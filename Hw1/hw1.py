#!/bin/python
import sys #required library for sys functions
i = 1 #initialize value
if len(sys.argv) > 1: #run only if there are arguments passed in
    while(i < (len(sys.argv))): #run while there are files to parse
        sys.stdout.write(open(sys.argv[i],"r+t").read()) #print out lines
        i+=1 #increment