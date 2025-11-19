# Node.js + Express Development Standards

Node.js + Express backend development standards. Includes MongoDB integration, middleware patterns, error handling, security, and testing.

> **Note**: Assumes core rules (command execution, file operations, quality gates, error handling, naming) are already loaded.

## Quality Gates (Node.js/Express-Specific)

- All code must pass: `eslint`, `prettier`, `typescript`, `jest`
- Test coverage >80% (use `npm run test -- --coverage`)
- Comprehensive API documentation
- Input validation for all endpoints
- Proper error handling with error middleware

## Code Structure (Atomic Design)

Structure Node.js/Express backend following atomic design hierarchy (see global/code-structure.md for general principles):

### Atoms (Basic Building Blocks)
- **Single-purpose utilities/models**: One function, one model, or one small utility per file
- **Size**: <100 lines (ideally <50 lines)
- **Location**: `src/atoms/`
- **Examples**:
  ```typescript
  // src/atoms/user.model.ts - Basic User model
  export interface User {
      id: number;
      email: string;
      name: string;
  }

  // src/atoms/validator.ts - Single-purpose validation
  export const validateEmail = (email: string): boolean => {
      return email.includes('@');
  };
  ```

### Molecules (Composed Components)
- **Compose atoms**: Import and use 2-5 atoms
- **Size**: <200 lines (ideally <150 lines)
- **Location**: `src/molecules/`
- **Examples**:
  ```typescript
  // src/molecules/userValidator.ts - Composes atoms
  import { User } from '../atoms/user.model';
  import { validateEmail } from '../atoms/validator';

  export const validateUser = (user: User): [boolean, string] => {
      if (!validateEmail(user.email)) {
          return [false, 'Invalid email'];
      }
      return [true, 'Valid'];
  };
  ```

### Organisms (Complex Modules)
- **Compose molecules/atoms**: Import multiple molecules
- **Size**: <500 lines (ideally <300 lines)
- **Location**: `src/organisms/`
- **Examples**:
  ```typescript
  // src/organisms/authController.ts - Complete auth controller
  import { validateUser } from '../molecules/userValidator';
  import { createToken } from '../molecules/tokenService';

  export class AuthController {
      // Composes userValidator and tokenService molecules
  }
  ```

### Node.js/Express-Specific Patterns
- Use middleware for cross-cutting concerns (auth, logging, CORS)
- Implement controllers as organisms composing multiple services
- Keep imports minimal - prefer composition over deep nesting
- Use TypeScript interfaces for type safety across layers

## MongoDB Best Practices

- Use Mongoose for schema validation and object modeling
- Implement proper indexing for query performance
- Use aggregation pipelines for complex queries
- Implement connection pooling and error handling
- Never expose database credentials in code

## Express.js Backend Standards

- Use middleware for cross-cutting concerns (auth, logging, CORS)
- Implement proper error handling with error middleware
- Use environment variables for configuration
- Implement request validation with libraries like Joi or express-validator
- Use async/await for database operations

## API Design

### Endpoint Structure
- Use RESTful conventions: `/api/v1/resources`
- Use appropriate HTTP methods (GET, POST, PUT, PATCH, DELETE)
- Return consistent JSON responses
- Use proper HTTP status codes

### Request Validation
- Validate all incoming request data
- Use libraries like `express-validator` or Joi
- Return clear validation error messages
- Implement input sanitization

### Error Handling
- Implement centralized error handling middleware
- Return consistent error response format
- Never expose sensitive error details
- Log errors for debugging

## Security

Node.js/Express-specific security patterns (see global/security.md for universal requirements):
- Use `process.env` for environment variables
- Use `dotenv` for `.env` file management (never commit `.env`)
- Implement rate limiting
- Use helmet.js for HTTP headers
- Validate and sanitize all inputs
- Implement CORS properly

## Testing (TDD)

Node.js/Express-specific TDD patterns (see testing/tdd-methodology.md for core principles):

### Testing Tools
- Use Jest for unit and integration tests
- Mock external dependencies and API calls
- Use `jest --coverage` for coverage reports
- Use supertest for testing Express routes

### TDD Workflow Example (Node.js/Express)
```typescript
// Red: Write failing test first
test('validateEmail returns true for valid email', () => {
    expect(validateEmail('user@example.com')).toBe(true);
});

// Green: Write minimal code to pass
// Refactor: Improve while keeping tests green
```

### Test Structure (Atomic Design)
- **Atoms**: Unit tests for models and utilities
- **Molecules**: Unit tests for services
- **Organisms**: Integration tests for controllers and routes

## Dependencies

- Pin dependency versions in package.json
- Use `npm audit` to check for security vulnerabilities
- Keep dependencies minimal and well-justified
- Regular security updates
- Use lock files (package-lock.json) for reproducible builds

## Performance

- Use connection pooling for database connections
- Implement caching for frequently accessed data
- Use async/await properly
- Monitor request/response times
- Optimize database queries with indexes
