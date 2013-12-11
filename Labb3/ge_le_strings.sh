#!/bin/bash

# Jack-Benny Persson
# LX13

Str1="Kalle" # K = 75
Str2="Lisa" # L = 76

if [ "$Str1" < "$Str2" ]; then
	echo "$Str1 är mindre än $Str2" # Eftersom 75 är mindre än 76
elif [ "$Str1" > "$Str2" ]; then
	echo "$Str1 är större än $Str2" # Kommer vara falskt, se ovan
fi

exit 0
