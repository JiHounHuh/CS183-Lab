#!/bin/bash

echo "Find all files /bin, /sbin, /usr/bin, and /usr/sbin that are setuid and owned by root."
find /bin -user root -perm -4000
read -p "Hit any key to continue."

echo "Find all files in /bin, /sbin, /usr/bin, and /usr/sbin that are setuid and owned by root. Why are these files potential security risks?"
find /sbin -user root -perm -4000
find /usr/bin -user root -perm -4000
find /usr/sbin -user root -perm -4000
read -p "Hit any key to continue."

echo "Find all files across the entire system that have setuid or setgid enabled (regardless of owner)."
find ../ -user root -perm -6000
read -p "Hit any key to continue."

echo "Find all files in /var that have changed in the last 20 minutes."
find /var -mmin -20 -ls
read -p "Hit any key to continue."

echo "Find all files in /var that are regular files of zero length."
find /var -size 0
read -p "Hit any key to continue."

echo "Find all files in /dev that are not regular files and also not directories. The same command should print a listing that includes permissions and modification times (at a minimum) for these files."
find /dev ! -type f ! -type d | xargs stat --format '%a' | find /dev ! -type f ! -type d | xargs stat
read -p "Hit any key to continue."

echo "Find all directories in /home that are not owned by root. In the same command, change their permissions to ensure they have 711 (-rwx--x--x) permissions."
find /home* ! -user root -type d | xargs chmod 711
read -p "Hit any key to continue."

echo "Find all regular files in /home that are not owned by root. In the same command, change their permissions to ensure they have 755 (-rwx-wx-wx) permissions."
find /home* ! -user root -type f | xargs chmod 755
read -p "Hit any key to continue."

echo "Find all files (of all types) in /etc that have changed in the last 5 days."
find /etc -tpe f -mtime -5
read -p "Hit any key to finish."