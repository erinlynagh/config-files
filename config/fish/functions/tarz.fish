function tarz --wraps='tar --use-compress-program="pigz -k" -hcvf' --wraps='tar --use-compress-program "pigz -1 -k" -hcvf ' --description 'alias tarz=tar --use-compress-program "pigz -1 -k" -hcvf '
  tar --use-compress-program "pigz -1 -k" -hcvf  $argv
        
end
