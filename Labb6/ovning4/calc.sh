#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 4, labb 6
# Make a calculator that could do add, substract, divide and times

# Define our variables
Nr1=$1
Nr2=$2

# Sanity check
if [ $# -ne 2 ]; then
	echo "`basename $0` requires two arguments"
	exit 2
fi

if ! [ $Nr1 -eq $Nr2 &> /dev/null ]; then
	echo "`basename $0` only takes integers"
	exit 2
fi

# Define our functions
add()
{
	Sum=$((Nr1+Nr2))
	return $Sum
}

sub()
{
	Sum=$((Nr1-Nr2))
	return $Sum
}

div()
{
	Sum=$((Nr1/Nr2))
	return $Sum
}

tim()
{
	Sum=$((Nr1*Nr2))
	return $Sum
}


# Main
Calc=`basename $0`
echo $Calc

case "$Calc" in
	"add.sh")
		add
		echo $?
		;;
	"sub.sh")
		sub
		echo $?
		;;
	"div.sh")
		div
		echo $?
		;;
	"tim.sh")
		tim
		echo $?
		;;
	*)
		echo "Please use on the symlink add.sh/sub.sh/div.sh/tim.sh"
		exit 2
		;;
esac

exit 0
