FROM alpine:3.22 as builder

RUN apk update && apk add --no-cache unzip wget

RUN mkdir -p /godot/releases && mkdir -p /godot/templates
WORKDIR /godot 

RUN wget --no-check-certificate -q https://github.com/godotengine/godot/releases/download/4.5-stable/Godot_v4.5-stable_linux.x86_64.zip
RUN wget --no-check-certificate -q https://github.com/godotengine/godot/releases/download/4.5-stable/Godot_v4.5-stable_export_templates.tpz

RUN unzip Godot_v4.5-stable_linux.x86_64.zip -d /godot/releases
RUN unzip Godot_v4.5-stable_export_templates.tpz -d /godot

FROM alpine:3.22 

RUN apk add --no-cache wine

RUN mkdir -p /godot
RUN mkdir -p /root/.local/share/godot/export_templates/

COPY --chmod=770 /entrypoint.sh /godot/entrypoint.sh

COPY --from=build /godot/releases/* /godot
COPY --from=build -r /godot/templates/* /root/.local/share/godot/export_templates/


ENTRYPOINT ["/godot/entrypoint.sh"]
