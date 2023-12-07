#!/bin/bash
sysctl -a 2>/dev/null | grep ipv6 | awk '/disable/{system(sysctl =1)}'

