function vnc-start --wraps='hostname -i&&x11vnc -clip 2560x1440+1920+0' --description 'alias vnc-start=hostname -i&&x11vnc -clip 2560x1440+1920+0'
  hostname -i&&x11vnc -clip 2560x1440+1920+0 $argv
        
end
