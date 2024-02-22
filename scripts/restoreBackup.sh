#!/bin/bash
# variables
mountPoint=/mnt/media
backupDirectory=$mountPoint/git/config-files

# restore packages
./installYay.sh
./installChaoticAur.sh
./installPackages.sh
./installTerminalSettings.sh
./installEmoji.sh
../dcss-config/addDcssToCommandLine.sh


input=$backupDirectory/scripts/backupSettings/folders.txt
while IFS= read -r line
do
    # skip first iteration
    if [ "$line" == "/from /to" ]; then
        continue
    fi

    # split line into varaibles
    IFS=' ' read -ra ADDR <<< "$line"
    sourceFolder=$backupDirectory${ADDR[-1]}
    destFolder=${ADDR[0]}
    # echo "copying from $sourceFolder to $destFolder"
    mkdir -p $destFolder
    cp -Rf $sourceFolder/* $destFolder/
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
    destFilepath=${ADDR[0]}
    sourceFilename=${destFilepath##*/}
    destPath=${destFilepath%/*}
    sourceDir=$backupDirectory${ADDR[-1]}

    if [ ${ADDR[-1]} == "/root" ]; then
        sourceDir=$backupDirectory
    fi
    # echo copying $sourceDir/$sourceFilename to $destPath
    cp -f $sourceDir/$sourceFilename $destPath
done < "$input"

cp -f $backupDirectory/dcss-config/*.txt ~/.crawl/

cp -f $backupDirectory/local/share/applications/*.desktop ~/.local/share/applications/
sudo cp -Rf $backupDirectory/etc/* /etc/

echo done