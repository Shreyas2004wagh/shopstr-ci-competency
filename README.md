# Shopstr CI Competency

This repository packages the competency-test work for the Shopstr project idea:

> Close the CI Test Gap - Enforce, Harden, and Measure the Shopstr Test Suite Across Every Hot Path

It is not a fork of `shopstr-eng/shopstr`, and it does not attempt to rehost Shopstr source code. Instead, it documents the investigation, the proposed CI workflow, the baseline coverage numbers, the current test blockers observed locally, and the exact artifacts produced for the competency test.

## Why this repo exists

The strongest way to demonstrate readiness for this project is to work against the real Shopstr repository instead of building an unrelated toy app. This repo captures that evidence in a compact, reviewable form.

The competency-test work completed here covers:

- drafting a GitHub Actions workflow that runs `npm test -- --ci` on pull requests to `main`
- inspecting the existing Jest setup and distributed test layout
- collecting local baseline coverage for the target Nostr modules
- drafting contributor-facing testing guidance for single-file and module-level Jest runs
- documenting pre-existing failures that currently block a clean full coverage run

## Repository structure

- [`artifacts/github-actions/test.yml`](./artifacts/github-actions/test.yml)
  Proposed GitHub Actions workflow for PR test enforcement.
- [`docs/testing-section.md`](./docs/testing-section.md)
  Draft Testing section suitable for `contributing.md`.
- [`docs/coverage-baseline.md`](./docs/coverage-baseline.md)
  Baseline coverage numbers extracted locally for the target modules.
- [`docs/full-suite-findings.md`](./docs/full-suite-findings.md)
  Summary of the failures observed during a full local test run.
- [`docs/project-scope.md`](./docs/project-scope.md)
  Rationale for why these modules and checks are the correct hot paths to prioritize.
- [`scripts/collect-target-coverage.ps1`](./scripts/collect-target-coverage.ps1)
  Helper script that runs the targeted coverage collection command used for the baseline.
- [`scripts/print-baseline.ps1`](./scripts/print-baseline.ps1)
  Small helper to print the recorded baseline in proposal-friendly form.

## Shopstr repository facts verified during this work

- Shopstr already has a substantial Jest test suite spread across colocated `__tests__` directories.
- The repo uses `next/jest` with `jest-environment-jsdom`.
- Shared test setup lives in `jest.setup.js`.
- At the time of inspection, only linting and formatting were enforced in GitHub Actions.
- There was no existing workflow that ran the test suite on pull requests to `main`.

## Competency-test baseline

Targeted coverage extraction over existing relevant tests produced this baseline:

- `utils/nostr/nostr-helper-functions.ts`
  - Statements: 13.97%
  - Branches: 14.79%
  - Functions: 10.97%
  - Lines: 14.46%
- `utils/nostr/fetch-service.ts`
  - Statements: 7.54%
  - Branches: 4.56%
  - Functions: 3.52%
  - Lines: 7.69%

These numbers confirm the core project claim: the high-risk Nostr modules are under-covered relative to their importance.

## Full-suite findings

A full local `npm test -- --coverage --runInBand` attempt surfaced several pre-existing failures on the default branch, including failures in:

- `__tests__/api/nostr/verify-nip05.test.ts`
- `pages/api/db/__tests__/update-order-status.test.ts`
- `components/utility-components/__tests__/product-card.test.tsx`
- `components/settings/__tests__/user-profile-form.test.tsx`
- `components/settings/__tests__/shop-profile-form.test.tsx`

This is useful proposal evidence because it shows the testing gap is not hypothetical. Shopstr already has meaningful tests, but they are not yet enforced or fully stabilized for CI.

## How this repo should be read

This repo is best treated as a compact competency artifact:

1. read the README for the context and deliverables
2. inspect the workflow and documentation artifacts
3. review the baseline coverage and failure notes
4. use the scripts as evidence of how the numbers were collected
