# REST API Client Development Standards

Generic REST API client development standards. Covers authentication, request/response patterns, error handling, and atomic design structure for REST API clients.

## API Overview

### REST Principles

- **Stateless**: Each request contains all information needed
- **Resource-based**: URLs represent resources, not actions
- **HTTP methods**: Use GET, POST, PUT, PATCH, DELETE appropriately
- **Status codes**: Use standard HTTP status codes
- **JSON**: Use JSON for request/response bodies (typically)

### Base URL Structure

- All endpoints prefixed with base URL
- Version in URL path: `/api/v1/` or `/v1/`
- Resource-based paths: `/api/v1/users`, `/api/v1/users/:id`
- Nested resources: `/api/v1/users/:id/posts`

## Authentication

### Common Patterns

- **API Key**: Header `X-API-Key: <key>` or query parameter
- **Bearer Token**: Header `Authorization: Bearer <token>`
- **Basic Auth**: Header `Authorization: Basic <base64(user:pass)>`
- **Custom Header**: Header `Private-Token: <token>`

### Token Management

- Store tokens securely (environment variables, not in code)
- Handle token expiration and refresh
- Support both temporary and permanent tokens
- Handle 401 Unauthorized errors gracefully

## HTTP Methods and Status Codes

### Standard Operations

- **GET**: Retrieve resource(s) - Returns `200 OK` with data
- **POST**: Create resource - Returns `200 OK` or `201 Created` with created resource
- **PUT**: Replace resource - Returns `200 OK` with updated resource
- **PATCH**: Update resource (partial) - Returns `200 OK` with updated resource
- **DELETE**: Delete resource - Returns `200 OK` or `204 No Content`

### Error Responses

- **400 Bad Request**: Invalid request data
- **401 Unauthorized**: Missing or invalid authentication
- **403 Forbidden**: Insufficient permissions
- **404 Not Found**: Resource doesn't exist
- **429 Too Many Requests**: Rate limit exceeded
- **500 Internal Server Error**: Server error

### Error Response Format

```json
{
  "error": "Error message",
  "code": "ERROR_CODE",
  "details": {}
}
```

## Code Structure (Atomic Design)

Structure REST API client code following atomic design hierarchy (see global/code-structure.md):

### Atoms (Basic Building Blocks)

- **Models**: Data models for API resources
- **Auth**: Authentication utilities (token management, header creation)
- **Exceptions**: Custom API error types
- **Size**: <100 lines each

### Molecules (Composed Components)

- **Resource Clients**: Each resource API client (UserClient, PostClient, etc.)
- **Compose atoms**: Import and use models, auth, exceptions
- **Size**: <200 lines each

### Organisms (Complex Modules)

- **Main Client**: Complete API client composing all resource clients
- **Compose molecules**: Import all resource clients
- **Size**: <500 lines

## Request/Response Patterns

### Request Headers

- `Content-Type: application/json` for JSON requests
- `Accept: application/json` for JSON responses
- Authentication headers (as required by API)
- Custom headers as needed

### Request Body

- JSON format for POST/PUT/PATCH requests
- Validate required fields before sending
- Handle optional fields appropriately

### Response Handling

- Parse JSON responses
- Handle different status codes
- Extract error messages from error responses
- Return appropriate data models

## Error Handling

### API Error Patterns

- Create custom error types for API errors
- Handle HTTP errors appropriately
- Return meaningful error messages
- Log errors without exposing sensitive data

### Retry Logic

- Implement exponential backoff for retries
- Retry on 5xx errors and timeouts
- Don't retry on 4xx errors (except 429)
- Set max retry attempts to prevent infinite loops

## Testing (TDD)

- Mock HTTP responses
- Test all HTTP methods
- Test error handling
- Test authentication
- Test data transformations
