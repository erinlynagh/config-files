function battery-info --wraps='upower -i /org/freedesktop/UPower/devices/battery_BAT0' --description 'alias battery-info=upower -i /org/freedesktop/UPower/devices/battery_BAT0'
  upower -i /org/freedesktop/UPower/devices/battery_BAT0 $argv
        
end
