FROM ubuntu:22.04
#FROM alpine

RUN apt update && apt install -y wine unzip wget
#RUN apk add --no-cache wine unzip wget

RUN mkdir -p /godot/releases && mkdir -p /godot/templates
WORKDIR /godot 

RUN wget  --no-check-certificate -q https://github.com/godotengine/godot/releases/download/4.2.1-stable/Godot_v4.2.1-stable_linux.x86_64.zip
RUN wget --no-check-certificate -q https://github.com/godotengine/godot/releases/download/4.2.1-stable/Godot_v4.2.1-stable_export_templates.tpz 

RUN unzip Godot_v4.2.1-stable_linux.x86_64.zip 
RUN unzip Godot_v4.2.1-stable_export_templates.tpz -d /godot

RUN mkdir -p /root/.local/share/godot/export_templates/

RUN cp -r /godot/templates/* /root/.local/share/godot/export_templates/


#RUN cp -r /root/.local/share/godot/templates/* /root/.local/share/godot/export_templates/
#RUN cp -r /github/home/.local/share/godot/templates/* /github/home/.local/share/godot/export_templates/4.2.1.stable/

COPY --chmod=770 /entrypoint.sh /godot/entrypoint.sh

#RUN chmod 777 /godot/Godot_v4.2.1-stable_linux.x86_64

#RUN ls -la /godot

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/godot/entrypoint.sh"]
