#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 2, labb 5

read -p "Enter a number between 10 and 100: " Num

# Sanity checks
if ! [ "$Num" -eq "$Num" &> /dev/null ]; then
	echo "Please enter integers only" > /dev/stderr
	exit 2
fi

if [ $Num -lt 10 ] || [ $Num -gt 100 ]; then
	echo "I only accept numbers between 10 and 100" > /dev/stderr
	exit 2
fi

# Main script
until [ $Num -eq 1 ]; do
	((Num--))
	echo $Num
done

exit 0
