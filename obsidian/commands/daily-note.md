---
description: "Voice-driven daily note workflow that creates intention + calendar overview in Obsidian"
allowed-tools:
  - Write(*)
  - Bash(date:*)
  - Bash(osascript:*)
  - Bash(open:*)
---

## Context

- **Today's Date:** !`date "+%Y-%m-%d"`
- **Template:** @.claude/templates/daily-note-template.md
- **Note Filename:** YYYY-MM-DD. Daily Note.md

## Your task

1. **Welcome & Present Questions:**
   First, fetch today's calendar with `shortcuts run "Calendar/Reminders for Today" 2>&1` and display events. Then greet warmly and show intention questions:

   **🎯 Intention:** What's your main intention for today?
   **🔧 Systems focus:** What system will you build vs just complete tasks?
   **📈 Development:** What skill/quality will you strengthen today?

2. **Create Note After ANY Response:**
   As soon as user provides ANY response (don't wait for all three), create `YYYY-MM-DD. Daily Note.md` using template. Fill intention sections with whatever responses were given. For calendar section, include both fetched events AND any new events mentioned in user responses (like "recording video at 7pm"). Format all events as todo checkboxes.

   **Add New Events to Calendar:** If user mentions new events in their responses, add them to Home calendar using:
   `osascript -e 'tell application "Calendar" to tell calendar "Home" to make new event with properties {summary:"EVENT_TITLE", start date:date "Day, Month DD, YYYY at HH:MM:SS AM/PM", end date:date "Day, Month DD, YYYY at HH:MM:SS AM/PM"}'`

3. **Open & Complete:**
   Open with `open "obsidian://open?vault=Obsidian&file=YYYY-MM-DD.%20Daily%20Note.md"` and give brief encouragement.

**Rules:** Create note immediately after ANY response, don't push for missing answers, extract events from user responses and add to calendar, preserve authentic voice.
