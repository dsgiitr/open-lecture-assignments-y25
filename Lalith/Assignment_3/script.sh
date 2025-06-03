#!/bin/bash

DEVICE="/dev/input/event5"  
SOUND="Intruder detected! Step away from my PC!"
INACTIVITY_TIMEOUT=100

last_activity=$(date +%s)

sudo libinput debug-events --device "$DEVICE" | while read -r line; do
    now=$(date +%s)
    
    # Check if last activity was less than timeout ago
    if (( now - last_activity >= INACTIVITY_TIMEOUT )); then
        echo "[!] Motion detected at $(date)"
        espeak "$SOUND"
        last_activity=$now
        sleep 10  # Avoid spamming sound
    else
        last_activity=$now
    fi
done
