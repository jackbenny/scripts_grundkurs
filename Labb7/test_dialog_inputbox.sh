#!/bin/bash

# Jack-Benny Persson
# LX13
# Testing inputboxes

# Binaries
Dialog="/usr/bin/dialog"

# Santiy check
if [ ! -x $Dialog ]; then
	echo "Can't execute $Dialog"
	exit 2
fi

# Main
$Dialog --inputbox "Your name" 10 60 2> /tmp/namefrombox
Name=`cat /tmp/namefrombox`

$Dialog --msgbox "Your name is $Name" 10 60

exit 0
