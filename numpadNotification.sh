#!/bin/bash

status=$(xset q | grep Caps | awk -F: '{ print $4 $5}' | sed 's/02*$//')

notify-send -a $status