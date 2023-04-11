function backup --wraps='gtg&&cd config-files&&./scripts/auto-backup-files.sh' --wraps='gtg&&cd config-files&&./scripts/auto-backup-files.sh&&cd' --wraps='gtg&&cd config-files&&./scripts/auto-backup-files.sh -r&&cd' --wraps='gtg&&cd config-files&&./scripts/auto-backup-files.sh -r&&cd -' --wraps='gtg&&cd config-files&&./scripts/auto-backup-files.sh -r&&cd --' --wraps='gtg&&cd config-files&&./scripts/auto-backup-files.sh -r&&cd ~' --description 'alias backup=gtg&&cd config-files&&./scripts/auto-backup-files.sh -r&&cd ~'
  gtg&&cd config-files&&./scripts/auto-backup-files.sh -r&&cd ~ $argv
        
end
