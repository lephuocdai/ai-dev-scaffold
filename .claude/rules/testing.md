# Testing Rules

## Test Naming Convention

Format: `should [expectedResult] when [inputCondition]`

**Examples:**

```typescript
// Good
it('should display error message when form is submitted with empty fields');
it('should return 404 when resource is not found');

// Bad
it('works correctly');
it('test filter');
```

## Test Structure (BDD)

Use clear given/when/then separation:

```typescript
describe('FeatureName', () => {
  it('should do X when Y', () => {
    // given: setup test data
    const input = createTestInput({ status: 'active' });

    // when: perform action
    const result = processInput(input);

    // then: assert outcome
    expect(result.status).toBe('processed');
  });
});
```

## Test Data

### Use Factories over Manual Setup

```typescript
// factories/entity.ts
export const createEntity = (overrides?: Partial<Entity>): Entity => ({
  id: crypto.randomUUID(),
  status: 'active',
  name: 'Test Entity',
  ...overrides,
});

// In tests -- only specify what matters
const entity = createEntity({ status: 'resolved' });
```

## Assertions

### Compare Whole Objects

```typescript
// Good: Compare whole object
expect(result).toEqual({
  status: 'success',
  data: expectedData,
});

// Avoid: Checking individual fields (unless that's specifically what you're testing)
expect(result.status).toBe('success');
expect(result.data).toEqual(expectedData);
```

### One Assertion Concept Per Test

Each test should verify a single behavior. Multiple assertions are fine if they verify the same concept.

## Mocking

### Mock Only External Dependencies

```typescript
// Good: Mock API calls, databases, file system
vi.mock('../services/api', () => ({
  fetchItems: vi.fn().mockResolvedValue([]),
}));

// Avoid: Mocking internal utilities -- let the real implementation run
```

### Prefer Factories over Mocks

Use factory functions for test data rather than excessive mock return values.

## Test File Organization

- Keep test files next to source: `Component.tsx` -> `Component.test.tsx`
- Use `describe` blocks to group related tests
- Keep individual test methods under 20 lines
- Extract common setup to `beforeEach` or helper functions

## TDD-Specific Rules

- Reference test case ID from test design: `// TC-{PREFIX}-{NNN}: {description}`
- All P0 test cases from test design MUST be implemented
- If a test needs to change, that signals a spec change -- go back to spec
