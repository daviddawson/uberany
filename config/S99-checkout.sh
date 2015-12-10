#!/bin/bash
set -e

if [ ! -d "/home/project" ]; then
    echo "directory does not exist"
    mkdir /home/project
    git clone ${giturl} /home/project

    if [ -e /home/project/build.sh ];then
        echo "Found build file"
        cd /home/project
        chmod +x build.sh
        ./build.sh
    else
        echo "Did not find build file"
    fi
fi

if [ -e /home/project/run.sh ];then
    echo "Found run file"
    cd /home/project
    chmod +x run.sh
    ./run.sh
else
    echo "Did not find run file"
fi