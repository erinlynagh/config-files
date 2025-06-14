function timer --wraps=termdown --description 'alias timer=termdown'
  termdown $argv && mpv ~/notificationSound.wav
        
end
