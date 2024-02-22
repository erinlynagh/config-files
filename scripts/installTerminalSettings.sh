#!/bin/bash
echo "configuring terminal..."
isFishInstalled=$(pacman -Q --info fish | grep -e "error")
if [ -z "$isFishInstalled" ]; then
    echo "Fish is already installed"
else
    echo "Fish is not installed"
    yay -S fish
fi
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

curl -sS https://starship.rs/install.sh | sh
echo "starship init fish | source" >> ~/.config/fish/config.fish

echo "PLEASE RUN omf install bang-bang"
