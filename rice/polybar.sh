#!/bin/bash

if pgrep -x polybar > /dev/null; then
  echo "Process 'polybar' found. Killing all instances..."
  pkill -x polybar
else
  echo "Process 'polybar' not running."
fi

echo "Starting process..."
polybar -c /home/zawadzki/rice/polybar.ini &
