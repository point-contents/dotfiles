#!/bin/bash 

## Works on Debian to get the default bashrc, 
##will start the bashrc totally from scratch

##Uncomment this to start from the start

# cat /etc/bash.bashrc > ~/.bashrc

# Explain (to myself mostly)
# Do a for loop of all of the bashfiles in the folder
# grep for all lines that do not start with the 
# bash shebang.

##redirect all of those lines to the bashrc in the users home
##directory

touch testBashRC

for a in $(find include/ -iname "*.sh") ; do 
	egrep -v "^#!" $a >>  testBashRC ; done ##~/.bashrc ; done 

## Need to do a " . ~/.bashrc " or "source ~/.bashrc" after
## or just restart the terminal

