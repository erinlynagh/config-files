function disable-caps --wraps='setxkbmap -option ctrl:nonum' --wraps='setxkbmap -option ctrl:nocaps' --description 'alias disable-caps=setxkbmap -option ctrl:nocaps'
  setxkbmap -option ctrl:nocaps $argv
        
end
