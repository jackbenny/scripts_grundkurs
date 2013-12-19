#!/bin/bash

for i in `df -h | awk '/\/dev\/sd*/ { print $1 }'`; do
	Disk[$Nr]=$i
	((Nr++))
done

echo ${Disk[@]}

exit 0
