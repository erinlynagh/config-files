#!/bin/bash
#Check
if [[ $1 != "-u"  ]]; then
    cd /media/Games/crawl/
    exec /media/Games/crawl/crawl-ref/source/crawl
else
	cd /media/Games/crawl/crawl-ref/source
	git pull
	make TILES=y
fi
