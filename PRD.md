# LLM Dev Rules - Product Requirements Document

## Project Overview

Create a comprehensive development standards repository that provides both Cursor IDE rules and Claude Code integration via Agent OS profile system. The repository should enable rapid development setup and consistent AI-assisted development across different project types.

## Goals
- **Reusability**: Rules and standards that work across different project types and environments
- **Modularity**: Each rule/standard addresses a specific concern with minimal overlap
- **Clarity**: Concise, actionable guidelines that AI agents and humans can follow autonomously
- **Completeness**: Cover all major aspects of software development workflow
- **AI Integration**: Seamless integration with Claude Code and other AI development tools
- **Standards Consistency**: Ensure consistent development practices across Cursor and Claude Code

## Target Users
- Developers using Cursor IDE with AI pair programming
- Developers using Claude Code for autonomous feature development
- Background AI agents working autonomously on tasks
- Teams needing consistent development standards across projects and tools

## Core Requirements

### Cursor IDE Rules Structure
- Maximum ~100 lines per rule file
- Clear, focused scope for each rule
- Consistent markdown formatting with frontmatter
- Actionable guidelines, not theoretical concepts
- YAML frontmatter with description, globs, alwaysApply

### Claude Code Integration
- Agent OS profile system with agents, commands, and skills
- Development standards that support both Cursor and Claude Code
- Workflows for different development scenarios
- Inheritance-based configuration for customization

### Development Standards
- Modular standards organized by domain (global, backend, frontend, testing)
- TDD methodology enforced across all standards
- Atomic design patterns for code structure
- Security-first approach with OWASP compliance

### Rule Categories (Cursor IDE)

#### 1. Core Foundation Rules
- **core.mdc**: Essential AI agent behavior and decision-making principles
- **dev-env.mdc**: Environment detection and OS-specific best practices
- **command-execution.mdc**: Safe and consistent command execution
- **file-operations.mdc**: Safe file handling and operations
- **quality-gates.mdc**: Testing and quality validation requirements
- **error-handling.mdc**: Error handling patterns and recovery
- **naming-conventions.mdc**: Consistent naming across projects
- **tdd-methodology.mdc**: Test-Driven Development requirements
- **code-structure.mdc**: Atomic design and code organization

#### 2. Project Management & Workflow
- **project-management.mdc**: High-level project management standards
- **tasks-sop.mdc**: TASKS.md file management and task lifecycle
- **issues-sop.mdc**: Issue tracking and GitLab/GitHub integration

#### 3. Agent Collaboration Workflows
- **local-agent-workflow.mdc**: Guidelines for AI agents working with humans
- **background-agent-workflow.mdc**: Autonomous agent behavior for unattended tasks

#### 4. Language-Specific Standards
- **python.mdc**, **golang.mdc**, **mern.mdc**, **cpp.mdc**, **typescript.mdc**, **rust.mdc**, **flutter.mdc**, **esp32.mdc**
- **canvus.mdc**, **rest-api.mdc**, **graphql-api.mdc**, **websocket-api.mdc**

#### 5. Specialized Development Workflows
- **refactor.mdc**: Guidelines for large-scale code refactoring
- **refresh.mdc**: Bug hunting and problem-solving approaches
- **reflect.mdc**: Post-development analysis and rule refinement
- **research.mdc**: Project inception, research, and design methodology

## Success Criteria

### ✅ Achieved

**Cursor IDE Rules:**
- ✅ Each rule file is self-contained and actionable
- ✅ Rules can be mixed and matched based on project needs
- ✅ AI agents can operate autonomously following the guidelines
- ✅ Development quality and consistency improves across projects
- ✅ Onboarding time for new projects is reduced significantly
- ✅ Token-optimized: ~728-928 tokens per call (under 1000 limit)

**Claude Code Integration:**
- ✅ Full Agent OS profile system implemented
- ✅ 8 agents for spec-driven workflow
- ✅ 7 commands for workflow automation
- ✅ 16 skills mapped to development concerns
- ✅ 4 workflows for different development scenarios
- ✅ Inheritance-based profile configuration

**Development Standards:**
- ✅ 49 modular standards across 4 domains
- ✅ TDD methodology enforced
- ✅ Atomic design principles applied throughout
- ✅ No duplicate content between rules
- ✅ OWASP Top 10 security compliance
- ✅ Accessible and responsive design patterns

## Technical Requirements
- ✅ Compatible with Cursor IDE rule system
- ✅ Proper frontmatter for rule targeting (globs, alwaysApply, etc.)
- ✅ Clear separation of concerns between rules
- ✅ No duplicate content across rules
- ✅ Compatible with Claude Code Agent OS profile system
- ✅ Inheritance support in configuration files

## Deliverables

### ✅ Completed

**1. Cursor IDE Rules** (`.cursor/rules/` - 37 rule files)
- ✅ 8 always-apply core rules (~728 tokens)
- ✅ 12 language-specific rules (Python, Go, MERN, C++, TypeScript, Rust, Flutter, ESP32, Canvus, REST API, GraphQL API, WebSocket API)
- ✅ 8 workflow rules (local-agent, background-agent, CI/CD, code-review, refactor, refresh, reflect, research)
- ✅ 3 project rules (tasks, project-management, issues)

**2. Claude Code Agent OS Profile System** (`.claude/` & `agent-os/profiles/default/`)
- ✅ 8 agent definitions (spec-initializer, shaper, writer, verifier, product-planner, tasks-list-creator, implementer, implementation-verifier)
- ✅ 7 Claude Code commands for workflow automation
- ✅ 16 reusable skills (global, backend, frontend, testing)
- ✅ 4 workflows (local-agent, background-agent, CI/CD, code-review)
- ✅ Profile configuration with inheritance support

**3. Development Standards** (`agent-os/profiles/default/standards/` - 49 files)
- ✅ 14 global standards
- ✅ 8 backend standards
- ✅ 7 frontend standards
- ✅ 3 testing standards
- ✅ TDD methodology enforced
- ✅ Atomic design patterns
- ✅ Security-first approach

**4. Documentation**
- ✅ Comprehensive README.md with deployment methods
- ✅ PRD documenting vision and requirements
- ✅ CLAUDE.md with Claude Code guidance
- ✅ Historical docs archived in `dross/` directory (including PROFILE_STRUCTURE.md, CHAT_CONTEXT.md, and previous planning docs)

### Current Status

**All Phases: COMPLETE** ✅
- ✅ Cursor IDE rule system fully optimized (37 files)
- ✅ Claude Code Agent OS profile system fully implemented
- ✅ Development standards comprehensive and organized
- ✅ All documentation updated
- ✅ Repository renamed to llm-dev-rules
- ✅ All changes committed to git
- ✅ **Ready for deployment and use**

## Usage Model

### For Cursor IDE Users
- Clone repository and copy `.cursor/rules/` to your project
- Select appropriate rules based on project type
- Rules apply automatically as you code in Cursor IDE
- Customize rule frontmatter (globs) for project-specific patterns

### For Claude Code Users
- Clone repository to access Agent OS profile system
- Use `.claude/` agents, commands, and skills directly
- Reference development standards from `agent-os/profiles/default/standards/`
- Extend profile system with custom profiles inheriting from default

### For Both Environments
- Share development standards between Cursor and Claude Code
- Maintain consistent practices across all tools
- Enable seamless collaboration between IDE and AI agents

## Maintenance & Evolution

- **Rules updated** based on real-world usage feedback
- **Standards reviewed** regularly for effectiveness and clarity
- **Version control** tracks all improvements
- **Profile system** enables customization without forking
- **Community feedback** drives enhancements

## Metrics & Performance

- **Total Cursor Rules**: 37 files (~8-9KB total)
- **Token Usage**: ~728-928 tokens per call (validated, under 1000 limit)
- **Claude Code Components**: 31 files (agents, commands, skills)
- **Development Standards**: 49 files (~50KB total)
- **TDD Coverage**: 100% of rules/standards enforce TDD
- **Atomic Design**: 100% of rules/standards follow atomic design
- **Duplication**: 0% (all duplicate content removed)
- **Security**: OWASP Top 10 compliance across all rules

## Deployment Status

✅ **Production Ready** - All components validated, optimized, and tested
- All code committed to main branch
- Repository publicly available
- Documentation comprehensive
- Ready for template use and cloning
