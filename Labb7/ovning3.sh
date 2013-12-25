#!/bin/bash

# Jack-Benny Persson
# LX13
# Excercise 3, lab 7 (Code a script to help admins create new users)

# Define some variables

# Binaries
Chpasswd="/usr/sbin/chpasswd"
Dialog="/usr/bin/dialog"
Grep="/bin/grep"
Cat="/bin/cat"

# Functions
ask()
{
	$Dialog --backtitle "Create new user" --inputbox "$1" 10 60\
		>> /tmp/createuser
	Input=`$Cat /tmp/createuser`
	if [ $? -ne 0 ]; then
		echo "Aborting, something went wrong..."
		exit 2
	elif [ $? -eq 255 ]; then
		echo "Aborting, user hit ESC"
		exit 2
	fi
}

list_shells()
{
	for Shell in `$Cat /etc/shells | $Grep /bin`; do
		echo "$Shell '$Shell'"	
	done
}

# Sanity checks
if [ $EUID -ne 0 ]; then
	echo "You need to run this script as root"
	exit 2
fi

for bin in $Chpasswd $Dialog; do
	if [ ! -x $bin ]; then
		echo "Can't execute $bin"
		exit 2
	fi
done

# Main
ask "Enter username of the new user"
Username=$Input

$Dialog --backtitle "Create new user"\
	--menu "Choose a shell for your new user" 10 60 list_shells
