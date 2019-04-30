#!/bin/bash

#check if file arguments is at least one, if not, don't do anything
if [ ! -z "$1" ] ; then
    cat $@
fi