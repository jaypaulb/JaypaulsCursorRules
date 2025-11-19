---
name: Global Error Handling
description: Design error handling that recovers from failures gracefully while keeping users informed. Provide user-friendly error messages that explain what went wrong without exposing technical details or stack traces. Implement fail-fast validation with explicit errors at entry points to prevent partial processing. Use specific, typed exception classes for different error scenarios to enable targeted error handling. Centralize error handling at appropriate architectural boundaries (API routes, form submission handlers, external API calls) rather than scattering try-catch blocks throughout code. Implement graceful degradation to maintain partial functionality when errors occur. Use exponential backoff with jitter for retrying transient failures (network timeouts, rate limits). Ensure proper resource cleanup in finally blocks to prevent connection leaks and memory issues. Use this skill when implementing error handling in functions and API endpoints, designing user-friendly error messages, validating input and raising errors early, creating custom exception classes and error types, implementing centralized error handlers and middleware, catching and handling specific exceptions, implementing retry logic with exponential backoff, designing API error response structures, implementing graceful degradation for dependent services, managing database transaction rollbacks, and logging errors for debugging and monitoring.
---

# Global Error Handling

This Skill provides Claude Code with specific guidance on how to adhere to coding standards as they relate to how it should handle global error handling.

## When to use this skill:

- When implementing error handling in functions
- When designing error messages for users
- When validating input and raising errors early
- When creating custom exception classes
- When implementing centralized error handlers
- When catching and handling specific exceptions
- When implementing retry logic with exponential backoff
- When designing API error responses
- When implementing graceful degradation
- When ensuring proper resource cleanup in error cases
- When logging errors for debugging

## Instructions

For details, refer to the information provided in this file:
[global error handling](../../../agent-os/standards/global/error-handling.md)
