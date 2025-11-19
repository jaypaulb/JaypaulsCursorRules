# React Development Standards

React frontend development standards. Includes component structure, hooks patterns, state management, testing, and performance.

> **Note**: Assumes core rules (command execution, file operations, quality gates, error handling, naming, TDD methodology, code structure) are already loaded.

## Quality Gates (React-Specific)

- All code must pass: `eslint`, `prettier`, `typescript`, `jest`
- Test coverage >80% (use `npm run test -- --coverage`)
- Component documentation and PropTypes/TypeScript interfaces
- Use consistent code style across components
- No console errors or warnings

## Code Structure (Atomic Design)

Structure React code following atomic design hierarchy (see global/code-structure.md for general principles):

### Atoms (Basic Building Blocks)
- **Single-purpose components/utilities**: One component, one hook, or one utility per file
- **Size**: <100 lines (ideally <50 lines)
- **Location**: `src/atoms/`
- **Examples**:
  ```tsx
  // src/atoms/Button.tsx - Basic button component
  interface ButtonProps {
      label: string;
      onClick: () => void;
  }

  export const Button: React.FC<ButtonProps> = ({ label, onClick }) => (
      <button onClick={onClick}>{label}</button>
  );

  // src/atoms/useLocalStorage.ts - Single-purpose hook
  export const useLocalStorage = (key: string) => {
      // Implementation
  };
  ```

### Molecules (Composed Components)
- **Compose atoms**: Import and use 2-5 atom components/hooks
- **Size**: <200 lines (ideally <150 lines)
- **Location**: `src/molecules/`
- **Examples**:
  ```tsx
  // src/molecules/LoginForm.tsx - Composes atoms
  import { Button } from '../atoms/Button';
  import { Input } from '../atoms/Input';
  import { useLocalStorage } from '../atoms/useLocalStorage';

  export const LoginForm: React.FC = () => {
      const [token, setToken] = useLocalStorage('token');
      // Composes Button and Input atoms
  };
  ```

### Organisms (Complex Components)
- **Compose molecules/atoms**: Import multiple molecule components
- **Size**: <500 lines (ideally <300 lines)
- **Location**: `src/organisms/`
- **Examples**:
  ```tsx
  // src/organisms/AuthSystem.tsx - Complete auth system
  import { LoginForm } from '../molecules/LoginForm';
  import { RegisterForm } from '../molecules/RegisterForm';

  export const AuthSystem: React.FC = () => {
      // Composes LoginForm and RegisterForm molecules
  };
  ```

### Pages (Complete Features)
- **Combine organisms into complete pages/screens**
- Location: `src/pages/`
- Integrate with routing and global state

### React-Specific Patterns
- Use functional components with hooks
- Implement proper state management (Context API or Redux)
- Use custom hooks for reusable logic
- Implement proper error boundaries
- Use PropTypes or TypeScript for type checking
- Follow component composition patterns
- Keep imports minimal - prefer composition over deep nesting

## Functional Components & Hooks

### Basic Hooks
- Use `useState` for component state
- Use `useEffect` for side effects
- Use `useContext` for context consumption
- Use `useCallback` to memoize callbacks
- Use `useMemo` to memoize expensive computations

### Custom Hooks
- Extract reusable logic into custom hooks
- Name custom hooks with `use` prefix
- Keep hooks focused on single responsibility
- Return state and callback functions

### Rules of Hooks
- Only call hooks at top level (not in loops/conditionals)
- Only call hooks from functional components or custom hooks
- Use ESLint plugin to enforce hook rules

## State Management

### Context API (Simple Cases)
- Use Context API for simple global state
- Create custom hooks to consume context
- Avoid prop drilling with Context

### Redux (Complex Cases)
- Use Redux for complex state management
- Implement ducks pattern (reducer, actions, selectors)
- Use Redux middleware for side effects
- Keep Redux state normalized

### Local State (Component Level)
- Use `useState` for local component state
- Lift state up when shared between components

## Component Documentation

- Document all public components
- Use JSDoc comments for function signatures
- Include PropTypes or TypeScript interfaces
- Provide usage examples for complex components

## Security

React-specific security patterns (see global/security.md for universal requirements):
- Use `dangerouslySetInnerHTML` only with trusted content
- Sanitize user input before displaying
- Use `process.env` for environment variables
- Use `dotenv` for `.env` file management (never commit `.env`)
- Implement proper authentication and authorization
- Use secure cookie settings

## Testing (TDD)

React-specific TDD patterns (see testing/tdd-methodology.md for core principles):

### Testing Tools
- Use Jest + React Testing Library for component tests
- Use Cypress or Playwright for E2E tests
- Mock external dependencies and API calls
- Use `jest --coverage` for coverage reports

### TDD Workflow Example (React)
```typescript
// Red: Write failing test first
test('Button renders with correct label', () => {
    render(<Button label="Click me" onClick={() => {}} />);
    expect(screen.getByText('Click me')).toBeInTheDocument();
});

// Green: Write minimal code to pass
// Refactor: Improve while keeping tests green
```

### Test Structure (Atomic Design)
- **Atoms**: Component snapshot tests and unit tests
- **Molecules**: Component integration tests
- **Organisms**: Complex component tests with state
- **Pages**: Full page E2E tests

### Testing Best Practices
- Test behavior, not implementation
- Use semantic queries (getByRole, getByLabelText)
- Mock API calls, not implementation
- Use `userEvent` instead of `fireEvent` when possible
- Keep tests fast and isolated

## Performance

- Use `React.memo` to prevent unnecessary re-renders
- Use `useMemo` and `useCallback` appropriately (avoid over-optimization)
- Implement code splitting with `React.lazy` and Suspense
- Optimize images and assets
- Use production build for testing performance
- Profile with React DevTools Profiler

## Styling

### CSS-in-JS
- Use styled-components or Emotion
- Keep styles colocated with components
- Use theme providers for consistent styling

### CSS Modules
- Use CSS modules for scoped styles
- Keep styles in separate files
- Import styles in components

### Tailwind CSS
- Use utility classes for styling
- Create custom components for common patterns
- Keep markup clean and readable

## Accessibility

- Use semantic HTML elements
- Implement proper ARIA labels and roles
- Ensure keyboard navigation works
- Maintain color contrast ratios
- Test with screen readers

## Dependencies

- Pin dependency versions in package.json
- Use `npm audit` to check for security vulnerabilities
- Keep dependencies minimal and well-justified
- Regular security updates
- Use lock files (package-lock.json) for reproducible builds
