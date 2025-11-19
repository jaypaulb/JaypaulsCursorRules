---
name: Frontend Components
description: Design reusable, maintainable UI components that can be combined to build complex interfaces. Apply the single responsibility principle where each component has one clear purpose and does it well. Make components flexible and configurable through props so they can be reused in different contexts. Favor composition and building complex components from simple, smaller components rather than creating monolithic, feature-packed components. Define clear component interfaces with well-documented props, including prop types, default values, and usage examples. Encapsulate implementation details within the component so consumers don't need to understand the internal structure. Use consistent naming conventions across all components (ComponentName, notComponentname or component-name). Keep component prop counts minimal—if a component requires many props, consider breaking it into smaller components or using composition patterns. Manage state at the appropriate level: keep state local to a component when only that component uses it, lift state up when multiple components need to share state, and use global state management for truly shared application state. Avoid prop drilling by using context APIs or composition patterns when passing data through many component layers. Use this skill when creating new React/Vue/Angular components, defining component props and their types with documentation, building composable component hierarchies, implementing components with single responsibility, refactoring monolithic components into smaller reusable pieces, adding documentation to component props and interfaces, managing component state and avoiding prop drilling, naming components and their props consistently, creating flexible and configurable components, encapsulating component implementation details, and testing component behavior and props.
---

# Frontend Components

This Skill provides Claude Code with specific guidance on how to adhere to coding standards as they relate to how it should handle frontend components.

## When to use this skill:

- When creating new React/Vue/Angular components
- When defining component props and their types
- When building composable component hierarchies
- When implementing components with single responsibility
- When refactoring monolithic components into smaller pieces
- When adding documentation to component props and interfaces
- When managing component state and props drilling
- When naming components and their props consistently
- When creating flexible, configurable components
- When encapsulating component implementation details
- When testing component behavior and props

## Instructions

For details, refer to the information provided in this file:
[frontend components](../../../agent-os/standards/frontend/components.md)
