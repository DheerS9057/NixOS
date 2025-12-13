#!/usr/bin/env bash

# Check if hypridle is running
if pgrep -x hypridle >/dev/null; then
  # If running, stop it
  pkill -x hypridle
  notify-send "Hypridle [OFF]"
else
  # If not running, start it in background
  nohup hypridle >/dev/null 2>&1 &
  notify-send 1 "Hypridle [ON]"
fi

