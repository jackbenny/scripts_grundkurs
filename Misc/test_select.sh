#!/bin/bash

# Jack-Benny Persson
# LX13
# Testing select, thx Paulena :)

select Word in "Ja" "Nej" "Kanske" "Exit"; do
	echo $Word
	case "$Word" in
	Ja)
	  echo "Omg YES"
	  ;;
	Nej)
	  echo "Oh no"
	  ;;
	Kanske)
	  echo "Maybe later baby"
	  ;;
	Exit)
	  echo "Se ya later"
	  exit 0
	  ;;
	esac
done

exit 0
