#!/bin/bash

# Skapa en funktion för att skriva ut färgen
Skriv()
{
	printf "Din favoritfärg är $Color\n"
}

# Läs in färgen från användarens input
read -t 3 -p "Ange din favoritfärg: " Color

# Kolla om vi fick en input från användaren
if [ -z "$Color" ]; then
	UserInput=0
else
	UserInput=1
fi

# Sätt röd om Color är tom
Color=${Color:="röd"}

# Om vi inte anger en färg kommer svaret hamna
# på samma rad som frågan, vilket inte är snyggt,
# därför lägger vi till en egen radbrytning
if [ $UserInput -eq 0 ]; then
	printf "\n"
	Skriv
else
	Skriv
fi

# Avsluta med status 0
exit 0
