#!/bin/bash
# variables
mountPoint=/mnt/media
backupDirectory=$mountPoint/git/config-files

# remove old backup directories
mkdir -p $backupDirectory/config
mkdir -p $backupDirectory/screenlayout
rm -rf $backupDirectory/config/*
rm -rf $backupDirectory/screenlayout/*

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
    mkdir -p $addressFolder
    cp -Rf $sourceFolder/* $addressFolder/
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
    cp -f $sourceFile $addressFile
done < "$input"

echo done


