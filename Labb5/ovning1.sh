#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 1, labb 5

read -p "Enter a number between 10 and 100: " Num

until [ $Num -eq 1 ]; do
	((Num--))
	echo $Num
done

exit 0
