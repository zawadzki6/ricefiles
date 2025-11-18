#!/bin/bash

xrandr --output DisplayPort-1 --mode 2560x1440

input-remapper-control --command autoload
pkill -f "bash ~/rice/listener.sh"
pkill -f "python ~/rice/autotile.py"
sleep 1s

for id in $(xinput list | grep "pointer" | cut -d '=' -f 2 | cut -f 1); do xinput --set-prop $id 'libinput Accel Profile Enabled' 0, 1; done

xset s off -dpms s noblank

xset r rate 400 50

bash ~/rice/listener.sh &
python ~/rice/autotile.py &

bash ~/rice/xrandr.sh &
