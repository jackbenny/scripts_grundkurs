#!/bin/bash

# Jack-Benny Persson
# LX13
# Exercise 6 - lab 8 (Write a script with awk that prints linenumbers)

# Sanity check
if [ $# -ne 1 ]; then
	echo "$0 requiers one argument"
	exit 1
fi

awk '{ print NR" " $0 }' "$1"

exit 0

