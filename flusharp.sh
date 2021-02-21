#/bin/bash
arp -a -n | awk '{system("arp -d "substr($2,2,length($2)-2))}'
