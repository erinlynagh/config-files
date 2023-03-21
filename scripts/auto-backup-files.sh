#!/bin/bash

cd /media/git/i3-config-files/scripts
old=$(cat timestamp)
echo $old

cd ~/.config
newfiles=$(find -newermt @$old)

rsync -rp --files-from=<(find -newermt @$old) ~/.config/ /media/git/i3-config-files/config

cd /media/git/i3-config-files/scripts
source deleteConfigFiles.sh

cd /media/git/i3-config-files/scripts
echo -n $EPOCHSECONDS > timestamp

echo "check git for diff now"
