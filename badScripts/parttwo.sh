#!/bin/bash

#test case
for i in $(cat /etc/passwd | awk -F ":" '{print $1}'); do $i; done
