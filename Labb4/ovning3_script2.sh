#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 3, script 2, labb4

# Testing parameter substiution

Arg1="$1"

echo "Hej ${USER}@${HOSTNAME}"
echo ""
echo "Variabler på U: ${!U*}"
echo "Variabler på S: ${!S*}"
echo ""


echo ${Arg1:?"No arg1 input"}

echo "Du skrev in ${#Arg1} tecken som argument till $0"

exit 0
