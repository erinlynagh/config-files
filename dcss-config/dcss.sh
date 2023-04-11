#!/bin/bash

crawlGameDir=/media/Games/crawl/
crawlBuildDir=/media/Games/crawl/crawl-ref/source/
crawlMorgueDir=/media/git/personal/dcss_morgue/
crawlSettingsDir=/media/git/config-files/dcss-config/
crawlConsole=/media/Games/crawl/crawl-console


# u: tiles update (for trunk)
# cu: console update (for trunk)
# c: run game in console
# e: edit the init file and save
# t: play trunk
# other: play main branch

if [[ $1 == "-u"  ]]; then
    cd $crawlBuildDir
    git pull
    make TILES=y
elif [[ $1 == "-cu"  ]]; then
    cd $crawlBuildDir
    git pull
    mv ./crawl ./crawl-tiles
    make
    mv ./crawl ./crawl-console
    rm -f /media/Games/crawl/crawl-console
    mv ./crawl-console $crawlGameDir
    mv ./crawl-tiles ./crawl
elif [[ $1 == "-c" ]]; then
    cd $crawlGameDir
    alacritty -e $crawlConsole
    notify-send "reminder" "backup your morgue files to git occasionally"
elif [[ $1 == "-e" ]]; then
    micro ~/.crawl/init.txt
elif [[ $1 == "-t" ]]; then
    cd $crawlGameDir
    /media/Games/crawl/crawl-ref/source/crawl
    notify-send "reminder" "backup your morgue files to git occasionally"
else
	crawl-tiles
	notify-send "reminder" "backup your morgue files to git occasionally"
fi

#backup files
cp ~/.crawl/morgue/*.lst $crawlMorgueDir
cp -f ~/.crawl/macro.txt $crawlSettingsDir
cp -f ~/.crawl/init.txt $crawlSettingsDir
