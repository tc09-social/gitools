#!/bin/bash
#
# gitconfig.sh
#
#
# setdefconfig
#
setdefconfig () {
    git config --global user.name "$username"
    git config --global user.email "$email"
    git config --global core.editor "vi"
    git config --global core.autocrlf false 
    git config --global core.eol lf
    # (Sets the EOL to LF so that if you build an installer locally the linux scripts will work)
    git config --global push.default simple

    # Improve readability:
    git config --global log.abbrevCommit yes
    git config --global core.abbrev 8

    # ignore sslVerify to allow self-signed cert
    git config --global http.sslVerify false
    }

###
# Start Here
###
username=`git config --get user.name`
email=`git config --get user.email`
if [ -z "$username" ] || [ -z "$email" ]; then
    while [ -z "$username" ]; do
	echo -n "Enter your user name: "
	read username
    done
    while [ -z "$email" ]; do
	echo -n "Enter your email: "
	read email
    done
    echo Username to be used: "$username".
    echo eMail to be used: "$email".
    yesno=""
    while [ -z "$yesno" ]; do
	echo -n "n to quit, Continue [y|n]? "
	read yesno
    done
    if [ "$yesno" = "n" ]; then
	exit 1
    fi
    setdefconfig
    echo git config set, use git config -l to see the setting
else
    echo git config set previously, use git config -l to see the setting
fi

