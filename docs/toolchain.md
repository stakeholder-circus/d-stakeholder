# D Toolchain

- State: Tranche D native runtime
- Compiler: `ldc2`
- Build tool: `dub`
- Recommended local install: `brew install ldc dub`

## Native commands
- `ldc2 --version`
- `dub --version`
- `python3 scripts/validate_scaffold.py`
- `dub build --compiler=ldc2`
- `dub test --compiler=ldc2`
- `dub run --compiler=ldc2 -- --list-values`

## Nix
- `nix develop`
- `nix run .#check`
