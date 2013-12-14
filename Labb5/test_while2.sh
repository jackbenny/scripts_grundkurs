#!/bin/bash

# Jack-Benny Persson
# LX13
# Just testing some while again

Num=0

while [ $Num -lt 5 ]; do
	read -p "Enter something: " Test
	let Num++ # Or use ((Num++)) or Num=$[Num+1] 
	echo ""
	echo "U entered $Test and this is the $Num time you run the loop"
done
