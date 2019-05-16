#!/bin/python

import re
import time
import sys
from time import strftime

i = 1
if len(sys.argv) > 1: 
	while (i < (len(sys.argv))):
		sys.stdout.write(open(sys.argv[i],"r+t").read())
		i+=1