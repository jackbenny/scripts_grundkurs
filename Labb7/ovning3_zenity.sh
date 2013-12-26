#!/bin/bash

# Jack-Benny Persson
# LX13
# Excercise 3, lab 7 (Code a script to help admins create new users)

# Define some variables

# Binaries
Chpasswd="/usr/sbin/chpasswd"
Useradd="/usr/sbin/useradd"
Zenity="/usr/bin/zenity"
Grep="/bin/grep"
Cat="/bin/cat"
Rm="/bin/rm"

# Functions
ask()
{
	$Zenity --title "Create new user" --forms \
		--add-entry="Username" \
		--add-entry="Full path of shell" \
		--add-entry="Optional comment (Full name etc)" \
		--add-password="Password" \
		> /tmp/createuser
	Input=`$Cat /tmp/createuser`
	if [ $? -eq 1 ]; then
		echo "Aborting, user hit cancel..."
		exit 2
	elif [ $? -ne 0 ]; then
		echo "Aborting, something went wrong"
		exit 2
	fi
}


# Sanity checks
if [ $EUID -ne 0 ]; then
	echo "You need to run this script as root"
	exit 2
fi

for bin in $Chpasswd $Useradd $Zenity $Grep $Cat $Rm; do
	if [ ! -x $bin ]; then
		echo "Can't execute $bin"
		exit 2
	fi
done

# Main
ask "Enter username of the new user"
Username=$Input

# Get a list of all avaliable shells on the system
Shell=`$Cat /etc/shells | $Grep /bin`
ShellList=`printf "$Shell" | sed 's/ / shell /g' | sed 's/$/ shell/'`

HowMany=`echo $Shell | wc -w` # How many shells are avaliable?

$Zenity --backtitle "Create new user"\
	--menu "Choose a shell for your new user" 14 60 $HowMany $ShellList\
	2> /tmp/createuser
Input=`$Cat /tmp/createuser`
UserShell=$Input

ask "Enter a password for the new user"
Password=$Input

# Remove the temp file (it contains the password of latest created user)
$Rm /tmp/createuser

# Create the user and set the password
$Useradd -m -s $UserShell $Username
echo "${Username}:${Password}" | $Chpasswd

exit 0
