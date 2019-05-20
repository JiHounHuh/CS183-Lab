#!/bin/python

import re
import sys
import time
import collections
from collections import Counter
from time import strftime

log_file_path = "log2"
uklist = []
klist = []

tk = 0 # total known ip connections
tu = 0 # total unknown ip connections
rconnect = re.compile(r'[^dis]connect[^ion]')
rknown = re.compile(r'.*[^un]known.*')
rip = re.compile(r'\[\d+\.\d+\.\d+\.\d+\]')
runknown = re.compile('.+unknown.*')
file = open(log_file_path,"r")
for x in file:
    matches = rconnect.finditer(x)
    for match in matches:
        ruk = runknown.match(x)
        print(ruk)
        rk = rknown.match(x)
        check1 = runknown.match(x)
        if ruk:
            #test = rip.match(x) 
            #uklist.append(test.group(0))
            tu += 1
        else:
            #klist.append(rk.group(1))
            tk += 1

print(Counter(uklist).most_common(1))
print("Total Known connection: ",tk,"- " "accounts for [x] connections\n")
print("Total Unknown connections: ",tu,"- [x.x.x.x] accounts for [x] connections\n")
file.close()

