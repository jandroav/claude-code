#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Claude Standup Note
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author jandro

# Configuration - Replace these placeholders
VAULT_PATH="/Users/jandro/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian"
CLAUDE_PATH="/Users/jandro/.nvm/versions/node/v22.17.1/bin/claude"

# Run daily note workflow in iTerm2 (new tab)
osascript -e "
tell application \"iTerm\"
    activate
    tell current window
        set newTab to (create tab with default profile)
        tell current session of newTab
            write text \"cd '$VAULT_PATH' && '$CLAUDE_PATH' '/daily-standup'\"
        end tell
    end tell
end tell"