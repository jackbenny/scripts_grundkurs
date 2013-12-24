#!/bin/bash

# Jack-Benny Persson
# LX13
# Testing menus with dialog

# Binaries
Dialog="/usr/bin/dialog"

# Sanity check
if [ ! -x $Dialog ]; then
	echo "Can't excute $Dialog"
	exit 2
fi

$Dialog --menu "Choose your editor" 10 60 3 vi "The vi Editor"\
	emacs "The emacs Editor" nano "The nano Editor" 2> /tmp/editorchoice

Editor=`cat /tmp/editorchoice`

$Dialog --msgbox "You selected $Editor" 10 60

exit 0
