#!/bin/bash

# Jack-Benny Persson
# LX13
# Öving 4, labb 3

Arg=$1

# Sanity checks
if [ $# -ne 1 ]; then
	echo "Enter a filename as an argument, such as $0 <filename.txt>"
	exit 1
fi

if [ ! -e $Arg ]; then
	echo "$Arg does not exist"
	exit 2
fi


# Check whatever arg1 is a block device, directory or a regular file
if [ -b $Arg ]; then
	echo "$Arg is a block device"
elif [ -d $Arg ]; then
	echo "$Arg is a directory"
elif [ -f $Arg ]; then
	echo "$Arg is regular file"
else
	echo "$Arg is something else"
fi

exit 0
