# Exercise 8, lab 8 #
This exercise was about writing a nice little script that you find useful.
Only requierment was that it should use sed and/or awk.
So for this exercise I've written the following script(s).

* [configure.sh](https://github.com/jackbenny/failedlogins/blob/master/configure.sh)<br>
	A small script that configures failed\_logins.sh with new variables
	for the hardcoded binary pathes. Useful in case this script is being run
	a different distro which doesn't have the same pathes as Ubuntu.

* [check\_smhi](https://github.com/jackbenny/check_smhi)<br>
	A Nagios plugin to check the SMHI website for wheather alerts.

