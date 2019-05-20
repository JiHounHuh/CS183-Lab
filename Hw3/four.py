#!/bin/python

import re
import time
import sys
from time import strftime

log_file_path = "log4"

rej = 0 # rejection counter from dnsbl.sorbs.net
unip = 0 # unique ips
unif = 0 # unique ips from
unit = 0 # unique ips to

rreject = re.compile(r'reject[^ion]')
remail = re.compile(r'\bdnsbl\.sorbs\.net\b')
#rfrom = re.compile(r'(IP)[\D](\d+\.\d+\.+\d+\.\d+)')
rfrom = re.compile(r'from=<\w+\@\w+\.\w+\.\w+>')
rip = re.compile(r'\d+\.\d+\.\d+\.\d+')
rto = re.compile(r'to=<\w+\@\w+\w+\.\w+>')
file = open(log_file_path,"r")
ip = set()
sfrom = set()
sto = set()
for x in file:
    #print(x)
    matches = remail.finditer(x)
    #check = rconnect.match(x)
    for match in matches:
        #print(match)
        rejecters = rreject.finditer(x)
        for rejecter in rejecters:
            addrs= rfrom.finditer(x)
            #print (addrs)
            receivers = rto.finditer(x)
            ipaddrs = rip.finditer(x)
            for ipaddr in ipaddrs:
                print(ipaddr.group())
                ip.add(ipaddr.group())
            for addr in addrs:
                #checker = rip.finditer(addr)
                #print(addr.group())
                sfrom.add(addr.group)
            for receiver in receivers:
               # print(receiver.group())
                sto.add(receiver.group())
            rej+=1

print (rej, " messages rejected")
print (len(ip)," unique IP's")
print (len(sfrom)," unique from addressses")
print (len(sto)," unique to address")
            
