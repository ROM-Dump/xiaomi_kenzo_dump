#!/bin/sh

set -x

tmproot="/tmp"
skip_paths[0]="/data/miui/app/"

# more dir could be defined as:
# skip_paths[1] = "..."
# skip_paths[2] = "..."

for dir in ${skip_paths[@]}
do
    if [ -e $dir ];then
    cp -r --parents $dir $tmproot >> /cache/`getprop ro.bootimage.name`/last_log 2>&1
    else
    echo "ignore $dir, not exist" >> /cache/`getprop ro.bootimage.name`/last_log 2>&1
    fi
done

setprop status.reservedata 1
