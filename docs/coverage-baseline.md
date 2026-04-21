# Coverage Baseline

These numbers were collected locally against the current Shopstr repository state using targeted coverage runs over existing relevant tests.

## Target modules

### `utils/nostr/nostr-helper-functions.ts`

- Statements: 13.97%
- Branches: 14.79%
- Functions: 10.97%
- Lines: 14.46%

### `utils/nostr/fetch-service.ts`

- Statements: 7.54%
- Branches: 4.56%
- Functions: 3.52%
- Lines: 7.69%

## Why the baseline matters

The project is not starting from zero tests. It is starting from a codebase with real tests, real infrastructure, and a meaningful test gap in the highest-risk Nostr paths. These baseline values provide a measurable starting point for:

- CI enforcement
- targeted hot-path coverage expansion
- eventual coverage threshold selection

## Command used

```bash
npx jest utils/nostr/__tests__/local-storage-data.test.ts utils/nostr/__tests__/fetch-service.test.ts --coverage --runInBand --collectCoverageFrom=utils/nostr/nostr-helper-functions.ts --collectCoverageFrom=utils/nostr/fetch-service.ts --coverageReporters=text-summary --coverageReporters=json-summary
```
