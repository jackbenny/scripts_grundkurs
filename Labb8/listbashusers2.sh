BEGIN {
	print "User	Shell"
	print "----	-----"
	FS=":"
}

/bash/ { print $1 "	"$7 }

END {
	print "\nNo more Bash-users to list"
}

