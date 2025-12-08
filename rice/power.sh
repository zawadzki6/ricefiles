#!/bin/bash

options=" 󰤆   Shutdown\n    Reboot\n    Logout\n 󰤄   Suspend\n 󰑹   Hibernate\n    Lock"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power" -theme ~/rice/rofi.rasi)

case "$chosen" in
    "󰤆 Shutdown")  bash ~/rice/power/shutdown.sh ;;
    "  Reboot")    bash ~/rice/power/reboot.sh ;;
    "  Logout")    bash ~/rice/power/logout.sh ;;
    "󰤄 Suspend")   bash ~/rice/lock.sh && systemctl suspend ;;
    "󰑹 Hibernate") bash ~/rice/power/hibernate.sh ;;
    "  Lock")      bash ~/rice/lock.sh ;;
    *)             exit 1 ;;
esac
