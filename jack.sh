#!/bin/bash

# Jack-Benny Persson
# LX13
# From the classic movie The Shining

Text=(A l l " " w o r k " " a n d " " n o " " p l a y " " m a k e s " " \
J a c k " " a " " d u l l " " b o y "." " " )

while true
do
	SemiRand=`date +%S`
	if [ $SemiRand -eq 10 ] || [ $SemiRand -eq 45 ]; then
		printf "\n"
	fi

	if [ $SemiRand -eq 15 ] || [ $SemiRand -eq 35 ] || \
		[ $SemiRand -eq 36 ] || [ $SemiRand -eq 37 ]; then
		printf "\n\n\t"
	fi

	for i in "${Text[@]}"
	do
		sleep 0.05
		printf "$i"
	done
done

exit 0
