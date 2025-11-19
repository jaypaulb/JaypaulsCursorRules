# GraphQL API Development Standards

GraphQL API development standards. Covers queries, mutations, subscriptions, schema design, and atomic design structure for GraphQL clients and servers.

## GraphQL Overview

### Core Concepts

- **Queries**: Read data (equivalent to GET)
- **Mutations**: Modify data (equivalent to POST/PUT/PATCH/DELETE)
- **Subscriptions**: Real-time updates (WebSocket-based)
- **Schema**: Type system defining API structure
- **Resolvers**: Functions that resolve fields

### Schema Design

- Use clear, descriptive type names
- Group related fields into types
- Use interfaces for shared fields
- Use enums for fixed sets of values
- Use input types for mutations
- Document schema with descriptions

## Code Structure (Atomic Design)

Structure GraphQL code following atomic design hierarchy (see global/code-structure.md):

### Atoms (Basic Building Blocks)

- **Types/Scalars**: GraphQL type definitions
- **Schema Fragments**: Reusable schema pieces
- **Size**: <100 lines each

### Molecules (Composed Components)

- **Resolvers**: Field resolvers for types
- **Queries/Mutations**: Individual query/mutation handlers
- **Compose atoms**: Import and use types
- **Size**: <200 lines each

### Organisms (Complex Modules)

- **Schema**: Complete GraphQL schema
- **Server/Client**: Complete GraphQL server or client
- **Compose molecules**: Import all resolvers
- **Size**: <500 lines

## Query Patterns

### Query Structure

```graphql
query GetUser($id: ID!) {
  user(id: $id) {
    id
    email
    name
    posts {
      id
      title
    }
  }
}
```

### Best Practices

- Request only needed fields (avoid over-fetching)
- Use fragments for reusable field sets
- Use variables for dynamic values
- Handle null values appropriately
- Use aliases when querying same field multiple times

## Mutation Patterns

### Mutation Structure

```graphql
mutation CreateUser($input: CreateUserInput!) {
  createUser(input: $input) {
    user {
      id
      email
      name
    }
    errors {
      field
      message
    }
  }
}
```

### Input Types

- Use input types for mutation arguments
- Validate inputs on server side
- Return success/error response consistently
- Include error details for validation failures

## Subscription Patterns

### Real-Time Updates

```graphql
subscription OnUserCreated {
  userCreated {
    id
    email
    name
  }
}
```

### Implementation

- Use WebSocket connections for subscriptions
- Handle subscription lifecycle
- Implement proper cleanup on disconnect
- Handle reconnection logic

## Error Handling

- Return errors in GraphQL response (errors array)
- Include error codes for client handling
- Provide error messages for debugging
- Don't expose internal errors to client

## Performance

- Implement field-level resolvers for lazy loading
- Use DataLoader to batch database queries
- Implement caching at resolver level
- Monitor query depth and complexity

## Testing (TDD)

- Test queries with various inputs
- Test mutations for success and error cases
- Test subscriptions for real-time updates
- Mock external dependencies
- Test schema validation
