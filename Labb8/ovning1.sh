#!/bin/bash

# Jack-Benny Persson
# LX13
# Exercise 1, lab 8 (remove the last line of /var/log/syslog)

sed '$d' /var/log/syslog

exit 0
