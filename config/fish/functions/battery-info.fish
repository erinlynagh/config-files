function battery-info --wraps='upower -i /org/freedesktop/UPower/devices/battery_BAT0' --wraps=upower\ -i\ /org/freedesktop/UPower/devices/battery_BAT0\ \|\ grep\ -e\ \"state:\"\ \|\ sed\ \'s/^\[\ \\t\]\*state:\ \[\ \\t\]\*//\' --description alias\ battery-info=upower\ -i\ /org/freedesktop/UPower/devices/battery_BAT0\ \|\ grep\ -e\ \"state:\"\ \|\ sed\ \'s/^\[\ \\t\]\*state:\ \[\ \\t\]\*//\'
  upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -e "state:" | sed 's/^[ \t]*state: [ \t]*//' $argv
        
end
