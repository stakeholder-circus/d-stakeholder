# D Parity

- Role: local-only Tranche D deterministic-first target
- Parity class: normalized-equivalent for deterministic JSON; pending for live providers

## Review model
- Rust remains the source audit anchor.
- Java depth-anchor behavior was reviewed as the first substantial follower shape.
- `stakeholder-core` remains the behavioral contract and fixture source.

## Current parity surface
- CLI flags and defaults mirror the deterministic Rust contract where practical.
- JSON output uses stable event ordering, stable synthetic timestamps, and same-seed family selection.
- Terminal styling is intentionally normalized away.
- Experimental provider activation fails fast and does not affect deterministic output.
