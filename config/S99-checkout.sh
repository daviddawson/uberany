#!/bin/bash
set -e

if [ ! -d "/home/project" ]; then
    echo "directory does not exist"
    mkdir /home/project
    git clone ${giturl} /home/project

    if [ -e ~/home/project/build.sh ];then
        echo "Found build file"
        /home/project/build.sh
    else
        echo "Did not find build file"
    fi
fi

if [ -e ~/home/project/run.sh ];then
    echo "Found run file"
    /home/project/run.sh
else
    echo "Did not find run file"
fi