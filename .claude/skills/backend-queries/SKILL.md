---
name: Backend Queries
description: Write database queries that are both efficient and secure, protecting against SQL injection and resource exhaustion. Always use parameterized queries (prepared statements) instead of string concatenation to prevent SQL injection attacks. Avoid N+1 query problems by using eager loading, joins, or batch loading to fetch related data in a single query rather than one query per row. Select only the specific columns you need instead of using SELECT * to reduce data transfer and I/O. Use indexes strategically on columns used in WHERE clauses, JOIN conditions, and ORDER BY. Implement proper database transactions when related changes must succeed or fail together, but keep transactions short to minimize locking. Set query execution timeouts to prevent runaway queries from consuming resources indefinitely. Apply caching strategically for expensive query results that are accessed frequently and change infrequently. Paginate large result sets to prevent loading millions of rows into memory. Use this skill when writing SQL queries or using query builders in code, implementing parameterized queries and prepared statements, optimizing queries to avoid N+1 problems, using eager loading and query joins to fetch related data efficiently, selecting specific columns instead of using SELECT *, creating indexes for query optimization, implementing database transactions and ACID properties, setting query execution timeouts, caching expensive or frequently-used query results, paginating through large datasets with limit/offset or cursor-based pagination, sorting and filtering query results efficiently, and managing database load and preventing resource exhaustion.
---

# Backend Queries

This Skill provides Claude Code with specific guidance on how to adhere to coding standards as they relate to how it should handle backend queries.

## When to use this skill:

- When writing SQL queries or using query builders
- When implementing parameterized queries to prevent SQL injection
- When optimizing queries to avoid N+1 problems
- When using eager loading or query joins to fetch related data efficiently
- When selecting specific columns instead of all columns
- When creating indexes for query optimization
- When implementing database transactions
- When setting query execution timeouts
- When caching expensive query results
- When paginating through large datasets
- When sorting and filtering query results

## Instructions

For details, refer to the information provided in this file:
[backend queries](../../../agent-os/standards/backend/queries.md)
