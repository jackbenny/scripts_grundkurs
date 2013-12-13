#!/bin/bash

# Jack-Benny Persson
# LX13
# Just a small test of while loops

while read -p "Enter password: " Pass
do
	if [ "$Pass" = "secret" ]; then
	break
	fi
done
