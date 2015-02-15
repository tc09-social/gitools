#!/bin/bash
#
# gitbranch.sh
#
usage() {
   echo $0 gitBranch gitCloneURL
   exit 1
   }
###
# Start Here
###
BRANCH=$1
URL=$2
if [ -z "$BRANCH" ] || [ -z "$URL" ]; then
   usage
fi
mkdir $BRANCH
cd $BRANCH
git init
git remote add origin $URL
git fetch origin $BRANCH
git checkout $BRANCH
