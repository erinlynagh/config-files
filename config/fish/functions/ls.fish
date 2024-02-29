function ls --wraps='lsd --extensionsort --almost-all' --wraps='lsd --extensionsort' --description 'alias ls=lsd --extensionsort'
  lsd --extensionsort $argv
        
end
