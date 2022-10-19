#!/bin/sh

set -x

tmproot="/tmp"
skip_paths[0]="/data/miui/app/"

# more dir could be defined as:
# skip_paths[1] = "..."
# skip_paths[2] = "..."

all="/*"

for dir in ${skip_paths[@]}
do
    if [ ! -e $dir ];then
    mkdir -p $dir
    fi
    cp -r $tmproot$dir$all $dir >> /cache/`getprop ro.bootimage.name`/last_log 2>&1
done

setprop status.reservedata 1
