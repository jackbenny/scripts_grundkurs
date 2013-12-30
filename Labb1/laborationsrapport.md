# Laborationsrapport 1 #

## Syfte ##

Grunderna i Bash. Att efter genomförd laboration få praktisk erfarenhet av att 
skräddarsy. Bashmiljön. Förstå hur Wildcards och Braces fungerar i praktiken. 
Kunna navigera i bashmiljön och förstå vad Bash’s olika konfigurationsfiler gör.
Notera att laborationens uppgifter både finns inbakade i texten och under 
frågesektionen.

## Tillvägagångsssätt ##

### Test och experiment ###

Tillsammans med [daemonicus666](https://github.com/daemonicus666) gjorde vi 
ett litet script med awk som tog uptime kommandot och filtrerade ut så endast 
uptimen visades på skärmen. 
Scriptet finns på [uptime.sh](https://github.com/jackbenny/scripts_grundkurs/blob/master/Labb1/uptime.sh)

### Frågor och uppgifter ###

1. Vad kommer att listas vid följande kommando?
	*	`ls -la [a]*[!e]`

	Listar alla filer som börjar på __a__ och innehåller ett fritt antal 
	tecken och som inte slutar på ett __e__.
	*	`ls -la *[f-i]?`	

	Listar alla filer som börjar på ett fritt antal tecken och sedan 
	innehåller __f__ till __i__ och sedan bara ett enda tecken. T.ex. 
	filen __aagl__ kommer visas, men inte __aaaglll__.
	*	`ls -la ????.[co]`

	Listar alla filer som innehåller fyra tecken, en punkt, och sedan ett __c__ eller ett __o__.

2. Om du vill lista alla filer som börjar på a och slutar på .c, vilken 
wildcard använder du då?
	```bash
	ls a*.c
	```

3. Om du skriver `ls -la >> /test/test`, vad händer då?

	Den skriver alla ut en fillista till filet /test/test. Körs raden igen 
	kommer den skriva fylla på med listan efter den förra listan i 
	samma fil.

4. Lista alla filer i hela filsystemet till en fil som heter ls-laR.gz, den ska 
alltså också vara komprimerad, eventuella felmeddelanden ska hamna i 
ls-laR-errors.txt.
	```bash
	ls -laR | gzip > ls-laR.gz 2> ls-laR-errors.txt		
	```

5. Vad är miljövariabeln PATH för något? Hur lägger du till katalogen ~/bin 
till PATH? Hur gör du så att denna ändring sker vid varje inloggning?

	PATH håller reda på binärer i systemet. För att lägga till ~/bin i min 
	egen PATH redigerar jag min ~/.profile och lägger till följande innehåll
	```bash
	if [ -d "$HOME/bin" ] ; then
    		PATH="$HOME/bin:$PATH"
	fi
	```

6. Vad händer om du skriver `top` i .bash\_logout?

	Top körs vid utloggning, dock bara om man är i ett login-shell, d.v.s. 
	om man loggar in via en riktig terminal, typ CTRL+ALT+F2.

7. Hur använder du mekanismen `pushd`, `popd` och `dirs`?

	Pushd används för att lägga in kataloger i dir-stacken samt byta till 
	katalogen man anger. Popd används för att byta tillbaks till katalogerna
	från dir-stacken, en i taget. När man använder popd försvinner katalogen
	en efter en från dir-stacken. Dirs kommandot används för att lista 
	katalogerna i dir-stacken. 

8. Vad är ett "null kommando" och varför finns det?

	Kolon (":") är ett null kommando och returnerar alltid 0 från $? 
	(värdet från senaste körda kommandot). D.v.s det är ett kommando som 
	faktiskt körs men inte gör något, men returnerar 0 i exit status. T.ex. 
	kan man använda detta istället för ett faktiskt kommando om man måste 
	ha ett sant returvärde från något. Exempelvis i en while-stats i script.
	Eller bara rakt upp och ner vid prompten för att testa ett script man 
	gjort som är beroende av ett sant returvärde.

## Reflektion ##

Det var en lärorik första laboration med tanke på att där var en hel del nytt 
att lära sig, bland annat null-kommandot och pushd, popd, dirs. Det är aldrig 
fel att gå tillbaks till grunderna för att få en stabilare grund att stå på när 
det gäller scripting.
Dessa tre kommandon kan också snabba upp navigeringen väsentligt när man arbetar
mycket i CLI-läge. De flesta känner säkert till att `cd ~` tar en tillbaks till
ens hemkatalog. Man kan använda dir-stacken på liknande sätt. Låt oss ta några
exempel på detta.
```bash
jake@olivia:~$ dirs
~
jake@olivia:~$ pushd scripts_grundkurs/
~/scripts_grundkurs ~
jake@olivia:~/scripts_grundkurs$ # Vi vill nu fixa lite i /etc
jake@olivia:~/scripts_grundkurs$ pushd /etc
/etc ~/scripts_grundkurs ~
jake@olivia:/etc$ # Fixar lite... nu vill vi tillbaks till scriptingen
jake@olivia:/etc$ dirs -v
 0  /etc
 1  ~/scripts_grundkurs
 2  ~
jake@olivia:/etc$ # Notera att scripts_grundkurs är nr 1 på listan
jake@olivia:/etc$ pushd +1
~/scripts_grundkurs ~ /etc
jake@olivia:~/scripts_grundkurs$ # Tada, man kan även går såhär:
jake@olivia:~/scripts_grundkurs$ dirs -v
 0  ~/scripts_grundkurs
 1  ~
 2  /etc
jake@olivia:~/scripts_grundkurs$ cd ~2
jake@olivia:/etc$ dirs -v
 0  /etc
 1  ~
 2  /etc
jake@olivia:/etc$ # Dock försvann då scripts_grundkurs från dir-stacken
```
