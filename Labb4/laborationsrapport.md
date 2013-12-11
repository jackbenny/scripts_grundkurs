# Laborationsrapport 4 #

## Syfte ##
Förstå hur man använder kommandot let för att utföra grundläggande räkning. Även att behärska parameter substitution (dollarsign substitution).

## Tillvägagångssätt ##

### Matematik i skalet ###

	```bash
	let Summa="10+2"
	echo $Summa
	12

Ovanståede kod är enkel och fungerar bra, det som blir problem är precis som texten säger, när man delar något som inte går jämnt ut. Man får då resten som modulus enligt nedan

	```bash
	let Summa="10/3"
	echo $Summa # Svaret blir 3, eftersom 3*3=9
	```

Vi får fram resten genom modulus

	```bash
	let Summa="10%3"
	echo $Summa # Svaret blir 1, efter 3*3=9+1=10, alltså resten är 1.

Istället för _let_ kan man instället skriva _Summa=$((4+4)); echo $Summa_ och vi får svaret 8.

### Övningar ###

## Reflektion ##
En lösning på problemet med att Bash bara räknar med int är att istället använda _bc_ (Bench Calculator) istället för _let_ i Bash.
Observera dock här att _bc_ inte heller räknar mer än int (heltal) som standard. T.ex. så blir _echo "10/3" | bc_ också 3. Tricket här att är att ställa in __scale__ variablen till _bc_. T.ex. så blir _echo "scale=3;10/3" | bc_ helt korrekt 3.33.

