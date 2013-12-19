#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 4, labb 6
# Make a calculator that could do add, substract, divide and times

# Define our variables
Nr1=$1
Nr2=$2

# Define our functions
add()
{
	Sum=$((Nr1+Nr2))
}

sub()
{
	Sum=$((Nr1-Nr2))
}

div()
{
	Sum=$((Nr1/Nr2))
}

tim()
{
	Sum=$((Nr*Nr2))
}


# Main
