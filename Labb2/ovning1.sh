#!/bin/bash

printf "Hej $USER, du befinner dig i $PWD\n";

if [ $? -ne 0 ]; then
	exit 1
else
	exit 0
fi
