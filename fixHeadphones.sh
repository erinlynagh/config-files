#!/bin/bash

pactl subscribe | while read -r event; do
    if echo $event | grep -q "Event 'new' on sink"; then
        notify-send "audio" "device (dis)connected"
    fi
done
systemctl restart --user pipewire pipewire-pulse # Connection failure: Connection terminated
