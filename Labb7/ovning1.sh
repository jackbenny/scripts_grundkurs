#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 1 (Make a menu that let's the user choose a web browser)

# Binaries
Dialog="/usr/bin/dialog"
Whereis="/usr/bin/whereis"

# Santiy checks
if [ ! -x $Dialog ]; then
	echo "Can't excute $Dialog"
	exit 1
fi

# Main
$Dialog --menu "Choose a browser to start" 12 60 4\
	firefox "Firefox" opera "Opera" \
	lynx "Lynx" links "Links" 2> /tmp/browserchoice
Browser=`cat /tmp/browserchoice`

BinPath=`$Whereis $Browser | awk '{ print $2 }'`

echo $BinPath | grep / &> /dev/null
if [ $? -ne 0 ]; then
	$Dialog --msgbox "It seems that you don't have $Browser installed" 10 60
	exit 1
fi

$Dialog --infobox "Starting up $Browser for you" 10 60
$BinPath

exit 0
