#!/usr/bin/env bash

if pgrep -x "fuzzel" >/dev/null; then
  pkill -x "fuzzel"
else
  cliphist list | fuzzel --dmenu | cliphist decode | wl-copy
fi
