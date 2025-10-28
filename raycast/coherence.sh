#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Kill Coherence Processes
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🔪

# Documentation:
# @raycast.description Kill Coherence Processes


# Define the process name
PROCESS_NAME="coherencemessaginghost"

# Find and count the number of processes with the specified name
PROCESS_COUNT=$(pgrep -c "$PROCESS_NAME")

# Kill the processes
pkill "$PROCESS_NAME"

# Check if any processes were found and killed
if [ "$PROCESS_COUNT" -gt 0 ]; then
    osascript -e 'display notification "Processes killed successfully." with title "Success"'
else
    osascript -e 'display notification "No processes found with the name '"$PROCESS_NAME"'." with title "No Action Needed"'
fi
