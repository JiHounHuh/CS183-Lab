#!/bin/python

import re
import time
from time import strftime

log_file_path = r"C:\Users\Patrick Wumbo\Documents\GitHub\CS183-Lab\Hw3\maillog"
export_file_path = r"C:\Users\Patrick Wumbo\Documents\GitHub\CS183-Lab\Hw3\hourlyInfo"

x = 0 # postfix rejects
y = 0 # amavis quarantines


