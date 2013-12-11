#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 2, labboration 3

Fil=recept.txt

# Kolla om filen finns samt är skrivbar/läsbar
if [ -e $Fil ]; then
	printf "Filen finns och har rättigheterna: "
	if [ -r $Fil ]; then
		printf "läsbar "
	fi
	if [ -w $Fil ]; then
		printf "skrivbar "
	fi
	printf "\n"
	printf "\nFilens innehål är:\n"
	cat $Fil
	exit 0
fi

exit 1 # Filen fanns inte, alltså avsluta med 1 (fel)
