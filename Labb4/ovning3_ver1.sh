#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 3, version1, labb 4
# Replace and count words 

# Define some variables
File="$1"
Old="$2"
New="$3"

# Sanity checks
if [ $# -ne 3 ]; then
	echo "Usage $0 <filename> <old_word> <new_word>"
	exit 2
fi

if [ ! -r $File ]; then
	echo "We can't read that file"
	exit 2
fi

# Main script
Data=`cat $1`
Alt=${Data/$Old/$New}

echo "$Alt"

exit 0
