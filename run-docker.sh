#!/bin/bash

if [[ -d ../Notebooks ]] ; then
    echo "../Notebooks directory exists.."
else
    echo "Creating ../Notebooks"
    mkdir ../Notebooks
fi

pushd docker/jupyter
./up.sh
