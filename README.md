# Claude Code Configuration 🤖

This repository contains a comprehensive Claude Code configuration setup for an AI-powered development workflow. It includes custom agents, slash commands, hooks, and Model Context Protocol (MCP) servers to enhance productivity and maintain coding standards.

## 🏗️ Configuration Overview

### MCP Servers (.claude.json)

The configuration includes several powerful MCP servers for enhanced AI capabilities:

- **🐙 GitHub MCP Server**: Docker-based GitHub integration for repository management
- **📋 Atlassian MCP**: Jira and Confluence integration via SSE
- **📚 Context7**: Documentation search and context retrieval
- **🧠 Sequential Thinking**: Enhanced reasoning capabilities
- **🎭 Playwright**: End-to-end web testing automation
- **📖 DeepWiki**: Wiki and documentation management
- **🚀 SpaceCTL**: Spacelift management and control

### Personal Guidelines (CLAUDE.md)

The main configuration file establishes key principles:

- **Team-oriented approach**: AI is treated as colleague "Jandro" - a collaborative relationship
- **MCP Usage Priority**: Context7 for docs, sequential-thinking for reasoning, Playwright for E2E testing
- **Documentation First**: Always update README.md and create PLAN.md files for tracking
- **Code Quality Standards**: Simple, maintainable solutions over clever complexity
- **Never Mock**: Always use real data and APIs
- **Comment Preservation**: Maintain code documentation

### Jira Integration (JIRA.md)

Structured ticket creation workflow:

- **Required Fields**: "DevOps" component, "DevOps Infrastructure Squad"
- **Template-driven**: Standardized sections for requirements, acceptance criteria, testing
- **Field Mapping**: Custom field handling for Datical Jira instance
- **Project Keys**: DAT or IO project selection

## 🤖 Sub-Agents

Claude Code agents provide specialized expertise for specific development tasks:

| Agent                   | Purpose                                                                       | Key Tools                           |
| ----------------------- | ----------------------------------------------------------------------------- | ----------------------------------- |
| **🎯 Planner**          | Creates detailed implementation plans based on investigation and flow reports | Task, Sequential Thinking, Context7 |
| **🔍 Code Reviewer**    | Ensures code quality, security, and maintainability standards                 | Git, File operations                |
| **🕵️ Investigator**     | Analyzes codebases and identifies issues                                      | (Custom analysis tools)             |
| **📋 Code Flow Mapper** | Maps and analyzes code flow patterns                                          | (Flow analysis tools)               |

### Agent Usage

Agents are invoked using the `@agent-name` syntax and automatically:

- Read investigation and flow reports
- Create detailed plans in `PLAN.md` files
- Focus on specific modified files for reviews
- Provide prioritized feedback (Critical → Warnings → Suggestions)

## ⚡ Slash Commands

Streamlined development workflows through custom commands:

### 🧠 Planning & Analysis

- `/brainstorm` - Interactive spec development with iterative questioning
- `/create-plan-file` - Generate comprehensive project plans
- `/session-summary` - Summarize development sessions

### 🔧 Development Workflow

- `/commit` - Conventional Commits compliant git commits
- `/code-review` - Trigger code reviewer for uncommitted changes
- `/find-missing-tests` - Identify untested code areas
- `/run-next-task` - Execute next planned development task

### 📋 Project Management

- `/gh-issue` - Create GitHub issues
- `/make-github-issues` - Bulk GitHub issue creation
- `/do-issues` - Process and work on existing issues
- `/generate-task-file` - Create task management files

### 🏁 Project Completion

- `/finalise-project` - Final project cleanup and documentation
- `/task_easy` & `/task_medium` - Task complexity management

## 🎣 Hooks

### task_medium_prep_hook.py

**Event**: `UserPromptSubmit` for `/task_medium` commands

**Functionality**:

- Automatically creates `claude-instance-{id}` directories
- Manages instance numbering and directory structure
- Sets up workspace for medium complexity tasks
- Integrates with `claude-code-storage` organization

**Key Features**:

- Auto-incrementing instance IDs
- Error handling and directory validation
- Workspace isolation for different task instances

## 📚 Documentation Standards

### Python Development (`docs/python.md`)

- **Package Manager**: UV exclusively (no pip, poetry, easy_install)
- **Project Structure**: pyproject.toml required in root
- **Initialization**: `uv init` for new projects

### Source Control (`docs/source-control.md`)

- Git workflow standards
- Branching strategies
- Commit message conventions

## 🚀 Getting Started

1. **Clone and Setup**:

   ```bash
   git clone <repository-url>
   cd claude-code
   ```

2. **Configure MCP Servers**:

   - Update `.claude.json` with your GitHub token
   - Ensure Docker is running for GitHub MCP server

3. **Customize Settings**:

   - Review `.claude/CLAUDE.md` for personal preferences
   - Update `.claude/JIRA.md` with your Jira instance details

4. **Use Agents and Commands**:
   - Type `@agent-name` to invoke specialized agents
   - Use `/command-name` for quick development workflows

## 🔧 Configuration Files Structure

```
.claude/
├── settings.json          # Claude Code settings
├── CLAUDE.md             # Personal AI guidelines
├── JIRA.md               # Jira ticket templates
├── agents/               # Specialized AI agents
│   ├── planner.md
│   ├── code-reviewer.md
│   ├── investigator.md
│   └── code-flow-mapper.md
├── commands/             # Slash commands
│   ├── brainstorm.md
│   ├── commit.md
│   ├── code-review.md
│   └── [12 more commands]
├── hooks/                # Event-driven automation
│   └── task_medium_prep_hook.py
└── docs/                 # Development standards
    ├── python.md
    └── source-control.md
```

## 🎯 Workflow Examples

### Code Review Workflow

1. Make code changes
2. Run `/code-review` command
3. Address feedback from code-reviewer agent
4. Use `/commit` for conventional commits

### Planning Workflow

1. Use `@investigator` for codebase analysis
2. Run `@planner` to create detailed implementation plan
3. Follow plan using `/run-next-task`
4. Track progress in generated `PLAN.md`

### Issue Management

1. Use `/brainstorm` for specification development
2. Create issues with `/gh-issue` or `/make-github-issues`
3. Process with `/do-issues`
4. Complete with `/finalise-project`

## 🤝 Contributing

This configuration is designed for collaborative AI-human development. When modifying:

- Maintain the team-oriented approach established in `CLAUDE.md`
- Follow the documentation-first principle
- Test agents and commands before committing
- Update this README with any new features

---

_This configuration represents a sophisticated AI-assisted development environment designed for high productivity and code quality maintenance._
