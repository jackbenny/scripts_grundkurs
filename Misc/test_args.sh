#!/bin/bash

# Jack-Benny Persson
# LX13
# Just testing out $@ and $*

Count=1
for param in "$*"; do
	echo "\$* Parameter #$Count = $param"
	((Count++))
done

Count=1
for param in "$@"; do
	echo "\$@ Parameter #$Count = $param"
	((Count++))
done

echo ""
echo "Testing with an array"
echo "---------------------"

Count=1
Test=($@)

Count=0
while [ $Count -lt ${#Test[@]} ]; do
	echo "Index #$Count is ${Test[$Count]}"
	((Count++))
done



