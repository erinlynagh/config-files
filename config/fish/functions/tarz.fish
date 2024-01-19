function tarz --wraps='tar --use-compress-program="pigz -k" -hcvf' --description 'alias tarz=tar --use-compress-program="pigz -k" -hcvf'
  tar --use-compress-program="pigz -k" -hcvf $argv
        
end
