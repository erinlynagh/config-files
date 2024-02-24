function weather --wraps='curl wttr.in/?m' --wraps=curl\ wttr.in\\\?m --description alias\ weather=curl\ wttr.in\\\?m
  curl wttr.in\?m $argv
        
end
