#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 4, labb 5
# Grade-calculation script

# Set some defaults
G=30
VG=48
Form=form.txt
Outfile="NO"

# Function to print the students grade and points
print_grade()
{
	echo "Your total points on the test was: $Total"

	if [ $Total -lt $G ]; then
		echo "Your grade is: IG"
	elif [ $Total -ge $VG ]; then
		echo "Your grade is: VG"
	else
		echo "Your grade is G"
	fi

	exit 0
}

# Define help functions
short_help()
{
	printf "Usage: `basename $0` -f <filename>" 
	printf " -o <filename> -G <int> -V <int>\n"
}

long_help()
{
	short_help
	cat <<- EOF
	-f Optional filename to read the form data from.
	-o Optional output file for the points and grade.
	-G Number of minimum points for a grade G (Default is 30).
	-V Number of minimum points for a grade VG (Default is 48).
	EOF
}

# Parse command line arguments
while getopts f:o:G:V:h Opt; do
	case "$Opt" in
	f)  if [ ! -r $OPTARG ]; then
		echo "Can't read $OPTARG" > /dev/stderr
		short_help
		exit 2
	    fi
	    Form="$OPTARG"
	    ;;
	o) 
	    if [ ! -w `dirname $OPTARG` ]; then
		echo "You can't write to `dirname $OPTARG`"\
		> /dev/stderr
		exit 2
	    fi
	    Outfile="$OPTARG"
	    ;;
	G) G=$OPTARG
	    ;;
	V) VG=$OPTARG
	     ;;
	h) long_help
	    exit 0
	    ;;
	*) short_help
	   exit 2
	   ;;
	esac
done

# Check if the file exist and that we can read it
if [ ! -r $Form ]; then
	echo "Can't read $Form" > /dev/stderr
	short_help
	exit 2
fi

# Get all the points
Points=( `tail -n +3 $Form | awk '{print $1}'` )

# Check that we only have int's in our array and print help
for l in ${Points[*]}; do
	if ! [ "$l" -eq "$l" &> /dev/null ]; then
		cat <<- EOF
		Something is wrong with the formatting of $Form
		Correct formatting should look like this:

		Points		Question
		------		--------
		1		Question 1
		1		Question 2
		4		Question 4

		EOF
		exit 2
	fi
done

# Calculate the points from the form
Total=0
for i in ${Points[*]}; do
	Total=$((Total+i))
done

# Print the total points and grade
if [ "$Outfile" != "NO" ]; then
	print_grade > $Outfile
else
	print_grade
fi
