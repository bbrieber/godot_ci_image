#!/bin/sh

mkdir -p /github/home/.local/share/godot/export_templates/4.2.1.stable/
cp -r /godot/templates/* /github/home/.local/share/godot/export_templates/4.2.1.stable/

echo "PROJECT"

echo `ls /github/workspace/project`

echo "WORKSPACE"

echo `ls /github/workspace`

echo "Template Folder Source"
echo `ls /godot/templates`

echo "Template Folder"
echo `ls /github/home/.local/share/godot/export_templates/4.2.1.stable/`

/godot/Godot_v4.2.1-stable_linux.x86_64 --headless --path /github/workspace/project --export-release WindowsDesktop
