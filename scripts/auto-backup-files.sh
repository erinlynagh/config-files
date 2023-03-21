#!/bin/bash

#global variables
lastBackup=$(cat timestamp)
homeDir=/media/git/i3-config-files/scripts
sourceConfDir=~/.config/
destConfDir=/media/git/i3-config-files/config

#functions
home () {
    cd $homeDir
}

changedFiles() {
    find -newermt @$lastBackup
}

backupDir () {
    cd $1
    rsync -rv --files-from=<(changedFiles) $1 $2 # $(find -newermt @$lastBackup) is used to find all files that have been modified since the last backup
}

#Start Backups

backupDir $sourceConfDir $destConfDir

home
source deleteConfigFiles.sh

home
#echo -n $EPOCHSECONDS > timestamp

echo "check git for diff now"
