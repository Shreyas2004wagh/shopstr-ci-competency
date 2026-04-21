# Why These Hot Paths Matter

The target modules named in the Shopstr project idea are the right places to focus because they sit near user-visible and state-sensitive behavior.

## `utils/nostr/nostr-helper-functions.ts`

This file contains core helper behavior for:

- local storage recovery and signer interpretation
- message and order tag construction
- relay-related helper logic
- key and profile-related storage flows

Bugs here can be silent and cross-cutting because they feed many higher-level features.

## `utils/nostr/fetch-service.ts`

This file coordinates behavior such as:

- fetching profiles and products
- merging relay and cached database data
- wallet and message retrieval flows
- state updates through context callbacks

This is exactly the kind of logic that can look correct in isolation while still regressing under stale data, ordering issues, or side-effect mismatches.

## `utils/nostr/cache-service.ts`

Cache behavior is sensitive because stale state, duplicate writes, or incorrect reconciliation can produce user confusion without a dramatic crash. Tests here are valuable even when behavior seems simple on the surface.

## `utils/parsers/product-parser-functions.ts`

Parser logic is a reliability boundary. It transforms Nostr event tags into storefront data. If malformed, repeated, or legacy tags are mishandled, user-visible product state can degrade quietly. Parser tests should therefore defend compatibility as well as correctness.
