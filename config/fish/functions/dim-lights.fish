function dim-lights --wraps='gummy -b 0&&gummy -s 0 -p 0' --wraps='gummy -b 0 -s 1&&gummy -p 0 -s 0' --wraps='gummy -b 0 -s 1&&gummy -p 25 -s 0' --wraps='gummy -b 0 -s 1&&gummy -p 50 -s 0' --description 'alias dim-lights=gummy -b 0 -s 1&&gummy -p 50 -s 0'
  gummy -b 0 -s 1&&gummy -p 50 -s 0 $argv
        
end
