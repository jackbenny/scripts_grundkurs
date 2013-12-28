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
BRE står för Basic Regular Expression

#### ERE ####
ERE står för Extended Regular Expression

## Reflektion ##

