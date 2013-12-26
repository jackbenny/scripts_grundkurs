#!/bin/bash

# Jack-Benny Persson
# LX13
# Exercise 2, lab 7 (Write script to create a dhcpd.conf)

# Set some variables
File="$HOME/dhcpd.conf"

# Binaries
Awk="/usr/bin/awk"
Zenity="/usr/bin/zenity"
Printf="/usr/bin/printf"
Rm="/bin/rm"

# Sanity checks
if [ ! -w `dirname $File` ]; then
	echo "Can't write to `dirname $File`"
	exit 2
fi

if [ ! -w /tmp/ ]; then
	echo "Can't write to /tmp/"
	exit 2
fi

for bin in $Awk $Zenity $Printf $Rm; do
	if [ ! -x $Bin ]; then
		echo "Can't execute $Bin"
		exit 2
	fi
done

# Functions
question_form()
{
	$Zenity --text "Interactive DHCPD config generator" \
	--forms --add-entry="Subnet" --add-entry="Netmask" \
	--add-entry="Range (Separate with whitespace)" \
	--add-entry="Nameserver (Separate with whitespaces)" \
	--add-entry="Routers (Separate with whitespaces)" \
	--add-entry="DDNS-update-style (none/interim/ad-hoc)" \
	--add-entry="Default lease time in seconds" \
	--add-entry="Max leaste time in seconds" \
	 > /tmp/dhcpd_question
	if [ $? -ne 0 ]; then # Check if user hit cancel
		$Zenity --error \
		--text="Aborting interactive DHCPD config generator"
		exit 1
	fi
	Input=`cat /tmp/dhcpd_question`
}


extract_data()
{
	Sub=`echo $Input | awk -F "|" '{ print $1 }'`
	Netmask=`echo $Input | awk -F "|" '{ print $2 }'`
	Range=`echo $Input | awk -F "|" '{ print $3 }'`
	Nameservers=`echo $Input | awk -F "|" '{ print $4 }'`
	Router=`echo $Input | awk -F "|" '{ print $5 }'`
	Style=`echo $Input | awk -F "|" '{ print $6}'`
	DefaultLeas=`echo $Input | awk -F "|" '{ print $7 }'`
	MaxLease=`echo $Input | awk -F "|" '{ print $8 }'`
}

# Main

# Display the question form
question_form

# Extract all the data from the question form
extract_data

# Generate dhcpd.conf
$Printf "subnet $Sub netmask $Netmask {\n" > $File
$Printf "range ${Range};\n" >> $File
$Printf "option domain-name-servers ${Nameservers};\n" >> $File
$Printf "option routers ${Router};\n" >> $File
$Printf "ddns-update-style ${Style};\n" >> $File
$Printf "default-lease-time ${DefaultLease};\n" >> $File
$Printf "max-lease-time ${MaxLease};\n" >> $File
$Printf "}\n" >> $File

# Clean up
$Rm /tmp/dhcpd_question

exit 0

