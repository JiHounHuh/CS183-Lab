#!/bin/python

import re
import time
import sys
from time import strftime
from collections import Counter

from_expr = re.compile(r'.*?from=<(.+?@.+?)>.*?')
to_expr = re.compile(r'.*?to=<(.+?@.+?)>.*?')

log_file_path = sys.argv[1]
from_addr = []
to_addr = []

with open(log_file_path, 'r') as f:
	for line in f:
		m = from_expr.match(line)
		m2 = to_expr.match(line)

		if m:
			from_addr.append(m.group(1))
		if m2:
			to_addr.append(m2.group(1))

# print(Counter(from_addr))
print('\n'.join(['From {} {}'.format(x, freq) for x, freq in Counter(from_addr).most_common(5)]))
print('\n'.join(['To {} {}'.format(x, freq) for x, freq in Counter(to_addr).most_common(5)]))
