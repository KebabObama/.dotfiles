#!/usr/bin/env bash

STATUS=$(hyprctl activewindow -j | jq '.fullscreen')

if [ "$STATUS" -eq 0 ]; then
  hyprctl dispatch fullscreen 1
elif [ "$STATUS" -eq 1 ]; then
  hyprctl dispatch fullscreen 2
else
  hyprctl dispatch fullscreen 0
fi
