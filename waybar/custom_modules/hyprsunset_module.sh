#!/bin/bash

# Path to a file to store the toggle state
STATE_FILE="/tmp/hyprsunset_toggle"

# Check the current state
if [ -f "$STATE_FILE" ]; then
    # If the file exists, toggle off
    pkill hyprsunset
    rm "$STATE_FILE"
    echo "{\"text\": \"Hyprsunset: OFF\", \"class\": \"inactive\"}"
else
    # If the file does not exist, toggle on
    hyprsunset -t 6000 & disown & 
    echo "$!" > "$STATE_FILE"  # Store the PID if needed
    echo "{\"text\": \"Hyprsunset: ON\", \"class\": \"active\"}"
fi
