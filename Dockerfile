FROM alpine:3.22 as builder

RUN apk update && apk add --no-cache unzip wget

RUN mkdir -p /godot/releases && mkdir -p /godot/templates
WORKDIR /godot 

RUN wget --no-check-certificate -q https://github.com/godotengine/godot/releases/download/4.5-stable/Godot_v4.5-stable_linux.x86_64.zip
RUN wget --no-check-certificate -q https://github.com/godotengine/godot/releases/download/4.5-stable/Godot_v4.5-stable_export_templates.tpz

RUN unzip Godot_v4.5-stable_linux.x86_64.zip -d /godot/releases
RUN unzip Godot_v4.5-stable_export_templates.tpz -d /godot

FROM ubuntu:24.04

#RUN apk add --no-cache wine
RUN apt update && apt install -y wine

RUN mkdir -p /godot
RUN mkdir -p /home/github/.local/share/godot/export_templates/v4.5.stable

COPY --chmod=770 /entrypoint.sh /godot/entrypoint.sh

COPY --from=builder /godot/releases/* /godot
COPY --from=builder /godot/templates /home/github/.local/share/godot/export_templates/v4.5.stable


ENTRYPOINT ["/godot/entrypoint.sh"]
