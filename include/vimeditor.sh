
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%			Vimmy()		       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#!/bin/bash

#Export these as environment variables.
#Needs to be added to the bashrc for it to be persistent

export EDITOR="nvim"
export VISUAL="$EDITOR"

##Add some aliases to complete the transition to neovim
alias vim="nvim"
alias vi="nvim"

## Make the terminal work like vim 

set -o vi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

