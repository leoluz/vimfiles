#!/bin/sh
image="leoluz/vimfiles:local"
imageFound=$(docker images -qf "label=$image" | wc -l)
if [ $imageFound -eq 0 ]; then
    docker build -t $image --label $image .
fi

found=$(docker ps -qaf name="^/leoluz-vimfiles$" | wc -l)
if [ $found -eq 1 ]; then
    docker start -i leoluz-vimfiles
else
    docker run --name leoluz-vimfiles -it $image
fi
