#!/bin/bash

#if condition syntax
#if [ expression ]
#    Statement if expression is true
#else 
#   Statement if expression is flase
#fi

NUMBER=$1

if [ $NUMBER -gt 50 ]
then 
    echo "The $NUMBER is greater than 50"
else 
    echo "The $NUMBER is less than 50"
fi

