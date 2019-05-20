#!/bin/python

import re
import time
from time import strftime

log_file_path = r"C:\Users\Patrick Wumbo\Documents\GitHub\CS183-Lab\Hw3\maillog"
export_file_path = r"C:\Users\Patrick Wumbo\Documents\GitHub\CS183-Lab\Hw3\hourlyInfo"

x = 0 # postfix rejects
y = 0 # amavis quarantines
reject = 'reject'
amavis = 'amavis'
regex = re.compile('\w+\W+\w+\W+\d+\D+\d+')

with open('maillog') as file: 
    lines = file.readlines()
    # matches = regex.finditer(contents)
    #print (lines)
    first = regex.match(lines)
    #print(lines)
    print(first.group())
    #print(first)


    for line in lines:
        other = regex.match(line)
        print (line)
        if first == other:
            print('match')
        #print(other)
        #print(other)
        #print('mismatch')

