#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 5, labb 6
# Monitor disk usage and send a warning if it exceeds N%

# Set some variables
Df="/bin/df"
Awk="/usr/bin/awk"
Sed="/bin/sed"
Warn=80 # Warn a how many percent full?

# Sanity checks
for bin in $Df $Awk $Sed; do
	if [ ! -x $bin ]; then
		echo "Can't execute $bin"
		exit 2
	fi
done

# Get the disks
for dev in `df -h | awk '/\/dev\/sd*/ { print $1 }'`; do
	Disk[$Nr]=$dev
	((Nr++))
done

# Get the usage percentage
for percent in `df -h | awk '/\/dev\/sd*/ { print $5 }' | sed 's/%//'`; do
	Use[$UseNr]=$percent
	((UseNr++))
done


# Main (Calculate usage and send warnings)
DiskDev=0
for i in ${Use[@]}; do
	if [ $i -gt $Warn ]; then
		echo "Disk ${Disk[$DiskDev]} is ${Use[$DiskDev]}% full"
		logger "Disk ${Disk[$DiskDev]} is ${Use[$DiskDev]}% full"
		((DiskDev++))
	fi
done

# Just exit in quiet if no warnings are issued
exit 0
