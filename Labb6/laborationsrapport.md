# Laborationsrapport 5 #
Jack-Benny Persson <br>
LX13

## Syfte ##
Ha koll på funktioner i bash, samt hur man passar ett argument till ett skript 
eller funktion!

## Tillvägagångssätt ##
Övningar genomförs i vanlig ordning enligt nedan. När det gäller att passa
argument till Bash-skript finns det flera olika alternativ förutom $1, $1 osv
som listas i laborationsbeskrivningen. Den mest flexibla och enkla av dessa
alternativ tycker jag är _getopts_ för passa flaggor till Bash-skript. Det finns
även _getopt_, alltså i singular, men denna kan vara lite klyddigare att jobba
med. I [Övning 4, version 2, labb
5](https://github.com/jackbenny/scripts_grundkurs/blob/master/Labb5/ovning4_ver2.sh)
använder jag _getopts_ för att få options/flaggor till scriptet. En liten
förklaring kan här vara på sin plats.
```bash
while getopts f:o:G:V:h Opt; do
        case "$Opt" in
        f) if [ ! -r $OPTARG ]; then
                echo "Can't read $OPTARG" > /dev/stderr
                short_help
                exit 2
         fi
         Form="$OPTARG"
         ;;
        o)
         if [ ! -w `dirname $OPTARG` ]; then
                echo "You can't write to `dirname $OPTARG`"\
                > /dev/stderr
                exit 2
         fi
         Outfile="$OPTARG"
         ;;
        G) G=$OPTARG
         ;;
        V) VG=$OPTARG
         ;;
        h) long_help
         exit 0
         ;;
        *) short_help
         exit 2
         ;;
        esac
done
```

I skriptet ovan på första raden `while getopts f:o:G:V:h Opt` anges flaggorna
som skriptet accepterar (här -f -o -G -V -h). De flaggor med ett kolon (:) efter
sig kräver ett argument. Argumentet till flaggan läses sedan in i variabeln
$OPTARG som också syns i ovan script.
Notera också ovan att man i case-satsen ej behöver ange bindestrecket före
flaggan, detta fixar _getopts_ själv.

Man kan även ha stor nytta av $0, d.v.s argument 0, som i Bash syftar på skripet
självt. $0 kommer alltid att visa hela sökvägen till skriptet som körs. D.v.s
startar man skriptet med ./script.sh kommer $0 vara just ./script.sh. Om man
däremot startar skriptet med ./home/jake/script.sh kommer $0 vara
./home/jake/script.sh.
Vill man att $0 alltid bara ska vara script.sh, om man t.ex. vill veta om
skriptet anropats direkt med script.sh eller med någon länk får man kapa av alla
katalogerna i början. Detta gör man enklast med _basename_.
I [Övning 4](https://github.com/jackbenny/scripts_grundkurs/tree/master/Labb6/ovning4)
på denna labben har jag använt mig av just `basename $0` för att skapa
kalkylatorskriptet. Jag gjorde som så att jag skapade ett skript som sedan kan
anropas med 4 olika symboliska länkar. Beroende på vilken länk som används så
utför skriptet olika funktioner.
Det finns även _dirname_ som görs precis tvärtom vad _basename_ gör, d.v.s.
istället för att skala bort alla kataloger före, så skalar _dirname_ bort själva
skriptnamnet och kvar blir bara sökvägen fram till skriptet.

## Reflektion ##
När det kommer till arrayer så fick jag en trevlig pull request av Paulena som
hade förenklat mitt
[test_array.sh](https://github.com/jackbenny/scripts_grundkurs/blob/master/Labb6/test_array.sh)
med flera rader kod. Istället för att göra en räknare och en loop för att läsa
in katalogerna i en array visade Paulena här att man helt enkelt bara kunde
läsa in hela ls-outputen med `Content=($(ls))`. Så mycket snyggare och enklare.
De yttre paranteserna anger arrayen och de inre paranteserna anger att ls skall
exekveras (samma som backticksen).
