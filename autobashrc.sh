#!/bin/bash

for a in *.sh ; do 
	test "$a" = autobashrc.sh && continue	
	egrep -v "^#!" $a >> ~/.bashrc ; done 
