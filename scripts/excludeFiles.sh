#!/bin/bash
# variables
mountPoint=/mnt/media
backupDirectory=$mountPoint/git/config-files
cd $backupDirectory/scripts

input=$backupDirectory/scripts/backupSettings/excludeFiles.txt
while IFS= read -r line; do
    if [ "$line" == "/files to exclude" ] || [ -z "$line" ] || [[ $line == "end" ]]; then
        continue
    fi

    # sudo rm -rfv $backupDirectory${line}
    sudo rm -rf $backupDirectory${line}
done <"$input"
