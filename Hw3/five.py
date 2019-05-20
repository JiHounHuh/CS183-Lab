import re
import fileinput
import sys

log_file_path = sys.argv[1]

with open(log_file_path, 'r') as file:
    lines = file.readlines() # read through the function

with open(log_file_path, 'w') as filer:
    for line in lines: # for each line parsing
        if not any(x in line for x in sys.argv[2:]): #check with each word
            filer.write(line) #write to line if not any of the key words