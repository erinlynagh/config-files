#!/bin/bash

# get default sink, using pacmd info, then grepping the default sink name, and finally using awk to get the sink number based on that name
defualt_sink=$(pactl list short sinks | grep -e $(pacmd info | grep -e "Default sink name" | awk '{print $4}') | awk '{print $1}')
# get all sinks
sinks=($(pactl list short sinks | awk '{print $1}'))
#remove the default sink from the list
unset sinks[$defualt_sink]
# set the default sink to the first sink in the list (the other sink)
pactl set-default-sink ${sinks[@]}
echo Now using: $(pacmd info | grep -e "Default sink name" | awk '{print $4}')
