#!/usr/bin/env bash

case "$(hyprctl activewindow -j | jq -r '"\(.floating):\(.pinned)"')" in
"false:false")
  hyprctl dispatch togglefloating >/dev/null
  hyprctl dispatch resizeactive exact 50% 50% >/dev/null
  hyprctl dispatch centerwindow >/dev/null
  ;;
"true:false")
  hyprctl dispatch pin >/dev/null
  ;;
"true:true")
  hyprctl dispatch pin >/dev/null
  hyprctl dispatch togglefloating >/dev/null
  ;;
esac
