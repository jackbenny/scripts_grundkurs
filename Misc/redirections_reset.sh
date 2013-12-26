#!/bin/bash

# Jack-Benny Persson
# LX13
# Testing to reset a permanent redirection

exec 3>&1
exec 1>reset_test

echo "This line should go to the reset_test file"

exec 1>&3

echo "And this should be outputted on STDOUD as normal"

exit 0
