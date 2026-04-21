# Competency Mapping

This file maps each stated competency-test requirement to the artifact in this repository that satisfies it.

## Requirement 1

Add a `test.yml` GitHub Actions workflow that runs `npm test -- --ci` on `pull_request` targeting `main`.

Mapped artifact:

- [`artifacts/github-actions/test.yml`](./artifacts/github-actions/test.yml)

What it shows:

- workflow name and trigger on `pull_request`
- branch target `main`
- dependency install via `npm ci`
- CI test command `npm test -- --ci`

## Requirement 2

Run `npm test -- --coverage` locally, extract coverage for `utils/nostr/nostr-helper-functions.ts` and `utils/nostr/fetch-service.ts`, and report the baseline numbers.

Mapped artifacts:

- [`docs/coverage-baseline.md`](./docs/coverage-baseline.md)
- [`scripts/collect-target-coverage.ps1`](./scripts/collect-target-coverage.ps1)
- [`scripts/print-baseline.ps1`](./scripts/print-baseline.ps1)
- [`docs/full-suite-findings.md`](./docs/full-suite-findings.md)

What they show:

- recorded baseline percentages for both required target files
- the exact coverage command used to collect the targeted baseline
- a reproducible helper script for rerunning the collection
- documentation of the current full-suite failures that prevented a clean full coverage artifact from the default branch

## Requirement 3

Draft a Testing section for `contributing.md` that links to existing tests and explains the Jest setup and single-module test workflow.

Mapped artifact:

- [`docs/testing-section.md`](./docs/testing-section.md)

What it shows:

- how to run all tests, CI-style tests, and coverage
- how to run single test files and module-scoped test runs
- references to the actual Jest setup and real Shopstr test locations
- contributor guidance for writing new tests consistently

## Supporting Context

These files are not strictly required by the competency test, but they strengthen the submission by showing project understanding rather than just task completion.

Supporting artifacts:

- [`README.md`](./README.md)
- [`docs/project-scope.md`](./docs/project-scope.md)

What they add:

- explains why this repo is an evidence artifact rather than a fork or toy project
- shows why the targeted modules are the right hot paths for the actual Shopstr proposal
