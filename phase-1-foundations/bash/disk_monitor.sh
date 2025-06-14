#!/bin/bash

# CONFIG
THRESHOLD=80
LOGFILE="$HOME/disk_usage.log"

# CHECK USAGE
USAGE=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

# LOG IF ABOVE THRESHOLD
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "$(date): Disk usage is ${USAGE}% (over ${THRESHOLD}%)" >> "$LOGFILE"
else
    echo "$(date): Disk usage is ${USAGE}% (normal)" >> "$LOGFILE"
fi
