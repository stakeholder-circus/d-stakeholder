# D Language Specialties

- The D runtime uses a compact value-type config and deterministic LCG scheduler for same-seed stability.
- JSON is emitted with explicit key order to keep normalized stream comparisons simple.
- Dub unit tests cover list-values, CLI parsing, and seeded scheduler stability.
