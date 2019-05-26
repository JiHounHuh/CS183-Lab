#!/bin/bash
param=$1
base=32
exp=$(expr $base - $param)
echo "this is the exponent $exp"
address=$(( 2 ** exp ))
echo $address
usable=$(( address - 2 ))
netmask=$(( 255 - address + 1 ))
echo "addresses: $address usable: $usable netmask: 255.255.255.$netmask" 
