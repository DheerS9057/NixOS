#!/usr/bin/env bash
AC_PATH="/sys/class/power_supply/ADP1/online"

set_profile() {
    case "$1" in
        "1") # AC connected
            powerprofilesctl set performance
            ;;
        "0") # AC disconnected
            powerprofilesctl set power-saver
            ;;
    esac
}

if [[ -f "$AC_PATH" ]]; then
    AC_STATE=$(cat "$AC_PATH")
    set_profile "$AC_STATE"
else
    echo "⚠️ Adapter path not found: $AC_PATH" | systemd-cat -t power-profile-auto -p warning
fi
