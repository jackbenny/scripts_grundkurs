#!/bin/bash

# Jack-Benny Persson
# LX 13
# Test to count arguments to a script

echo "You entered $# arguments"
echo "The last argument was ${!#}"
echo "The arguments entered was: $*"

echo "Iterating throuh all the arguments: "
for i in $@; do
	echo "$i"
done

exit 0
