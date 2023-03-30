function dcss-trunk-update --wraps='cd /media/Games/crawl/&&git pull&&cd ./crawl-ref/source&&make TILES=y&&./crawl' --wraps=./media/Games/crawl/crawl-ref/source/crawl --description 'alias dcss-trunk-update=cd /media/Games/crawl/&&git pull&&cd ./crawl-ref/source&&make TILES=y&&./crawl'
  cd /media/Games/crawl/&&git pull&&cd ./crawl-ref/source&&make TILES=y&&./crawl $argv
        
end
