# Frågor och uppgifter #

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
