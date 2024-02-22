#!/bin/bash
isFishInstalled=$(pacman -Q --info fish | grep -e "error")
if [ -z "$isFishInstalled" ]; then
    echo "Fish is already installed"
else
    echo "Fish is not installed"
    yay -S fish
fi
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fish -c "omf install bang-bang"

curl -sS https://starship.rs/install.sh | sh
echo "starship init fish | source" >> ~/.config/fish/config.fish

cp -f ../config/starship.toml ~/.config/starship.toml

