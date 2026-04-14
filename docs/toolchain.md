  # D Toolchain

  - State: scaffold-only next-20 prep
  - Toolchain source: `brew`

  ## Planned commands after promotion
    - `brew install ldc dub`
- `ldc2 --version`
- `dub --version`

  ## Scaffold-time checks
  - `python3 scripts/validate_scaffold.py`
  - `/nix/var/nix/profiles/default/bin/nix --extra-experimental-features 'nix-command flakes' flake lock`

  ## Current limitation
  - Requires Brew install of ldc and dub before implementation.
