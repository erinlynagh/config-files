#!/bin/bash

cp ~/.crawl/morgue/*.lst /media/git/personal/dcss_morgue/
cp -f ~/.crawl/macro.txt /media/git/config-files/dcss-config/macro.txt
cp -f ~/.crawl/init.txt /media/git/config-files/dcss-config/init.txt

if [[ $1 == "-u"  ]]; then
    cd /media/Games/crawl/crawl-ref/source
    git pull
    make TILES=y
elif [[ $1 == "-e" ]]; then
    micro ~/.crawl/init.txt
    cp -f ~/.crawl/init.txt /media/git/config-files/dcss-config/init.txt
elif [[ $1 == "-t" ]]; then
    cd /media/Games/crawl/
    exec /media/Games/crawl/crawl-ref/source/crawl
else
	crawl-tiles
fi

notify-send "reminder" "backup your morgue files to git occasionally"
