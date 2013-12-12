#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 2, labb 4

# Get current exchange rate
Rate=`curl -s http://www.valutakurser.nu/usd.html | \
grep "<td>Forex</td>" | awk '{print $10}' | \
egrep [0-9] | cut -b15-18`

# Run it
printf "Do you want to convert from SEK or USD? "
read Exchange

# Check our input
if [ "$Exchange" != "USD" ] && [ $Exchange != "SEK" ]; then
	echo "Enter USD or SEK"
	exit 2
fi

printf "Enter amount: "
read Amount

# Case-statement in case we want other current in the future
case "$Exchange" in
	USD)
	  Answer=`echo "scale=2;$Amount*$Rate" | bc`
	  printf "$Amount USD is $Answer SEK\n"
	;;

	SEK)
	  Answer=`echo "scale=2;$Amount/$Rate" | bc`
	  printf "$Amount SEK is $Answer USD\n"
	;;
esac

exit 0
