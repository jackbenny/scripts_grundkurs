#!/bin/bash

# Jack-Benny Persson
# LX13
# Exercise 3, lab 8 (Write a script to warn when disk usage exceeds 80%)

# Binaries
Df="/bin/df"
Sed="/bin/sed"
Awk="/usr/bin/awk"
Logger="/usr/bin/logger"

# Variables
DiskSed="diskusage.sed"
Warn=80

# Sanity checks
for Bin in $Df $Sed $Awk $Logger; do
	if [ ! -x $Bin ]; then
		echo "Can't execute $Bin"
		exit 1
	fi
done

# Put the usages in an array
Usages=(`$Df -h | $Awk '{print $5}' | $Sed -f $DiskSed`)

# Put all the disknames in an array
Disks=(`$Df -h | $Awk '{print $1}'| $Sed '1d'`)

# Start the loop to check the disk usage
Index=0
for i in ${Usages[@]}; do
	if [ $i -gt $Warn ]; then
		echo "Disk ${Disks[$Index]} is ${i}% full" >&2
		$Logger "Disk ${Disks[$Index]} is ${i}% full"
	fi 
	((Index++))
done

exit 0
