#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 5, labb 6
# Monitor disk usage and send a warning if it exceeds N%

# Binaries
Df="/bin/df"
Awk="/usr/bin/awk"
Sed="/bin/sed"
Logger="/usr/bin/logger"
Mail="/usr/bin/mail"

# Set some variables
Warn=10 # Warn a how many percent full?

# Sanity checks
for bin in $Df $Awk $Sed $Logger $Mail; do
	if [ ! -x $bin ]; then
		echo "Can't execute $bin"
		exit 1
	fi
done

# Get the disks
for dev in `$Df -h | $Awk '/\/dev\/sd*/ { print $1 }'`; do
	Disk[$Nr]=$dev
	((Nr++))
done

# Get the usage percentage
for percent in `$Df -h | $Awk '/\/dev\/sd*/ { print $5 }' | $Sed 's/%//'`; do
	Use[$UseNr]=$percent
	((UseNr++))
done


# Main (Calculate usage and send warnings)
DiskDev=0
for i in ${Use[@]}; do
	if [ $i -gt $Warn ]; then
		echo "Disk ${Disk[$DiskDev]} is ${Use[$DiskDev]}% full"
		$Logger "Disk ${Disk[$DiskDev]} is ${Use[$DiskDev]}% full"
		echo "Disk ${Disk[$DiskDev]} is ${Use[$DiskDev]}% full" \
		| $Mail root -s "Disk usage warning"
		((DiskDev++))
	fi
done

# Just exit in quiet if no warnings are issued
exit 0
