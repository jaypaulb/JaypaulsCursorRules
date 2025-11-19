---
name: Testing Test Writing
description: Write pragmatic, focused tests that verify core functionality and user flows without excessive edge case coverage during initial development. Complete feature implementation first, then add tests at logical completion points rather than writing comprehensive test suites for every change. Focus tests on user-visible behavior and critical paths rather than implementation details—if you refactor internal code structure, your tests shouldn't break if behavior stays the same. Use descriptive test names that clearly explain what scenario is being tested and what the expected outcome is. Mock external dependencies (APIs, databases, file systems) to keep tests fast and isolated from external systems. Maintain fast test execution speeds (unit tests should run in milliseconds) by mocking heavy operations and keeping test data minimal. Defer comprehensive edge case testing and error scenario coverage to dedicated QA or testing phases once core features are working. Write tests that are easy to understand and modify; overly complex test code is harder to maintain. Use this skill when writing unit tests for functions, components, and modules, creating integration tests that verify multiple components working together, writing end-to-end tests for critical user flows, mocking external dependencies and APIs in tests, setting up test fixtures and test data, writing clear, descriptive test case names and descriptions, testing public APIs and interfaces rather than implementation details, improving test execution speed and performance, refactoring code to be more testable, and building test infrastructure and utilities.
---

# Testing Test Writing

This Skill provides Claude Code with specific guidance on how to adhere to coding standards as they relate to how it should handle testing test writing.

## When to use this skill:

- When writing unit tests for functions and components
- When creating integration tests
- When writing end-to-end tests
- When mocking external dependencies and APIs
- When testing user interactions and workflows
- When naming test cases descriptively
- When testing public APIs and interfaces
- When setting up test fixtures and data
- When testing error handling and edge cases
- When improving test execution speed
- When refactoring code to be more testable

## Instructions

For details, refer to the information provided in this file:
[testing test writing](../../../agent-os/standards/testing/test-writing.md)
