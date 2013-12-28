/^-/ { print "File      -> " $0 }
/^d/ { print "Directory -> " $0 }
/^l/ { print "Link      -> " $0 }
