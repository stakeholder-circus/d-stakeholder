# d-stakeholder Status

Last updated: 2026-05-15 CEST

- Role: Tranche D deterministic-first D rewrite
- Parity class: normalized-equivalent deterministic target
- State: native-validated local deterministic tranche
- Rewrite completeness: 56%
- Functionality completeness: 48%
- Branch: `main`
- Origin: `git@github.com:stakeholder-circus/d-stakeholder.git`
- Upstream: `https://github.com/giacomo-b/rust-stakeholder`

## Implemented
- D/Dub CLI with `--list-values`, `--focus-family`, `--output-format text|json`, `--seed`, and explicit `--experimental-provider` fail-fast.
- Dedicated deterministic renderers for classic-six and modern-core families.
- Grouped deterministic fallback for later families.
- Native validation script and D unit tests.

## Evidence
- `python3 scripts/validate_scaffold.py`
- `ldc2 --version`
- `dub build --compiler=ldc2`
- `dub test --compiler=ldc2`
- `dub run --compiler=ldc2 -- --list-values`
- JSON smoke for `metrics`
- same-seed deterministic JSON diff for `platform_engineering`
- explicit `--experimental-provider local-demo` fail-fast smoke

## Blockers
- Full live-provider runtime is intentionally deferred.
- Later family depth remains grouped fallback until a later tranche.
- Publication remains blocked until governance and remote access are approved.

## Next
- Expand later family renderers out of grouped fallback.
- Add cross-language fixture comparison when the workspace contract is ready for D.
