#!/usr/bin/env bash

# Check if hypridle is running
if pgrep -x hypridle >/dev/null; then
  # If running, stop it
  pkill -x hypridle
  hyprctl notify 1 3000 "rgb(ff5555)" "Hypridle [OFF]"
else
  # If not running, start it in background
  nohup hypridle >/dev/null 2>&1 &
  hyprctl notify 1 3000 "rgb(50fa7b)" "Hypridle [ON]"
fi

