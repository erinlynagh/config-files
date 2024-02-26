#!/bin/bash
# if there is only one webcam connected, exit
touch /home/erin/test.txt
if [ ! -e /dev/video1 ]; then
    notify-send "Only one webcam is connected. Exiting..."
# if the integrated webcam is connected, remove it
else
    pkexec rm -f /dev/video0
    if [ -e /dev/video0 ]; then
        notify-send "Failed to remove integrated webcam."
    else
        notify-send "Integrated webcam removed."
    fi
fi
exit 0
