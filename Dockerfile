FROM ubuntu:22.04

RUN apt update && apt install -y wine unzip wget

RUN mkdir -p /godot/releases && mkdir -p /godot/templates
WORKDIR /godot 


RUN wget --no-check-certificate -q https://github.com/godotengine/godot/releases/download/4.4.1-stable/godot-4.4.1-stable.tar.xz
RUN wget --no-check-certificate -q https://github.com/godotengine/godot/releases/download/4.4.1-stable/godot-4.4.1-stable_export_templates.tpz 

RUN tar -xzf godot-4.4.1-stable.tar.xz
RUN unzip godot-4.4.1-stable_export_templates.tpz -d /godot

RUN mkdir -p /root/.local/share/godot/export_templates/

RUN cp -r /godot/templates/* /root/.local/share/godot/export_templates/

COPY --chmod=770 /entrypoint.sh /godot/entrypoint.sh

ENTRYPOINT ["/godot/entrypoint.sh"]
