function battery-level --wraps='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep time' --wraps='upower -i /org/freedesktop/UPower/devices/battery_BAT0' --description 'alias battery-level=upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep time'
  upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep time $argv
        
end
