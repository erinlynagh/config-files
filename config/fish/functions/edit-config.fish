function edit-config --wraps='micro ~/.i3/config' --wraps='micro ~/.config/i3/config' --description 'alias edit-config=micro ~/.config/i3/config'
  micro ~/.config/i3/config $argv
        
end
