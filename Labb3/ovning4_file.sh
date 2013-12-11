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

# Using _file_ to test the filetype
Type=`file $Arg | sed "s/$Arg\:\ //"` # Only works for files in CWD because of /

# Print the file type
echo "$Arg is a $Type file"

exit 0
