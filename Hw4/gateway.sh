#!/bin/bash
Gateway=$(route -n | grep "UG" | awk '{print $2}')
#Netmask=$(route -n | grep "U " | awk '{print $3}')
Iface=$(route -n | grep "UG" | awk '{print $8}')
Netmask=$(ifconfig $Iface| awk '/netmask / { gsub("netmask:","",$4); print $4;exit}')
echo "Gateway: $Gateway Netmask: $Netmask device: $Iface"

#echo $Gateway
# second test
#Check=$(ifconfig ens33 | awk '/inet / { gsub("inet:", "", $2); print $2}')
#Netmask=$(ifconfig ens33 | awk '/netmask / { gsub("netmask:","",$4); print $4}')
#echo $Check
#echo $Netmask
