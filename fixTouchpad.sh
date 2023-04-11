#!/bin/bash
#Check
if [[ $1 != "-d"  ]]; then
    touchpad_config -e $(touchpad_config -l | grep -o "Touchpad.*id=.." | tail -c 3) 
   	echo "use -d to disable"
else
   	touchpad_config -d $(touchpad_config -l | grep -o "Touchpad.*id=.." | tail -c 3)
fi
