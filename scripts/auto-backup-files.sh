#/bin/bash

#import libraries
source ./findExclusions.sh

#global variables
lastBackup=$(cat timestamp)
homeDir=/media/git/i3-config-files/scripts
sourceConfDir=~/.config
destConfDir=/media/git/i3-config-files/config


## TODO: Dry Run

#functions
home () {
    cd $homeDir
}

changedConfigFiles(){
    find . \( -path ./4kdownload.com -prune -o \
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
    -o -newermt @$lastBackup
}

changedConfigFilesPrint(){
    echo "changed files:"
    find . \( -path ./4kdownload.com -prune -o \
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
    -o -newermt @$lastBackup -print
}

backupConfigDir () {
    echo "2"
    rsync -rn --files-from=<(changedConfigFiles) $1 $2 # $(find -newermt @$lastBackup) is used to find all files that have been modified since the last backup
}

#Start Backups
cd $sourceConfDir
changedConfigFilesPrint
echo "1"
backupConfigDir $sourceConfDir $destConfDir

home
#echo -n $EPOCHSECONDS > timestamp

echo "files updated :3"
