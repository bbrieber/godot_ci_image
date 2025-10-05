ARG GODOT_VERSION="4.5"

FROM alpine:3.22 as builder

ARG GODOT_VERSION
RUN apk update && apk add --no-cache unzip wget

RUN mkdir -p /godot/releases && mkdir -p /godot/templates
WORKDIR /godot 

RUN wget --no-check-certificate -q https://github.com/godotengine/godot/releases/download/${GODOT_VERSION}-stable/Godot_v${GODOT_VERSION}-stable_linux.x86_64.zip
RUN wget --no-check-certificate -q https://github.com/godotengine/godot/releases/download/${GODOT_VERSION}-stable/Godot_v${GODOT_VERSION}-stable_export_templates.tpz

RUN unzip Godot_v${GODOT_VERSION}-stable_linux.x86_64.zip -d /godot/releases
RUN unzip Godot_v${GODOT_VERSION}-stable_export_templates.tpz -d /godot

FROM ubuntu:24.04
ARG GODOT_VERSION
LABEL org.opencontainers.image.description "Build image for Godot projects"
#RUN apk add --no-cache wine
RUN apt update && apt install -y wine

RUN mkdir -p /godot
RUN mkdir -p /github/home/.local/share/godot/export_templates/${GODOT_VERSION}.stable

COPY --chmod=770 /entrypoint.sh /godot/entrypoint.sh

COPY --from=builder /godot/releases/* /godot
COPY --from=builder /godot/templates/* /github/home/.local/share/godot/export_templates/${GODOT_VERSION}.stable


ENTRYPOINT ["/godot/entrypoint.sh"]
