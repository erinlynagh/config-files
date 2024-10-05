function gp --wraps='copyq disable&&rbw get github Token | xclip -selection c&&git push&&echo -n | xclip -selection c&&copyq enable' --description 'alias gp=copyq disable&&rbw get github Token | xclip -selection c&&git push&&echo -n | xclip -selection c&&copyq enable'
  copyq disable&&rbw get github Token | xclip -selection c&&git push&&echo -n | xclip -selection c&&copyq enable $argv
        
end
