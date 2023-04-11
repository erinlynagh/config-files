#!/bin/bash
#Check
if [[ $1 == "-u"  ]]; then
    cd /media/Games/crawl/crawl-ref/source
    git pull
    make TILES=y
elif [[ $1 == "-e" ]]; then
    micro ~/.crawl/init.txt
    cp -f ~/.crawl/init.txt /media/git/config-files/dcss-config/init.txt
else
	cd /media/Games/crawl/
    exec /media/Games/crawl/crawl-ref/source/crawl
fi
