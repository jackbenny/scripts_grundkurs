#!/bin/bash

# Jack-Benny Persson
# LX13
# Exercise 2, lab 8 (make an advanced ls printout)

# Binaries
Awk="/usr/bin/awk"

# Variables
MyLs="myls.awk"

# Sanity check
if [ $# -ne 1 ]; then
	echo "`basename $0` requires one argument"
	exit 1
fi

if [ ! -x $Awk ]; then
	echo "Can't execute $Awk"
	exit 1
fi

if [ ! -r $MyLs ]; then
	echo "Can't find file $MyLs"
	exit 1
fi

# Main
ls -l $1 | awk -f $MyLs

exit 0
