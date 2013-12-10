#!/bin/bash

# Jack-Benny Persson
# LX13

declare DIST=Hej
echo "Utan unset: $DIST"
unset DIST
echo "Med unset: $DIST"
exit 0
