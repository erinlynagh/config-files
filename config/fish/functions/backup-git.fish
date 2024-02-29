function backup-git --wraps='gtg&&z config-files&&backup&&lg' --wraps='gtg&&cd config-files&&backup&&lg' --wraps='gtg&&cd config-files&&backup&&lg&&gp' --wraps='gtg&&cd config-files&&backup&&lg&&gp&&cd -' --description 'alias backup-git=gtg&&cd config-files&&backup&&lg&&gp&&cd -'
  gtg&&cd config-files&&backup&&lg&&gp&&cd - $argv
        
end
