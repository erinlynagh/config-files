#!/bin/bash

# check if xremap is running
if [ -z "$(pgrep xremap)" ]; then
    xremap /home/erin/.config/xremap/numLockOn.yml
else
    pkill xremap
fi

