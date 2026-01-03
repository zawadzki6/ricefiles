#!/bin/bash

process="SCPSL.exe"
running=false

while true; do
    if pgrep "$process" > /dev/null; then
        if [ "$running" = false ]; then
            notify-send "This is a reminder to enable Replay Buffer because SCPSL.exe was found"
            running=true
        fi
    else
        running=false
    fi
    sleep 20
done
