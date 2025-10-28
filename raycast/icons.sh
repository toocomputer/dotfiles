#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Icons
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤺

# Documentation:
# @raycast.description Open Icons

open ~/Library/CloudStorage/Dropbox/Icons
open /Applications/

osascript -e 'tell application "System Events" to key code 53'
