---
name: Backend Migrations
description: Implement reversible, safe database schema changes that can be deployed without downtime or data loss. Create small, focused migrations that handle a single logical change (add column, create table, add index) rather than bundling multiple changes together. Always implement proper rollback (down/revert) functions to enable quick recovery if a migration fails. Separate schema changes from data transformations into distinct migrations to reduce locking time and deployment risk. Manage indexes carefully, using concurrent operations where available to avoid locking tables during migration. Never modify existing migration files that have been deployed; create new migrations instead. Design migrations with backward compatibility during deployment to allow old code versions to coexist with new schema. Use this skill when creating new database migration files, implementing reversible migrations with proper rollback capabilities, adding or modifying database schema and columns, creating or modifying database indexes with concurrent options, writing data transformation and backfill migrations, separating large schema changes into multiple smaller migrations, naming migration files with clear, descriptive names and timestamps, implementing database version control and tracking, designing zero-downtime deployment strategies, and ensuring safe rollback options for all schema changes.
---

# Backend Migrations

This Skill provides Claude Code with specific guidance on how to adhere to coding standards as they relate to how it should handle backend migrations.

## When to use this skill:

- When creating new database migration files
- When implementing reversible migrations with rollback capabilities
- When adding or modifying database schema
- When creating or modifying database indexes
- When writing data transformation migrations
- When splitting schema and data changes into separate migrations
- When naming migration files with clear, descriptive names
- When implementing database version control
- When ensuring migrations support zero-downtime deployments
- When migrating data without locking tables

## Instructions

For details, refer to the information provided in this file:
[backend migrations](../../../agent-os/standards/backend/migrations.md)
