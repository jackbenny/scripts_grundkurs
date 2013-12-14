#!/bin/bash

# Jack-Benny Persson
# LX13
# Övning 4, labb 5
# Grade-calculation script

# Set some variables
G=30
VG=48
Form=form.txt

# Check if the file exist and that we can read it
if [ ! -r $Form ]; then
	echo "Can't read $Form" > /dev/stderr
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
echo "Your total points on the test was: $Total"

if [ $Total -lt $G ]; then
	echo "Your grade is: IG"
elif [ $Total -ge $VG ]; then
	echo "Your grade is: VG"
else
	echo "Your grade is G"
fi

exit 0
