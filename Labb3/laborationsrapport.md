# Laborationsrapport 3 #

## Syfte ##

Förstå och kunna hantera villkor med test. Både gällande strängar, filer och matematiska villkor.

## Tillvägagångssätt ##

Declare och test-värden testas lite i början av labben. Exempelvis:

	jake@elektra:~$ declare -x StringTest="Hej"
	jake@elektra:~$ test -z $StringTest; echo $?
	1
	jake@elektra:~$ test -n $StringTest; echo $?
	0
	jake@elektra:~$ test -z $StringTest; echo $?
	1
	jake@elektra:~$ unset StringTest
	jake@elektra:~$ test -z $StringTest; echo $?
	0
	jake@elektra:~$ test "hej" = "hej"
	jake@elektra:~$ echo $?
	0

Detta är ett enkelt sätt att testa olika test-scenarion utan att behöva skapa ett helt nytt script varje gång man vill prova på något bara.

### Övningsupptifter ###

Samtliga övningsuppgifter finns här på GitHub

* [Övning 1](https://github.com/jackbenny/scripts_grundkurs/blob/master/Labb3/ovning1.sh)
* [Övning 2](https://github.com/jackbenny/scripts_grundkurs/blob/master/Labb3/ovning2.sh)
* [Övning 3](https://github.com/jackbenny/scripts_grundkurs/blob/master/Labb3/ovning3.sh)
* [Övning 4](https://github.com/jackbenny/scripts_grundkurs/blob/master/Labb3/ovning4.sh)

## Reflektion ##

Som vanligt lärorikt att gå tillbaks till grunderna, så mycket man missat när man kodat tidigare. Det är lätt man bara använder det man kan och struntar i allt annat, trots att koden hade blivit bättre om man hade tagit sig tiden att läsa på lite.
