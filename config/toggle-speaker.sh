#!/bin/bash

# get default sink, using pacmd info, then grepping the default sink name, and finally using awk to get the sink number based on that name
pactl list short sinks
defualt_sink=$(pactl list short sinks | grep -e $(pacmd info | grep -e "Default sink name" | awk '{print $4}') | awk '{print $1}')
echo default sink: $defualt_sink
# get all sinks
sinks=($(pactl list short sinks | awk '{print $1}'))

# loop through all sinks and set the other sink as the default sink
for sink in ${sinks[@]}; do
    if [[ $sink != $defualt_sink ]]; then
        pactl set-default-sink $sink
        break
    fi
done

# set the default sink to the first sink in the list (the other sink)
echo Now using: $(pacmd info | grep -e "Default sink name" | awk '{print $4}')
