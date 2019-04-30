#!/bin/bash


echo "Find all files /bin, /sbin, /usr/bin, and /usr/sbin that are setuid and owned by root."
find /bin -user root -perm -4000 > /root/lab3/output.txt
find /sbin -user root -perm -4000 >> /root/lab3/output.txt
find /usr/bin -user root -perm -4000 >> /root/lab3/output.txt
find /usr/sbin -user root -perm -4000 >> /root/lab3/output.txt 

echo "Find all files across the entire system that have setuid or setgid enabled (regardless of owner)."
find ../ -user root -perm -6000 >> /root/lab3/output.txt


#echo 'finding directories in /tmp/ that are subdirectories of /tmp, but no other files'
#read -p "Hit any key to continue."
#echo find /tmp -mindepth 1 -type d
#read -p "Hit any key to continue."
#echo 'find all files in /var/ that are symbolic links'
#read -p "Hit any key to continue."
#echo find /var -type s
