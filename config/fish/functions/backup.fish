function backup --wraps='gtg&&./config-files/scripts/auto-backup-files.sh&&lg' --wraps='gtg&&cd config-files&&./scripts/auto-backup-files.sh&&lg' --wraps='gtg&&cd config-files&&./scripts/auto-backup-files.sh' --description 'alias backup=gtg&&cd config-files&&./scripts/auto-backup-files.sh'
gtg&&cd config-files&&./scripts/auto-backup-files.sh $argv

end
