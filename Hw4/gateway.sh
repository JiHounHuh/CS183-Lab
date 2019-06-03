#!/bin/bash
Gateway=$(route -n | grep "UG" | awk '{print $2}')
Iface=$(route -n | grep "UG" | awk '{print $8}')
Netmask=$(ifconfig $Iface| awk '/netmask / { gsub("netmask:","",$4); print $4;exit}')
echo "Gateway: $Gateway Netmask: $Netmask device: $Iface"

