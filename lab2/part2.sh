#!/bin/bash


# Parse passwd file for stuff
awk -F ":" '{print $4 ":" $1;}' /etc/passwd > users.txt 
awk -F ":" '{print $3":" $1;}' /etc/group > group.txt

awk -F ":" 'NR==FNR{a[$1]=$1":"$2; next} ($1 in a){print $2":"a[$1]}' group.txt users.txt


