# Agent OS Profile System Structure
## Complete Profile Implementation

This document describes the Agent OS profile system as implemented in the AgentStandards repository.

---

## Overview

The profile system organizes standards, workflows, agents, and commands into a cohesive system that can be inherited, customized, and applied to projects.

### Default Profile Location

```
agent-os/
├── config.yml                          # Main configuration file
└── profiles/
    └── default/                        # Default profile (base profile)
        ├── profile-config.yml          # Profile configuration
        ├── standards/                  # Standards organized by domain
        │   ├── global/                 # Universal standards (14 files)
        │   ├── backend/                # Backend standards (8 files)
        │   ├── frontend/               # Frontend standards (7 files)
        │   ├── testing/                # Testing standards (3 files)
        │   └── README.md               # Standards navigation
        ├── workflows/                  # Workflow definitions
        │   ├── local-agent-workflow.yml
        │   ├── background-agent-workflow.yml
        │   ├── ci-cd-pipeline.yml
        │   └── code-review.yml
        ├── agents/                     # Agent definitions
        │   └── agents-config.yml
        └── commands/                   # Command definitions
            └── commands-config.yml
```

---

## Profile Configuration

### profile-config.yml

The profile configuration file defines:

```yaml
name: default
version: 1.0.0
inherits_from: null              # null = base profile

standards:
  global_patterns:
    - global/**/*.md
  backend_patterns:
    - backend/**/*.md
  frontend_patterns:
    - frontend/**/*.md
  testing_patterns:
    - testing/**/*.md

default_stack:
  backend:
    runtime: nodejs
    framework: express
    database: mongodb
  frontend:
    framework: react
    language: typescript

tech_stacks:
  nodejs-express-mongodb:
    backend: [nodejs-express, api, models, migrations, queries]
    frontend: [react, typescript, accessibility, responsive]
  python-django:
    backend: [python]
    frontend: [react, typescript]
  # ... more stacks
```

**Key Features:**
- **Inheritance**: `inherits_from` references parent profile (null for base)
- **Tech Stacks**: Pre-configured combinations for common architectures
- **Standard Patterns**: Glob patterns for standards discovery
- **Exclude Rules**: Customize which inherited standards to skip

---

## Standards Organization

### Category Structure

Standards are organized into four domains:

#### 1. Global Standards (14 files)
Universal patterns applied to all projects:
- `code-structure.md` - Atomic design (atoms/molecules/organisms)
- `naming-conventions.md` - Variable, function, class naming
- `error-handling.md` - Error types and handling patterns
- `security.md` - OWASP Top 10, input validation, secrets
- `documentation.md` - Code docs, APIs, READMEs
- `file-operations.md` - Safe file read/write operations
- `command-execution.md` - Safe command execution with timeout
- `project-structure.md` - Directory organization
- `dev-environment.md` - OS detection and environment setup
- `performance.md` - Profiling, optimization, caching
- `conventions.md` - Git, project management conventions
- `validation.md` - Input validation patterns
- `rest-api.md` - REST API client patterns
- `graphql-api.md`, `websocket-api.md`, `canvus-api.md` - API standards

#### 2. Backend Standards (8 files)
Server-side development:
- `python.md` - Python with type hints, pytest, async/await
- `golang.md` - Go with interfaces, error handling, concurrency
- `cpp.md` - C++ with smart pointers, RAII, CMake
- `rust.md` - Rust with ownership, Result/Option, cargo
- `nodejs-express.md` - Node.js/Express with MongoDB
- `esp32-iot.md` - ESP32/IoT with FreeRTOS
- `models.md` - Database models and schemas
- `migrations.md`, `queries.md`, `api.md` - Database and API patterns

#### 3. Frontend Standards (7 files)
Client-side development:
- `react.md` - React with hooks, state management
- `typescript.md` - TypeScript with strict mode
- `flutter.md` - Flutter/Dart widgets and state
- `accessibility.md` - WCAG compliance, ARIA
- `responsive.md` - Mobile-first, CSS breakpoints
- `components.md` - Component composition patterns
- `css.md` - CSS organization and performance

#### 4. Testing Standards (3 files)
Quality and testing:
- `tdd-methodology.md` - Red-Green-Refactor cycle
- `quality-gates.md` - Testing requirements, coverage, linting
- `test-writing.md` - Test structure and naming

---

## Workflows

### Workflow Files

Each workflow is a YAML file defining phases, steps, and standards injection points.

#### 1. local-agent-workflow.yml
**Purpose**: Human + Claude Code agent collaboration

**Phases:**
1. project-setup - Detect language, inject standards
2. human-planning - Gather requirements, review standards
3. code-generation - Claude generates code with standards
4. testing - TDD approach, verify quality gates
5. review-and-refine - Human reviews, provides feedback
6. deployment - Prepare changes, create commit

**Standards Injection:**
```yaml
context:
  standards: "{{standards/**/*}}"
  patterns:
    atomic-design: "{{standards/global/code-structure.md}}"
    error-handling: "{{standards/global/error-handling.md}}"
```

#### 2. background-agent-workflow.yml
**Purpose**: Autonomous agent operation

**Phases:**
1. initialization - Load standards and context
2. task-analysis - Parse requirements
3. implementation - Implement following standards
4. quality-assurance - Verify quality gates autonomously
5. integration - Merge changes
6. monitoring - Check deployed changes

**Decision Rules:**
- Security-first
- Fail safely if uncertain
- Preserve backward compatibility
- Maintain test coverage >80%

#### 3. ci-cd-pipeline.yml
**Purpose**: Automated testing and deployment

**Phases:**
1. trigger - Detect changes
2. code-quality - Lint, type check, format
3. testing - Run test suite, verify coverage
4. performance - Profile code, check bundle size
5. security - Scan dependencies, check secrets
6. approval - Request human approval
7. deployment - Deploy to production
8. rollback - Handle failures

**Gates:**
- code-quality-gate (required)
- security-gate (required)
- testing-gate (required)
- approval-gate (required)

#### 4. code-review.yml
**Purpose**: Code review with standards verification

**Phases:**
1. review-request - Load PR details
2. automated-checks - Verify tests, linting, types
3. standards-analysis - Analyze standards compliance
4. detailed-review - AI and human review
5. feedback - Provide standards-based feedback
6. resolution - Author addresses feedback
7. approval - Final approval process
8. merge - Merge to main

**Review Checklist:**
- Structure (atomic design)
- Naming conventions
- Error handling
- Security
- Testing
- Documentation

---

## Agents

### Agent Roles

#### Primary Agents
- **claude-code-agent** - Main development agent with full capabilities

#### Specialized Agents
- **backend-agent** - Server-side development
- **frontend-agent** - UI/UX development
- **api-agent** - API design and integration
- **qa-agent** - Testing and quality assurance
- **security-agent** - Security and vulnerabilities
- **documentation-agent** - Documentation management
- **code-review-agent** - Standards compliance review

### Agent Capabilities

Each agent has:
- **Standards**: Relevant standards to follow
- **Workflows**: Which workflows they participate in
- **Responsibilities**: Specific tasks they handle
- **Constraints**: Rules they must follow

### Agent Interaction Rules

```yaml
interaction_rules:
  priority_order:
    1: claude-code-agent (primary)
    2: specialized-agent (domain expert)
    3: qa-agent (quality)
    4: code-review-agent (standards)
    5: security-agent (security)

  context_passing:
    - Standards shared globally
    - Code context passed sequentially
    - Feedback consolidated

  decision_authority:
    - Code changes: claude-code-agent
    - Standards: human
    - Security: security-agent + human
    - Architecture: human
```

---

## Commands

### Available Commands

#### 1. project-install
Initialize new project with standards

```bash
agent-os project-install --profile default --tech-stack nodejs-express-mongodb my-project
```

**Injects:**
- All global standards
- Backend standards
- Frontend standards
- Testing standards

#### 2. standards-check
Verify project compliance with standards

```bash
agent-os standards-check --fix --report /path/to/project
```

**Checks:**
- Code structure (atomic design)
- Naming conventions
- Error handling
- Security
- Tests and coverage

#### 3. quality-gates
Run quality gate verification

```bash
agent-os quality-gates --gate all /path/to/project
```

**Gates:**
- tests-pass
- coverage >80%
- no-linting-errors
- no-type-errors
- no-secrets

#### 4. code-review
Run code review checks

```bash
agent-os code-review --ai --human <pr-number>
```

**Checks:**
- Automated standards compliance
- AI-assisted review suggestions
- Human review preparation

#### 5. tdd-scaffold
Create new feature with TDD structure

```bash
agent-os tdd-scaffold --type component --language typescript MyComponent
```

**Creates:**
- Test file with initial test cases
- Source file with stub implementation
- Documentation file

#### 6. security-scan
Run comprehensive security scan

```bash
agent-os security-scan --fix /path/to/project
```

**Scans:**
- Secrets in code
- Vulnerable dependencies
- Injection risks
- Access control

#### 7. docs-generate
Generate or update documentation

```bash
agent-os docs-generate --type api readme /path/to/project
```

**Generates:**
- API documentation
- README updates
- Architecture documentation

### Injection Points

Commands use `{{standards/...}}` syntax to inject standards:

```yaml
- action: check-structure
  standards: "{{standards/global/code-structure.md}}"

- action: verify-security
  standards: "{{standards/global/security.md}}"

- action: run-tests
  standards: "{{standards/testing/tdd-methodology.md}}"
```

---

## Standards Injection System

### How It Works

1. **Profile Loading**: Agent OS loads profile configuration
2. **Standards Discovery**: Glob patterns find all standards
3. **Workflow Execution**: Workflow files define injection points
4. **Context Building**: Standards injected into agent context
5. **Application**: Agents follow standards during execution

### Injection Syntax

```yaml
# Single standard
standards: "{{standards/global/code-structure.md}}"

# Pattern (all files in directory)
standards: "{{standards/global/*}}"

# Multiple patterns
standards:
  - "{{standards/global/*}}"
  - "{{standards/backend/*}}"
  - "{{standards/frontend/*}}"

# Language-specific
standards:
  python: "{{standards/backend/python.md}}"
  typescript: "{{standards/frontend/typescript.md}}"
```

### Context Flow

```
Profile Configuration
        ↓
Load Standards (glob patterns)
        ↓
Workflow Definition
        ↓
Injection Points ({{standards/...}})
        ↓
Agent Context
        ↓
Execution with Standards
```

---

## Profile Inheritance

### Creating Custom Profiles

To create a custom profile (e.g., for Django + React):

```yaml
# profiles/django-react/profile-config.yml

name: django-react
version: 1.0.0
inherits_from: default

# Override defaults
default_stack:
  backend:
    runtime: python
    framework: django
  frontend:
    framework: react

# Exclude standards not needed
exclude_inherited_files:
  - "backend/nodejs-express.md"
  - "backend/golang.md"

# Add custom standards
custom_standards:
  - "custom/django-specific.md"
```

### Inheritance Chain

```
custom-profile
      ↓ inherits_from
  default-profile (base)
      ↓ (loads all standards)
  All standards available
```

---

## Configuration Files Summary

| File | Purpose | Location |
|------|---------|----------|
| agent-os/config.yml | Main config, profile paths | Root |
| profile-config.yml | Profile definition | profiles/default/ |
| workflows/*.yml | Workflow definitions | profiles/default/workflows/ |
| agents-config.yml | Agent configurations | profiles/default/agents/ |
| commands-config.yml | Command definitions | profiles/default/commands/ |
| standards/*.md | Standards files | profiles/default/standards/ |

---

## Standards Injection Points Summary

### By Workflow

| Workflow | Injection Points |
|----------|------------------|
| local-agent | code-structure, error-handling, security, documentation |
| background-agent | All standards (full context) |
| CI/CD | testing, security, documentation |
| code-review | All standards (compliance checking) |

### By Command

| Command | Standards | Injection Points |
|---------|-----------|-----------------|
| project-install | All | global, backend, frontend, testing |
| standards-check | All | structure, naming, errors, security, tests |
| quality-gates | testing, security | coverage, linting, types, secrets |
| code-review | All | structure, naming, errors, security, tests, docs |
| security-scan | security | secrets, vulnerabilities, injection |

---

## Deployment Workflow

### 1. Development
```bash
# Use local-agent-workflow
# Human + Claude Code collaborate
# Standards injected into context
```

### 2. Testing
```bash
# Use CI/CD pipeline
# Automated quality gates
# Security scanning
```

### 3. Code Review
```bash
# Use code-review workflow
# Standards-based feedback
# Automated compliance checks
```

### 4. Production
```bash
# Deploy after approval
# Monitor deployed changes
# Rollback procedures
```

---

## Quick Reference

### Load Standards in Agent Context
```yaml
context:
  standards: "{{standards/**/*}}"
```

### Check Atomic Design
```yaml
standards: "{{standards/global/code-structure.md}}"
```

### Run TDD Tests
```yaml
standards: "{{standards/testing/tdd-methodology.md}}"
requirements:
  - coverage: ">80%"
  - approach: "red-green-refactor"
```

### Security Verification
```yaml
standards: "{{standards/global/security.md}}"
checklist:
  - no-secrets-in-code
  - input-validation
  - injection-protection
  - access-control
```

---

## Files Created/Modified

### New Files
- `agent-os/profiles/default/profile-config.yml`
- `agent-os/profiles/default/workflows/local-agent-workflow.yml`
- `agent-os/profiles/default/workflows/background-agent-workflow.yml`
- `agent-os/profiles/default/workflows/ci-cd-pipeline.yml`
- `agent-os/profiles/default/workflows/code-review.yml`
- `agent-os/profiles/default/agents/agents-config.yml`
- `agent-os/profiles/default/commands/commands-config.yml`

### Modified Files
- `agent-os/config.yml` - Updated with profile system references

### Moved Files
- `agent-os/standards/` → `agent-os/profiles/default/standards/`

---

## Validation

✅ Profile structure complete
✅ Standards properly organized
✅ Workflows with injection points defined
✅ Agents configured
✅ Commands with injection points configured
✅ Configuration files reference new structure
✅ Ready for Agent OS deployment

---

## Next Steps

1. **Deploy to live Agent OS**:
   ```bash
   cp -r agent-os/profiles/default/* ~/agent-os/profiles/default/
   ```

2. **Test profile system**:
   ```bash
   agent-os project-install --profile default my-test-project
   ```

3. **Create custom profiles** (if needed):
   ```bash
   mkdir -p agent-os/profiles/custom-profile
   # Copy and customize profile-config.yml
   ```

4. **Sync to git**:
   ```bash
   git add agent-os/
   git commit -m "feat(profile-system): implement full Agent OS profile structure"
   ```

---

**Version**: 1.0.0
**Last Updated**: 2025-11-19
**Status**: Production Ready ✅
