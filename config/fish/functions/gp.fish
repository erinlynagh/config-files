function gp --wraps='rbw get github Token | xclip -selection c&&git push&&echo -n | xclip -selection c' --description 'alias gp=rbw get github Token | xclip -selection c&&git push&&echo -n | xclip -selection c'
  rbw get github Token | xclip -selection c&&git push&&echo -n | xclip -selection c $argv
        
end
