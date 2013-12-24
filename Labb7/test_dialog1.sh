#!/bin/bash

# Jack-Benny Persson
# LX13
# Testing out dialog

# Variables
Dialog="/usr/bin/dialog"

# Sanity check
if [ ! -x $Dialog ]; then
	echo "Can't execute $Dialog"
	exit 2
fi

# Main
$Dialog --backtitle "Epic App" --msgbox \
"Welcome to Epic App, hit enter to continue" 10 60
if [ $? -ne 0 ]; then
	echo "Quitting"
	exit 1
fi

$Dialog --backtitle "Epic App" --title "U sure?" --yesno \
"Are you sure you want to continue?" 10 60
if [ $? -eq 1 ]; then
	echo "Okay, you said no, quitting"
	exit 2
elif [ $? -eq 255 ]; then
	echo "Ok, escaping..."
	exit 2
fi

if [ $? -ne 0 ]; then
	echo "Something else happend, bailing out"
	exit 2
fi

$Dialog --backtitle "Epic App" --infobox "Booting up..." 10 60
sleep 3

$Dialog --backtitle "Epic App" --pause "Waiting to get ready..." 10 60 5
if [ $? -eq 254 ]; then
	echo "Ok, aborting"
	exit 2
fi



