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
		--add-entry="Comment (Full name etc)" \
		--add-password="Password" \
		> /tmp/createuser
	if [ $? -eq 1 ]; then
		echo "Aborting, user hit cancel..."
		exit 1
	fi
	Input=`$Cat /tmp/createuser`
}

extract_data()
{
	Username=`echo $Input | awk -F "|" '{ print $1 }'`
	UserShell=`echo $Input | awk -F "|" '{ print $2 }'`
	Comment=`echo $Input | awk -F "|" '{ print $3 }'`
	Password=`echo $Input | awk -F "|" '{ print $4 }'`
}


# Sanity checks
if [ $EUID -ne 0 ]; then
	echo "You need to run this script as root"
	exit 1
fi

for bin in $Chpasswd $Useradd $Zenity $Grep $Cat $Rm; do
	if [ ! -x $bin ]; then
		echo "Can't execute $bin"
		exit 1
	fi
done

# Main

# Display the question form
ask

# Extract the data from the temp file
extract_data

# Remove temp file for security reasons
$Rm /tmp/createuser

# Create the user and set the password
$Useradd -m -s $UserShell -c "$Comment" $Username
if [ $? -ne 0 ]; then
	echo "Couldn't create new user $Username, aborting"
	exit 1
fi
echo "${Username}:${Password}" | $Chpasswd

exit 0

