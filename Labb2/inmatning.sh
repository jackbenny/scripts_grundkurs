#!/bin/bash

#Definiera Name
Name="Hemligt"

read -t 3 -p "Vad heter du? " Name
Name=${Name:="Hemligt"}  # Definiera Name till Hemligt om ingen input
printf "Du heter: $Name\n\n" 

exit 0
