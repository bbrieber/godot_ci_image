#!/bin/sh

mkdir -p /github/home/.local/share/godot/export_templates/4.2.1.stable/
cp -r /godot/templates/* /github/home/.local/share/godot/export_templates/4.2.1.stable/


echo "1"
echo $1

echo "2"
echo $2

echo "3"
echo $3

echo "PROJECT"

echo `ls  -la /github/workspace/project`

echo "WORKSPACE"

echo `ls -la /github/workspace`

echo "Template Folder Source"
echo `ls -la /godot/templates`




echo "Godot Folder Source"
echo `ls -la /godot`

echo "Template Folder"
echo `ls -la /github/home/.local/share/godot/export_templates/4.2.1.stable/`

echo "/godot/Godot_v4.2.1-stable_linux.x86_64 --headless --path /github/workspace/$3 $2 $1"

/godot/Godot_v4.2.1-stable_linux.x86_64 --headless --path /github/workspace/$3 $2 $1
