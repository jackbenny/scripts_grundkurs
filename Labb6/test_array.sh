#!/bin/bash

# Jack-Benny Persson
# LX13
# Just testing arrays

Content=`ls`

Nr=0

for i in $Content; do
	Word[$Nr]=$i
	((Nr++))
done

echo ${Word[@]}

exit 0

