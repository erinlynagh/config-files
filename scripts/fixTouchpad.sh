#!/bin/bash
#Check
# notify-send "hello"
if [[ $1 != "-d"  ]]; then
    touchpad_config -e $(xinput list | grep -o "Touchpad.*id=.." | tail -c 3)
    echo "use -d to disable"
else
    touchpad_config -d $(xinput list | grep -o "Touchpad.*id=.." | tail -c 3)
fi


