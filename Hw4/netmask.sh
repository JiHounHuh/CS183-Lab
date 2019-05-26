#!/bin/bash
param=$1
base=32
Iface=$(route -n | grep "UG" | awk '{print $8}')
Netmask=$(ifconfig $Iface| awk '/netmask / { gsub("netmask:","",$4); print $4;}')

exp=$(expr $base - $param)
# echo "this is the exponent $exp"
address=$(( 2 ** exp ))
# echo $address
usable=$(( address - 2 ))
# netmask=$(( 255 - address + 1 ))
check=$(ifconfig $Iface| awk '/netmask / { gsub("netmask:","",$4); print $4;}') 
first=$(echo $check | awk -F"." '{print $1}')
second=$(echo $check | awk -F"." '{print $2}')
third=$(echo $check | awk -F"." '{print $3}')
fourth=$(echo $check | awk -F"." '{print $4}')
echo "first is $first"
first=$( echo "obase=2;$first" | bc)
second=$( echo "obase=2;$second" | bc)
third=$(echo "obase=2;$third" | bc)
fourth=$(echo "obase=2;$fourth" | bc)

newCheck=$first"."$second"."$third"."$fourth
echo $newCheck
x=${Netmask##*255.}
echo $x
#echo $newCheck
 
echo "addresses: $address usable: $usable netmask: 255.255.255.$netmask" 
