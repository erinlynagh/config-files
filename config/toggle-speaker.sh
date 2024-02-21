#!/bin/bash

# get default sink, using pacmd info, then grepping the default sink name, and finally using awk to get the sink number based on that name
# pactl list short sinks
current_active_device=$(pactl info | grep -e "Default Sink"| awk '{print $3}')
# echo "Active Device:" $current_active_device

defualt_sink=$(pactl list short sinks | grep -e $current_active_device | awk '{print $1}')
# echo "Default Sink:" $defualt_sink

# get all sinks
sinks=($(pactl list short sinks | awk '{print $1}'))

# change the default sink to the first sink in the list (the other sink)
for sink in ${sinks[@]}; do
    if [[ $sink != $defualt_sink ]]; then
        pactl set-default-sink $sink
        echo Now Using Sink: $(pactl info | grep -e "Default Sink" | awk '{print $3}')
        break
    fi
done


