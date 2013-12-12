#!/bin/bash

################################################################################
#                                                                              #
# Copyright (C) 2011 Jack-Benny Persson <jake@cyberinfo.se>                    #
#                                                                              #
# This program is free software; you can redistribute it and/or modify         #
# it under the terms of the GNU General Public License as published by         #
# the Free Software Foundation; either version 2 of the License, or            #
# (at your option) any later version.                                          #
#                                                                              #
# This program is distributed in the hope that it will be useful,              #
# but WITHOUT ANY WARRANTY; without even the implied warranty of               #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the                 #
# GNU General Public License for more details.                                 #
#                                                                              #
# You should have received a copy of the GNU General Public License            #
# along with this program; if not, write to the Free Software                  #
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA      #
#                                                                              #
################################################################################

## Interactive git add/commit/push for beginners ##

# Declare some variables
Git=/usr/bin/git
Repo=$HOME/testgit
Msg="$1"

# Sanity checks
if [ $1 -ne 1 ]; then
	echo 'Usage: $0 "commit message"'
	exit 2
fi

if [ ! -x $Git ]; then
	echo "Can't execute $Git"
	exit 2
fi

if [ ! -d $Repo ]; then
	echo "$Repo does not exist"
	exit 2
fi

if [ -d $Repo ]; then
	if [ ! -d $Repo/.git ]; then
		echo "$Git is not a git repository"
		exit 2
	fi
fi

# Enter our repo, list changes and ask to commit them
cd $Repo

git status

printf "\nAre you sure you want to commit and push these changes? (y/n)"
read ShallWe

if [ "$ShallWe" = "y" ]; then
	echo "Adding, commiting & pushing"
	git add -A
	git commit -m "$Msg"
	echo "Fake push"
elif [ "$ShallWe" = "n" ]; then
	echo "Aborting"
	exit 1
else
	echo "Please choose y(es) or n(o)"
	exit 2
fi

exit 0
