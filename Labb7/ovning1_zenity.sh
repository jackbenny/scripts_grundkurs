#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 1 (Make a menu that let's the user choose a web browser)

# Binaries
Zenity="/usr/bin/zenity"
Whereis="/usr/bin/whereis"

# Santiy checks
if [ ! -x $Zenity ]; then
	echo "Can't excute $Zenity"
	exit 2
fi

# Main
$Zenity --text "Choose a browser" --list --column="Start"\
	--column "Browser" --radiolist FALSE firefox FALSE lynx FALSE links FALSE w3m\
	> /tmp/browserchoice
Browser=`cat /tmp/browserchoice`

BinPath=`$Whereis $Browser | awk '{ print $2 }'`

echo $BinPath | grep / &> /dev/null
if [ $? -ne 0 ]; then
	$Zenity --info --text="It seems you don't have $Browser installed"
	exit 2
fi

$BinPath &

exit 0
