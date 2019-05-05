#!/bin/bash
#dd can be utilized to change or create large/small files
echo "hello friends. I am wumbo" > file.txt
dd if=~/file.txt of=~/file1.txt conv=ucase
cat file1.txt

#find command can be used to find files based on the parameters and path. This command will find all files that are empty in the current directory.
find . type f -empty

#the file command can be used to recognizing the type of data contained in a file
file file.txt
#to show just the file type
file -b file.txt

#fuser shows which processes are using a specific file
fuser -u /var/log/syslog

#grep helps search through files or plaintext which matches the specified search criteria
grep "friends" file.txt

#host is used for dns lookups
host www.google.com

#ldd lists dynamic dependencies, for example, what libraries each program needs. This command needs the full directory path for dynamic executables
ldd /bin/ls

#lsof means list open files, which makes a list of all open files and the processes that open them 
lsof root

#mount is usually associated with a storage device or filesystem allowing it to be accessed however, I don't really want to mount anything weird so the following command will exemplify the use of it to find out what version it is running. You can mount a new directory if you'd like but might be troublesome
mount -V

#ps prints out the processes and information pertaining to them. This command prints out the processes running
ps -r

#pkill is used to send signals to processes. this kills gedit (if its running)
pkill gedit

#netstat shows the network traffic/connections of the current machine
netstat -f

#renice changes the priority of running proceses
renice -n -10 -p 7974 

#rsync is used for efficiently transferring and syncing files across a network on computers
rsync -zvh file1.txt /tmp/backups/

#time computes the time it takes for a command to run
time ls

#ssh is a command used to remotely log into a machine that has the protocol enabled. It allows for various uses, remote access, file transfers, etc..
ssh edward@will-fw.dyn.ucr.edu 
#the above command won't actually connect because of firewall (: custom port

#stat command is a more detailed version of the ls command, pulling more information from the file's inode
stat file1.txt

#strace traces system calls and signals
strace df -h

#uname prints the current machine's info, useful when you don't know which machine you are currently accessing
uname -a

#wget retrieves content from webservers
#wget https://launcher.mojang.com/v1/objects/f1a0073671057f01aa843443fef34330281333ce/server.jar
wget http://alumni.cs.ucr.edu/~weesan/cs183/

