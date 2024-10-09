#!/bin/bash

pid=$(pgrep -f "bash infinite.sh")
# pid = $(pgrep -f "chmod +x ./infinite.sh")

if [ -n "$pid" ]; then
    kill $pid
    echo "Process infinite.sh (PID: $pid) has been terminated."
else
    echo "No process called infinite.sh was found."
fi