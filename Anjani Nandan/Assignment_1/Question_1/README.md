# Assignment 1 - Log Cleanup Script

## 🧠 Problem Statement
As a developer, I often accumulate a lot of temporary `.log` files in my `~/projects` directory. Manually deleting these files is tedious and error-prone. I want a simple Bash script that automatically finds and deletes all `.log` files older than 7 days, keeping my workspace clean and saving disk space.

---

## 💻 Solution

I created a Bash script called `clean_logs.sh` that:

- Searches for `.log` files older than 7 days in the target directory
- Deletes them automatically
- Can be scheduled to run daily using a cron job

### ✅ Script Contents
```bash
#!/bin/bash

TARGET_DIR="/DSG"

find "$TARGET_DIR" -type f -name "*.log" -mtime +7 -print -delete

echo "Deleted .log files older than 7 days in $TARGET_DIR"


![Script Output](screenshot 2025-06-03 121407.png)

