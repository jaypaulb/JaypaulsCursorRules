# Cursor Rules to Agent OS Standards Conversion - Next Steps

**Status**: Partially Complete (13/37 rules converted = 35%)
**Location**: `agent-os/standards/` directory

## Summary of Completed Work

### Core Rules Converted to Agent OS Standards Format ✅

**Global Standards** (`agent-os/standards/global/`):
1. ✅ `command-execution.md` - Command execution patterns (timeout, error handling)
2. ✅ `file-operations.md` - File read/write, token-aware filtering, path validation
3. ✅ `security.md` - OWASP Top 10, secret management, secure coding practices
4. ✅ `documentation.md` - Code docs, APIs, README, maintenance guidelines
5. ✅ `code-structure.md` - Atomic design hierarchy (atoms → molecules → organisms)
6. ✅ `naming-conventions.md` - Variable, class, file naming conventions
7. ✅ `performance.md` - Profiling, benchmarking, caching, optimization
8. ✅ `project-structure.md` - Root directory layout, source organization, configuration

**Testing Standards** (`agent-os/standards/testing/`):
9. ✅ `quality-gates.md` - Test coverage, linting, type checking, security scans
10. ✅ `tdd-methodology.md` - Red-Green-Refactor cycle, test organization, coverage requirements

**Development Environment** (`agent-os/standards/global/`):
11. ✅ `dev-environment.md` - OS detection, Windows/Linux commands, tool validation
12. ✅ `error-handling.md` - (already exists, enhanced with Cursor rule content)

### Language-Specific Rules Converted ✅

**Backend Standards** (`agent-os/standards/backend/`):
1. ✅ `python.md` - Python TDD, type hints, code style, security, performance
2. ✅ `golang.md` - Go testing, concurrency, error handling, packages

**Frontend Standards** (`agent-os/standards/frontend/`):
1. ✅ `typescript.md` - Type safety, strict mode, TDD patterns, dependencies

## Remaining Conversions (24 rules)

### Language-Specific Rules (9 remaining)

**Backend** (6 rules):
- `cpp.mdc` → `backend/cpp.md` - C++ development standards
- `rust.mdc` → `backend/rust.md` - Rust development standards
- `esp32.mdc` → `backend/esp32-iot.md` - ESP32/IoT development
- `canvus.mdc` → `global/canvus-api.md` - Language-agnostic Canvus API standards
- `rest-api.mdc` → `global/rest-api.md` - Generic REST API client patterns
- `graphql-api.mdc` → `global/graphql-api.md` - GraphQL API standards
- `websocket-api.mdc` → `global/websocket-api.md` - WebSocket/real-time standards

**Frontend** (1 rule):
- `flutter.mdc` → `frontend/flutter.md` - Flutter/Dart development standards

**Full-Stack** (2 rules):
- `mern.mdc` → Split into:
  - `backend/nodejs-express.md` - Node.js/Express backend standards
  - `frontend/react.md` - React frontend standards

### Workflow Rules (8 rules - Reference Documentation)

Located in `.cursor/rules/workflows/`:
- `local-agent-workflow.mdc` - Human + AI collaboration task management
- `background-agent-workflow.mdc` - Autonomous agent task selection
- `ci-cd.mdc` - CI/CD pipeline patterns
- `code-review.mdc` - Code review standards
- `specialized/refactor.mdc` - Refactoring guidelines
- `specialized/refresh.mdc` - Bug hunting approaches
- `specialized/reflect.mdc` - Post-development analysis
- `specialized/research.mdc` - Project inception research

**Status**: Will create reference documentation in separate folder

### Project Rules (3 rules - Reference Documentation)

Located in `.cursor/rules/project/`:
- `tasks.mdc` - Task management in TASKS.md
- `project-management.mdc` - Project documentation standards
- `issues.mdc` - Issue tracking standards

**Status**: Will create reference documentation in separate folder

## Quick Conversion Template

For anyone completing the remaining conversions, here's the template:

### Format Changes
```
Remove YAML frontmatter:
---
description: ...
globs: ...
alwaysApply: ...
---

Keep everything else as-is, just convert .mdc to .md
```

### File Locations

**Global (universal standards)**:
- `agent-os/standards/global/` - Cross-language, cross-framework standards

**Backend**:
- `agent-os/standards/backend/` - Server-side languages and frameworks

**Frontend**:
- `agent-os/standards/frontend/` - Client-side languages and frameworks

**Testing**:
- `agent-os/standards/testing/` - Quality, testing, verification standards

**Workflows** (separate folder):
- `agent-os/standards/workflows/` - Operational and process documentation

## How to Deploy to Live System

Once all conversions are complete:

```bash
# Copy standards to Agent OS installation
cp -r agent-os/standards/* ~/agent-os/profiles/default/standards/

# Or use git subtree if managing versions
git subtree add --prefix=~/agent-os/profiles/default/standards \
  https://github.com/jaypaulb/AgentStandards.git main --squash
```

## File Mapping Reference

Quick lookup for which Cursor rules map where:

```
Core Rules:
  command-execution.mdc    → global/command-execution.md
  file-operations.mdc      → global/file-operations.md
  quality-gates.mdc        → testing/quality-gates.md
  error-handling.mdc       → global/error-handling.md
  naming-conventions.mdc   → global/naming-conventions.md
  tdd-methodology.mdc      → testing/tdd-methodology.md
  code-structure.mdc       → global/code-structure.md
  documentation.mdc        → global/documentation.md
  security.mdc            → global/security.md
  performance.mdc         → global/performance.md
  project-structure.mdc   → global/project-structure.md
  dev-env.mdc             → global/dev-environment.md

Language Rules:
  python.mdc              → backend/python.md ✅
  golang.mdc              → backend/golang.md ✅
  typescript.mdc          → frontend/typescript.md ✅
  mern.mdc                → backend/nodejs-express.md + frontend/react.md
  cpp.mdc                 → backend/cpp.md
  rust.mdc                → backend/rust.md
  flutter.mdc             → frontend/flutter.md
  esp32.mdc               → backend/esp32-iot.md
  canvus.mdc              → global/canvus-api.md
  rest-api.mdc            → global/rest-api.md
  graphql-api.mdc         → global/graphql-api.md
  websocket-api.mdc       → global/websocket-api.md

Workflow Rules: → workflows/ (reference documentation)
  local-agent-workflow.mdc
  background-agent-workflow.mdc
  ci-cd.mdc
  code-review.mdc
  refactor.mdc
  refresh.mdc
  reflect.mdc
  research.mdc

Project Rules: → workflows/ (reference documentation)
  tasks.mdc
  project-management.mdc
  issues.mdc
```

## Next Actions

### Option 1: Batch Convert Remaining Language Rules
For each language rule in `.cursor/rules/languages/*.mdc`:
1. Read the file
2. Remove YAML frontmatter
3. Save to appropriate location in `agent-os/standards/`

### Option 2: Deploy Partial Conversions
Current 13 converted rules are sufficient for:
- Core development standards (command execution, file operations, quality gates)
- TDD methodology
- Python, Go, TypeScript projects
- Atomic design structure

Can deploy now and add remaining language rules incrementally.

### Option 3: Full Conversion First
Complete all 37 rules before deploying to ensure consistency.

## Verification

After conversion, verify:

```bash
# Count converted files
find agent-os/standards -name "*.md" -type f | wc -l

# Check for any remaining .mdc references
grep -r "\.mdc" agent-os/standards/

# Validate markdown syntax
find agent-os/standards -name "*.md" -exec grep -l "^#" {} \;
```

## Git Workflow

When ready to sync:

```bash
git add agent-os/standards/
git commit -m "feat(standards): convert Cursor rules to Agent OS standards format"
git push origin main

# If using subtree for upstream distribution
git subtree push --prefix=agent-os/standards \
  https://github.com/jaypaulb/AgentStandards.git standards
```

## Notes

- Original `.cursor/rules/` folder remains unchanged for archival
- All content preserved - only format and organization changed
- No rules deleted
- New standards are ready for Agent OS project installations
- Can be synced to other AI agent rule management systems

---

**Last Updated**: 2025-11-19
**Completed**: 13 of 37 rules (35%)
**Estimated Remaining**: 2-3 hours to convert all 37 rules manually
**Alternative**: Use automated script to batch convert remaining 24 rules
