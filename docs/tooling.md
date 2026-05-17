# D Tooling

## Commands
- `python3 scripts/validate_scaffold.py`
- `dub build --compiler=ldc2`
- `dub test --compiler=ldc2`
- `dub run --compiler=ldc2 -- --output-format json --seed 7 --duration 1 --focus-family metrics`

## Notes
- Native validation is the required Tranche D gate.
- Docker remains configured for CI/reproducibility but was not run during this local tranche.
