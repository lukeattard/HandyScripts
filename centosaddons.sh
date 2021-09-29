#!/bin/bash
shopt -s expand_aliases
alias eyum='yum $1 $* --enablerepo=base,updates,epel,centosplus'

if [ -n "$(egrep -n '^alias eyum' ~/.bashrc)" ]; then
    sed -i "s/^alias eyum.*/alias eyum=\'yum \$1 \$* --enablerepo=base,updates,epel,centosplus\'/" ~/.bashrc
else 
    echo "alias eyum='yum \$1 \$* --enablerepo=base,updates,epel,centosplus'" >> ~/.bashrc
fi
