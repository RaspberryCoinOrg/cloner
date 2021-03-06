#!/bin/bash

if [ "$1" == "" ]; then {
    COIN=bitcoin
    }
else {
    COIN=$1
    } fi

cat config/Dockerblank | sed "s/cointemplate/$COIN/g" > Dockerfile
sed -i "s/coincommand/$COIN/g" Dockerfile
sed -i "s/coin_vars/${COIN}_vars/g" Dockerfile
docker build -t coinclone/$COIN .
