#!/bin/bash

# Jack-Benny Persson
# LX13

# Santity check
if [ $# -ne 2 ]; then # Vi måste ha två och bara två argument
	echo "Ange två tal efter scriptet, exempelvis $0 100 90"
	exit 1
fi

# Bara kolla om det är lika stor
if [ $1 -eq $2 ]; then
	echo "$1 är lika stort som $2"
else
	echo "$1 är inte lika stort som $2"
	# Om talen inte är lika stora kolla större än/mindre än
	if [ $1 -gt $2 ]; then
		echo "$1 är däremot större än $2"
	elif [ $1 -lt $2 ]; then
		echo "$1 är däremot mindre än $2"
	else
		echo "Nu blev nånting konstigt" # Nåt fel-catch-all
		exit 1
	fi
fi

exit 0
