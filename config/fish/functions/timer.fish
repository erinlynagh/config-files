function timer --wraps='cd && sleep 20m && paplay alarm.mp3 && cd -' --description 'alias timer=cd && sleep 20m && paplay alarm.mp3 && cd -'
    cd && sleep $argv && paplay alarm.mp3 && cd -
end
