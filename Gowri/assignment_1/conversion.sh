#!/bin/bash

for file in *.jpeg *.png; do
    filename=${file%.*}
    mv "$file" "$filename.jpg"
done

