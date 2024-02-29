function backup-git --wraps='gtg&&z config-files&&backup&&lg' --wraps='gtg&&cd config-files&&backup&&lg' --wraps='gtg&&cd config-files&&backup&&lg&&gp' --wraps='gtg&&cd config-files&&backup&&lg&&gp&&cd -' --wraps='cd /mnt/media/git/config-files&&backup&&lg&&gp&&cd -' --description 'alias backup-git=cd /mnt/media/git/config-files&&backup&&lg&&gp&&cd -'
  cd /mnt/media/git/config-files&&backup&&lg&&gp&&cd - $argv
        
end
