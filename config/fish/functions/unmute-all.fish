function unmute-all --wraps='amixer set Speaker unmut&&amixer set Headphone unmute&&amixer set Master unmute' --wraps='amixer set Speaker unmute&&amixer set Headphone unmute&&amixer set Master unmute' --description 'alias unmute-all=amixer set Speaker unmute&&amixer set Headphone unmute&&amixer set Master unmute'
  amixer set Speaker unmute&&amixer set Headphone unmute&&amixer set Master unmute $argv
        
end
