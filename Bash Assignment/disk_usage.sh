#!/usr/bin/env bash 
echo "Generate disk usage report"
echo "---------------------------------"
du -h --max-depth=1 "$HOME" | sort -hr
