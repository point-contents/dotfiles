# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
# but only if not SUDOing and have SUDO_PS1 set; then assume smart user.
if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi

#This will clean up all the filth after
#cmake fails, like it does with me 99% of the time

clearmake(){
	rm CMakeCache.txt
	rm -rf CMakeFiles
	rm cmake_install.cmake
	rm Makefile
}



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


# Quick function/alias to make a templated pandoc latex file
# and hopefully catch any errors in compiling
# just call pandy and the name of the markdown file 
# needs the eisvogel template in your ~/.pandoc/templates directory

pandy () {
	pdffile=${1%.md}.pdf
	echo "Now turning $1 into a beautiful pdf"
	pandoc -f markdown -t latex "$1" -o $pdffile --template=eisvogel 2>failure
	result=$?
	if [ $result -eq 0 ]; then
		echo "The file is called $pdffile"
	else
		echo -e "That was unfortunately a failure, further information below \n"
		echo -e "$(cat failure)" "\n"
		echo -e "If the error message does not provide enough information"
		echo -e "then you should call pandoc fully to look at the latex log \n"

	fi
	rm failure
}

## Where the "Pandy" will make a pdf with the eisvogel template
## This one will do it with plain pandoc rendering 


pando () {
	pdffile=${1%.md}.pdf
	echo "Now turning $1 into a beautiful pdf"
	pandoc -f markdown -t latex "$1" -o $pdffile --pdf-engine=xelatex 2>failure
	result=$?
	if [ $result -eq 0 ]; then
		echo "The file is called $pdffile"
	else
		echo -e "That was unfortunately a failure, further information below \n"
		echo -e "$(cat failure)" "\n"
		echo -e "If the error message does not provide enough information"
		echo -e "then you should call pandoc fully to look at the latex log \n"

	fi
	rm failure
}

#add this to make the prompt tiny, good for 
#directories with tons of files

#prompt will just be the username
#export PS1='\u > '



#Export these as environment variables.
#Needs to be added to the bashrc for it to be persistent

export EDITOR="nvim"
export VISUAL="$EDITOR"


## Make the terminal work like vim

set -o vi

alias vim='nvim'
alias vi='nvim'



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/me/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/me/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/me/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/me/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

