BEGIN { print "<html><head><title>ett skript</title><head><body><pre>" } 
{ print $0 } 
END { print "</pre></body></html>" }
