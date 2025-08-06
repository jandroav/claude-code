# Claude Code Configuration 🤖

This repository contains a comprehensive Claude Code configuration setup for an AI-powered development workflow. It includes custom agents, slash commands, hooks, and Model Context Protocol (MCP) servers to enhance productivity and maintain coding standards.

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

### Agent Orchestration

The `/task_medium` command serves as the primary orchestrator for complex development tasks, coordinating multiple sub-agents in a structured workflow:

**4-Step Process:**

1. **Investigation Phase** - Invokes `@investigator` subagent to analyze the codebase and generate `INVESTIGATION_REPORT.md`
2. **Flow Analysis** - Triggers `@code-flow-mapper` to create `FLOW_REPORT.md` mapping code patterns and dependencies
3. **Planning Phase** - Executes `@planner` subagent to synthesize both reports into a comprehensive `PLAN.md`
4. **Plan Review** - Enters plan mode to present the generated plan for user approval or adjustments

**Key Features:**

- **Sequential Thinking Integration** - Leverages sequential-thinking MCP for deep reasoning
- **Edge Case Consideration** - Emphasizes comprehensive problem analysis
- **Best Practices Enforcement** - Prevents bandaid fixes through thorough planning
- **Workspace Isolation** - Works with `task_medium_prep_hook.py` to create dedicated `claude-instance-{id}` directories

### Agent Usage

Individual agents can also be invoked using the `@agent-name` syntax and automatically:

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

## 🔄 Complete Task Management Workflow

This configuration includes a sophisticated 3-command workflow for handling complex development tasks from analysis to completion:

### The 3-Command Sequence

#### 1. `/task_medium` - Analysis & Planning Phase

**Purpose**: Comprehensive problem analysis and plan generation
**Process**:

- Creates isolated `claude-instance-{id}` workspace via `task_medium_prep_hook.py`
- Orchestrates three specialized subagents in sequence:
  - `@investigator` → Generates `INVESTIGATION_REPORT.md`
  - `@code-flow-mapper` → Creates `FLOW_REPORT.md`
  - `@planner` → Synthesizes reports into comprehensive `PLAN.md`
- Presents final plan for user approval/adjustment
- Emphasizes edge cases and best practices (no bandaid fixes)

#### 2. `/generate-task-file` - Task Breakdown Phase

**Purpose**: Convert strategic plan into actionable task list
**Process**:

- Reads the generated `PLAN.md` file
- Converts every bullet point into checkbox format `[ ]`
- Adds subtasks where beneficial for granular tracking
- Saves as `tasks.md` for execution tracking
- Confirms completion and readiness for implementation

#### 3. `/run-next-task` - Execution Phase

**Purpose**: Systematic task completion with progress tracking
**Process**:

- Reads `tasks.md` to find first uncompleted task `[ ]`
- Implements only that specific task (focused execution)
- Marks task as complete `[X]` upon successful implementation
- Saves updated `tasks.md` with progress
- Stops execution (ready for next iteration)

### Workflow Benefits

- **🎯 Focused Execution**: One task at a time prevents scope creep
- **📊 Progress Tracking**: Visual checkbox progress in `tasks.md`
- **🔍 Thorough Analysis**: Multi-agent investigation before implementation
- **🏗️ Structured Planning**: Strategic breakdown before tactical execution
- **♻️ Iterative Process**: Repeat `/run-next-task` until completion
- **🔒 Quality Assurance**: Built-in analysis prevents rushed solutions

### Example Usage Flow

```bash
# 1. Start with complex problem analysis
/task_medium "Implement user authentication system with OAuth2"

# 2. Convert plan to executable tasks
/generate-task-file

# 3. Execute tasks one by one
/run-next-task  # Implements first task
/run-next-task  # Implements second task
/run-next-task  # Implements third task
# ... continue until all tasks complete
```

This workflow ensures that complex development tasks are thoroughly analyzed, properly planned, and systematically executed with full progress visibility.

## 🔄 Alternative Simplified Planning Workflow

For simpler projects or when subagent orchestration isn't needed, this streamlined 3-command workflow provides direct planning and execution:

### The Alternative 3-Command Sequence

#### 1. `/create-plan-file` - Direct Plan Creation

**Purpose**: Create versioned plan files from conversation outlines
**Process**:

- Reads the latest outline from current conversation context
- Determines next version number (v001, v002, etc.)
- Creates `plan-{VERSION}.md` in project root
- Adds heading "Plan {VERSION}" with UTC timestamp
- Saves conversation outline as structured plan
- Confirms successful file creation

#### 2. `/generate-task-file` - Task List Generation

**Purpose**: Convert plan into actionable checklist (same as complex workflow)
**Process**:

- Reads the newest `plan-*.md` file
- Converts every bullet point into checkbox format `[ ]`
- Adds subtasks where beneficial
- Saves as `tasks.md` for execution tracking

#### 3. `/run-next-task` - Sequential Task Execution

**Purpose**: Execute tasks systematically (same as complex workflow)
**Process**:

- Finds first uncompleted `[ ]` task in `tasks.md`
- Implements that specific task only
- Marks as complete `[X]` on success
- Saves progress and stops

### When to Use This Workflow

- **Simple to Medium Projects**: When full subagent analysis isn't necessary
- **Quick Iterations**: For rapid prototyping or small features
- **Conversation-Driven Planning**: When you've already discussed the approach
- **Direct Implementation**: When requirements are clear and well-understood

### Alternative Workflow Benefits

- **⚡ Faster Setup**: No subagent orchestration overhead
- **💬 Conversation-Based**: Leverages ongoing discussion context
- **📋 Version Control**: Timestamped plan versions for tracking
- **🎯 Same Execution**: Identical focused task completion
- **📊 Progress Tracking**: Same checkbox-based progress monitoring

### Example Usage Flow

```bash
# 1. After discussing approach in conversation
/create-plan-file  # Saves discussion outline as plan-v001.md

# 2. Convert plan to executable tasks
/generate-task-file  # Creates tasks.md from plan

# 3. Execute tasks systematically
/run-next-task  # Implements first task
/run-next-task  # Implements second task
# ... continue until completion
```

### Workflow Comparison

| Aspect             | Complex Workflow (`/task_medium`) | Simplified Workflow (`/create-plan-file`) |
| ------------------ | --------------------------------- | ----------------------------------------- |
| **Analysis Depth** | Multi-agent investigation         | Conversation-based                        |
| **Setup Time**     | Longer (3 subagents)              | Faster (direct)                           |
| **Best For**       | Complex, unknown problems         | Clear, discussed solutions                |
| **File Output**    | `PLAN.md` (comprehensive)         | `plan-v001.md` (versioned)                |
| **Task Execution** | Same (`/run-next-task`)           | Same (`/run-next-task`)                   |

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
