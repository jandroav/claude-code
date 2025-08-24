# Claude Daily Productivity Framework

A voice-driven productivity framework that integrates Obsidian, Raycast, and Claude to automate daily note creation and standup reporting based on calendar events and Jira activity.

## 🎯 Overview

This framework consists of two main workflows:

1. **Daily Note Creation** - Creates structured daily notes with intentions, calendar events, and focus areas
2. **Daily Standup Generation** - Automatically updates daily notes with work accomplished based on Jira ticket activity

## 📁 Project Structure

```
.claude/
├── README.md                      # This documentation
├── settings.local.json            # Claude permissions configuration
├── commands/                      # Claude slash commands
│   ├── daily-note.md             # Daily note creation workflow
│   └── daily-standup.md          # Daily standup report workflow
├── raycast/                      # Raycast launcher scripts
│   ├── daily-note.sh             # Triggers daily note creation
│   └── daily-standup.sh          # Triggers standup generation
└── templates/                    # Note templates
    └── daily-note-template.md    # Daily note structure template
```

## 🚀 How It Works

### Daily Note Workflow

1. **Trigger**: Launch via Raycast command "Claude Daily Note"
2. **Process**:

   - Fetches today's calendar events from macOS Calendar
   - Prompts for daily intentions and focus areas
   - Creates a new daily note in Obsidian with format `YYYY-MM-DD. Daily Note.md`
   - Adds mentioned events to your Home calendar
   - Opens the note in Obsidian

3. **Voice-Driven**: Designed for voice input to quickly capture intentions. You can use [SuperWhisper](https://superwhisper.com)

### Daily Standup Workflow

1. **Trigger**: Launch via Raycast command "Claude Standup Note"
2. **Process**:
   - Queries Jira for tickets you worked on today
   - Updates the existing daily note with work summaries
   - Formats each ticket as: `### TICKET-KEY - Summary`
   - Opens the updated note in Obsidian

## 📋 Daily Note Template

Each daily note follows this structure:

```markdown
## 🎯 Today's intention

[Your main focus/goal for the day]

## 📅 Today's calendar events

[Automatically populated from calendar + checkbox format]

## 🔧 Systems focus

[What system/process you're building vs just completing tasks]

## 📈 Development target

[Skill or quality you're strengthening today]

## 📈 What I did

[Automatically populated from Jira ticket activity]

### TICKET-123 - Ticket Summary

[Summary of work done on this ticket]
```

## ⚙️ Setup Requirements

### Prerequisites

1. **Claude CLI** - Install and configure Claude command-line interface
2. **Raycast** - macOS launcher application
3. **Obsidian** - Note-taking application with vault named "Obsidian"
4. **Jira Integration** - Claude MCP server for Atlassian/Jira access
5. **macOS Calendar** - For calendar event integration

### Configuration

1. **Update Raycast Scripts**: Edit the paths in `raycast/*.sh` files:

   ```bash
   VAULT_PATH="/path/to/your/obsidian/vault"
   CLAUDE_PATH="/path/to/claude/cli"
   ```

2. **Permissions**: The `settings.local.json` grants Claude access to:

   - Run macOS Shortcuts
   - Open Obsidian URLs
   - Access Jira via MCP server

3. **Calendar Setup**: Ensure you have a "Home" calendar in macOS Calendar app

4. **Apple Shortcut**: Install the "Calendar/Reminders for Today" shortcut:
   - [Calendar/Reminders for Today Shortcut](https://www.icloud.com/shortcuts/19ff2b29e44343c4b12f7e32cb365c1d)
   - Grant permissions for Reminders and Calendar access when prompted

## 🎮 Usage

### Creating a Daily Note

1. Open Raycast (⌘ + Space)
2. Type "Claude Daily Note" and press Enter
3. Speak or type your responses to the intention questions:
   - What's your main intention for today?
   - What system will you build vs just complete tasks?
   - What skill/quality will you strengthen today?
4. The note is automatically created and opened in Obsidian

### Generating Daily Standup

1. Open Raycast (⌘ + Space)
2. Type "Claude Standup Note" and press Enter
3. The system automatically:
   - Finds your Jira activity for today
   - Updates your daily note with work summaries
   - Opens the updated note

## 🔧 Customization

### Modifying the Template

Edit `templates/daily-note-template.md` to change the daily note structure.

### Updating Workflows

- **Daily Note Logic**: Modify `commands/daily-note.md`
- **Standup Logic**: Modify `commands/daily-standup.md`

### Adding New Raycast Commands

1. Create a new `.sh` file in `raycast/`
2. Add Raycast metadata headers
3. Configure the script to call your Claude command

## 🔐 Security & Permissions

The framework uses:

- **Local permissions** defined in `settings.local.json`
- **Raycast security model** for script execution
- **Claude MCP** for secure Jira integration
- **macOS AppleScript** for calendar and application integration

## 🤝 Contributing

To extend this framework:

1. Add new commands in the `commands/` directory
2. Create corresponding Raycast scripts in `raycast/`
3. Update permissions in `settings.local.json` as needed
4. Document new workflows in this README

## 📝 Notes

- Designed for voice-first interaction
- Integrates seamlessly with existing productivity workflows
- Automatically handles date formatting and file naming
- Preserves authentic voice and doesn't over-prompt for missing information
- Works entirely offline except for Jira integration

---

_This framework turns daily planning and standup reporting into a seamless, voice-driven experience that fits naturally into your existing productivity stack._
