#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 1, labb 6
# Arguments

# Define some variables
Arg1=$1
Arg2=$2

# Sanity checks
if [ $# -ne 2 ]; then
	printf "`basename $0` requires two arguments\n"
	exit 2
fi

printf "Argument 1 is ${Arg1}\n"
printf "Argument 2 is ${Arg2}\n"

exit 0
