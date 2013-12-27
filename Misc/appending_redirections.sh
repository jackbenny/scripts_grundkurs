#!/bin/bash

# Jack-Benny Persson
# LX13
# Testing out permanent appending redirections

exec 1>>appending_output

echo "Everytime this script run this should be added to file"
echo "This could be useful for logfiles and such"

# Closing it again
exec 1>&-
echo "We won't be able to print this line since we no longer have STDOUT"

exit 0
