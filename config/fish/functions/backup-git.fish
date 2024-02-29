function backup-git --wraps='gtg&&z config-files&&backup&&lg' --wraps='gtg&&cd config-files&&backup&&lg' --wraps='gtg&&cd config-files&&backup&&lg&&gp' --description 'alias backup-git=gtg&&cd config-files&&backup&&lg&&gp'
  gtg&&cd config-files&&backup&&lg&&gp $argv
        
end
