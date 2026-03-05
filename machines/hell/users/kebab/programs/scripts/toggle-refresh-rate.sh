#!/usr/bin/env bash

MONITOR="eDP-1"

CURRENT=$(hyprctl monitors | awk \
  "/Monitor $MONITOR/{f=1} f && /@/{print \$1; exit}")

if [[ "$CURRENT" == *"@144"* ]]; then
  hyprctl keyword monitor "$MONITOR,1920x1080@60,auto,1"
else
  hyprctl keyword monitor "$MONITOR,1920x1080@144,auto,1"
fi
