BEGIN { FS=":"; OFS="\n"; print "The following users uses Bash" } 
/\/bin\/bash/ { print $1 }
