#!/bin/bash
param=$1
base=32
Iface=$(route -n | grep "UG" | awk '{print $8}')
Netmask=$(ifconfig $Iface| awk '/netmask / { gsub("netmask:","",$4); print $4;exit}')
exp=$(expr $base - $param)
# echo "this is the exponent $exp"
address=$(( 2 ** exp ))
# echo $address
usable=$(( address - 2 ))
# netmask=$(( 255 - address + 1 ))
newNet=$(( echo "obase=2;$Netmask" | bc))
echo newNet
echo "addresses: $address usable: $usable netmask: 255.255.255.$netmask" 
