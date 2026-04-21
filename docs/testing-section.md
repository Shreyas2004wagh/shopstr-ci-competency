# Draft Testing Section for `contributing.md`

## Testing

### 1. Run Tests

```bash
# Run all tests
npm test

# Run CI-style tests locally
npm test -- --ci

# Generate a local coverage report
npm test -- --coverage

# Run tests in watch mode during development
npm run test:watch
```

Shopstr uses Jest with the Next.js wrapper in `jest.config.cjs` and shared test environment setup in `jest.setup.js`. Tests are colocated with the code they exercise, usually in a nearby `__tests__` directory. Good entry points for examples include:

- `utils/nostr/__tests__/fetch-service.test.ts`
- `utils/nostr/__tests__/local-storage-data.test.ts`
- `utils/parsers/__tests__/product-parser-functions.test.ts`
- `components/utility-components/__tests__/product-card.test.tsx`

### 2. Run a Single Module or Test File

Use Jest's path filtering when working on one module:

```bash
# Run one test file
npx jest utils/nostr/__tests__/fetch-service.test.ts

# Run all tests for one area
npx jest utils/nostr/__tests__

# Collect coverage for a specific module while running targeted tests
npx jest utils/nostr/__tests__/fetch-service.test.ts --coverage --collectCoverageFrom=utils/nostr/fetch-service.ts
```

This is the fastest way to iterate on parser, cache, and Nostr helper changes without running the entire suite on every edit.

### 3. Writing Tests

- Write tests for new features and bug fixes.
- Keep tests close to the module under test, typically inside a neighboring `__tests__` directory.
- Prefer descriptive test names that explain the user-visible or state-sensitive behavior being protected.
- Reuse the existing mock-heavy patterns for Nostr, Cashu, fetch, and browser storage flows instead of introducing ad hoc test helpers.
