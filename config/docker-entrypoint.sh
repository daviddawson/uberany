#!/bin/bash
set -e

if [${giturl}] then
    git clone ${giturl} /home/project
else
    echo "No Git repo specified"
fi

if [ -e ~/home/project/build.sh ];then
    echo "Found build file"
    /home/project/build.sh
else
    echo "Did not find build file"
fi

if [ -e ~/home/project/run.sh ];then
    echo "Found run file"
    /home/project/run.sh
else
    echo "Did not find run file"
fi

exec "$@"