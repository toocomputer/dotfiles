#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Close Finder Windows
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤐

tell application "Finder"
    close windows
end tell
tell application "System Events"
    key code 53
end tell


