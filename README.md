> [!WARNING]
> This repository is AI-assisted and manually reviewed. It is a local-only D rewrite target in Tranche D.

# d-stakeholder

D deterministic-first port of `rust-stakeholder` under stakeholder-circus.

## Status
- Tranche D runtime foundation implemented with `ldc2`/`dub`.
- Local-only; no upstream tracking and no publication yet.
- Default deterministic path supports normalized JSON and same-seed stability.

## CLI contract
- `--list-values`
- `--focus-family <family>`
- `--output-format text|json`
- `--seed <integer>`
- `--experimental-provider <name>` fail-fast with an explicit D gap id

## Family coverage
- Dedicated classic-six: `code_analyzer`, `data_processing`, `jargon`, `metrics`, `network_activity`, `system_monitoring`.
- Dedicated modern-core: agent workflow, AI runtime, platform, security, observability, preview, evaluation, retrieval, edge, identity, provenance, boundary, embedded, governance, and FinOps families.
- Later protocol, healthcare, charging, and quantum families are listed and routed through grouped deterministic fallback.

## Native validation
```bash
python3 scripts/validate_scaffold.py
dub build --compiler=ldc2
dub test --compiler=ldc2
dub run --compiler=ldc2 -- --list-values
dub run --compiler=ldc2 -- --output-format json --seed 7 --duration 1 --focus-family metrics
```

## Documentation
- [STATUS.md](STATUS.md)
- [PARITY.md](PARITY.md)
- [GAPS.md](GAPS.md)
- [docs/toolchain.md](docs/toolchain.md)
- [docs/traceability/first-push-families.md](docs/traceability/first-push-families.md)
