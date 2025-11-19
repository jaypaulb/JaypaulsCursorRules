# Canvus API Development Standards

Canvus API documentation and development standards. Covers authentication, endpoints, resources, streaming, and API patterns for building Canvus API clients.

## API Overview

### Base URL and Versioning

- **Base Path**: `/api/v1/` (all endpoints prefixed with this)
- **Current Version**: v1.2 (introduced in Canvus 3.1)
- **Versioning**: Semantic versioning with single major version number
- **Data Format**: JSON for all requests and responses
- **Example**: `https://canvus.example.com/api/v1/canvases`

### Compatibility

- Backward-incompatible changes trigger version increment
- Minor updates (new features) don't require version update
- Server version info available via `/server-info` endpoint

## Authentication

### Access Tokens

- **Header**: `Private-Token: <access_token>`
- **Required**: For most endpoints (except `/server-info` and shared links)
- **Unauthenticated**: Returns `401 Unauthorized`

### Token Types

1. **Temporary Tokens**: Issued via `/users/login` endpoint, valid for 24 hours
2. **Permanent Tokens**: Created via Canvus UI or `/users/:id/access-tokens` endpoint, never expire unless revoked

### Token Management

- Create: `POST /users/:id/access-tokens` (returns plain text token - only shown once)
- List: `GET /users/:id/access-tokens` (does not return actual tokens)
- Update: `PATCH /users/:id/access-tokens/:token-id` (change description)
- Delete: `DELETE /users/:id/access-tokens/:token-id` (revoke token)

### Shared Links (Canvus 3.1+)

- **Format**: `{serverAddress}/open/{canvasId}`
- **Permission**: Canvas must have `link_permission` set to `edit` or `view`
- **Access**: Unauthenticated access possible (Guest user with specified permission)
- **Override**: Valid `Private-Token` can be provided for authenticated access

## HTTP Methods and Status Codes

### Standard Operations

- **GET**: Returns `200 OK` with requested resource
- **POST**: Returns `200 OK` with created resource
- **PATCH**: Returns `200 OK` with updated resource
- **DELETE**: Returns `200 OK` indicating successful deletion

### Error Responses

- **4xx**: Client errors (missing token, invalid attributes, insufficient permissions)
- **5xx**: Server errors
- **Error Format**: JSON with `msg` field describing the issue

```json
{
  "msg": "Permission denied"
}
```

## Main Resource Categories

### Canvas Management

**Canvases** (`/canvases`):
- `GET /canvases` - List all canvases
- `GET /canvases/:id` - Get single canvas
- `POST /canvases` - Create canvas
- `PATCH /canvases/:id` - Update canvas
- `DELETE /canvases/:id` - Delete canvas

**Canvas Folders** (`/canvas-folders`):
- `GET /canvas-folders` - List all folders
- `POST /canvas-folders` - Create folder
- `DELETE /canvas-folders/:id` - Delete folder

### Canvas Content Resources

**Notes, Images, PDFs, Videos** (`/canvases/:id/{notes,images,pdfs,videos}`):
- `GET` - List resources
- `POST` - Create resource (multipart for binary)
- `PATCH` - Update resource
- `DELETE` - Delete resource

**Widgets** (`/canvases/:id/widgets`):
- `GET` - List widgets
- `POST` - Create widget
- `PATCH` - Update widget
- `DELETE` - Delete widget

**Connectors** (`/canvases/:id/connectors`):
- `GET` - List connectors
- `POST` - Create connector
- `PATCH` - Update connector
- `DELETE` - Delete connector

### User Management

**Users** (`/users`):
- `GET /users` - List all users
- `POST /users` - Create user (admin only)
- `PATCH /users/:id` - Update user profile
- `DELETE /users/:id` - Delete user (admin only)
- `POST /users/login` - Login
- `POST /users/logout` - Logout

**Groups** (`/groups`):
- `GET /groups` - List all groups
- `POST /groups` - Create group
- `DELETE /groups/:id` - Delete group
- `POST /groups/:group_id/members` - Add user to group

### Server Management

**Server Info** (`/server-info`):
- `GET /server-info` - Get server information (no authentication)

**Server Config** (`/server-config`):
- `GET /server-config` - Get configuration
- `PATCH /server-config` - Update settings

**License** (`/license`):
- `GET /license` - Get license info
- `POST /license/activate` - Activate license

## Code Structure (Atomic Design)

Structure Canvus API client following atomic design hierarchy:

### Atoms (Basic Building Blocks)
- **Models**: Data models for Canvus resources
- **Auth**: Token management and authentication
- **Size**: <100 lines each

### Molecules (Composed Components)
- **Resource Clients**: Canvas, User, Widget clients
- **Compose atoms**: Models and auth utilities
- **Size**: <200 lines each

### Organisms (Complex Modules)
- **Main Client**: Complete Canvus API client
- **Compose molecules**: All resource clients
- **Size**: <500 lines

## Error Handling

- Handle 401 Unauthorized (refresh token or re-authenticate)
- Handle 403 Forbidden (insufficient permissions)
- Handle 404 Not Found (resource doesn't exist)
- Return meaningful error messages to users
- Log errors without exposing sensitive data

## Testing (TDD)

- Mock API responses
- Test all CRUD operations
- Test authentication and authorization
- Test error handling
- Test file upload/download
