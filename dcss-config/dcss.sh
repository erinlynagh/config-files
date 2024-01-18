#!/bin/bash

crawlGameDir=/media/Games/crawl/
crawlBuildDir=/media/Games/crawl/crawl-ref/source/
crawlMorgueDir=/media/git/personal/dcss_morgue/
crawlSettingsDir=/media/git/config-files/dcss-config/


# u: tiles update (for trunk)
# cu: console update (for trunk)
# c: run game in console
# e: edit the init file and save
# t: play trunk
# other: play main branch

if [[ $1 == "-u"  ]]; then
    cd $crawlBuildDir || exit
    git pull
    make TILES=y
    elif [[ $1 == "-cu"  ]]; then
    cd $crawlBuildDir || exit
    git pull
    mv ./crawl ./crawl-tiles
    make
    mv ./crawl ./crawl-console
    rm -f /media/Games/crawl/crawl-console
    mv ./crawl-console $crawlGameDir
    mv ./crawl-tiles ./crawl
    elif [[ $1 == "-c" ]]; then
    cd $crawlGameDir || exit
    ./crawl-console
    elif [[ $1 == "-cw" ]]; then
    cd $crawlGameDir || exit
    kitty --detach -e ./crawl-console
    elif [[ $1 == "-e" ]]; then
    code ~/.crawl/init.txt
    elif [[ $1 == "-t" ]]; then
    cd $crawlGameDir || exit
    /media/Games/crawl/crawl-ref/source/crawl &
    elif [[ $1 == "-h" ]]; then
    echo "h: show this message"
    echo "u: tiles update (for trunk)"
    echo "cu: console update (for trunk)"
    echo "c: run game in console"
    echo "e: edit the init file and save"
    echo "t: play trunk"
    echo "other: play main branch"
    elif [[ $1 == "-s" ]]; then
    cp -f ~/.crawl/morgue/*.txt $crawlMorgueDir
    cp -f ~/.crawl/morgue/*.lst $crawlMorgueDir
    cp -f ~/.crawl/saves/scores $crawlMorgueDir
    cp -f /media/Games/crawl/morgue/*.txt $crawlMorgueDir
    cp -f /media/Games/crawl/morgue/*.lst $crawlMorgueDir
    cp -f /media/Games/crawl/saves/scores $crawlMorgueDir
    python /media/git/config-files/dcss-config/dcssStats.py
else
    crawl-tiles &
    notify-send "reminder" "backup your morgue files to git occasionally"
fi

#backup files
cp /media/Games/crawl/morgue/*.txt $crawlMorgueDir
cp /media/Games/crawl/morgue/*.lst $crawlMorgueDir
cp ~/.crawl/morgue/*.txt $crawlMorgueDir
cp ~/.crawl/morgue/*.lst $crawlMorgueDir
cp -f ~/.crawl/macro.txt $crawlSettingsDir
cp -f ~/.crawl/init.txt $crawlSettingsDir
