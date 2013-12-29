#!/bin/bash

# Jack-Benny Persson
# LX13
# Exercise 7 lab 8 (Write a script to show logged in users in a HTML table

# Binaries
Awk="/usr/bin/awk"
Sed="/bin/sed"
Printf="/usr/bin/printf"
Who="/usr/bin/who"

# Variables
Outfile="/home/jake/loggedin.html"

# Sanity check
if [ ! -w `dirname $Outfile` ]; then
	echo "Can't write to `dirname $Outfile`"
	exit 1
fi

for Bin in $Awk $Sed $Printf $Who; do
	if [ ! -x $Bin ]; then
		echo "Can't execute $Bin"
		exit 1
	fi
done


### Main ###
exec 1> $Outfile

# Print the HTML header for us
$Printf "<html><head><title>Logged in users</title></head>\n"
$Printf "<body>\n"
$Printf "<table border=1>\n"
$Printf "<tr>\n"
$Printf "<td><b>User</b></td><td><b>TTY</b></td><td><b>Date</b>"
$Printf "</td><td><b>Time<b></td>\n"
$Printf "</tr>\n"

# Print all the current logins for us in a nice table
$Who | \
awk 'BEGIN { OFS="</td><td>"; ORS="\n</tr><tr>\n" } { print $1, $2, $3, $4 }' |\
sed '/^[a-z]/s/^/<td>/' | sed '/[0-9]$/s/$/<\/td>/' | sed '$d'

# End the table and HTML
$Printf "</tr>\n"
$Printf "</table>\n"
$Printf "</body>\n"
$Printf "</html>\n"

exit 0
