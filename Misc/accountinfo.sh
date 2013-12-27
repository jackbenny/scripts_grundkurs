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

# Set the field seprator to match that of the passwd file
IFS=$":"

# Read the users info from the passwd file
Row=`sed -n "/$USER/p" /etc/passwd`

# Define an array with explanitory info
Info=("Username:" "Password:" "UID:" "GID:" "Comment:" "Home:" "Shell:")

echo "Your account information"
echo "------------------------"
# Itterate the fields and print the info
Index=0
for i in $Row; do
	echo "${Info[$Index]} $i"
	((Index++))
done

exit 0

