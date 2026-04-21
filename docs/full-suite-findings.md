# Full Suite Findings

During a local attempt to run the full Shopstr suite with coverage, the repository did not currently pass cleanly on the default branch.

## Command attempted

```bash
npm test -- --coverage --runInBand
```

## Failures observed

- `__tests__/api/nostr/verify-nip05.test.ts`
  - request handling currently fails around `x-forwarded-for` access
- `pages/api/db/__tests__/update-order-status.test.ts`
  - request IP handling fails in the tested route
- `components/utility-components/__tests__/product-card.test.tsx`
  - UI assertion no longer matches current rendered output
- `components/settings/__tests__/user-profile-form.test.tsx`
  - helper mock mismatch around `getLocalUserProfileKey`
- `components/settings/__tests__/shop-profile-form.test.tsx`
  - timeout and call-count mismatches

## Why this is proposal-relevant

These failures are not a reason to avoid CI work. They are part of the justification for it.

The project needs to do more than just add one workflow file. It needs to:

- turn the existing suite into a trustworthy merge signal
- stabilize or isolate pre-existing breakage where necessary
- focus new coverage on the state-sensitive paths where silent regressions matter most

This supports the proposal claim that the work is incremental, practical, and immediately valuable.
