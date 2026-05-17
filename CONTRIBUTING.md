# Contributing to d-stakeholder

## Rules
- Track the Rust source baseline and `stakeholder-core` contract.
- Use Conventional Commits.
- Do not hide missing parity; add a feature-level `GAPS.md` entry.
- Keep deterministic seeded JSON stable unless a baseline evolution explicitly changes it.

## Local workflow
- `python3 scripts/validate_scaffold.py`
- `dub build --compiler=ldc2`
- `dub test --compiler=ldc2`
- `dub run --compiler=ldc2 -- --list-values`

## Change discipline
- Generator-family additions must update docs, traceability, and native validation.
- Experimental provider work must remain separated from deterministic parity paths.
