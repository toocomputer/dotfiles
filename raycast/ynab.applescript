#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title YNAB
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤑

# Documentation:
# @raycast.description Open YNAB and bring to front

tell application "YNAB"
    activate
end tell
tell application "System Events"
    key code 53
end tell

