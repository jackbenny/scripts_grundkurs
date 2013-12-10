#!/bin/bash

read -p "Vad heter du? " Namn
read -p "Hur gammal är du? " Alder
read -p "Vart bord du? " Ort

printf "Hej $Namn, du är $Alder år gammal och bor i $Ort\n"

exit 0
