#!/bin/bash
# variables 
mountPoint=/mnt/media
backupDirectory=$mountPoint/git/config-files
cd $backupDirectory/scripts

# remove old backup directories
sudo mkdir -p $backupDirectory/config
sudo mkdir -p $backupDirectory/screenlayout
sudo rm -rf $backupDirectory/config/*
sudo rm -rf $backupDirectory/screenlayout/*

# backup packages
yay -Qqe > $backupDirectory/packages.txt

input=$backupDirectory/scripts/backupSettings/folders.txt
while IFS= read -r line
do
    # skip first iteration
    if [ "$line" == "/from /to" ]; then
        continue
    fi

    # split line into varaibles
    IFS=' ' read -ra ADDR <<< "$line"
    sourceFolder=${ADDR[0]}
    addressFolder=$backupDirectory${ADDR[-1]}
    sudo mkdir -p $addressFolder
    sudo cp -Rfp $sourceFolder/* $addressFolder/
done < "$input"

input=$backupDirectory/scripts/backupSettings/files.txt
while IFS= read -r line
do
    # skip first iteration
    if [ "$line" == "/from /to" ]; then
        continue
    fi

    # split line into varaibles
    IFS=' ' read -ra ADDR <<< "$line"
    sourceFile=${ADDR[0]}
    addressFile=$backupDirectory${ADDR[-1]}
    if [ ${ADDR[-1]} == "/root" ]; then
        addressFile=$backupDirectory
    fi
    sudo cp -fp $sourceFile $addressFile
done < "$input"


