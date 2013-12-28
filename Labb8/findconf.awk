BEGIN { print "I found the following conf files:\n" } 
/^.*\.conf$/ { print $9 } # Changed < to ^ (what does < mean in this context?)
END { print "\nDone." }
