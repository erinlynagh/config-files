#!/bin/bash

crawlTrunkDir=/mnt/media/Games/crawl-trunk/
crawlBuildDir=/mnt/media/git/crawl/crawl-ref/source/
crawlMorgueDir=/mnt/media/git/personal/dcss_morgue/
crawlSettingsDir=/mnt/media/git/config-files/dcss-config/


# u: tiles update (for trunk)
# cu: console update (for trunk)
# c: run game in console
# e: edit the init file and save
# t: play trunk
# other: play main branch

if [[ $1 == "-e" ]]; then
    micro ~/.crawl/init.txt
    elif [[ $1 == "-h" ]]; then
    echo "h: show this message"
    echo "e: edit the init file"
    echo "s: show stats"
    echo "t: play trunk"
    echo "u: update trunk"
    echo "other: play dungeon crawl"
    elif [[ $1 == "-s" ]]; then
    cp -f ~/.crawl/morgue/*.txt $crawlMorgueDir
    cp -f ~/.crawl/morgue/*.lst $crawlMorgueDir
    cp -f ~/.crawl/saves/scores $crawlMorgueDir
    alacritty -e python /mnt/media/git/config-files/dcss-config/dcssStats.py
    elif [[ $1 == "-u" ]]; then
    cd $crawlBuildDir
    git pull
    make -j4 TILES=y
    ln -sf /mnt/media/git/crawl/crawl-ref/source/crawl /mnt/media/Games/crawl-trunk/crawl
    elif [[ $1 == "-uc" ]]; then
    cd $crawlBuildDir
    git pull
    make -j4    
    ln -sf /mnt/media/git/crawl/crawl-ref/source/crawl /mnt/media/Games/crawl-trunk/crawl
    elif [[ $1 == "-t" ]]; then
    cd ~/.crawl
    $crawlTrunkDir/crawl
     elif [[ $1 == "-hell" ]]; then
    cd ~/.crawl
    /mnt/media/git/hellcrawl/crawl-ref/source/crawl
    elif [[ $1 == "-bloat" ]]; then
    cd ~/.crawl
    /mnt/media/git/bloatcrawl2/crawl-ref/source/crawl
    elif [[ $1 == "-c" ]]; then
    crawl  
else
    crawl-tiles
fi

#backup files
cp ~/.crawl/morgue/*.txt $crawlMorgueDir
cp ~/.crawl/morgue/*.lst $crawlMorgueDir
cp -f ~/.crawl/macro.txt $crawlSettingsDir
cp -f ~/.crawl/init.txt $crawlSettingsDir
