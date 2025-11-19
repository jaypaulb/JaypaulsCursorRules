---
name: Global Validation
description: Implement defense-in-depth validation across multiple layers: server-side validation as the authoritative source of truth, client-side validation for improved user experience, and database-level constraints for data integrity. Always fail fast on invalid input with specific, field-level error messages that guide users to correct errors. Use allowlists (permit known good values) instead of blocklists (block known bad values), validate data types and formats comprehensively, and sanitize all input against injection attacks (SQL, XSS, command injection). Validate consistently across all entry points including APIs, form submissions, background jobs, and webhooks. Use this skill when implementing form validation in frontend code, validating API request payloads and request handlers, securing API endpoints, preventing injection attacks and XSS vulnerabilities, designing field-specific error messages, validating file uploads and size limits, checking user permissions and authorization, implementing rate limiting and quotas, and ensuring validation logic is not duplicated across entry points.
---

# Global Validation

This Skill provides Claude Code with specific guidance on how to adhere to coding standards as they relate to how it should handle global validation.

## When to use this skill:

- When implementing server-side input validation
- When adding client-side form validation
- When validating API request payloads
- When checking user permissions and authorization
- When sanitizing input to prevent injection attacks
- When validating email addresses and URLs
- When checking password strength requirements
- When validating file uploads
- When implementing rate limiting and quotas
- When providing field-specific error messages
- When validating data types and formats

## Instructions

For details, refer to the information provided in this file:
[global validation](../../../agent-os/standards/global/validation.md)
