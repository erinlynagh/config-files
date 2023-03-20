#!/bin/bash

# Terminate already running bars
killall -q polybar
flag=true

for m in $(polybar --list-monitors | cut -d":" -f1); do
    if $flag; then
        MONITOR=$m TRAYPOS="right" polybar --reload example &
        flag=false
    else
        MONITOR=$m TRAYPOS="" polybar --reload example &
    fi
done
