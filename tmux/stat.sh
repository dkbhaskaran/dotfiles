#!/bin/bash

MEMORY=$(free -m | awk 'NR==2{printf "mem : %.2f%%", $3*100/$2 }')
CPU=$(top -bn1 | grep load | awk '{printf "cpu : %.2f%%", $(NF-2)}')
DISK=$(df -h | awk '$NF=="/"{printf "disk : %s", $5}')
USERS=$(uptime  | awk '{printf "users : %s", $6}')

COMMA=', '
echo ${CPU}${COMMA}${MEMORY}
