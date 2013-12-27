#!/bin/bash

# Jack-Benny Persson
# LX13
# Testing out traps

trap "echo ' I have just trapped CTRL+C'" SIGINT SIGTERM
trap "echo ' Dont stop me plz'" SIGTSTP
trap "echo ' Ok, just exit'" EXIT

for (( i=60; i>=0; i-- )); do
	echo $i
	sleep 1
done

exit 0
