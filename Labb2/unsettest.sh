#!/bin/bash

declare DIST=Hej
echo "Utan unset: $DIST"
unset DIST
echo "Med unset: $DIST"
exit 0
