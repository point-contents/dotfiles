#!/bin/bash
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

