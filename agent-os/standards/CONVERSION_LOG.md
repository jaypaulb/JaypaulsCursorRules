# Cursor Rules to Agent OS Standards Conversion Log

**Start Date**: November 18, 2025
**Status**: IN PROGRESS
**Total Rules**: 37 Cursor rule files

## Conversion Summary

Converting Cursor IDE `.mdc` rules to Agent OS standards `.md` format for archival and future syncing with other AI agent rule systems.

### Mapping Strategy

Cursor rules are categorized and mapped to Agent OS standard locations:

```
.cursor/rules/          →  agent-os/standards/
├── core/              →  global/ + testing/
├── languages/         →  backend/ + frontend/ + global/
├── workflows/         →  Reference documentation (not directly copied)
└── project/          →  Documentation (handled separately)
```

## Completed Conversions ✅

### Core Rules (12 rules) → global/ + testing/

Global Standards (agent-os/standards/global/):
- ✅ `command-execution.md` - Standard command execution patterns
- ✅ `file-operations.md` - File read/write standards
- ✅ `security.md` - OWASP Top 10 security standards
- ✅ `documentation.md` - Documentation standards
- ✅ `code-structure.md` - Atomic design hierarchy
- ✅ `error-handling.md` - Error handling standards (exists, enhanced from original)
- ✅ `naming-conventions.md` - Naming conventions
- ✅ `performance.md` - Performance optimization standards
- ✅ `project-structure.md` - Project folder structure standards
- ✅ `dev-environment.md` - OS detection and dev environment standards

Testing Standards (agent-os/standards/testing/):
- ✅ `quality-gates.md` - Quality gate requirements
- ✅ `tdd-methodology.md` - Test-Driven Development methodology

### Language-Specific Rules (3 of 12 completed)

Backend Standards (agent-os/standards/backend/):
- ✅ `python.md` - Python development standards
- ✅ `golang.md` - Go development standards

Frontend Standards (agent-os/standards/frontend/):
- ✅ `typescript.md` - TypeScript development standards

### Remaining Conversions ⏳

Language-Specific Rules (9 remaining):
- [ ] `mern.md` - MERN stack (split into backend/nodejs-express.md + frontend/react.md)
- [ ] `cpp.md` → backend/cpp.md
- [ ] `rust.md` → backend/rust.md
- [ ] `flutter.md` → frontend/flutter.md
- [ ] `esp32.md` → backend/esp32-iot.md
- [ ] `canvus.md` → global/canvus-api.md
- [ ] `rest-api.md` → global/rest-api.md
- [ ] `graphql-api.md` → global/graphql-api.md
- [ ] `websocket-api.md` → global/websocket-api.md

Workflow Rules (8 rules):
- [ ] `local-agent-workflow.mdc` → Documentation reference
- [ ] `background-agent-workflow.mdc` → Documentation reference
- [ ] `ci-cd.mdc` → Documentation reference
- [ ] `code-review.mdc` → Documentation reference
- [ ] `specialized/refactor.mdc` → Documentation reference
- [ ] `specialized/refresh.mdc` → Documentation reference
- [ ] `specialized/reflect.mdc` → Documentation reference
- [ ] `specialized/research.mdc` → Documentation reference

Project Rules (3 rules):
- [ ] `tasks.mdc` → Documentation reference
- [ ] `project-management.mdc` → Documentation reference
- [ ] `issues.mdc` → Documentation reference

## Current Progress

### Completed
- ✅ Analyzed all 37 Cursor rules
- ✅ Created directory structure in agent-os/standards/
- ✅ Converted 10 core rules to global/testing standards
- ✅ Converted 3 of 12 language-specific rules
- ✅ Created CONVERSION_LOG.md (this file)

### In Progress
- Converting remaining 9 language-specific rules

### Pending
- Converting workflow rules (will be reference documentation)
- Converting project rules (will be reference documentation)
- Creating PROFILE_CUSTOMIZATION_GUIDE.md
- Creating final status report

## Distribution Plan

Once conversion is complete:

### Archive in Repository
Keep original Cursor rules in `.cursor/rules/` folder for reference.

### Copy to Agent OS Installation
After validation, copy converted standards to:
```bash
~/agent-os/profiles/default/standards/
├── global/
├── backend/
├── frontend/
└── testing/
```

### Version Control
Commit to git for syncing with other AI agent rule systems:
```bash
git add agent-os/standards/
git commit -m "feat(standards): convert Cursor rules to Agent OS standards format"
```

## Format Changes

### Old Format (Cursor .mdc)
```yaml
---
description: Rule description
globs: *.py,*.js
alwaysApply: true
---
# Rule Title
Content...
```

### New Format (Agent OS .md)
```markdown
# Rule Title

Content...
(YAML frontmatter removed - file location indicates context)
```

## Key Differences

1. **Metadata**: Removed `globs` and `alwaysApply` (captured in directory structure instead)
2. **Format**: `.mdc` → `.md` (standard markdown)
3. **Organization**: Rules organized by Agent OS standard categories
4. **References**: Updated references from `.mdc` files to `.md` files
5. **Location-Based Context**: File location in standard folders indicates context instead of frontmatter

## Next Steps

1. Convert remaining 9 language-specific rules
2. Document workflow integration patterns
3. Document project-specific conventions
4. Create PROFILE_CUSTOMIZATION_GUIDE.md
5. Validate all conversions
6. Test with actual Agent OS installation
7. Commit and sync to git

## Notes

- Original Cursor rules remain unchanged in `.cursor/rules/`
- Converted standards are new files in `agent-os/standards/`
- No rules deleted - all archived for reference
- All content preserved - only format and organization changed
- References updated to point to new `.md` files instead of `.mdc`

---

**Last Updated**: 2025-11-19
**Completed**: 13 of 37 rules (35%)
**Next Priority**: Language-specific rules (9 remaining)
