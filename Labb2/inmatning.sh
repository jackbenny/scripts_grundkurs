#!/bin/bash

#Definiera Name
declare Namn

read -t 3 -p "Vad heter du? " Name
Name=${Name:="Secret"}  # Definiera Name till Hemligt om ingen input
printf "Du heter: $Name\n\n" 

exit 0
