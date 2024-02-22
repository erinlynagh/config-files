#!/bin/bash

DIR="/mnt/media/git/yay"
if [ -d "$DIR" ]; then
    # Take action if $DIR exists. #
    cd $DIR
    makepkg -si
    yay -Rns yay-debug
else
    cd "/mnt/media/git"
    pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
fi

