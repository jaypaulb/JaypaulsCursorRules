---
name: Backend API
description: Design RESTful APIs that are predictable, scalable, and developer-friendly. Use resource-based URL structures with plural noun naming (e.g., /api/users, /api/posts/123/comments) instead of verb-based endpoints. Use appropriate HTTP methods (GET for retrieval, POST for creation, PUT/PATCH for updates, DELETE for deletion) and return proper status codes (200 OK, 201 Created, 400 Bad Request, 404 Not Found, 500 Internal Server Error) that accurately reflect the operation result. Implement consistent endpoint naming conventions across all routes (lowercase, hyphenated for multi-word resources). Use query parameters for filtering, sorting, and pagination (e.g., ?page=1&limit=20&sort=created_at&filter=status:active). Limit nesting depth to 2-3 levels maximum (/api/users/123/posts/456 is reasonable, deeper nesting becomes confusing). Design versioning strategies (URL versioning like /v1/users or header versioning) if you need to support multiple API versions. Include rate limiting headers (X-RateLimit-Limit, X-RateLimit-Remaining) to communicate usage quotas to clients. Design consistent error response formats that include error codes, messages, and field-level validation errors. Use this skill when creating new API endpoints and routes, implementing request handlers and response formatting, defining URL structures and resource paths, working with HTTP methods and status codes, implementing query parameters for filtering, sorting, or pagination, handling API versioning strategies, setting up authentication and authorization headers, implementing rate limiting and API quotas, designing nested resource endpoints, returning appropriate HTTP status codes, formatting API error responses, and ensuring API consistency across your backend.
---

# Backend API

This Skill provides Claude Code with specific guidance on how to adhere to coding standards as they relate to how it should handle backend API.

## When to use this skill:

- When creating new API endpoints or routes
- When implementing request handlers and response formatting
- When defining URL structures and resource paths
- When working with HTTP methods (GET, POST, PUT, DELETE, PATCH)
- When implementing query parameters for filtering, sorting, or pagination
- When handling API versioning strategies
- When setting up authentication/authorization headers
- When implementing rate limiting and API quotas
- When designing nested resource endpoints
- When returning appropriate HTTP status codes

## Instructions

For details, refer to the information provided in this file:
[backend API](../../../agent-os/standards/backend/api.md)
