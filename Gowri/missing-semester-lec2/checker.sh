#!/usr/bin/env bash

count=0

while true; do

    ./tocheck.sh &> output.txt

    if [[ "$?" -ne 0 ]]; then
        break;
    fin

    count=$((count+1))

done

echo "Output:"
cat output.txt

echo "Number of runs before error was found: $count"