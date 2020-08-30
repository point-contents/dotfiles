#!/bin/bash 

## Works on Debian to get the default bashrc, 
##will start the bashrc totally from scratch

cat /etc/bash.bashrc > ~/.bashrc

#Explain (to myself mostly)
#Do a for loop of all of the bashfiles in the folder
#If the files are called "autobashrc or makenew" do nothing
#otherwise, grep for all lines that do not start with the 
#bash shebang.

##redirect all of those files to the bashrc in the users home
##directory

for a in *.sh ; do 
	test "$a" = autobashrc.sh && continue
	test "$a" = makenew.sh && continue	
	egrep -v "^#!" $a >> ~/.bashrc ; done 

## Need to do a " . ~/.bashrc " or "source ~/.bashrc" after

