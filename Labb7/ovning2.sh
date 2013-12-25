#!/bin/bash

# Jack-Benny Persson
# LX13
# Exercise 2, lab 7 (Write script to create a dhcpd.conf)

# Set some variables
File="$HOME/dhcpd.conf"

# Binaries
Awk="/usr/bin/awk"
Dialog="/usr/bin/dialog"
Printf="/usr/bin/printf"

# Sanity checks
if [ ! -w `dirname $File` ]; then
	echo "Can't write to `dirname $File`"
	exit 2
fi

for bin in $Awk $Dialog $Printf; do
	if [ ! -x $Bin ]; then
		echo "Can't execute $Bin"
		exit 2
	fi
done

# Functions
question()
{
	$Dialog --backtitle "Interactive DHCPD config generator" \
	--inputbox "$1" 10 60 2> /tmp/dhcpd_question
	if [ $? -ne 0 ]; then # Check if user hit ESC
		echo "Aborting interactive DHCPD config generator"
		exit 1
	fi
	Input=`cat /tmp/dhcpd_question`
}

# Ask all the questions
question "Enter subnet and netmask, separate with a single whitespace"
Subnet=$Input

question "Enter IP range, seperate start and end with a single whitespace"
Range=$Input

question "Enter your network DNS servers, multiple servers can be entered"
Nameservers=$Input

question "Enter your default routers"
Router=$Input

$Dialog --backtitle "Interactive DHCPD config generator" \
	--menu "Choose DDNS update style" 10 60 3 \
	none "None" ad-hoc "Ad-Hoc" interim "Interim" 2> /tmp/dhcpd_question
	Input=`cat /tmp/dhcpd_question`
Style=$Input

question "Enter default lease time in seconds"
DefaultLease=$Input

question "Enter max lease time in seconds"
MaxLease=$Input

# Generate dhcpd.conf
Sub=`echo $Subnet | $Awk '{ print $1 }'`
Netmask=`echo $Subnet | $Awk '{ print $2 }'`
$Printf "subnet $Sub netmask $Netmask {\n" > $File
$Printf "range ${Range};\n" >> $File
$Printf "option domain-name-servers ${Nameservers};\n" >> $File
$Printf "option routers ${Router};\n" >> $File
$Printf "ddns-update-style ${Style};\n" >> $File
$Printf "default-lease-time ${DefaultLease};\n" >> $File
$Printf "max-lease-time ${MaxLease};\n" >> $File
$Printf "}\n" >> $File

exit 0

