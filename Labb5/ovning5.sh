#!/bin/bash

#Jack-Benny Persson
# LX13
# Övning 5, labb 5
# Backup-script

# Set some variabels
BackupTo="$HOME/backups/"

# Set our binarys
Tar="/bin/tar"

# Sanity checks
if [ $# -ne 1 ]; then
	echo "Usage: $0 <directory>"
	exit 2
fi

if [ ! -w $BackupTo ] || [ ! -d $BackupTo ]; then
	echo "Can't write to $BackupTo or doesn't exist" > /dev/stderr
	exit 2
fi

if [ ! -r "$1" ]; then
	echo "Can't read $1"
	exit 2
fi

# Main
$Tar cvf ${BackupTo}`basename $1`.tar $1

exit 0
