#!/bin/bash

if [ "$1" == "-o" ]; then

mkdir $2 
cd $2
   
wget  https://github.com/orgs/$2/repositories -O .output.tmp;
#wget  https://github.com/$1?tab=repositories -O .output.tmp;
awk '/codeRepository/{ system("git clone https://github.com"substr($6,7,length($6)-7)) }' .output.tmp; 
totalPages="$(grep -o 'data-total-pages="[0-9]*"' .output.tmp | grep -o '[0-9]*')"

#for x in {2..51} 
for ((x = 2; x <= $totalPages; x++)); 
	do 
	echo "$x"
	wget  https://github.com/orgs/$2/repositories?page="$x" -O .output.tmp;
    awk '/codeRepository/{ system("git clone https://github.com"substr($6,7,length($6)-7)) }' .output.tmp; 
done

else

mkdir $1
cd $1
 
wget https://api.github.com/users/$1/repos -O .json.tmp
sed 's/"/ /g' .json.tmp | sed 's/,//g' > .output.tmp
rm .json.tmp
   
#wget  https://github.com/orgs/$1/repositories -O .output.tmp;
#wget  https://github.com/$1?tab=repositories -O .output.tmp;
awk '/clone_url/{ system("git clone "$3) }' .output.tmp; 
#totalPages="$(grep -o 'data-total-pages="[0-9]*"' .output.tmp | grep -o '[0-9]*')"

#for x in {2..51} 
#for ((x = 2; x <= $totalPages; x++)); 
#	do 
#	echo "$x"

#	wget  https://github.com/$1/repositories?page="$x" -O .output.tmp;
 #   awk '/codeRepository/{ system("git clone https://github.com"substr($6,7,length($6)-7)) }' .output.tmp; 
#done
fi
