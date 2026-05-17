# d-stakeholder AGENTS

- Preserve imported Rust history and provenance.
- Origin: `git@github.com:stakeholder-circus/d-stakeholder.git`
- Upstream: `https://github.com/giacomo-b/rust-stakeholder`
- Deterministic normalized JSON is the first implementation target.
- Missing behavior must fail fast and be recorded in `GAPS.md`.
- Use `ldc2` and `dub` for native work.
- Do not attach upstream tracking or publish without explicit instruction.

## Native commands
- `python3 scripts/validate_scaffold.py`
- `dub build --compiler=ldc2`
- `dub test --compiler=ldc2`
- `dub run --compiler=ldc2 -- --list-values`
