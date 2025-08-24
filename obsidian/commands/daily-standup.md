---
description: "Voice-driven daily standup report"
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

1. **Get Today Jira tasks I worked on:**
   First, fetch today's Jira tasks with the Atlassian MCP server. You need to find the jira tickets updated by me today.

2. **Edit the note for today:**
   Edit today `YYYY-MM-DD. Daily Note.md` using the @../templates/daily-note-template.md template. For each jira ticket, fill `What I did' section with a summary of my comments on each jira ticket I worked on today. The format for the section is:

   ```md
   ### Ticket KEY - Ticket Summary

   {summary}
   ```

3. **Open & Complete:**
   Open with `open "obsidian://open?vault=Obsidian&file=YYYY-MM-DD.%20Daily%20Note.md"` and give brief encouragement.

**Rules:** Edit note immediately after ANY response, don't push for missing answers, preserve authentic voice.
