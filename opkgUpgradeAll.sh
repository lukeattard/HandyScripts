#!/bin/bash
opkg update
opkg list-upgradable | awk 'BEGIN {system("sleep 10")} {system("opkg upgrade "$1)}
echo "Please check for errors above, and enjoy"
