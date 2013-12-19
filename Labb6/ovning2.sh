#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 2, labb 6
# Check EUID and empty /tmp/testdir/

# Sanity check
if [ $EUID -ne 0 ]; then
	echo "`basename $0` must run as root"
	exit 2
fi

rm /tmp/testdir/* 2> /dev/null
if [ $? -ne 0 ]; then
	echo "Something went wrong when deleting files in /tmp/testdir/"
	exit 2
fi 

exit 0
