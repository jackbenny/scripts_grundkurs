# Laborationsrapport 1 #

## Test och experiment ##

Tillsammans med @daemonicus666 gjorde vi ett litet script med awk som tog uptime kommandot och filtrerade ut så endast uptimen visades på skärmen. Scriptet finns på [uptime.sh](https://github.com/jackbenny/scripts_grundkurs/blob/master/Labb1/uptime.sh)

## Frågor och uppgifter ##

1.	Vad kommer att listas vid följande kommando?
	*	ls -la [a]*[!e]

	Listar alla filer som börjar på "a" och innehåller ett fritt antal tecken och som inte slutar på ett "e".
	*	ls -la *[f-i]?	

	Listar alla filer som börjar på ett fritt antal tecken och sedan innehåller "f" till "i" och sedan bara ett enda tecken. T.ex. filen aaagl kommer visas, men inte aaaglll.
	*	ls -la ????.[co]

	Listar alla filer som innehåller fyra tecken, en punkt, och sedan ett "c" eller ett "o".

2.	Om du vill lista alla filer som börjar på a och slutar på .c, vilken wildcard använder du då?
	```bash
	ls a*.c
	```

3.	Om du skriver ls -la >> /test/test, vad händer då?

	Den skriver alla ut en fillista till filet /test/test. Körs raden igen kommer den skriva fylla på med listan efter den förra listan i samma fil.

4.	Lista alla filer i hela filsystemet till en fil som heter ls-laR.gz, den ska alltså också vara komprimerad, eventuella felmeddelanden ska hamna i ls-laR-errors.txt.
	```bash
	ls -laR | gzip > ls-laR.gz 2> ls-laR-errors.txt		
	```

5.	Vad är miljövariabeln PATH för något? Hur lägger du till katalogen ~/bin till PATH?
	Hur gör du så att denna ändring sker vid varje inloggning?

	PATH håller reda på binärer i systemet. För att lägga till ~/bin i min egen PATH redigerar jag min ~/.profile och lägger till följande innehåll
	```bash
	if [ -d "$HOME/bin" ] ; then
    		PATH="$HOME/bin:$PATH"
	fi
	```

6.	Vad händer om du skriver top i .bash_logout?

	Top körs vid utloggning, dock bara om man är i ett login-shell, d.v.s. om man loggar in via en riktig terminal, typ CTRL+ALT+F2.

7. 	Hur använder du mekanismen pushd, popd och dirs?

	Pushd används för att lägga in kataloger i dir-stacken samt byta till katalogen man anger. Popd används för att byta tillbaks till katalogerna från dir-stacken, en i taget. När man använder popd försvinner katalogen en efter en från dir-stacken. Dirs kommandot används för att lista katalogerna i dir-stacken. 

8.	Vad är ett "null kommando" och varför finns det?

	Ett null-kommando är ett semikolon där ett kommando skulle ha stått, man kan använda semikolon för att separera kommandon på samma rad. T.ex. "pwd; ls; who;"
