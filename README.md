# LLM Dev Rules - Modular Development Standards

A comprehensive development standards repository providing:

- **Cursor IDE Rules** - Focused, reusable rules for consistent development across different project types
- **Claude Code Configuration** - Agent OS profile system with agents, commands, and skills for autonomous AI development
- **Development Standards** - 49 modular standards for global, backend, frontend, and testing concerns
- **TDD & Atomic Design** - Test-Driven Development methodology and atomic design patterns throughout

Each component is designed to be modular, focused on specific concerns, and actionable for both human developers and AI agents.

## Quick Start

### Method 1: GitHub Template (Recommended for New Projects)

1. **Use this template** on GitHub:
   - Click "Use this template" button on the repository page
   - Create a new repository from the template
   - Clone your new repository

2. **Copy the rules** to your project:
   ```bash
   cp -r llm-dev-rules/.cursor your-project/
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

   # Add subtree (note: repository root contains .cursor/rules/, so we add to project root)
   git subtree add --prefix=.cursor https://github.com/jaypaulb/llm-dev-rules.git main --squash

   # If you get nested .cursor/rules/.cursor/rules/, fix it:
   if [ -d ".cursor/rules/.cursor" ]; then
     mv .cursor/rules/.cursor/rules/* .cursor/rules/ 2>/dev/null || true
     rm -rf .cursor/rules/.cursor
   fi
   ```

2. **Update rules** when new versions are available:
   ```bash
   git subtree pull --prefix=.cursor https://github.com/jaypaulb/llm-dev-rules.git main --squash

   # If you get nested .cursor/rules/.cursor/rules/, fix it:
   if [ -d ".cursor/rules/.cursor" ]; then
     mv .cursor/rules/.cursor/rules/* .cursor/rules/ 2>/dev/null || true
     rm -rf .cursor/rules/.cursor
   fi
   ```

3. **Select and customize rules** as needed for your project

### Method 3: Manual Clone (Simple Setup)

1. **Clone this repository** to your new project:
   ```bash
   git clone https://github.com/jaypaulb/llm-dev-rules.git
   cp -r llm-dev-rules/.cursor .
   rm -rf llm-dev-rules  # Clean up
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

## Project Components

### 1. Cursor IDE Rules (`.cursor/rules/`)
Rules for the Cursor IDE development environment with 37 rule files organized by category:

**Core Foundation Rules** (7 files, ~728 tokens)
- command-execution, file-operations, quality-gates, error-handling, naming-conventions, tdd-methodology, code-structure

**Language-Specific Rules** (12 files)
- python, golang, mern, cpp, typescript, rust, flutter, esp32, canvus, rest-api, graphql-api, websocket-api

**Workflow Rules** (8 files)
- local-agent-workflow, background-agent-workflow, ci-cd, code-review, plus specialized workflows (refactor, refresh, reflect, research)

**Project Rules** (3 files)
- tasks, project-management, issues

### 2. Claude Code Agent OS Profile System (`.claude/` & `agent-os/profiles/default/`)

**Agents** (8 agent definitions)
- spec-initializer, spec-shaper, spec-writer, spec-verifier, product-planner, tasks-list-creator, implementer, implementation-verifier

**Commands** (7 Claude Code commands)
- plan-product, shape-spec, write-spec, create-tasks, orchestrate-tasks, implement-tasks, improve-skills

**Skills** (16 reusable skills)
- Global: coding-style, commenting, conventions, error-handling, validation, tech-stack
- Backend: api, migrations, models, queries
- Frontend: accessibility, components, css, responsive
- Testing: test-writing

### 3. Development Standards (`agent-os/profiles/default/standards/`)

**49 Standards** organized by domain:
- **Global** (14): All development domains
- **Backend** (8): Python, Go, C++, Rust, Node.js, ESP32, Models, Migrations, Queries, API
- **Frontend** (7): React, TypeScript, Flutter, Accessibility, Responsive, Components, CSS
- **Testing** (3): TDD, Quality Gates, Test Writing

### 4. Workflows & Configuration

**Workflows** (4 files)
- local-agent-workflow, background-agent-workflow, ci-cd-pipeline, code-review

**Configuration**
- profile-config.yml (with inheritance support)
- agents-config.yml
- commands-config.yml

## Rule Selection Guide

### For Python Projects

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

### For Go Projects

**Automatically Applied:**
- All core rules (always-apply)
- `languages/golang.mdc` (when editing `.go` files)
- `project/tasks.mdc` (when editing `TASKS.md`)
- `workflows/local-agent-workflow.mdc` (always-apply)

**Key Features:**
- ✅ Go-specific TDD patterns (cargo test, table-driven tests)
- ✅ Atomic design with Go package structure
- ✅ Interface-based composition

### For MERN Stack Projects

**Automatically Applied:**
- All core rules (always-apply)
- `languages/mern.mdc` (when editing `.js`, `.jsx`, `.ts`, `.tsx` files)
- `project/tasks.mdc` (when editing `TASKS.md`)
- `workflows/local-agent-workflow.mdc` (always-apply)

**Key Features:**
- ✅ React + Express TDD patterns (Jest, React Testing Library)
- ✅ Atomic design for both frontend and backend
- ✅ TypeScript type safety

### For Background Agent Projects

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

**Version**: 2.0.0
**Last Updated**: November 2025
**Status**: Production Ready
**Components**:
- Cursor IDE Rules (37 files)
- Claude Code Agent OS Profile System (8 agents, 7 commands, 16 skills)
- Development Standards (49 files)
- Workflows & Configuration (4 workflows)
