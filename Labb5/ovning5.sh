#!/bin/bash

#Jack-Benny Persson
# LX13
# Övning 5, labb 5
# Backup-script

# Set some variabels
BackupTo="$HOME/backups/"
declare Verbose
Tar="/bin/tar"

# Help screens
short_usage()
{
	echo "Usage: `basename $0` -b <dir> -f <filename.tar> -o <dir> -v -h"
}

long_usage()
{
	short_usage
	cat <<- EOF
	-b Directory to make a backup of
	-f Optional tar output filename (default is the name of the directory)
	-o Optional directory to put the backup in (default is \$HOME/backups)
	-v Turn on tar -v (Verbose)
	-h This help
	EOF
}

# Parse arguments and options
while getopts b:f:o:vh Opt; do
	case "$Opt" in
	b)  BackupThis=$OPTARG
	    ;;
	f)  File=$OPTARG	
	    ;;
	o)  BackupTo=$OPTARG
	    ;;
	v)  Verbose=v
	    ;;
	h)  long_usage
	    ;;
	*)  short_usage
	    ;;
	esac
done

# Sanity checks
if [ ! -w $BackupTo ] || [ ! -d $BackupTo ]; then
	echo "Can't write to $BackupTo or $BackupTo doesn't exist" > /dev/stderr
	exit 2
fi

if [ ! -r $BackupThis ]; then
	echo "Can't read $BackupThis"
	exit 2
fi

# Main (do the actual backup)

$Tar cf$Verbose ${BackupTo}/`basename $BackupThis`.tar $BackupThis

exit 0
