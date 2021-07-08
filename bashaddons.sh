#!/bin/bash

function dfh()
{
	df -h | awk '/snap/{ next; } { print($0) }'
}

function refresh()
{
	echo -e 'Current status of service '$1' is:\n'
	systemctl status $1;
	echo -e 'stoping service '$1':\n'
	systemctl stop $1;
	echo -e 'trying to restart service '$1': \n'
	systemctl start $1;
	echo -e '\n\nStatus after refresh is:\n'
	systemctl status $1 
}
