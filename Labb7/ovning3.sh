#!/bin/bash

# Jack-Benny Persson
# LX13
# Excercise 3, lab 7 (Code a script to help admins create new users)

# Define some variables

# Binaries
Chpasswd="/usr/sbin/chpasswd"
Useradd="/usr/sbin/useradd"
Dialog="/usr/bin/dialog"
Grep="/bin/grep"
Cat="/bin/cat"
Rm="/bin/rm"
Temp=`mktemp -t createuser.XXXX` # This is safer than just creating the file
				 # manualy, since it will be chmod 600 now

# Functions
ask()
{
	$Dialog --backtitle "Create new user" --inputbox "$1" 10 60\
		2> $Temp
	if [ $? -eq 255 ]; then
		echo "Aborting, user hit ESC"
		exit 1
	fi
	Input=`$Cat $Temp`

}


# Sanity checks
if [ $EUID -ne 0 ]; then
	echo "You need to run this script as root"
	exit 1
fi

for bin in $Chpasswd $Useradd $Dialog $Grep $Cat $Rm; do
	if [ ! -x $bin ]; then
		echo "Can't execute $bin"
		exit 1
	fi
done

# Main
ask "Enter username of the new user"
Username=$Input

# Get a list of all avaliable shells on the system
Shell=`$Cat /etc/shells | $Grep /bin`
ShellList=`printf "$Shell" | sed 's/ / shell /g' | sed 's/$/ shell/'`

HowMany=`echo $Shell | wc -w` # How many shells are avaliable?

$Dialog --backtitle "Create new user"\
	--menu "Choose a shell for your new user" 14 60 $HowMany $ShellList\
	2> $Temp
	if [ $? -eq 255 ]; then
		echo "Aborting, user hit ESC"
		exit 1
	fi
Input=`$Cat $Temp` 
UserShell=$Input

ask "Enter a password for the new user"
Password=$Input

# Remove the temp file (it contains the password of latest created user)
$Rm $Temp

# Create the user and set the password
$Useradd -m -s $UserShell $Username
echo "${Username}:${Password}" | $Chpasswd

exit 0
