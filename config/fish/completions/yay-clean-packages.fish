function yay-clean-packages --wraps='yay -Qtdq | yay -Rns -&&sudo pacman -Qqd | sudo pacman -Rsu -' --wraps='yay -Qtdq | yay -Rns -||sudo pacman -Qqd | sudo pacman -Rsu -' --description 'alias yay-clean-packages=yay -Qtdq | yay -Rns -||sudo pacman -Qqd | sudo pacman -Rsu -'
  yay -Qtdq | yay -Rns -||sudo pacman -Qqd | sudo pacman -Rsu - $argv
        
end
