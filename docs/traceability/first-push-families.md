# First-push families for d-stakeholder

| Rust source | Line range | Behavior | D target | Rationale | Parity class |
| --- | --- | --- | --- | --- | --- |
| `src/main.rs` | `23-58` | CLI flags and defaults, extended with deterministic extras | `source/app.d` | Preserve user-facing contract and add Tranche D `--focus-family`/provider guard | normalized-equivalent |
| `src/main.rs` | `63-146` | Session config, seeded scheduler, JSON/text output dispatch | `source/app.d` | Implement deterministic-first runtime without terminal timing dependency | normalized-equivalent |
| `src/types.rs` | `1-54` | Development, jargon, complexity, and output-format values | `source/app.d` | Keep CLI enum strings and `--list-values` stable | exact |
| `src/activities.rs` | `11-112` | List-values payload, boot event, termination event | `source/app.d` | Preserve normalized JSON shape and synthetic sequence/timestamp behavior | normalized-equivalent |
| `src/generators/code_analyzer.rs` | `1-513` | Classic code-analysis family behavior | `source/app.d` | Dedicated deterministic D renderer | normalized-equivalent |
| `src/generators/data_processing.rs` | `1-264` | Classic data-processing family behavior | `source/app.d` | Dedicated deterministic D renderer | normalized-equivalent |
| `src/generators/jargon.rs` | `1-352` | Jargon family routed by dev type and jargon level | `source/app.d` | Dedicated deterministic D renderer | normalized-equivalent |
| `src/generators/metrics.rs` | `1-294` | Metrics family status and optimization copy | `source/app.d` | Dedicated deterministic D renderer | normalized-equivalent |
| `src/generators/network_activity.rs` | `1-337` | Network activity family | `source/app.d` | Dedicated deterministic D renderer | normalized-equivalent |
| `src/generators/system_monitoring.rs` | `1-75` | System monitoring family | `source/app.d` | Dedicated deterministic D renderer | normalized-equivalent |
| `src/generators/mod.rs` | `58-111` | Modern-core family routing | `source/app.d` | Dedicated deterministic D renderers for modern-core families | normalized-equivalent |
| `src/generators/mod.rs` | `112-158` | Later protocol/health/charging family routing | `source/app.d` | Listed and selectable with grouped deterministic fallback | pending |
| `stakeholder-core/packets/java-first/inputs/java-traceability-rows.json` | `1-17` | Java first-target traceability expectations | `docs/traceability/first-push-families.md` | Align D rows with the first follower audit model | normalized-equivalent |
