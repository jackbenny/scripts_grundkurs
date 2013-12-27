#!/bin/bash

# Jack-Benny Persson
# LX13
# Testing out nested loop from the book

for (( a = 1; a <= 3; a++ )); do
	echo "Outer loop: $a"
	for (( b = 1; b <= 3; b++ )); do
		echo "	Inner loop: $b"
	done
done

exit 0
