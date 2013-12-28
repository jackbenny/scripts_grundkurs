#!/bin/bash

# Jack-Benny Persson
# LX13
# Exercise 4 on lab 8 (Write a script that sends a report to the sysadmin
# about the 5 biggest homefolders on the system

# Binaries
Sed="/bin/sed"
Awk="/usr/bin/awk"
Du="/usr/bin/du"
Mktemp="/bin/mktemp"
Mail="/usr/bin/mail"
Printf="/usr/bin/printf"
Rm="/bin/rm"

# Variables
Admin="jake"

# Sanity checks
for Bin in $Sed $Awk $Du $Mktemp $Mail $Printf $Rm; do
	if [ ! -x $Bin ]; then
		echo "Can't execute $Bin"
		exit 1
	fi
done

if [ ! -w /tmp/ ]; then
	echo "Can't create temporary files, aborting"
	exit 1
fi


# Main

# Create a temporary file
File=`$Mktemp -t homeusage.XXXXXX`

# Redirect all output to the temporary file
exec 1> $File

# Create the mail content
$Printf "Home folder usage report (the top 5 users)\n\n"
$Printf "Usage   \tUser\n"
$Printf "-----   \t----\n"
$Du -sm /home/* | sort -r | sed -n '1,5p' | awk '{ print $1 " Mbyte   \t" $2 }'

# And finaly send it to it's recipient
$Mail $Admin -s "User usage report" < $File

# Clean up
$Rm $File

exit 0
