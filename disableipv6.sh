#!/bin/bash
echo $#
if [ $# -gt 0 ]; then
    if [ "$1" == "-p" ]; then
        sysctl -a 2>/dev/null | grep ipv6 | awk '/disable/{system("sysctl "$1"=1")}' >> /etc/sysctl.conf
    fi
else
    sysctl -a 2>/dev/null | grep ipv6 | awk '/disable/{system("sysctl "$1"=1")}'
fi

