#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 1, labb 4

# Get user input
read -p "Enter first number: " Tal1
read -p "Enter second number: " Tal2

# Do the calulations
Add=$((Tal1+Tal2))
Sub=$((Tal1-Tal2))
Tim=$((Tal1*Tal2))
Div=$((Tal1/Tal2))
Mod=$((Tal1%Tal2))

# Print the calulcations and answers
echo "$Tal1 + $Tal2 = $Add"
echo "$Tal1 - $Tal2 = $Sub"
echo "$Tal1 * $Tal2 = $Tim"
echo "$Tal1 / $Tal2 = $Div, rest: $Mod"

exit 0
