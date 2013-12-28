# Laborationsrapport 8 #
Jack-Benny Persson<br>
LX13

## Syfte ##
Förstå ___grunderna___ i sed och awk.

## Tillvägagångssätt ##
Denna laboration påbörjas med att repetera reguljära uttryck och läsa på lite om
vilka olika former av reguljära uttryck det finns och vilka som fungerar i sed
respektive awk. Vad gäller awk så finns det olika varianter av awk. De tre
vanligaste är awk (AWK-originalet), mawk (New AWK) och gawk (Gnu AWK). För att
få reda på vilken version man har installerat är det enklast att bara köra
`awk --version` då awk ofta är en symbolisk länk till antingen mawk eller gawk
för att skript som använder awk ska fungera rakt av.

### AWK ###
AWK så som det var skapat av Aho, Kernighan och Weinberger (därav AWK). Använder
ERE (Extended Regular Expression, se nedan) dock ej komplett, bland annat 
saknas {range}.

### mawk (New AWK) ###
mawk innehåller en del tillägg till awk så som möjligheten att använda
Linux-kommandon innuti awk-script. I mawk kan man också definera egna funktioner
i sina skript. Samma ERE som awk.

### gawk (Gnu AWK) ###
gawk har en rad extra tillägg som awk och mawk inte har. En av de viktigaste
att veta om för denna laborationen är kanske möjligheten är att här använda
{range} i reguljära uttryck. I de flesta Linux-system används oftast antingen
gawk eller mawk.

### Reguljära uttryck ###
#### BRE ####
BRE står för Basic Regular Expression och innehåller bland annat följande
reguljära uttryck

Symbol | Mening
------ | ------
^      | Början av raden
$      | Slutet av raden
.      | Ett och endast ett tecken
*      | Valfritt antal gånger av tecknet
[]     | Klass av tecken, t.ex. [ybh]ay matchar yay, hay, bay
[^]    | Negativ klass av tecken, t.ex. [^yh]ay matchar INTE hay eller yay
[-]    | En serie av tecken, t.ex. [0-9] matchar alla tecken mellan 0 och 9

#### ERE ####
ERE står för Extended Regular Expression. Förutom ovanstående har ERE även
följande reguljära uttryck.

Symbol | Mening
------ | ------
?      | Ingen eller en gång
+      | En eller flera gånger (minst en gång)
{}     | Upprepa antal ggr, t.ex. b{3} matchar 3 st b
{,}    | T.ex. {1,3} matchar minst en gång, men max 3 gånger
&#124; | OR/ELLER, t.ex. cat|dog matchar cat eller dog
()     | Gruppera uttryck, t.ex. ca(t|b) eller Hej(san)

### Exempel och experiment med Sed & Awk ###
Dessa exempel använder filerna file.txt och name.txt som finns här i mappen 
Mycket är taget från laborationsbeskrivningen och boken.
```bash
# Matchar Många/många/Långa/långa
sed -n '/^[MmLl]ånga/p' file.txt

# Skriver Spock -- framför varje rad
sed 's/^/Spock -- /g' file.txt 

# Skriver ut fält 1, 3 och 3
awk '{ print $1 $2 $3 }' names.txt

# Skriver ut fält 1, 2 och 3 med mellanslag mellan fält ett och två och
# --> mellan 2 och 3
awk '{ print $1" "$2" --> "$3 }' names.txt 

# Det egna ls-kommandot från laborationen, dock modifierat för att fungera
# då det 8:e fältet är tiden, inte filnamnet
ls -l | grep -v total | awk '{ print $9"\t är "$5" bytes stor" }'

# Mer test från laborationsbeskrivningen
ls -l /etc/| awk 'BEGIN { print "Found:\n" } /^.*\.conf$/ { print $9 } END { print "\nDone" }'
```
Fler exempel finns i denna mappen i form av bland annat en rad awk-skript.


## Reflektion ##

