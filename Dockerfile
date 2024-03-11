FROM ubuntu:22.04

RUN apt update && apt install -y wine unzip wget


RUN mkdir -p /godot/releases && mkdir -p /root/.local/share/godot/export_templates/4.2.1.stable/
WORKDIR /godot 

RUN wget  --no-check-certificate https://github.com/godotengine/godot/releases/download/4.2.1-stable/Godot_v4.2.1-stable_linux.x86_64.zip
RUN wget --no-check-certificate https://github.com/godotengine/godot/releases/download/4.2.1-stable/Godot_v4.2.1-stable_export_templates.tpz 

RUN unzip Godot_v4.2.1-stable_linux.x86_64.zip && unzip Godot_v4.2.1-stable_export_templates.tpz -d /root/.local/share/godot/

#RUN cp -r /root/.local/share/godot/templates/* /root/.local/share/godot/export_templates/
RUN cp -r /root/.local/share/godot/templates/* /root/.local/share/godot/export_templates/4.2.1.stable/

COPY --chmod=770 /entrypoint.sh /godot/entrypoint.sh


# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/godot/entrypoint.sh"]
