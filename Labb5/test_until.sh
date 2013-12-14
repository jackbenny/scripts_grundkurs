#!/bin/bash

# Jack-Benny Persson
# LX13
# Until test

Time=0

until [ $Time -eq 59 ]; do
	Time=`date +%S`
	echo $Time
	sleep 1
done
