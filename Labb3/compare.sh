#!/bin/bash

# Jack-Benny Persson
# LX13

read -p "Skriv något: " Str1
read -p "SKriv något: " Str2


if [ "$Str1" = "$Str2" ]; then
	echo "$Str1 är lika med $Str2"
elif [ "$Str1" != "$Str2" ]; then
	echo "$Str1 är inte samma som $Str2"
fi

	exit 0

