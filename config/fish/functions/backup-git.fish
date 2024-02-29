function backup-git --wraps='gtg&&z config-files&&backup&&lg' --wraps='gtg&&cd config-files&&backup&&lg' --description 'alias backup-git=gtg&&cd config-files&&backup&&lg'
  gtg&&cd config-files&&backup&&lg $argv
        
end
