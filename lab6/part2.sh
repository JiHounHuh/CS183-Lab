#!/bin/bash
ps -N -U root | awk -F " " '{print $1":"$3}' | awk -F ":" '{time = (($2 * 3600) + ($3 * 60) + $4); print $1":"time}' | kill -9 $(awk -F ":" '$2 > 30 {print $1}')
