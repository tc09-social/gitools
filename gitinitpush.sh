#!/bin/bash
#
# gitinitpush.sh
#
usage () {
    echo $0 gitCloneURL
    exit 1
    }
###
# Start Here
###
base=$1
if [ -z "$base" ]; then
    usage
fi
git init
git add .
git commit -m "init..."
git remote add origin $base
git push --set-upstream origin master
