#!/bin/bash

# Jack-Benny Persson
# LX13

Datum=`date +%F`
Moms=30
Net=500

printf "Invoice" 
printf "%40s" "$Datum"
printf "\n-------"
printf "%40s" "----------"
printf "\n\n\n"
printf "%49s" "Net Total: "$Net
printf "\n"
printf "%40s" "Tax: "
printf "%d%%" $Moms
printf "\n"
