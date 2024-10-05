#!/bin/bash

sudo pacman -S --needed git base-devel

DIR="/mnt/media/git/yay"
if [ -d "$DIR" ]; then
    # Take action if $DIR exists. #
    rm -rf $DIR
fi

cd "/mnt/media/git"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -Rns yay-debug