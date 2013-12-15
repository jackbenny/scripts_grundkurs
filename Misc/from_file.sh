#!/bin/bash

# Jack-Benny Persson
# LX13
# Testing to read from a file

Counter=1
if [ $# -ne 1 ]; then
	echo "Usage: `basename $0` <filename>"
	exit 2
fi

if [ ! -r $1 ]; then
	echo "Can't read $1"
	exit 2
fi

cat "$1" | while read line; do
	echo "Line $Counter: $line"
	((Counter++))
done

exit 0
