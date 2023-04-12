#!/bin/bash

# if there is 1 screen
if [[ $(xrandr --listactivemonitors | wc -l) == 2  ]]; then
   	i3 workspace 1
fi
