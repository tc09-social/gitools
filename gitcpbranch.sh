#!/bin/bash
#
# gitcpconfig.sh
#
usage () {
    echo $0 newBranch oldBranch gitCloneURL
    exit 1
    }
###
# Start Here
###
newprj=$1
oldbr=$2
newbr=$newprj
base=$3
if [ -z "$newprj ] || [ -z "oldbr" ] || [ -z "$base" ]; then
    usage
fi
sh gitbranch.sh $oldbr $base
cd $oldbr
git checkout -b $newbr
git push --all origin
cd ..
rm -fr $oldbr
sh gitbranch.sh $newbr $base
