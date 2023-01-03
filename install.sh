#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

cd "${0%/*}"

dir="`pwd`"
HOME="/home/vili"

for i in ".tmux.conf $HOME" ".vimrc $HOME" ".zshrc $HOME" "i3-config $HOME/.i3/config" "i3-status-config $HOME/.config/i3status/config" ".gitconfig $HOME" "sshd_config /etc/ssh/"
do
	set -- $i # convert the "tuple" into the param args $1 $2...
	read -p "Install $1 in $2? " y

	if [[ $y == "y" ]]
	then
		ln -si $dir/$1 $2
	fi

done
