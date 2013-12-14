#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 3, labb 5

File="while.dat"

while [ ! -f $File ]; do
	sleep 1
done

echo "Filen $File hittades!"

exit 0
