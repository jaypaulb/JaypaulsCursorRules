---
name: Backend Models
description: Design database models and schemas that enforce data integrity at the database level, not just application code. Use clear, consistent naming conventions (singular names for models/entity classes, plural for tables). Include creation and update timestamps (created_at, updated_at) on all tables for auditing and debugging. Implement database-level constraints (NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK constraints) to prevent invalid data from entering the database regardless of application bugs. Select appropriate data types (VARCHAR length, decimal precision, date formats) to represent data accurately. Create indexes strategically on foreign keys and frequently-queried columns to optimize query performance without bloating the schema. Define explicit relationships between entities (one-to-many, many-to-many) with proper foreign key constraints and cascade delete policies. Apply validation at multiple layers: database constraints, ORM-level validation, and application-level business rules. Maintain balanced database normalization to prevent redundancy while optimizing for query patterns. Use this skill when creating new database models and tables, defining model/table naming conventions, adding relationships and associations between entities (one-to-many, many-to-many), implementing foreign key constraints and cascade behaviors, adding timestamps for auditing created_at and updated_at fields, setting up database-level constraints (unique, not null, check), selecting appropriate data types and field lengths, creating indexes on foreign keys and frequently-queried fields, implementing model-level validation rules, normalizing database schemas, and working with ORM frameworks.
---

# Backend Models

This Skill provides Claude Code with specific guidance on how to adhere to coding standards as they relate to how it should handle backend models.

## When to use this skill:

- When creating new database models or tables
- When defining model/table naming conventions
- When adding relationships between models (one-to-many, many-to-many)
- When implementing model associations and foreign keys
- When adding timestamps (created_at, updated_at) for auditing
- When setting up database-level constraints (unique, not null, check)
- When selecting appropriate data types for fields
- When creating indexes on foreign keys and frequently-queried columns
- When implementing model validation rules
- When normalizing database schemas
- When working with ORM frameworks

## Instructions

For details, refer to the information provided in this file:
[backend models](../../../agent-os/standards/backend/models.md)
