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

echo `ls /github/workspace/project`

echo "WORKSPACE"

echo `ls /github/workspace`

echo "Template Folder Source"
echo `ls /godot/templates`




echo "Godot Folder Source"
echo `ls /godot`

echo "Template Folder"
echo `ls /github/home/.local/share/godot/export_templates/4.2.1.stable/`

echo "/godot/Godot_v4.2.1-stable_linux.x86_64 --headless --path /github/workspace/$3 $2 $1"

#/godot/Godot_v4.2.1-stable_linux.x86_64 --headless --path /github/workspace/$3 $2 $1
#/godot/Godot_v4.2.1-stable_linux.x86_64 --headless --path /github/workspace/project --export-release $1
/godot/Godot_v4.2.1-stable_linux.x86_64 --help
