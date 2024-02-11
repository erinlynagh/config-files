function gp --wraps='rbw get github Token&&git push' --wraps='rbw get github Token | xclip -selection c&&git push' --wraps=echo\ \'password\ copied\ to\ clipboard\'\&\&rbw\ get\ github\ Token\ \|\ xclip\ -selection\ c\&\&git\ push --wraps=sudo\ echo\ \'password\ copied\ to\ clipboard\'\&\&rbw\ get\ github\ Token\ \|\ xclip\ -selection\ c\&\&git\ push --wraps='git push' --wraps='rbw get github Token | xclip -selection c&&git push&&echo -n | xclip -selection c' --description 'alias gp=rbw get github Token | xclip -selection c&&git push&&echo -n | xclip -selection c'
  rbw get github Token | xclip -selection c&&git push&&echo -n | xclip -selection c $argv
        
end
