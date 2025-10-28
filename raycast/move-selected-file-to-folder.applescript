#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Move Selected file to Folder
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Moves the selected file to the specificed folder

tell application "Finder"
    activate

    set selectedItems to selection
    if selectedItems is not {} then
        -- Get the first selected item
        set itemToMove to item 1 of selectedItems
        
        -- Show a dialog to choose the destination folder
        set destFolder to choose folder with prompt "Select a destination folder:"
        
        -- Move the selected item to the chosen folder
        move itemToMove to destFolder
    else
        display dialog "No files selected." buttons {"OK"} default button "OK"
    end if
end tell
