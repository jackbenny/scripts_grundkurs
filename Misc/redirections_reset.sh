#!/bin/bash

# Jack-Benny Persson
# LX13
# Testing to reset a permanent redirection

exec 3>&1
exec 1>reset_test
echo "This line should go to the reset_test file"

exec 1>&3
echo "And this should be outputted on STDOUD as normal"


# And one can also redirect input and then reset it the same was
# as with output above
exec 5<&0
exec 0<infile.txt
cat

exec 0>&5
read Yay
echo $Yay


exit 0
