#!/bin/bash

# Jack-Benny Persson
# LX13
# Testing functions

Nr1=$1
Nr2=$2

# Sanity checks
if [ $# -ne 2 ]; then
	echo "`basename $0` requires two arguments (integers)"
	exit 2
fi

# Functions
add()
{
	Sum=$((Nr1+Nr2))
	return $Sum
}

# Main
add
echo $?
echo "Nr1 contained ${#Nr1} chars, Nr2 contained ${#Nr2}"


exit 0
