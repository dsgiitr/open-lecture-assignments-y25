## DISK USAGE SCRIPT
#### Usage
This script tells the disk usage of all folders in HOME directory in descending order.
#### .sh file
```
#!/usr/bin/env bash 
echo "Generate disk usage report"
echo "---------------------------------"
du -h --max-depth=1 "$HOME" | sort -hr
```
#### Output
![Alt text](https://raw.githubusercontent.com/ishantbhartii/Ishant-Bharti-Git-Assignment-DSG/refs/heads/main/Bash%20Assignment/Screenshot_20250604_192701.png)


