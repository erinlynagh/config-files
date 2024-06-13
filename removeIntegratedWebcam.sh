#!/bin/bash
# if there is only one webcam connected, exit
if [ ! -e /dev/video1 ]; then
    notify-send "Only one webcam is connected. Exiting..."
# if the integrated webcam is connected, remove it
else
    # if the integrated webcam is connected, remove it
    if [ -e /dev/video0 ]; then
        pkexec rm -f /dev/video0
        if [ $? -eq 0 ]; then
            notify-send "Integrated webcam removed."
        else
            notify-send "Failed to remove integrated webcam."
            exit 1
        fi
    fi

fi
exit 0
