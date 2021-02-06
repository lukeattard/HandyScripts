#!/bin/ash
opkg update
#sleep 10 is used to ensure that the lock from opkg list-upgrade is released before we attempt to install the first upgrade, most likely can be less then 10, but better safe then having errors at times.
opkg list-upgradable | awk 'BEGIN {system("sleep 10")} {system("opkg upgrade "$1)}'
echo "Please check for errors above, and enjoy"
