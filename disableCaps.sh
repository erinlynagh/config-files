#!/bin/bash
capsStatus=$(xset q | rg "Caps Lock" | awk '{print $4}')
if [ $capsStatus == "on" ]; then
	xdotool key Caps_Lock
fi
setxkbmap -option ctrl:nocaps
