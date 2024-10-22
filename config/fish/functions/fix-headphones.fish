function fix-headphones --wraps='systemctl --user restart pipewire pipewire-pulse' --description 'alias fix-headphones=systemctl --user restart pipewire pipewire-pulse'
  systemctl --user restart pipewire pipewire-pulse $argv
        
end
