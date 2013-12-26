#!/bin/bash

# Jack-Benny Persson
# LX13
# Testing diffrent forms of redirections

echo "This is an error message" >&2 # To redirect to a file decriptor it's must
				    # be preceded by a & sign

echo "This is also an error message" > /dev/stderr # The same as above

echo "This is a normal message" >&1 # To STDOUT instead of STDERR

exec 1>all_normal.txt # All output below will go to a file
		      # Very practical for logfiles and such

echo "Everything here will be redirected to a file called all_normal"
echo "Even this line"
echo "And this line too"


exec >&2 # All output below will go to STDERR
	 # Very practical for important errors and such

echo "But everything from here will go to STDERR"
echo "All the errors..."


exec 2>errorlog # All errors below should be redirected to a logfile
		# called errorlog

echo "This line should go to the errorlog" >&2


exec 0< errorlog # The same can be done for input
		 # Nice for processing logs etc

#cat # This will read from STDIN, which is now errorlog, and output will be put
    # on STDOUT... epic stuff :)

# This will also read from STDIN, which is now errorlog, and put it's output on
# STDOUT togheter with line number
Count=1
while read Line; do
	echo "Errorlog: $Line"
	((Count++))
done

# One can also create new file descriptors

exec 3>file_desc3
echo "This will go to file_desc3 file" >&3

exit 0
