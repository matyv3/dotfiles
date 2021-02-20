#!/bin/bash

ACTIVAR="~/projects/activar/activar"
CHE="~/projects/cheacercate.com.ar"
AVATAR="/var/www/"

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
			createWindow activar npm -c $ACTIVAR
			sendCommand activar npm "loadnvm && npm run dev"
			;;
		"--avatar")
			createSession avatar primary -c $AVATAR
			;;

    *) echo "Unavailable command... $curr"
    esac
done
