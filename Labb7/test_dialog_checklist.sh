#!/bin/bash

# Jack-Benny Persson
# LX13
# Testing checklists in dialg

dialog --checklist "Choose your editor" 10 60 3 \
	vi "The vi editor" off emacs "The Emacs editor" \
	off nano "The nano editor" off 2> /tmp/editorchoice
Editor=`cat /tmp/editorchoice | sed 's/\"//g'`

echo "You chose the $Editor editor, starting"
$Editor

exit 0

