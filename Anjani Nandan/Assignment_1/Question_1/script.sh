#Created a Bash Script for Log Cleanup
#!/bin/bash

TARGET_DIR="/DSG"

find "$TARGET_DIR" -type f -name "*.log" -mtime +7 -print -delete

echo "Deleted .log files older than 7 days in $TARGET_DIR"


# Made the Script Executable
chmod +x /root/clean_logs.sh

#Tested the Script
bash /root/clean_logs.sh

#Set Up a Cron Job for Automation
crontab -e
0 8 * * * /root/clean_logs.sh >> /root/clean_logs.log 2>&1
sudo service cron start

