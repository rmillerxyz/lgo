#!/bin/bash
export NB_USER="gopher"
export NB_UID=1000
export HOME="/home/${NB_USER}"
docker-compose up -d
url=$(docker-compose exec jupyter jupyter notebook list | grep http | awk '{print $1}')
if [[ -z $url ]]; then
    echo Cannot determine url
    exit 1
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    xdg-open $url
elif [[ "$OSTYPE" == "darwin"* ]]; then
    open $url
else
    echo $url
fi

sleep 4
docker-compose exec jupyter jupyter notebook list
