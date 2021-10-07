#!/bin/bash

ACTIVAR="~/personal/activar/activar"
CHE="~/personal/cheacercate.com.ar"
AGREE="~/agree"
AVATAR="~/avatar"

#agree projects
AGREE_API2="~/agree/agreemarket-api2"
AGREE_AUTH="~/agree/agreemarket-auth"
AGREE_FRONT="~/agree/agreemarket-front"

createWindow() {
    session=$1
    window=$2
    shift
    shift
    hasWindow=$(tmux list-windows -t $session | grep "$window")
    if [ -z "$hasWindow" ]; then
        cmd="tmux neww -t $session: -n $window -d"
		if [ $# -gt 0 ]; then
			cmd="$cmd $@"
		fi
        echo "Creating Window(\"$hasWindow\"): $cmd"
        eval $cmd
    fi
}

createSession() {
    session=$1
    window=$2
    shift
    shift
    cmd="tmux new -s $session -d -n $window $@ > /dev/null 2>&1"

    echo "Creating Session: $cmd"
    eval $cmd
}

sendCommand(){
    session=$1
    window=$2
    shift
    shift
    cmd="tmux send-keys -t $session:$window \"$@\" C-m"
    echo "Sending command: $cmd"
    eval $cmd
}

while [ "$#" -gt 0 ]; do
    curr=$1
    shift

    case "$curr" in
		"--che")
			createSession che primary -c $CHE
			createWindow che front -c $CHE/frontend
			sendCommand che front "loadnvm && nvm use 14 && yarn dev"
			createWindow che back -c $CHE/backend 
			sendCommand che back "loadnvm && nvm use 14 && yarn develop"
			;;
		"--activar")
			createSession activar primary -c $ACTIVAR
			sendCommand activar primary "loadnvm"
			createWindow activar npm -c $ACTIVAR
			sendCommand activar npm "loadnvm && npm run dev"
			;;
		"--avatar")
			createSession avatar primary -c $AVATAR
			;;
		"--agree")
			createSession agree api2-auth-front -c $AGREE
			sendCommand agree api2-auth-front "cd $AGREE_API2/laravel"
			sendCommand agree api2-auth-front "tmux split-window -h"
			sendCommand agree api2-auth-front "cd $AGREE_FRONT/laravel"
			sendCommand agree api2-auth-front "tmux split-window -v"
			sendCommand agree api2-auth-front "cd $AGREE_API2"
			createWindow agree webhooks -c $AGREE/agree-webhooks
			sendCommand agree webhooks "loadnvm && v ."
			createWindow agree webhooks-server -c $AGREE/agree-webhooks
			sendCommand agree webhooks-server "loadnvm && npm run dev"
			;;

    *) echo "Unavailable command... $curr"
    esac
done
