#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Applications
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📱

# Documentation:
# @raycast.author claudealdric
# @raycast.authorURL https://github.com/claudealdric

tell application "Finder"
    open folder "Applications" of startup disk
    activate
end tell
