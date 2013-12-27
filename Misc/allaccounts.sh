#!/bin/bash

# Jack-Benny Persson
# LX13
# Testing out the IFS (Field Separator) variable
# and some sed along the way.
# Turned out to become a small script to display your account information

# Binaries
Sed="/bin/sed"

# Sanity check
if [ ! -x $Sed ]; then
	echo "Can't execute $Sed"
	exit 1
fi

for entry in `cat /etc/passwd`; do
	echo "Information on user `echo $entry | awk '{ print $1 }'`"
	echo "---------------------------"

	IFS=$":"
	Info=("Username:" "Password:" "UID:" "GID:" "Comment:" "Home:" "Shell:")

	# Itterate the fields and print the info
	Index=0
	for i in $entry; do
		echo "${Info[$Index]} $i"
		((Index++))
	done
	echo ""
done

exit 0

