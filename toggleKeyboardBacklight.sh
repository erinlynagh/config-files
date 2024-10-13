#!/bin/bash

# this script increases and decreases the keyboard backlight brightness

kbd_backlight_dir="/sys/class/leds/"$(ls /sys/class/leds/ | grep -E 'kbd_backlight')
kbd_backlight=$kbd_backlight_dir"/brightness"

# check files exists
if [ ! -e $kbd_backlight ]; then
    echo "Error: Keyboard backlight not found"
    exit 1
fi

# get brightness values
current_brightness=$(cat "$kbd_backlight")
max_brightness=$(cat "$kbd_backlight_dir/max_brightness")

# set max brightness to 1 if the file wasnt found
if [ -z $max_brightness ]; then
    max_brightness=1
fi

# make sure the file is writable
if [ ! -w $kbd_backlight ]; then
    pkexec chmod +666 $kbd_backlight
fi

# santiy check that max_brightness is an integer
if ! [[ $max_brightness =~ ^[0-9]+$ ]]; then
    echo "Error: max_brightness is not an integer"
    exit 1
fi

if [ "$1" = "-i" ]; then
    if [ $current_brightness -lt $max_brightness ]; then
        echo $(($current_brightness + 1)) | tee $kbd_backlight >/dev/null
    fi
elif [ "$1" = "-d" ]; then
    if [ $current_brightness -gt 0 ]; then
        echo $(($current_brightness - 1)) | tee $kbd_backlight >/dev/null
    fi
else
    echo $kbd_backlight
    echo $max_brightness
fi
