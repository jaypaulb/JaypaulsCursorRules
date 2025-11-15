---
description: Master IDE rule - Essential development principles that apply to all projects. This rule works standalone and provides core guidance even when the full rules folder doesn't exist.
alwaysApply: true
---

# Master IDE Rule - Essential Development Principles

> **Note**: This is a standalone master rule that provides essential development principles. For complete rule sets, see `.cursor/rules/` directory.

## Core Principles

### 1. Atomic Design Structure

Structure all code following this hierarchy:

**Atoms** (<100 lines, ideally <50)
- Single-purpose, indivisible components
- One class, one function, or one small utility
- Context-agnostic, reusable names
- Example: `atoms/user.py` - Basic User class

**Molecules** (<200 lines, ideally <150)
- Small groups of atoms working together
- Compose 2-5 atoms
- Example: `molecules/user_validator.py` - Validates user using atoms

**Organisms** (<500 lines, ideally <300)
- Complex modules composed from molecules/atoms
- Complete business logic for a domain area
- Example: `organisms/auth_system.py` - Complete authentication system

**Templates** (<200 lines)
- Reusable structural patterns
- Example: `templates/endpoint_template.py` - API endpoint pattern

**Pages** (<500 lines)
- Complete features composed from organisms/molecules/atoms
- Example: `pages/login_page.py` - Complete login feature

### Directory Structure

```
src/
├── atoms/          # Basic building blocks (<100 lines each)
├── molecules/      # Composed components (<200 lines each)
├── organisms/      # Complex modules (<500 lines each)
├── templates/     # Reusable patterns (<200 lines each)
└── pages/         # Complete features (<500 lines each)

tests/
├── atoms/          # Unit tests for atoms
├── molecules/      # Integration tests for molecules
├── organisms/      # System tests for organisms
└── pages/          # E2E tests for pages
```

### Composition Rules

- **Atoms**: Import only standard library or external dependencies
- **Molecules**: Import atoms and compose them
- **Organisms**: Import molecules and/or atoms
- **Pages**: Import organisms, molecules, and atoms as needed
- Prefer composition over inheritance
- Keep import depth shallow
- Avoid circular dependencies

## 2. Test-Driven Development (TDD)

### Red-Green-Refactor Cycle

1. **Red**: Write failing test first
   - Describe desired behavior in test
   - Test must fail (proves it tests something)
   - Run test to confirm it fails

2. **Green**: Write minimal code to pass
   - Just enough to make test pass
   - No premature optimization
   - Run test to confirm it passes

3. **Refactor**: Improve code quality
   - Improve while keeping tests green
   - Remove duplication
   - Improve readability
   - Run tests frequently

### Test Requirements

- **Write tests first** - Before implementation code
- **Tests must fail first** - Proves they test something
- **One test per behavior** - Focused, single responsibility
- **Descriptive test names** - Clear what is being tested
- **Fast execution** - Tests should run quickly
- **Isolated** - Tests should not depend on each other
- **Repeatable** - Same results every time

### Test Coverage

- **Minimum coverage**: >80% for all code
- **Critical paths**: 100% coverage
- **Public APIs**: 100% coverage
- **Edge cases**: Must be tested (zero values, empty states, nulls)
- **Error conditions**: All error paths tested

### Test Structure (Mirrors Source)

- **Atoms**: Unit tests - test individual functions/classes in isolation
- **Molecules**: Integration tests - test composed components (2-5 atoms)
- **Organisms**: System tests - test complex modules (multiple molecules)
- **Pages**: E2E tests - test complete features

## 3. Quality Gates

### Universal Requirements

- ✅ **TDD followed**: Tests written before implementation (Red-Green-Refactor)
- ✅ **Tests pass**: All tests must pass before completion
- ✅ **Test coverage**: >80% coverage (100% for critical paths and public APIs)
- ✅ **Test structure**: Tests follow atomic design hierarchy
- ✅ Linting passes
- ✅ Type checking passes (if applicable)
- ✅ Security scans pass
- ✅ No secrets in code
- ✅ Documentation updated

### Pre-Commit Validation

All changes must pass quality gates before:
- Marking tasks complete
- Creating merge requests
- Closing issues

## 4. Code Structure Standards

### File Size Enforcement

**Before Creating a File:**
- [ ] Is this file small and focused? (Check size limits above)
- [ ] Does it have a single, clear responsibility?
- [ ] Can it be broken down into smaller atoms/molecules?
- [ ] Is it at the appropriate hierarchy level?

**If File Exceeds Size Limit:**
- Split into atoms: Extract basic building blocks
- Create molecules: Compose atoms into focused components
- Build organisms: Compose molecules into complex modules
- Never create large monolithic files

## 5. Security Standards

### Secret Management

- ❌ **Never** commit API keys, passwords, tokens, or credentials
- ❌ **Never** hardcode secrets in source code
- ✅ **Always** use environment variables for secrets
- ✅ **Always** use secure storage solutions (secret managers, vaults)
- ✅ **Always** validate that secrets are not in code before committing

### OWASP Top 10 Prevention

1. **Broken Access Control**: Implement proper authentication and authorization
2. **Cryptographic Failures**: Use strong algorithms, HTTPS/TLS, hash passwords
3. **Injection**: Use parameterized queries, validate and sanitize inputs
4. **Insecure Design**: Design with security in mind from the start
5. **Security Misconfiguration**: Use secure defaults, remove unnecessary features
6. **Vulnerable Components**: Keep dependencies updated, scan for vulnerabilities
7. **Authentication Failures**: Strong passwords, MFA, secure session management
8. **Software and Data Integrity**: Verify dependencies, validate data integrity
9. **Security Logging Failures**: Log security events, protect logs, don't log secrets
10. **Server-Side Request Forgery**: Validate URLs, use allowlists

### Secure Coding Practices

- Validate all inputs (type, format, range, length)
- Sanitize inputs before processing
- Encode outputs to prevent XSS
- Don't expose sensitive information in errors
- Use HTTPS/TLS for all external communications
- Implement proper error handling (no secrets in logs)

## 6. Error Handling

### Core Principles

- Implement comprehensive error handling
- Use custom exception classes for domain-specific errors
- Log errors appropriately (exclude sensitive data)
- Return meaningful error messages to users
- Never expose sensitive data in errors

### Error Handling Checklist

- [ ] All external calls wrapped in try/catch
- [ ] Custom exceptions for domain errors
- [ ] Sensitive data excluded from logs
- [ ] User-friendly error messages
- [ ] Proper error propagation
- [ ] Error recovery strategies where appropriate

## 7. Naming Conventions

### Core Principles

- **Context-agnostic**: Name by structure/function, not context
- **Consistent**: Use same patterns across codebase
- **Descriptive**: Names should clearly indicate purpose
- **Conventional**: Follow language-specific conventions

### Atomic Design Naming

- **Atoms**: Context-agnostic, reusable names (e.g., `user.py`, `validator.py`)
- **Molecules**: Describe the composition (e.g., `user_validator.py`, `auth_form.py`)
- **Organisms**: Describe the domain (e.g., `auth_system.py`, `user_service.py`)
- **Templates**: Pattern names (e.g., `endpoint_template.py`)
- **Pages**: Feature names (e.g., `login_page.py`)

### Variable/Function Naming

- Use language-appropriate conventions
- Be descriptive: `userCount` not `uc`
- Avoid abbreviations unless widely understood
- Use constants for magic numbers/strings

## 8. Documentation Standards

### Code Documentation

- Docstrings for all public functions/classes
- Inline comments for complex logic
- API documentation for public APIs
- README with project structure and setup

### Documentation Checklist

- [ ] All public functions/classes documented
- [ ] README updated with setup instructions
- [ ] API documentation generated (if applicable)
- [ ] Examples provided for complex features
- [ ] Architecture decisions documented

## 9. Command Execution

### Core Pattern

**Commands That Self-Terminate** (most commands):
```bash
<command> 2>&1 | cat
```

**Commands That Don't Self-Terminate** (log tailing, watch, interactive):
```bash
timeout <duration> <command> 2>&1 | cat
```

### Timeout Guidelines

Use timeout only for commands that:
- Run indefinitely (e.g., `log --tail`, `watch`)
- May hang (e.g., interactive commands, network requests)
- Need a safety limit (e.g., long-running operations)

**Timeout Duration Examples:**
- Log tailing/monitoring: `timeout 30s` or `timeout 60s`
- Long-running operations: `timeout 300s` (5 minutes)
- Interactive commands: `timeout 30s`
- Network requests: `timeout 30s`

### Requirements

- Use non-interactive flags (`-y`, `--yes`) where safe
- Use non-paging flags where safe
- Validate command outputs before proceeding
- Always check exit codes
- Capture stderr with `2>&1`
- **Use timeout only for commands that don't self-terminate**
- Pipe to `cat` to prevent paging

### Examples

**Self-Terminating** (no timeout needed):
```bash
git status 2>&1 | cat
```

**Non-Terminating** (timeout required):
```bash
timeout 30s docker logs --tail 100 -f container_name 2>&1 | cat
```

## 10. File Operations

### Read Before Write

- Always read files before modifying them
- Re-read after changes to verify integrity
- Check file existence and permissions before operations

### Path Validation

- Use workspace-relative paths (not location-relative)
- Always confirm working directory with `pwd`
- Validate target directory exists before writing

## Best Practices Summary

✅ **Do's:**
- Write tests before implementation (TDD)
- Keep files small and focused (atomic design)
- Use environment variables for secrets
- Validate all inputs
- Document public APIs
- Follow language-specific conventions
- Compose from smaller pieces
- Run quality gates before completion

❌ **Don'ts:**
- Don't commit secrets
- Don't create large monolithic files
- Don't skip tests
- Don't expose sensitive data in errors
- Don't duplicate code (compose instead)
- Don't write implementation before tests
- Don't skip quality gates

## Quick Reference

**Atomic Design Hierarchy:**
- Atoms → Molecules → Organisms → Templates → Pages
- Size limits: 100 → 200 → 500 → 200 → 500 lines

**TDD Cycle:**
- Red (failing test) → Green (passing code) → Refactor (improve)

**Quality Gates:**
- TDD followed, tests pass, >80% coverage, linting, security, documentation

**Security:**
- No secrets in code, validate inputs, use HTTPS, keep dependencies updated

---

> **For complete rule sets**: See `.cursor/rules/` directory for language-specific rules, workflow rules, and detailed guidelines.

