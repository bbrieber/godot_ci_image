#!/bin/sh

echo ls /github/workspace/project

echo ls /github/workspace

/godot/Godot_v4.2.1-stable_linux.x86_64 --headless --path /github/workspace/project --export-release $1 
