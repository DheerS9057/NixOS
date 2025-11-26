#!/usr/bin/env bash
# toggle_fans_safe.sh
# Safer toggle: Auto ↔ Max with ramp from current value

LEFT=0x2c
RIGHT=0x2d
AUTO=0xff     # True auto (BIOS control) — confirm with: sudo ectool -d | grep -E '2c|2d'
BALANCED=0x32 # ~50% for quieter max (adjust based on your RPM tests)
FULL=0x64     # 100% full blast

STEP=0x04
DELAY=1

# Helper: Get current value for a reg (hex)
get_current() {
   ectool -d | grep -o "($(printf '%02x' $1)):.*0x$(printf '%02x')" | cut -d' ' -f3 | tr -d '0x'
}

# Helper: Write with error check
safe_write() {
  local reg=$1 val=$2
  if !  timeout 5 ectool -w $reg -z $val; then
    echo "ERROR: Failed to write $reg=0x$val. Reboot to reset."
    exit 1
  fi
}

#MODE_FILE="$HOME/.fan_mode"
MODE_FILE="/tmp/fan_mode"

if [ ! -f "$MODE_FILE" ]; then
  echo "auto" >"$MODE_FILE"
fi
MODE=$(cat "$MODE_FILE")

if [ "$MODE" = "auto" ]; then
  echo "Switching to MAX fans..."
  # Get current (should be AUTO, but detect anyway)
  CUR_LEFT=$(get_current $LEFT)
  CUR_RIGHT=$(get_current $RIGHT)
  CUR=$(((CUR_LEFT + CUR_RIGHT) / 2)) # Average for symmetric ramp

  # Ramp from current to balanced
  VAL=$CUR
  while [ $VAL -le $BALANCED ]; do
    safe_write $LEFT $VAL
    safe_write $RIGHT $VAL
    echo "Ramping: 0x$VAL (~$(($VAL * 100 / 255))%)"
    VAL=$((VAL + STEP))
    sleep $DELAY
  done
  # Then to full
  safe_write $LEFT $FULL
  safe_write $RIGHT $FULL
  echo "FULL MAX applied!"
  echo "max" >"$MODE_FILE"
else
  echo "Switching to AUTO..."
  safe_write $LEFT $AUTO
  safe_write $RIGHT $AUTO
  echo "auto" >"$MODE_FILE"
fi

# Show status
echo -e "\nCurrent status:"
sensors | grep -E 'fan|temp'
