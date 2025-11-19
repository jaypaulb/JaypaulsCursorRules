# Agent OS Standards

Development standards for AI-assisted software development using Agent OS. These standards ensure consistent code quality, testing practices, security, and architecture across different languages and frameworks.

## Overview

This directory contains modular, language-agnostic and language-specific development standards organized by category:

```
standards/
├── global/         # Universal standards (all projects)
├── backend/        # Server-side language standards
├── frontend/       # Client-side language standards
├── testing/        # Quality, testing, verification standards
└── workflows/      # Operational and process documentation
```

## Quick Navigation

### Universal Standards (Global)

Every project follows these core standards:

- **[command-execution.md](global/command-execution.md)** - How to execute commands safely
- **[file-operations.md](global/file-operations.md)** - Reading, writing, and validating files
- **[error-handling.md](global/error-handling.md)** - Handling and logging errors
- **[security.md](global/security.md)** - OWASP Top 10 compliance, secret management
- **[code-structure.md](global/code-structure.md)** - Atomic design hierarchy for code organization
- **[naming-conventions.md](global/naming-conventions.md)** - Consistent naming across projects
- **[documentation.md](global/documentation.md)** - Code, API, and project documentation
- **[project-structure.md](global/project-structure.md)** - Directory layout and organization
- **[dev-environment.md](global/dev-environment.md)** - OS detection and tool setup
- **[performance.md](global/performance.md)** - Profiling, benchmarking, optimization
- **[canvus-api.md](global/canvus-api.md)** - Canvus API client patterns
- **[rest-api.md](global/rest-api.md)** - REST API client patterns
- **[graphql-api.md](global/graphql-api.md)** - GraphQL API patterns
- **[websocket-api.md](global/websocket-api.md)** - WebSocket/real-time patterns

### Testing & Quality Standards

All projects must follow these standards:

- **[quality-gates.md](testing/quality-gates.md)** - Tests, linting, type checking, security
- **[tdd-methodology.md](testing/tdd-methodology.md)** - Test-Driven Development (Red-Green-Refactor)

### Backend Standards

Choose appropriate language for your backend:

- **[python.md](backend/python.md)** - Python projects
- **[golang.md](backend/golang.md)** - Go projects
- **[nodejs-express.md](backend/nodejs-express.md)** - Node.js + Express projects
- **[cpp.md](backend/cpp.md)** - C++ projects
- **[rust.md](backend/rust.md)** - Rust projects
- **[esp32-iot.md](backend/esp32-iot.md)** - ESP32/IoT projects

### Frontend Standards

Choose appropriate language for your frontend:

- **[typescript.md](frontend/typescript.md)** - TypeScript projects
- **[react.md](frontend/react.md)** - React projects
- **[flutter.md](frontend/flutter.md)** - Flutter projects

### Workflows

Operational and process standards:

- **[workflows/](workflows/)** - Task management, CI/CD, code review, specialized workflows

## Key Principles

### 1. Atomic Design Hierarchy

All code is organized in a composition hierarchy:

```
Atoms (< 100 lines) - Basic building blocks
  ↓ imports only stdlib/external
Molecules (< 200 lines) - Composed atoms
  ↓ imports atoms
Organisms (< 500 lines) - Composed molecules/atoms
  ↓ imports molecules/atoms
Pages (< 500 lines) - Complete features
```

**Benefits**: Small, focused, independently testable, highly reusable components

See [global/code-structure.md](global/code-structure.md) for details.

### 2. Test-Driven Development (TDD)

All projects follow Red-Green-Refactor cycle:

1. **Red**: Write failing test first
2. **Green**: Write minimal code to pass
3. **Refactor**: Improve while keeping tests green

**Requirements**:
- >80% test coverage (100% for critical paths)
- Tests mirror code hierarchy (atoms → molecules → organisms)
- All tests pass before completion

See [testing/tdd-methodology.md](testing/tdd-methodology.md) for details.

### 3. Quality Gates

Before completing work, ensure:

- ✅ Tests pass and coverage >80%
- ✅ Linting passes
- ✅ Type checking passes (if applicable)
- ✅ Security scans pass
- ✅ No secrets in code
- ✅ Documentation updated
- ✅ Atomic design structure maintained

See [testing/quality-gates.md](testing/quality-gates.md) for details.

### 4. Security by Design

All code follows OWASP Top 10 compliance:

- Never commit secrets (use environment variables)
- Validate all inputs
- Sanitize all outputs
- Use strong authentication
- Keep dependencies updated
- Implement proper error handling

See [global/security.md](global/security.md) for details.

## Getting Started

### For a New Project

1. Choose your technology stack (language + framework)
2. Read the universal standards (global/*.md)
3. Read your language/framework standards (backend/*, frontend/*)
4. Read testing standards (testing/*.md)
5. Follow the project structure: [global/project-structure.md](global/project-structure.md)

### For Existing Projects

1. Audit your code against the standards
2. Set up quality gates in your CI/CD
3. Gradually refactor to match atomic design structure
4. Implement TDD for all new features
5. Document your architecture and decisions

## Standard Application

In Agent OS projects, standards are injected automatically using `{{standards/}}` tags. The system:

1. **Identifies context**: What language, framework, and files are involved
2. **Loads relevant standards**: Global + language/framework-specific
3. **Applies standards**: Injects them into prompts for AI agents
4. **Ensures consistency**: All code follows the same patterns

## Contributing

When adding new standards:

1. Keep them concise and actionable
2. Include concrete examples
3. Reference related standards
4. Test with real projects
5. Document breaking changes

## Standard Format

Each standard file is a markdown document containing:

- **Title**: Clear, descriptive heading
- **Overview**: What this standard covers
- **Key Principles**: Core concepts
- **Detailed Guidelines**: Specific requirements
- **Examples**: Working code examples
- **Checklists**: Validation criteria
- **Best Practices**: Do's and don'ts

## Related Documentation

- **[CONVERSION_LOG.md](../CONVERSION_LOG.md)** - History of Cursor rules conversion
- **[CONVERSION_NEXT_STEPS.md](../CONVERSION_NEXT_STEPS.md)** - Remaining conversion tasks
- **[CLAUDE.md](../../CLAUDE.md)** - Claude Code configuration for this repository

## Version History

**v2.1.1** (November 18, 2025)
- Converted core Cursor rules to Agent OS standards format
- Added Python, Go, TypeScript standards
- Atomic design and TDD enforcement

## Support

For questions or issues:

1. Check the relevant standard file for detailed guidance
2. Review examples in the standards
3. Refer to language-specific standards for context
4. Open an issue on GitHub for improvements

---

**Last Updated**: 2025-11-19
**Total Standards**: 26 files (13 completed, 13 in progress)
**Coverage**: Python, Go, TypeScript, C++, Rust, Flutter, Node.js, React, ESP32
