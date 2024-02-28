#!/bin/bash

crawlGameDir=/mnt/media/Games/crawl/
crawlBuildDir=/mnt/media/Games/crawl/crawl-ref/source/
crawlMorgueDir=/mnt/media/git/personal/dcss_morgue/
crawlSettingsDir=/mnt/media/git/config-files/dcss-config/


# u: tiles update (for trunk)
# cu: console update (for trunk)
# c: run game in console
# e: edit the init file and save
# t: play trunk
# other: play main branch

if [[ $1 == "-e" ]]; then
    code ~/.crawl/init.txt
    elif [[ $1 == "-h" ]]; then
    echo "h: show this message"
    echo "e: edit the init file"
    echo "s: show stats"
    echo "other: play dungeon crawl"
    elif [[ $1 == "-s" ]]; then
    cp -f ~/.crawl/morgue/*.txt $crawlMorgueDir
    cp -f ~/.crawl/morgue/*.lst $crawlMorgueDir
    cp -f ~/.crawl/saves/scores $crawlMorgueDir
    alacritty -e python /mnt/media/git/config-files/dcss-config/dcssStats.py
else
    crawl-tiles
fi

#backup files
cp ~/.crawl/morgue/*.txt $crawlMorgueDir
cp ~/.crawl/morgue/*.lst $crawlMorgueDir
cp -f ~/.crawl/macro.txt $crawlSettingsDir
cp -f ~/.crawl/init.txt $crawlSettingsDir
