function toggle-speaker --wraps='amixer set Speaker toggle' --wraps='~/toggle-speaker.sh' --description 'alias toggle-speaker=~/toggle-speaker.sh'
  ~/toggle-speaker.sh $argv
        
end
