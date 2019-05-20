#! /usr/bin/env python

import re 
import sys

r = re.compile(r"(self\.uid\s*=\s*)'\w{12}'")
line = "self.uid = '027FC8EBC2D1'"
newv = "AAAABBBBCCCC"
r.sub(r"\g<1>'%s'" % newv, line)


