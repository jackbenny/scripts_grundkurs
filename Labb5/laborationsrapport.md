# Laborationsrapport 5 #
Jack-Benny Persson <br>
LX13

## Syfte ##
Förstå och kunna använda loopar.

## Tillvägagångssätt ##
Övningarna utförs och laboreras med och de tre övningar som här känns mest 
lärorika och där mest tid läggs ned är de två backup-skripten och 
betygsättar-skriptet.

### Övningar ###
* [Övning 1](https://github.com/jackbenny/scripts_grundkurs/blob/master/Labb5/ovning1.sh)
* [Övning 2](https://github.com/jackbenny/scripts_grundkurs/blob/master/Labb5/ovning2.sh)
* [Övning 3](https://github.com/jackbenny/scripts_grundkurs/blob/master/Labb5/ovning3.sh)
* [Övning 4](https://github.com/jackbenny/scripts_grundkurs/blob/master/Labb5/ovning4.sh)
* [Övning 5](https://github.com/jackbenny/scripts_grundkurs/blob/master/Labb5/ovning5.sh)
* [Övning 6](http://github.com/jackbenny/scripts_grundkurs/tree/master/Labb5/serverbackup)

## Reflektion ##
Den helt klar roligaste övningen i denna labb var Övning 6, serverbackup.sh.
Speciellt skoj var det att man kunde anpassa övningen så att den gick att
använda i sin egna miljö och egna server. Här fick jag också en chans att öva
lite på att rita flödesscheman. Flödesschemat ritades upp innan själva kodandet
påbörjades. Dock fick flödesschemat ändras något under arbetets gång efterhand
som nya problem, möjligheter och funktioner kom fram. Men i princip blev
skriptet så som det var tänkt från början.
Ett live-test av skriptet ägde rum den 2013-12-22. Testet blev lyckat i
live-miljön. De enda ändringarna som gjordes i samband med testet var att jag
fick ändra _test -b_ till _test -e_ på bandstationen för att det skulle fungera
samt att jag lade in en extra sanity check för att kontrolla så att katalogen
med Proxmox backupfiler verkligen finns.
