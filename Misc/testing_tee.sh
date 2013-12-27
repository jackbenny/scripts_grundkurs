#!/bin/bash

# Jack-Benny Persson
# LX13
# Testing out tee

date | tee -a teeout.txt # This will appear on both terminal and in
		         # teeout.txt file (-a for appending data)
who | tee -a teeout.txt
echo "----" | tee -a teeout.txt


exit 0
