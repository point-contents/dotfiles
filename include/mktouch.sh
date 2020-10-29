
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%			mktouch			%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#!/usr/bin/bash

#this will make a file in a directory that
#doesnt yet exist

mktouch() {
	mkdir -p "$(dirname "$1")" && touch "$1";
	echo $(dirname $1)
}

## For example
## mktouch /Documents/code/streamio.h
## would make a new folder called "code" assuming it 
## doesnt already exist.
## and put a new file in that folder called stream io

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

