#!/usr/bin/env bash

count=0

while true; do
    ./script_q3.sh >> stdout_file 2> stderr_file
    if [[ $? -ne 0 ]]; then
        break
    fi    
    ((count++))
done 

echo "The standard output is:"
cat stdout_file

echo "The standard error is:"
cat stderr_file

echo "The error count is $count"
