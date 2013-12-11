# Laborationsrapport 3 #

## Syfte ##

Förstå och kunna hantera villkor med test. Både gällande strängar, filer och matematiska villkor.

## Tillvägagångssätt ##

Declare och test-värden testas lite i början av labben. Exempelvis:

	````bash
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
	````

Detta är ett enkelt sätt att testa olika test-scenarion utan att behöva skapa ett helt nytt script varje gång man vill prova på något bara.


