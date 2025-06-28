#!/bin/bash

options="⏻ Shutdown\n  Reboot\n  Logout\n󰤄 Suspend\n  Lock"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power" -theme ~/rice/rofi.rasi)

case "$chosen" in
    "⏻ Shutdown")  bash /home/zawadzki/rice/power/shutdown.sh ;;
    "  Reboot")    bash /home/zawadzki/rice/power/reboot.sh ;;
    "  Logout")    bash /home/zawadzki/rice/power/logout.sh ;;
    "󰤄 Suspend")   systemctl suspend ;;
    "  Lock")      loginctl lock-session ;;
    *)             exit 1 ;;
esac
