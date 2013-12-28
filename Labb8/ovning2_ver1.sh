#!/bin/bash

# Jack-Benny Persson
# LX13
# Exercise 2, lab 8 (make an advanced ls printout)

# Binaries
Sed="/bin/sed"

# Sanity check
if [ $# -ne 1 ]; then
	echo "`basename $0` requires one argument"
	exit 1
fi

if [ ! -x $Sed ]; then
	echo "Can't execute $Sed"
	exit 1
fi

# Main
ls -l $1 | $Sed '{
s/^d/Directory-> d/
s/^l/Link     -> l/
s/^-/File     -> -/
}'

exit 0
