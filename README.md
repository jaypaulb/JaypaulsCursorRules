# CursorRules - Modular Development Standards

A comprehensive set of focused, reusable Cursor Rules for rapid development setup across different project types. Each rule is designed to be concise (~100 lines), focused on specific concerns, and actionable for both human developers and AI agents.

## Quick Start

### Method 1: GitHub Template (Recommended for New Projects)

1. **Use this template** on GitHub:
   - Click "Use this template" button on the repository page
   - Create a new repository from the template
   - Clone your new repository

2. **Copy the rules** to your project:
   ```bash
   cp -r JaypaulsCursorRules/.cursor your-project/
   ```

3. **Select appropriate rules** based on your project type (see Rule Selection Guide below)

4. **Customize frontmatter** in rule files to match your project's file patterns

5. **Start developing** with AI assistance following established standards

### Method 2: Git Subtree (Recommended for Rule Updates)

For projects where you want to keep rules synchronized with updates:

**Prerequisites:**
- Project must be a git repository (`git init` if needed)
- `.cursor/rules/` directory must not exist or be empty

1. **Add rules as subtree** (one-time setup):
   ```bash
   # Ensure you're in a git repository
   git init  # if not already initialized

   # Remove existing rules if they exist
   rm -rf .cursor/rules/

   # Add subtree
   git subtree add --prefix=.cursor/rules https://github.com/jaypaulb/JaypaulsCursorRules.git main --squash
   ```

2. **Update rules** when new versions are available:
   ```bash
   git subtree pull --prefix=.cursor/rules https://github.com/jaypaulb/JaypaulsCursorRules.git main --squash
   ```

3. **Select and customize rules** as needed for your project

### Method 3: Manual Clone (Simple Setup)

1. **Clone this repository** to your new project:
   ```bash
   git clone https://github.com/jaypaulb/JaypaulsCursorRules.git
   cp -r JaypaulsCursorRules/.cursor .
   rm -rf JaypaulsCursorRules  # Clean up
   ```

2. **Select appropriate rules** based on your project type (see Rule Selection Guide below)

3. **Customize frontmatter** in rule files to match your project's file patterns

4. **Start developing** with AI assistance following established standards

## Deployment Method Comparison

| Method | Best For | Pros | Cons |
|--------|----------|------|------|
| **GitHub Template** | New projects, one-time setup | Clean separation, no git history pollution | Manual updates required |
| **Git Subtree** | Projects needing rule updates | Version controlled, can pull latest changes | More complex setup |
| **Manual Clone** | Quick setup, simple projects | Simple, no dependencies | No update mechanism |

**Recommendation:**
- Use **GitHub Template** for most new projects
- Use **Git Subtree** if you want to keep rules synchronized with updates
- Use **Manual Clone** for quick prototyping or simple projects

## Rule Categories

### 1. Core Foundation Rules
- **1.1 core.mdc**: Essential AI agent behavior and decision-making principles
- **1.2 dev-env.mdc**: Environment detection and OS-specific best practices

### 2. Project Management & Workflow
- **2.1 project-management.mdc**: High-level project management standards
- **2.2 tasks-sop.mdc**: TASKS.md file management and task lifecycle
- **2.3 issues-sop.mdc**: Issue tracking and GitLab/GitHub integration

### 3. Agent Collaboration Workflows
- **3.1 local-agent-workflow.mdc**: Guidelines for AI agents working with humans
- **3.2 background-agent-workflow.mdc**: Autonomous agent behavior for unattended tasks

### 4. Language-Specific Standards
- **4.1 python-standards.mdc**: Python development best practices (legacy - see `languages/python.mdc`)
- **4.2 golang-standards.mdc**: Go development standards and patterns (legacy - see `languages/golang.mdc`)
- **4.3 mern-standards.mdc**: MERN stack (MongoDB, Express, React, Node.js) guidelines (legacy - see `languages/mern.mdc`)
- **4.4 cpp-standards.mdc**: C++ development standards (legacy - see `languages/cpp.mdc`)

**New Atomic Structure** (`.cursor/rules-atomic/`):
- **languages/python.mdc**: Python with TDD patterns and atomic design
- **languages/golang.mdc**: Go with TDD patterns and atomic design
- **languages/mern.mdc**: MERN with TDD patterns and atomic design
- **languages/cpp.mdc**: C++ with TDD patterns and atomic design
- **languages/flutter.mdc**: Flutter/Dart development (NEW)
- **languages/canvus.mdc**: Canvus API development, language-agnostic (NEW)

### 5. Specialized Development Workflows
- **5.1 refactor.mdc**: Guidelines for large-scale code refactoring (legacy - see `workflows/specialized/refactor.mdc`)
- **5.2 refresh.mdc**: Bug hunting and problem-solving approaches (legacy - see `workflows/specialized/refresh.mdc`)
- **5.3 reflect.mdc**: Post-development analysis and rule refinement (legacy - see `workflows/specialized/reflect.mdc`)
- **5.4 research.mdc**: Project inception and research methodology (legacy - see `workflows/specialized/research.mdc`)

**New Atomic Structure** (`.cursor/rules-atomic/`):
- All workflow rules include TDD methodology
- All rules enforce atomic design principles
- Token-optimized structure

## Rule Selection Guide

> **Note**: The new atomic structure (`.cursor/rules-atomic/`) is recommended. See `RULE_SELECTION_GUIDE.md` in the atomic rules directory for detailed selection guidance.

### For Python Projects (New Atomic Structure)

**Automatically Applied:**
- All core rules (always-apply): command-execution, file-operations, quality-gates, error-handling, naming-conventions, tdd-methodology, code-structure
- `languages/python.mdc` (when editing `.py` files)
- `project/tasks.mdc` (when editing `TASKS.md`)
- `project/project-management.mdc` (when editing `README.md`, `PRD.md`, `CHANGELOG.md`)
- `workflows/local-agent-workflow.mdc` (always-apply)

**Key Features:**
- ✅ TDD methodology enforced (tests before implementation)
- ✅ Atomic design structure (atoms → molecules → organisms)
- ✅ Token-optimized (~728-928 tokens per call)
- ✅ No duplication between rules

### For Python Projects (Legacy Structure)
```
✅ 1.1 core.mdc (always apply)
✅ 1.2 dev-env.mdc
✅ 4.1 python-standards.mdc
✅ 2.1 project-management.mdc
✅ 2.2 tasks-sop.mdc
✅ 2.3 issues-sop.mdc
⚠️ 3.1 local-agent-workflow.mdc (if working with AI agents)
```

### For Go Projects (New Atomic Structure)

**Automatically Applied:**
- All core rules (always-apply)
- `languages/golang.mdc` (when editing `.go` files)
- `project/tasks.mdc` (when editing `TASKS.md`)
- `workflows/local-agent-workflow.mdc` (always-apply)

**Key Features:**
- ✅ Go-specific TDD patterns (cargo test, table-driven tests)
- ✅ Atomic design with Go package structure
- ✅ Interface-based composition

### For MERN Stack Projects (New Atomic Structure)

**Automatically Applied:**
- All core rules (always-apply)
- `languages/mern.mdc` (when editing `.js`, `.jsx`, `.ts`, `.tsx` files)
- `project/tasks.mdc` (when editing `TASKS.md`)
- `workflows/local-agent-workflow.mdc` (always-apply)

**Key Features:**
- ✅ React + Express TDD patterns (Jest, React Testing Library)
- ✅ Atomic design for both frontend and backend
- ✅ TypeScript type safety

### For Background Agent Projects (New Atomic Structure)

**Automatically Applied:**
- All core rules (always-apply)
- `workflows/background-agent-workflow.mdc` (for autonomous operation)
- `project/tasks.mdc` (when editing `TASKS.md`)
- Language-specific rule based on file types

**Key Features:**
- ✅ Multi-agent coordination
- ✅ Autonomous task selection
- ✅ TDD enforcement in autonomous mode

## Rule Structure

Each rule file follows this structure:

```markdown
---
description: Brief description of what this rule covers
globs: *.py,*.js  # File patterns this rule applies to
alwaysApply: true/false  # Whether to apply regardless of file type
---
# Rule Title

## Section 1: Core Concepts
- Clear, actionable guidelines
- Specific examples where helpful
- No theoretical discussions

## Section 2: Implementation Details
- Step-by-step procedures
- Command examples
- Code snippets

## Section 3: Quality Standards
- Measurable criteria
- Validation steps
- Common pitfalls to avoid
```

## Customization

### Adjusting File Patterns
Update the `globs` field in rule frontmatter to match your project structure:

```markdown
---
globs: src/**/*.py,tests/**/*.py,*.py
---
```

### Enabling/Disabling Rules
- Set `alwaysApply: true` for rules that should always be active
- Set `alwaysApply: false` and use specific `globs` for conditional application
- Remove or rename `.mdc` extension to disable rules

### Project-Specific Customizations
1. Copy rules to your project's `.cursor/rules/` directory
2. Modify content to match your team's specific needs
3. Add project-specific rules following the same structure
4. Update this README with your customizations

## Working with AI Agents

### Human + AI Development
Use **local-agent-workflow.mdc** when working interactively with AI agents. This rule provides:
- Guidelines for autonomous AI behavior
- Clear escalation criteria
- Progress tracking standards
- Quality gate requirements

### Background Agent Development
Use **background-agent-workflow.mdc** for unattended AI agents working through task queues. This rule provides:
- Multi-agent coordination protocols
- Conflict resolution strategies
- Autonomous task selection
- Self-healing behaviors

## Quality Assurance

### Rule Validation
Each rule is designed to be:
- **Actionable**: Contains specific, executable instructions
- **Focused**: Addresses one primary concern (~25-200 lines, optimized for tokens)
- **Measurable**: Includes clear success criteria
- **Reusable**: Works across different projects of the same type
- **TDD-Enforced**: Test-Driven Development methodology integrated
- **Atomic Design**: Code structure follows atoms → molecules → organisms hierarchy

### Token Optimization
- **Always-apply rules**: ~728 tokens (validated)
- **Context-specific rules**: ~100-200 tokens (when globs match)
- **Total per call**: ~728-928 tokens (well under 1,000 limit)
- **Strategy**: Minimal core rules, context-specific rules only when needed

### Testing Rules
Validate rules by:
1. Testing with sample projects of each type
2. Ensuring AI agents can follow instructions autonomously
3. Verifying no conflicts between rule combinations
4. Confirming quality gates are achievable

## Contributing

### Adding New Rules
1. Follow the established structure and style
2. Keep rules focused and under 100 lines
3. Include specific examples and commands
4. Test with real projects before submitting
5. Update this README with the new rule

### Improving Existing Rules
1. Maintain backward compatibility when possible
2. Update all related rules consistently
3. Test changes with multiple project types
4. Document breaking changes in commit messages

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

- **Issues**: Report problems or suggest improvements via GitHub issues
- **Discussions**: Share experiences and ask questions in GitHub discussions
- **Documentation**: All rules are self-documenting with examples and procedures

---

**Version**: 1.0.0
**Last Updated**: January 2024
**Compatibility**: Cursor IDE with Cursor Rules support
