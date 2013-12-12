#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 3, version1, labb 4
# Replace words

# Define some variables
File="$1"
Old="$2"
New="$3"

# Sanity checks
if [ $# -ne 3 ]; then
	if [ $# -eq 1 ]; then      # If there is just one arg and
		if [ -r $# ]; then # if the file exists,
			cat $1     # just print it
		fi
		else
			echo "Usage $0 <filename> <old_word> <new_word>"
			exit 2 # If it dosen't, exit and print usage
		fi
fi

if [ ! -r $File ]; then # If there is no such file
	echo "We can't read that file"
	exit 2
fi

# Main script
Data=`cat $1` # Put the content of the file in Data
Alt=${Data/$Old/$New} # Replace the word (kinda lika sed 's/old/new/')

echo "$Alt" # Print the content with the replaced words

exit 0
