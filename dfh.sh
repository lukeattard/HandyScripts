#!/bin/bash
df -h | awk '/snap/{ next; } { print($0) }'
