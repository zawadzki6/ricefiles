#!/bin/bash

# Get default sink
sink=$(pactl get-default-sink)

# Listen to PulseAudio events and filter for sink volume changes
pactl subscribe | grep --line-buffered "sink" | while read -r line; do
    # Get current volume in %
    volume=$(pactl get-sink-volume "$sink" | grep -oP '\d+%' | head -1 | tr -d '%')
    
    if [ "$volume" -gt 100 ]; then
        pactl set-sink-volume "$sink" 100%
    fi
done

