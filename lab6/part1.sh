#!/bin/bash
ps -Af | awk -F" " '$1 != "root" { print $1 ":" $2 ":" $7; }' > test.txt # get user processes
cat test.txt | awk -F":" '{d1 = ( ($3 * 3600) + ($4 * 60) + $5); print $1 ":" $2 ":" d1}' > check.txt # convert time to seconds
cat check.txt | awk -F":" '$3 > 120 {system("kill -9 $2) }' #kills procceses running longer than 2 min
# rm test.txt #clean up
# rm check.txt #clean up
