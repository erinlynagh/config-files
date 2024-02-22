#!/bin/bash

# if the first arguement is blank or not formatted for the sleep command, we default to 7m as the sleep time
if [ -z "$1" ] || ! [[ "$1" =~ ^[0-9]+[smh]$ ]]; then
    echo "No or invalid argument, defaulting to 7m"
    $1="7m"
fi

while true; do
    feh --recursive --bg-fill --randomize /mnt/media/Library/Pictures/Wallpapers/*
    sleep $1
done
