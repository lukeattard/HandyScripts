#!/bin/bash

function display_help {
  echo "Usage: linechange <COMMAND> [option] <pattern> [<replace>] <file>"
  echo "where COMMAND is one of:"
  echo " -S			Replace string if it appears at the start of the line"
  echo " -E			Replace string if it appears at the end of the line"
  echo " -F			Replace only the first time the string appears"
  echo " -A			Replace ALL instances of the string"
  echo " -RA		Remove all text after string"
  echo " -RB		Remove all text before string"
  echo " -RE <n>	Remove <n> characters from the end of each line text"

  echo " -AE   Append to the end of each line"
  echo " -AS   Add text at the start of all line"
  echo " "
  echo " "
  echo "where is option is one of:"
  echo " -rnm  Remove all lines that do not contain pattern"
  echo " -ram  Remove all lines that contain the search pattern"
  echo " "
} >&2


if [ $# == 0 ]; then
    display_help
    exit

fi

if [ $1 == '-E' ]; then

	if [ $# != 4 ]; then
		display_help
		exit
	fi

	plength=${#2}
	
	while read -r line; do
		if [ "${line: -$plength}" == "$2" ]
		then
			echo "${line%$2}$3"
		else
			echo "$line"
		fi
	done < "$4"

elif [ $1 == '-RE' ]; then

    if [ $# != 3 ]; then
        display_help
        exit
    fi

    while read -r line; do
		plength=${#line}-$2
        echo "${line:0:$plength}"
    done < "$3"


elif [ $1 == '-S' ]; then

	if [ $# != 4 ]; then
        display_help
        exit
    fi

	plength=${#2}

    while read -r line; do
        if [ "${line:0:$plength}" == "$2" ]
        then
            echo "${3}${line#$2}"
        else
            echo "$line"
        fi
    done < "$4"

elif [ $1 == "-F" ]; then

    if [ $# != 4 ]; then
        display_help
        exit
    fi

	while read -r line; do
        echo "${line/$2/$3}"
    done < "$4"

elif [ $1 == "-A" ]; then

	if [ $# != 4 ]; then
        display_help
        exit
    fi

    while read -r line; do
        echo "${line//$2/$3}"
    done < "$4"

elif [ $1 == "-RA" ]; then

	if [ $# != 3 ]; then
		display_help
		exit
	fi

	while read -r line; do
		echo "${line%%$2*}"
	done < "$3"	

elif [ $1 == "-RB" ]; then

    if [ $# != 3 ]; then
        display_help
        exit
    fi

    while read -r line; do
        echo "${line#*$2}"
    done < "$3"

elif [ $1 == "-AE" ]; then

   if [ $# != 3 ]; then
        display_help
        exit
    fi

	while read -r line; do
		echo "${line}$2"
	done < "$3"
	
elif [ $1 == "-AS" ]; then

   if [ $# != 3 ]; then
        display_help
        exit
    fi

    while read -r line; do
        echo "$2${line}"
    done < "$3"

else
	display_help
fi


