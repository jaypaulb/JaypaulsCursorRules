# Atomic Rules System - Refactored

This directory contains the token-optimized atomic design-based rule system for CursorRules.

## ✅ Refactored Structure

```
.cursor/rules/
├── core/                    # Always-apply core rules (~25 lines each)
│   ├── command-execution.mdc
│   ├── file-operations.mdc
│   ├── quality-gates.mdc
│   ├── error-handling.mdc
│   └── naming-conventions.mdc
├── workflows/              # Always-apply workflow rules (~100 lines)
│   └── local-agent-workflow.mdc
├── languages/              # Context-specific language rules (~60 lines)
│   └── python.mdc
└── project/                # Context-specific project rules (~40 lines)
    └── tasks.mdc
```

## Token Budget

**Always-apply rules**: ~728 tokens (validated)
- Core rules: ~528 tokens (7 rules: command-execution, file-operations, quality-gates, error-handling, naming-conventions, tdd-methodology, code-structure)
- Workflow rules: ~131 tokens (local-agent-workflow)

**Context-specific rules**: ~120-200 tokens
- Language rules: ~150-200 tokens (when file matches globs)
- Project rules: ~50-100 tokens (when file matches globs)
- Workflow rules: ~70-150 tokens (when context matches)

**Total per call**: ~728-928 tokens (well under 1,000 limit) ✅

**Token Optimization Results:**
- ✅ Reduced from initial estimate of ~1,200+ tokens
- ✅ Achieved through strategic always-apply rules (minimal core)
- ✅ Context-specific rules only load when needed
- ✅ No duplication between rules (references used instead)

## Key Principles

1. **Always-apply rules are minimal** (~25-150 lines each, average ~80 lines)
2. **Context-specific rules assume core is loaded** (no duplication)
3. **Strategic references** - Rules reference core rules (tdd-methodology.mdc, code-structure.mdc) instead of duplicating content
4. **Token-efficient** - All scenarios under 1,000 tokens (validated: ~728-928 tokens)
5. **TDD enforced** - Test-Driven Development methodology integrated across all rules
6. **Atomic design** - Code structure follows atoms → molecules → organisms → pages hierarchy

## Rule Types

### Always-Apply Rules
- **Core** (`core/`): Universal patterns (~25-150 lines each, `alwaysApply: true`)
  - `command-execution.mdc` - Command execution standards
  - `file-operations.mdc` - File read/write standards
  - `quality-gates.mdc` - Quality gate requirements (includes TDD enforcement)
  - `error-handling.mdc` - Error handling patterns
  - `naming-conventions.mdc` - Naming conventions
  - `tdd-methodology.mdc` - Test-Driven Development methodology (NEW)
  - `code-structure.mdc` - Atomic design code structure (NEW)
- **Workflow** (`workflows/`): Agent behavior (~100 lines, `alwaysApply: true`)
  - `local-agent-workflow.mdc` - Human + AI collaboration workflow

### Context-Specific Rules
- **Languages** (`languages/`): Language-specific standards (~60-200 lines, `globs: *.py`)
  - `python.mdc` - Python development standards
  - `golang.mdc` - Go development standards
  - `mern.mdc` - MERN stack standards
  - `cpp.mdc` - C++ development standards
  - `typescript.mdc` - TypeScript development standards
  - `rust.mdc` - Rust development standards
  - `flutter.mdc` - Flutter/Dart development standards
  - `esp32.mdc` - ESP32/Espressif development standards (ESP32-S3)
  - `canvus.mdc` - Canvus API development standards (language-agnostic)
  - `rest-api.mdc` - REST API client development standards
  - `graphql-api.mdc` - GraphQL API development standards
  - `websocket-api.mdc` - WebSocket/real-time API development standards
- **Project** (`project/`): File-specific patterns (~40-100 lines, `globs: TASKS.md`)
  - `tasks.mdc` - Task management standards
  - `project-management.mdc` - Project management standards
  - `issues.mdc` - Issue tracking standards
- **Workflows** (`workflows/specialized/`): Specialized workflows (~50-200 lines, context-specific)
  - `refactor.mdc` - Refactoring guidelines
  - `refresh.mdc` - Bug hunting approaches
  - `reflect.mdc` - Post-development analysis
  - `research.mdc` - Project inception and research

## Usage

### For Rule Makers
1. Create/update core rules in `core/` (keep minimal, ~25 lines)
2. Create/update workflow rules in `workflows/` (keep focused, ~100 lines)
3. Create language rules in `languages/` (Python-specific only, ~60 lines)
4. Create project rules in `project/` (file-specific only, ~40 lines)

### For Rule Users
1. Rules apply automatically based on:
   - Always-apply rules: Applied to every interaction
   - Language rules: Applied when file matches globs
   - Project rules: Applied when file matches globs
2. No manual selection needed - Cursor handles it automatically

## Recent Updates

### TDD Integration (Latest)
- ✅ **TDD methodology rule** (`core/tdd-methodology.mdc`) - Always-apply TDD principles
- ✅ **All language rules** - Include TDD patterns specific to each language
- ✅ **All workflow rules** - Include TDD workflow steps
- ✅ **Quality gates** - Enforce TDD requirements (>80% coverage, tests before implementation)
- ✅ **Project rules** - Include TDD in completion criteria

### Canvus API Rule (Latest)
- ✅ **Language-agnostic** - Removed language-specific duplication
- ✅ **API-focused** - Consolidated Canvus API documentation
- ✅ **LLM-consumable** - Optimized for AI consumption
- ✅ **References language rules** - For language-specific patterns

## Migration Status

✅ **Refactoring complete** - All rules are token-optimized and self-contained
✅ **TDD integrated** - Test-Driven Development enforced across all rules
✅ **Atomic design** - Code structure follows atomic design hierarchy
✅ **Cursor-compliant** - All rules follow Cursor Rules specification

## Old Structure (Archived)

The initial atomic design structure has been archived to `archive/old-structure/`:
- `atoms/` - Archived (replaced by `core/`)
- `molecules/` - Archived (replaced by `languages/`)
- `organisms/` - Archived (no longer needed)
- `pages/` - Archived (no longer needed)

**Status**: Archived for reference only. Do not use - use the new structure instead.

## Deployment

```bash
# Copy refactored structure to live folder
cp -r .cursor/rules-atomic/core .cursor/rules/
cp -r .cursor/rules-atomic/workflows .cursor/rules/
cp -r .cursor/rules-atomic/languages .cursor/rules/
cp -r .cursor/rules-atomic/project .cursor/rules/
```

All references in rules point to `.cursor/rules/` (live folder), so they'll work immediately after deployment.

## Documentation

- See `dross/` directory for historical documentation and migration guides
- Active documentation: This README and rule files
