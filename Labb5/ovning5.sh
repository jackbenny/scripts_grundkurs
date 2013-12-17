#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 5, labb 5
# Backup-script

# Set some variabels
BackupTo="$HOME/backups/"
declare Verbose
File="False"
Tar="/bin/tar"

# Question for overwriting existing file
overwrite()
{
	select Overwrite in "Yes" "No"; do
	   case $Overwrite in
	     "Yes") printf "Overwriting previous file, continuing...\n"
		    break
	            ;;
	     "No") printf "Not overwriting, halting script\n"
	           exit 0
	           ;;
	     *)	printf "Please answer 1 (yes) or 2 (no)\n"
		;;
	   esac
	done
}


# Print short help
short_usage()
{
	printf "Usage: `basename $0` -b <dir> -f <filename.tar> -o "
	printf "<dir> -v -h\n"
}

# Print long help
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

# Parse command line arguments and options
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
	    exit 1
	    ;;
	*)  short_usage
	    exit 2
	    ;;
	esac
done

# Sanity checks
if [ ! -w $BackupTo ] || [ ! -d $BackupTo ]; then
	printf "Can't write to $BackupTo or $BackupTo doesn't exist\n" \
		> /dev/stderr
	exit 2
fi

if [ ! -r $BackupThis ]; then
	printf "Can't read ${BackupThis}\n" > /dev/stderr
	exit 2
fi

# Check if the backup file already exists
if [ "$File" != "False" ]; then
	if [ -f ${BackupTo}/${File} ]; then
		printf "${BackupTo}/${File} already exist, overwrite?\n"
		overwrite
	fi
else
	if [ -f ${BackupTo}/`basename $BackupThis`.tar ]; then
		printf "${BackupTo}/`basename $BackupThis`.tar already exist, "
		printf "overwrite?\n"
		overwrite
	fi
fi

# Main (do the actual backup)
if [ "$File" != "False" ]; then
	$Tar cf$Verbose ${BackupTo}/${File} $BackupThis
else
	$Tar cf$Verbose ${BackupTo}/`basename $BackupThis`.tar $BackupThis
fi

exit 0
