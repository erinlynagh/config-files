function backup-packages --wraps='yay -Qqe > /mnt/media/git/config-files/packages.txt' --description 'alias backup-packages=yay -Qqe > /mnt/media/git/config-files/packages.txt'
  yay -Qqe > /mnt/media/git/config-files/packages.txt $argv
        
end
