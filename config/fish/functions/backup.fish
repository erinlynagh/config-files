function backup --wraps='gtg&&./i3-config-files/scripts/auto-backup-files.sh&&lg' --wraps='gtg&&cd i3-config-files&&./scripts/auto-backup-files.sh&&lg' --description 'alias backup=gtg&&cd i3-config-files&&./scripts/auto-backup-files.sh&&lg'
  gtg&&cd i3-config-files&&./scripts/auto-backup-files.sh&&lg $argv
        
end
