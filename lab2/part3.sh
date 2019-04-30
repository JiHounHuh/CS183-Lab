#!/bin/bash

FILE=lab2-file.txt
if [ ! -f "$FILE" ]; then
 echo "$(date +%m"-"%d"-"%Y" "%H":"%M":"%S) - File $FILE has been lost" >> ../var/log/cs183/uptime.log
else
 tail -f ../var/log/cs183/uptime.log | grep -m 1 "lost" | echo "$(date +%m"-"%d"-"%Y" "%H":"%M":"%S) - File $FILE has been found" >> ../var/log/cs183/uptime.log
fi

