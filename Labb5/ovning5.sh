#!/bin/bash

#Jack-Benny Persson
# LX13
# Övning 5, labb 5
# Backup-script

# Sanity checks

# Set some variabels
BackupTo="$HOME/backups/"

# Sanity checks
if [ $# -ne 1 ]; then
	echo "Usage: $0 <directory>"
fi

if [ -w $BackupTo ]; then
	echo "Can't write to $BackupTo" > /dev/stderr
	exit 2
fi

if [ ! -r "$1" ]; then
	echo "Can't read $1"
	exit 2
fi

# Main

