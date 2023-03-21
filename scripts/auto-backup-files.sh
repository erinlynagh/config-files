#/bin/bash

#sanity check
if [ ! -f ./logs/timestamp ]; then
    echo -n "0" > timestamp
    mv timestamp ./logs
fi

#global variables
lastBackup=$(cat /media/git/i3-config-files/scripts/logs/timestamp)
homeDir=/media/git/i3-config-files/scripts
logDir=/media/git/i3-config-files/scripts/logs
sourceConfDir=~/.config
destConfDir=/media/git/i3-config-files/config

## TODO: Dry Run

#functions
home () {
    cd $homeDir
}

changedConfigFilesPrint(){
    find \( -path ./4kdownload.com -prune -o \
    -path ./battlefront -prune -o \
    -path ./BetterDiscord -prune -o \
    -path ./'BetterDiscord Installer' -prune -o \
    -path ./BraveSoftware -prune -o \
    -path ./cef_user_data -prune -o \
    -path ./chrome-remote-desktop -prune -o \
    -path ./Chronicon -prune -o \
    -path ./Code -prune -o \
    -path ./conky-manager.json -prune -o \
    -path ./copyq -prune -o \
    -path ./'Crafting Legends' -prune -o \
    -path ./dconf -prune -o \
    -path ./discord -prune -o \
    -path ./fastfetch -prune -o \
    -path ./fontforge -prune -o \
    -path ./galculator -prune -o \
    -path ./gh -prune -o \
    -path ./git-cola -prune -o \
    -path ./'GitHub Desktop' -prune -o \
    -path ./gkh -prune -o \
    -path ./godot -prune -o \
    -path ./gpick -prune -o \
    -path ./greenclip.toml -prune -o \
    -path ./gtk-4.0 -prune -o \
    -path ./heroic -prune -o \
    -path ./htop -prune -o \
    -path ./inkscape -prune -o \
    -path ./'Jackbox Games' -prune -o \
    -path ./kglobalshortcutsrc -prune -o \
    -path ./lazygit -prune -o \
    -path ./legendary -prune -o \
    -path ./libfm -prune -o \
    -path ./light -prune -o \
    -path ./ludo -prune -o \
    -path ./maltejur -prune -o \
    -path ./micro -prune -o \
    -path ./ModTheSpire -prune -o \
    -path ./mpv -prune -o \
    -path ./'Mullvad VPN' -prune -o \
    -path ./NecroDancer -prune -o \
    -path ./nnn -prune -o \
    -path ./pavucontrol.ini -prune -o \
    -path ./pcmanfm -prune -o \
    -path ./Pinta -prune -o \
    -path ./procps -prune -o \
    -path ./pulse -prune -o \
    -path ./QtProject.conf -prune -o \
    -path ./rbw -prune -o \
    -path ./retroarch -prune -o \
    -path ./SiralimUltimate -prune -o \
    -path ./sublime-merge -prune -o \
    -path ./systemd -prune -o \
    -path ./transmission -prune -o \
    -path ./twmn -prune -o \
    -path ./ungit -prune -o \
    -path ./unity3d -prune -o \
    -path ./vlc -prune -o \
    -path ./xgrabcolorrc -prune -o \
    -path ./yay -prune \) \
    -o -newermt @$lastBackup -print | tail -n +3
}

backupConfigDir () {
    echo "modified config files:"
    changedConfigFilesPrint
    changedConfigFilesPrint > copiedConfigFiles.log
    echo "copying config files..."
    rsync -rv --files-from="copiedConfigFiles.log" $1 $2
    echo "updating log files"
    mv copiedConfigFiles.log $logDir
    cd $2
    rm copiedConfigFiles.log
}

#Start Config Backup
cd $sourceConfDir
backupConfigDir $sourceConfDir $destConfDir
home
echo "config files updated, updating installed package list"
cd ..
yay -Qe > packages.txt
home
echo -n $EPOCHSECONDS > timestamp
mv timestamp ./logs
echo "backup complete, timestamp has been logged"