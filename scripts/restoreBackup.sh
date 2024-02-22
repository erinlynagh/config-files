#!/bin/bash
# variables
mountPoint=/mnt/media
backupDirectory=$mountPoint/git/config-files
cd $backupDirectory/scripts

# restore packages
echo "Running other scripts"
./installYay.sh
./installChaoticAur.sh
./installPackages.sh
./installEmoji.sh
../dcss-config/addDcssToCommandLine.sh
./activateServices.sh
./installTerminalSettings.sh

echo "Restoring files and folders"
echo "Note that /boot is not restored autopmatically"

input=$backupDirectory/scripts/backupSettings/folders.txt
while IFS= read -r line; do
    # skip some lines
    if [ "$line" == "/from /to" ] || [ -z "$line" ] || [[ $line == *"boot"* ]]; then
        continue
    fi

    # split line into varaibles
    IFS=' ' read -ra ADDR <<<"$line"
    sourceFolder=$backupDirectory${ADDR[-1]}
    destFolder=${ADDR[0]}
    # echo "copying from $sourceFolder to $destFolder"
    sudo mkdir -p $destFolder
    sudo cp -Rfp $sourceFolder/* $destFolder/
done <"$input"

input=$backupDirectory/scripts/backupSettings/files.txt
while IFS= read -r line; do
    # skip some lines
    if [ "$line" == "/from /to" ] || [ -z "$line" ] || [[ $line == *"boot"* ]]; then
        continue
    fi

    # split line into varaibles
    IFS=' ' read -ra ADDR <<<"$line"
    destFilepath=${ADDR[0]}
    sourceFilename=${destFilepath##*/}
    destPath=${destFilepath%/*}
    sourceDir=$backupDirectory${ADDR[-1]}

    if [ ${ADDR[-1]} == "/root" ]; then
        sourceDir=$backupDirectory
    fi
    # echo copying $sourceDir/$sourceFilename to $destPath
    sudo cp -fp $sourceDir/$sourceFilename $destPath
done <"$input"
