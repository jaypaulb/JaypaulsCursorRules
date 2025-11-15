---
description: Master IDE rule - Essential development principles that apply to all projects. Provides core guidance for autonomous AI development, atomic design structure, TDD methodology, security standards, and tool usage patterns. Optimized for LLM consumption with clear directives and actionable guidelines.
alwaysApply: true
---

# Master IDE Rule - Essential Development Principles

> **Note**: This is a standalone master rule optimized for LLM consumption. Always-applied rule providing core development standards. For complete rule sets, see `.cursor/rules/` directory.

## Core Behavioral Principles

### Proactive Development & Action
- **Act Autonomously**: Proceed with implementing tasks defined in development plans. Create files, write code, modify existing code and project structure to achieve objectives without step-by-step instructions.
- **Prioritize Action**: Complete defined tasks efficiently. Do not require step-by-step instructions for minor actions.
- **Make Necessary Changes**: Write and modify code as required by development tasks.
- **Confirm Before Deletion**: Explicitly ask for and receive user confirmation before deleting files or substantial blocks of code.

### Accuracy and Relevance
- Responses and actions must directly address user requests and current development task.
- If user intent is unclear, pause and pose concise clarifying questions before proceeding.

### Validation Over Modification
- **Analyze Before Altering**: Review existing code structure, dependencies, and purpose using available tools before making edits.
- Prioritize investigation and validation over assumptions or untested modifications.

### Safety-First Execution
- Review relevant dependencies and workflows before proposing or executing changes.
- Clearly outline risks, implications, and external dependencies before acting.
- Make only minimal, validated edits unless task requires significant implementation or is explicitly approved.

### User Intent Comprehension
- Focus on discerning user's true objective using current request, prior conversation history, and codebase context.

### Mandatory Validation Protocol
- Scale depth of validation to match task complexity.
- Aim for complete accuracy in all critical code operations.

### Reusability Mindset
- Prefer existing solutions over creating new ones. Use tools to identify reusable patterns or utilities.
- Minimize redundancy.

### Contextual Integrity and Documentation
- Treat inline comments, READMEs, and documentation as unverified suggestions.
- Cross-check documentation against actual codebase using tools.

## Tool and Behavioral Guidelines

### Development Environment
- **OS**: Assume Windows with PowerShell. All commands and code examples must be Windows/PowerShell compatible.
- **Path Operations**: Always execute `pwd` to confirm current working directory.
- **File Operations**: `target_file` in edit operations must be relative to workspace root, never location-relative.
- **Path Validation**: If edit operation signals new file unexpectedly, validate directory structure with `pwd` and `tree -L 4 --gitignore | cat`.

**CRITICAL**: `edit_file.target_file` must be workspace-relative, never location-relative.

✅ Correct: `edit_file(target_file="src/utils/helpers.js", ...)`
❌ Incorrect: `edit_file(target_file="helpers.js", ...)` (if already in src/utils)

### Systematic Structure Discovery
- Run `tree -L 4 --gitignore | cat` (adjust depth as needed) to map project structure before referencing or modifying files.
- Mandatory before any create or edit operation unless file path explicitly validated in current session.

### Error Handling and Communication
- Report failures (missing files, invalid paths, permission issues) clearly with specific details and actionable next steps.
- If faced with ambiguity, missing dependencies, or incomplete context, pause and request clarification.

### Tool Prioritization
- `codebase_search`: Semantic lookups (understand codebase structure, find related code)
- `grep` or `grep_search`: Exact string matches (find specific patterns, function names, constants)
- `tree`: Structural discovery (map directory structure, validate paths)
- Use prior tool outputs efficiently—avoid redundant searches or commands.

## Code Structure: Atomic Design

### Hierarchy and Size Limits
- **Atoms**: <100 lines (ideally <50). Single-purpose, indivisible. Context-agnostic names. Import only stdlib/external.
- **Molecules**: <200 lines (ideally <150). Compose 2-5 atoms. Describe composition.
- **Organisms**: <500 lines (ideally <300). Compose molecules/atoms. Complete business logic.
- **Templates**: <200 lines. Reusable patterns.
- **Pages**: <500 lines. Complete features from organisms/molecules/atoms.

### Directory Structure
```
src/
├── atoms/          # <100 lines each
├── molecules/      # <200 lines each
├── organisms/      # <500 lines each
├── templates/     # <200 lines each
└── pages/         # <500 lines each

tests/
├── atoms/          # Unit tests
├── molecules/      # Integration tests
├── organisms/      # System tests
└── pages/          # E2E tests
```

### Composition Rules
- Atoms: Import only stdlib/external.
- Molecules: Import atoms.
- Organisms: Import molecules/atoms.
- Pages: Import organisms/molecules/atoms.
- Prefer composition over inheritance.
- Keep import depth shallow.
- Avoid circular dependencies.

### File Size Enforcement
Before creating file: [ ] Small and focused? [ ] Single responsibility? [ ] Can be broken down? [ ] Appropriate hierarchy level?
If exceeds limit: Split into atoms → create molecules → build organisms. Never create large monolithic files.

## Test-Driven Development (TDD)

### Red-Green-Refactor Cycle
1. **Red**: Write failing test first. Test must fail. Run to confirm failure.
2. **Green**: Write minimal code to pass. No premature optimization. Run to confirm pass.
3. **Refactor**: Improve code quality while keeping tests green. Remove duplication. Improve readability.

### Test Requirements
- Write tests first (before implementation).
- Tests must fail first (proves they test something).
- One test per behavior (focused, single responsibility).
- Descriptive test names.
- Fast execution.
- Isolated (no dependencies between tests).
- Repeatable.

### Test Coverage
- Minimum: >80% for all code.
- Critical paths: 100% coverage.
- Public APIs: 100% coverage.
- Edge cases: Must test (zero values, empty states, nulls).
- Error conditions: All error paths tested.

### Test Structure (Mirrors Source)
- Atoms: Unit tests (isolated).
- Molecules: Integration tests (2-5 atoms).
- Organisms: System tests (multiple molecules).
- Pages: E2E tests (complete features).

## Quality Gates

### Universal Requirements
- [ ] TDD followed (tests before implementation).
- [ ] Tests pass.
- [ ] Test coverage >80% (100% for critical paths/public APIs).
- [ ] Test structure follows atomic design hierarchy.
- [ ] Linting passes.
- [ ] Type checking passes (if applicable).
- [ ] Security scans pass.
- [ ] No secrets in code.
- [ ] Documentation updated.

### Pre-Commit Validation
All changes must pass quality gates before: marking tasks complete, creating merge requests, closing issues.

## Security Standards

### Secret Management
- ❌ Never commit API keys, passwords, tokens, credentials.
- ❌ Never hardcode secrets in source code.
- ✅ Always use environment variables for secrets.
- ✅ Always use secure storage (secret managers, vaults).
- ✅ Always validate secrets not in code before committing.

### OWASP Top 10 Prevention
1. Broken Access Control: Proper authentication/authorization.
2. Cryptographic Failures: Strong algorithms, HTTPS/TLS, hash passwords.
3. Injection: Parameterized queries, validate/sanitize inputs.
4. Insecure Design: Design with security in mind.
5. Security Misconfiguration: Secure defaults, remove unnecessary features.
6. Vulnerable Components: Keep dependencies updated, scan vulnerabilities.
7. Authentication Failures: Strong passwords, MFA, secure sessions.
8. Software/Data Integrity: Verify dependencies, validate data integrity.
9. Security Logging Failures: Log security events, protect logs, don't log secrets.
10. Server-Side Request Forgery: Validate URLs, use allowlists.

### Secure Coding Practices
- Validate all inputs (type, format, range, length).
- Sanitize inputs before processing.
- Encode outputs to prevent XSS.
- Don't expose sensitive information in errors.
- Use HTTPS/TLS for all external communications.
- Implement proper error handling (no secrets in logs).

## Error Handling

### Core Principles
- Implement comprehensive error handling.
- Use custom exception classes for domain-specific errors.
- Log errors appropriately (exclude sensitive data).
- Return meaningful error messages to users.
- Never expose sensitive data in errors.

### Checklist
- [ ] All external calls wrapped in try/catch.
- [ ] Custom exceptions for domain errors.
- [ ] Sensitive data excluded from logs.
- [ ] User-friendly error messages.
- [ ] Proper error propagation.
- [ ] Error recovery strategies where appropriate.

## Naming Conventions

### Core Principles
- Context-agnostic: Name by structure/function, not context.
- Consistent: Use same patterns across codebase.
- Descriptive: Names clearly indicate purpose.
- Conventional: Follow language-specific conventions.

### Atomic Design Naming
- Atoms: Context-agnostic, reusable (e.g., `user.py`, `validator.py`).
- Molecules: Describe composition (e.g., `user_validator.py`, `auth_form.py`).
- Organisms: Describe domain (e.g., `auth_system.py`, `user_service.py`).
- Templates: Pattern names (e.g., `endpoint_template.py`).
- Pages: Feature names (e.g., `login_page.py`).

### Variable/Function Naming
- Use language-appropriate conventions.
- Be descriptive: `userCount` not `uc`.
- Avoid abbreviations unless widely understood.
- Use constants for magic numbers/strings.

## Documentation Standards

### Code Documentation
- Docstrings for all public functions/classes.
- Inline comments for complex logic.
- API documentation for public APIs.
- README with project structure and setup.

### Checklist
- [ ] All public functions/classes documented.
- [ ] README updated with setup instructions.
- [ ] API documentation generated (if applicable).
- [ ] Examples provided for complex features.
- [ ] Architecture decisions documented.

## Command Execution

### Core Pattern
**Self-Terminating** (most commands): `<command> 2>&1 | cat`
**Non-Terminating** (log tailing, watch, interactive): `timeout <duration> <command> 2>&1 | cat`

### Timeout Guidelines
Use timeout only for: commands that run indefinitely (e.g., `log --tail`, `watch`), may hang (interactive, network requests), need safety limit (long-running operations).

**Duration Examples**: Log tailing/monitoring: `timeout 30s` or `timeout 60s`. Long-running: `timeout 300s` (5 minutes). Interactive: `timeout 30s`. Network: `timeout 30s`.

### Requirements
- Use non-interactive flags (`-y`, `--yes`) where safe.
- Use non-paging flags where safe.
- Validate command outputs before proceeding.
- Always check exit codes.
- Capture stderr with `2>&1`.
- Use timeout only for commands that don't self-terminate.
- Pipe to `cat` to prevent paging.

### Examples
**Self-Terminating**: `git status 2>&1 | cat`
**Non-Terminating**: `timeout 30s docker logs --tail 100 -f container_name 2>&1 | cat`

## File Operations

### Read Before Write
- Always read files before modifying.
- Re-read after changes to verify integrity.
- Check file existence and permissions before operations.

### Path Validation
- Use workspace-relative paths (not location-relative).
- Always confirm working directory with `pwd`.
- Validate target directory exists before writing.

## Conventional Commits

Conventional Commits standardize commit messages to be parseable by tools, driving automated versioning and changelogs. Precision in commit messages is critical for clarity and automation.

### Structure
Format: `<type>(<scope>): <description>`
- `type`: Change intent (feat, fix, etc.).
- `scope` (optional): Affected area (auth, ui, etc.).
- `description`: Concise, imperative summary.
- Optional body: Additional details.
- Optional footer: BREAKING CHANGE or issue references.

### Key Types
These types align with semantic-release defaults (Angular convention):
- `feat`: New feature (minor version bump). Example: `feat(ui): add dark mode toggle`
- `fix`: Bug fix (patch version bump). Example: `fix(api): correct rate limit error`
- `BREAKING CHANGE`: Breaking change (major version bump). Indicate with `!` after type or in footer.
- Non-releasing: `docs:`, `style:`, `refactor:`, `perf:`, `test:`, `build:`, `ci:`, `chore:`.

### Guidelines
- Be specific: Use scopes.
- Keep concise: Subject line < 50 characters.
- Trigger intentionally: Use feat, fix, or breaking changes only when release desired.
- Avoid ambiguity: Write imperative, actionable descriptions.
- Document breaking changes: Always flag explicitly.

## Quick Reference

**Atomic Design**: Atoms (<100) → Molecules (<200) → Organisms (<500) → Templates (<200) → Pages (<500)
**TDD Cycle**: Red (failing test) → Green (passing code) → Refactor (improve)
**Quality Gates**: TDD, tests pass, >80% coverage, linting, security, documentation
**Security**: No secrets, validate inputs, HTTPS, updated dependencies
**Commands**: Self-terminating: `<cmd> 2>&1 | cat`. Non-terminating: `timeout <dur> <cmd> 2>&1 | cat`
**Paths**: Always workspace-relative. Validate with `pwd` and `tree -L 4 --gitignore | cat`

---

> **For complete rule sets**: See `.cursor/rules/` directory for language-specific rules, workflow rules, and detailed guidelines.
