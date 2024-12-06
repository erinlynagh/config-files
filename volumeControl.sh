#!/bin/bash
# if the first argument is -i or -d, then increase or decrease the volume by the second argument (or 5% by default) with pamixer
# otherwise, run pamixer -t to toggle the volume

# then, use notify-send to show the new volume level

if [ "$1" == "-i" ] || [ "$1" == "-d" ]; then
    if [ "$(pamixer --get-mute)" == "true" ]; then
        pamixer -u
        exit
    fi
    if [ "$2" -eq "$2" ] 2>/dev/null; then
        :
    else
        echo "Usage: volumeControl.sh [-i|-d] [amount]"
        exit 1
    fi
fi

if [ "$1" == "-i" ]; then
    pamixer -i ${2:-5}
    paplay volumeSound.wav
elif [ "$1" == "-d" ]; then
    pamixer -d ${2:-5}
    paplay volumeSound.wav
elif [ "$1" == "-m" ]; then
    pamixer --mute
    notify-send "volume muted"
else
    if [ "$(pamixer --get-mute)" == "true" ]; then
        notify-send "volume unmuted"
    else
		notify-send "volume muted"
    fi
    pamixer -t
fi

# notify-send "Volume: $(pamixer --get-volume)%"
