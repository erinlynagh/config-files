function edit-config --wraps='cd&&micro .config/i3/config' --description 'alias edit-config=cd&&micro .config/i3/config'
  cd&&micro .config/i3/config $argv; 
end
