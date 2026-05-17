# d-stakeholder Status

Last updated: 2026-05-15 CEST

- Role: Tranche D deterministic-first D rewrite
- Parity class: normalized-equivalent deterministic target
- State: native-runtime-implemented-local-only
- Rewrite completeness: 52%
- Functionality completeness: 44%
- Branch: `main`
- Origin: `git@github.com:stakeholder-circus/d-stakeholder.git`
- Upstream: `https://github.com/giacomo-b/rust-stakeholder`

## Implemented
- D/Dub CLI with `--list-values`, `--focus-family`, `--output-format text|json`, `--seed`, and explicit `--experimental-provider` fail-fast.
- Dedicated deterministic renderers for classic-six and modern-core families.
- Grouped deterministic fallback for later families.
- Native validation script and D unit tests.

## Blockers
- Full live-provider runtime is intentionally deferred.
- Later family depth remains grouped fallback until a later tranche.
- Publication remains blocked until governance and remote access are approved.

## Next
- Expand later family renderers out of grouped fallback.
- Add cross-language fixture comparison when the workspace contract is ready for D.
