#!/bin/sh

mkdir -p /github/home/.local/share/godot/export_templates/4.3.stable/
cp -r /godot/templates/* /github/home/.local/share/godot/export_templates/4.3.stable/

#echo "/godot/Godot_v4.2.1-stable_linux.x86_64 --headless --path /github/workspace/$3 $2 $1"

/godot/Godot_v4.2.2-stable_linux.x86_64 --headless --path /github/workspace/$3 $2 $1
