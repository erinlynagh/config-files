function la --wraps='lsd -lA' --wraps='lsd --almost-all --long --git' --description 'alias la=lsd --almost-all --long --git'
  lsd --almost-all --long --git $argv
        
end
