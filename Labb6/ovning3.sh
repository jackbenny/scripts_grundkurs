#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 3, labb 6
# Draw a line with a function

# Define variables
Nr=$1
Iterate=0

# Sanity checks
if [ $# -ne 1 ]; then
	echo "`basename $0` requires one argument"
	exit 2
fi

if ! [ $Nr -eq $Nr &> /dev/null ]; then
	echo "Use only integers"
	exit 2
fi

# Define our functions
draw()
{
	while [ $Iterate -lt $Nr ]; do
		printf "*"
		((Iterate++))
	done  
	printf "\n"
}

draw

exit 0
