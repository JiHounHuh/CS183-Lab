#!/bin/python

import re
import sys
import time
from time import strftime

log_file_path = sys.argv[1]
export_file_path = "hourlyInfo"

rej = 0 # postfix rejects
quar = 0 # amavis quarantines
reject = 'reject'
amavis = 'amavis'
regex = re.compile('\w+\W+\d+\W+\d+\D+\d+')

file = open(log_file_path,"r")
first = regex.match(file.readline())
for x in file:
    #first = regex.match(x)
    other = regex.match(x)
    #print (other.group())
    if other == None:
        while first.group() == regex.match(x):
            if "reject" in x:
                rej +=1
            if "quarantine" in x:
                quar +=1
        f = open(export_file_path, "a")
        print(first.group(),' [postfix rejects:',rej,']'+  ' [amavis quarantines:',quar,']')
        f.write(first.group() +' [postfix rejects:'+ str(rej)+']' + ' [amavis quarantines:'+ str(quar)+"]\n")
        f.close()
        break

    elif first.group() == other.group():
        if "reject" in x:
            rej +=1
        if "quarantine" in x:
            quar +=1
        #print('match')
    else:
        f = open(export_file_path,"a")
        print(first.group(),' [postfix rejects:',rej,']' + ' [amavis quarantines:',quar,']')
        f.write(first.group()+' [postfix rejects:'+ str(rej) +']'+ ' [amavis quarantines:'+ str(quar)+ "]\n")
        f.close()
        x = 0
        y = 0
        first = other

file.close()

