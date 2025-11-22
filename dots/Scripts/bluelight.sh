#!/usr/bin/env bash
# toggle_hyprsunset.sh
# Toggles Hyprsunset (nightlight) on/off in Hyprland

# Adjust these to your liking
TEMP=6000 # Color temperature (Kelvin)

# Check if hyprsunset is running
if pgrep -x "hyprsunset" >/dev/null; then
  echo "Hyprsunset running → turning OFF"
  notify-send -t 1000 "☀️ Hyprsunset Disabled" "Back to normal lighting"
  pkill -x hyprsunset
else
  echo "Hyprsunset not running → turning ON"
  notify-send -t 1000 "🌙 Hyprsunset Enabled" "Temp: ${TEMP}K "
  hyprsunset -t "$TEMP"
fi
