function randomize-wallpapers --wraps='feh --bg-fill --randomize /media/Pictures/Wallpapers/*' --wraps='feh --bg-fill -rz /mnt/media/Library/Pictures/Wallpapers/' --description 'alias randomize-wallpapers=feh --bg-fill -rz /mnt/media/Library/Pictures/Wallpapers/'
  feh --bg-fill -rz /mnt/media/Library/Pictures/Wallpapers/ $argv
        
end
