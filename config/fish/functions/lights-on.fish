function lights-on --wraps='gummy -T 0-b 100 -p 100' --wraps='gummy -T 0 -b 100 -p 100' --description 'alias lights-on=gummy -T 0 -b 100 -p 100'
  gummy -T 0 -b 100 -p 100 $argv
        
end
