# D Edge Cases

- Same seed plus same CLI inputs must produce the same normalized JSON stream.
- `--focus-family` bypasses scheduler selection and emits only the requested family.
- `--experimental-provider` always fails fast in this tranche.
- Later families are selectable but use grouped fallback copy until expanded.
