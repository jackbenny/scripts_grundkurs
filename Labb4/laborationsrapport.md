# Laborationsrapport 4 #

## Syfte ##
Förstå hur man använder kommandot let för att utföra grundläggande räkning. Även att behärska parameter substitution (dollarsign substitution).

## Tillvägagångssätt ##

### Matematik i skalet ###
```bash
let Summa="10+2"
echo $Summa
12
```

Ovanståede kod är enkel och fungerar bra, det som blir problem är precis som texten säger, när man delar något som inte går jämnt ut. Man får då resten som modulus enligt nedan
```bash
let Summa="10/3"
echo $Summa # Svaret blir 3, eftersom 3*3=9
```

Vi får fram resten genom modulus
```bash
let Summa="10%3"
echo $Summa # Svaret blir 1, efter 3*3=9+1=10, alltså resten är 1.
```

Istället för `let` kan man instället skriva `Summa=$((4+4)); echo $Summa` och vi får svaret 8.

### Parameter Substitution / Expansion ##
Skillnaden mellan `echo ${Param:=Hej}` och `echo ${Param=Hej}` är att första exemplet,
d.v.s. där vi har kolon (:) så kommer "Hej" att skrivas om $Param är tom och inte satt (unset). Om vi skriver utan kolon å andra sidan så testas bara om $Param är tom.

```bash
Me=""
echo ${Me=Yay} # Skriver inte ut något
echo ${Me:=Yay} # Skriver ut Yay samt säter $Mee till Yay
```

Det finns även andra operatorer förutom lika med (=). Nedan listas dessa med exempel
```bash
Me=""
echo ${Me-Yay} # Skriver inte ut något (eftersom Me är satt)
echo ${Me:-Yay} # Skriver ut Yay (men sätter INTE Me till Yay som med "=")

Test10="Hej"
echo ${Test10:+Då} # Skriver ut Då, men lämnar $Test10 till "Hej"
unset Test10
echo ${Test10:+Då} # Skriver inte något då $Test10 är unset

echo ${Test20:?Missing} # Skriver ut "Missing" till STDERR eftersom $Test20 är unset
```

### Övningar ###
* [Övning 1](https://github.com/jackbenny/scripts_grundkurs/blob/master/Labb4/ovning1.sh)
* [Övning 2](https://github.com/jackbenny/scripts_grundkurs/blob/master/Labb4/ovning2.sh)
* [Övning 3, script 1](https://github.com/jackbenny/scripts_grundkurs/blob/master/Labb4/ovning3_script1.sh)

## Reflektion ##
En lösning på problemet med att Bash bara räknar med int är att istället använda `bc` (Bench Calculator) istället för `let` i Bash.
Observera dock här att `bc` inte heller räknar mer än int (heltal) som standard. T.ex. så blir `echo "10/3" | bc` också 3. Tricket här att är att ställa in __scale__ variablen till `bc`. T.ex. så blir `echo "scale=3;10/3" | bc` helt korrekt 3.33.

En annan cool sak som stod i laborationen var det om Variable Substution. Att kunna tilldela en variabel ett specifikt värde om den är tom, t.ex `Variabel=""; echo ${Variabel:=test}`.
Att kunna byta ut strängar i variabler är också en häftig funktion och väldigt "sed lik". T.ex. nedanstående kodstycke
```bash
Var="Hej alla glada"
Var=${Var/glada/sura}
echo $Var # "Hej alla sura" skrivs ut
```

Att kunna söka efter variabler är också trevligt, typ `echo ${!U}` som kommer att matcha t.ex. UID och USER.

