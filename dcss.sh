#!/bin/bash

mainDir=/mnt/media

crawlTrunkDir=$mainDir/Games/crawl-trunk/
crawlBuildDir=$mainDir/git/crawl/crawl-ref/source/
crawlMorgueDir=$mainDir/git/personal/dcss_morgue/
crawlSettingsDir=$mainDir/git/config-files/dcss-config/

hellDir=$mainDir/Games/hellcrawl

bloatDir=$mainDir/Games/bloatcrawl

bcadrencrawlDir=$mainDir/Games/BcadrenCrawl
bcadrencrawlBuildDir=$mainDir/git/BcadrenCrawl/crawl-ref/source/

twoFourDir=$mainDir/Games/crawl-24/source

kimchiDir=$mainDir/Games/kimchicrawl

# u: tiles update (for trunk)
# cu: console update (for trunk)
# c: run game in console
# e: edit the init file and save
# t: play trunk
# other: play main branch
cd ~/.crawl
if [[ $1 == "-e" ]]; then
    micro ~/.crawl/init.txt
elif [[ $1 == "-h" || $1 == "--help" || $1 == "-help" ]]; then
    echo "h/help: show this message"
    echo "e: edit the init file"
    echo "s: show stats"
    echo "t: play trunk"
    echo "u: update trunk"
    echo "uc: update trunk (console)"
    echo "hell: play hellcrawl (variant)"
    echo "bloat: play bloatcrawl (variant)"
    echo "bc: play bcadrencrawl (variant)"
    echo "ubc: update bcadrencrawl (variant)"
    echo "k: play kimchi (variant)"
    echo "24: play 0.24"
    echo "c: play console"
    echo "other: play dungeon crawl"
    exit 0
elif [[ $1 == "-s" ]]; then
    cp -f ~/.crawl/morgue/*.txt $crawlMorgueDir
    cp -f ~/.crawl/morgue/*.lst $crawlMorgueDir
    cp -f ~/.crawl/saves/scores $crawlMorgueDir
    python $mainDir/git/config-files/dcss-config/dcssStats.py
elif [[ $1 == "-u" ]]; then
    cd $crawlBuildDir
    git pull
    ccache make -j4 TILES=y
    ln -sf $mainDir/git/crawl/crawl-ref/source/crawl $mainDir/Games/crawl-trunk/crawl
    paplay ~/notificationSound.wav
elif [[ $1 == "-uc" ]]; then
    cd $crawlBuildDir
    git pull
    ccache make -j4
    ln -sf $mainDir/git/crawl/crawl-ref/source/crawl $mainDir/Games/crawl-trunk/crawl
    paplay ~/notificationSound.wav
elif [[ $1 == "-ubc" ]]; then
    cd $bcadrencrawlBuildDir
    git pull
    ccache make -j4 TILES=y
    ln -sf $mainDir/git/BcadrenCrawl/crawl-ref/source/crawl $mainDir/Games/BcadrenCrawl/crawl
    paplay ~/notificationSound.wav
elif [[ $1 == "-t" ]]; then
    cd ~/.crawl
    $crawlTrunkDir/crawl
elif [[ $1 == "-hell" ]]; then
    cd $hellDir
    $hellDir/crawl
elif [[ $1 == "-bloat" ]]; then
    cd $bloatDir
    $bloatDir/crawl
elif [[ $1 == "-k" ]]; then
    cd $kimchiDir
    $kimchiDir/crawl
elif [[ $1 == "-24" ]]; then
    cd $twoFourDir
    $twoFourDir/crawl
elif [[ $1 == "-bc" ]]; then
    cd $bcadrencrawlDir
    $bcadrencrawlDir/crawl
elif [[ $1 == "-c" ]]; then
    crawl
else
    crawl-tiles
fi

# Backup the morgue files and settings
oldDate=$(cat ~/.crawl/backup_timestamp)
if [ -z "$oldDate" ]; then
    oldDate="1970-01-01 00:00:00"
fi

find ~/.crawl/morgue/ -type f \( -name "*.txt" -o -name "*.lst" \) -newermt "$oldDate" -exec cp {} $crawlMorgueDir \;

currentDate=$(date +"%Y-%m-%d %H:%M:%S")    
echo $currentDate > ~/.crawl/backup_timestamp

cp ~/.crawl/morgue/scores $crawlMorgueDir
cp -f ~/.crawl/macro.txt $crawlSettingsDir
cp -f ~/.crawl/init.txt $crawlSettingsDir
