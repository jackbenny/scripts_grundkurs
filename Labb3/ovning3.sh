#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 3, labb 3

# Sanity check
if [ $# -ne 1 ]; then
	echo "Ange ett tal mellan 1 och 10, exempelvis $0 5"
	exit 1
fi

# Definiera Tal som värdet av $1
Tal=$1

# Kolla om talet är mindre än ett eller större än 10
if [[ $Tal -lt 1 || $1 -gt 10 ]]; then
	echo "$Tal är inte mellan 1 och 10!!!"
else
	echo "Bra, talet du skrev var $Tal"
fi

exit 0
