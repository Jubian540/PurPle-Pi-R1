#!/bin/bash

SSD_202=`sudo docker images | grep ssd202 | awk '{print $1}'`


if [ "$SSD_202" != "ssd202" ]; then
    tar cvzf gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf.tgz -C ../toolchain gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf
    sudo docker build --tag ssd202:16.04 .
    rm gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf.tgz
fi


sudo docker run -it --rm --name ssd202 -u $(id -u):$(id -g) -v $PWD/../:/home/sdkuser -w /home/sdkuser --user sdkuser ssd202:16.04
