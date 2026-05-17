from pathlib import Path

required = [
    'README.md', 'AI_DISCLOSURE.md', 'PARITY.md', 'GAPS.md', 'AGENTS.md',
    'docs/remotes.md', 'docs/provenance.md', 'docs/toolchain.md', 'docs/tooling.md',
    'docs/docker.md', 'docs/edge-cases.md', 'docs/example-outputs.md', 'docs/experimental.md',
    'docs/language-specialties.md', 'docs/traceability/README.md',
    'docs/traceability/first-push-families.md', '.githooks/commit-msg', '.githooks/pre-push',
    '.github/CODEOWNERS', '.github/PULL_REQUEST_TEMPLATE.md', '.github/dependabot.yml',
    '.github/workflows/actionlint.yml', '.github/workflows/dependency-review.yml',
    '.github/workflows/ci.yml', '.github/workflows/ci-native.yml', '.github/workflows/docker-smoke.yml',
    'flake.nix', 'Dockerfile', 'flake.lock', 'dub.json', 'source/app.d', 'LICENSE',
]
missing = [p for p in required if not Path(p).exists()]
if missing:
    raise SystemExit('missing files: ' + ', '.join(missing))

for forbidden in ['Cargo.toml', 'Cargo.lock', 'rust-toolchain.toml']:
    if Path(forbidden).exists():
        raise SystemExit('Rust scaffold file still present: ' + forbidden)

license_text = Path('LICENSE').read_text()
if 'Copyright (c) 2025 giacomo-b' not in license_text:
    raise SystemExit('MIT upstream copyright notice missing')

app_text = Path('source/app.d').read_text()
for token in ['--list-values', '--focus-family', '--output-format', '--seed', '--experimental-provider', 'CLASSIC_SIX', 'MODERN_CORE']:
    if token not in app_text:
        raise SystemExit('missing D implementation token: ' + token)

print('d-stakeholder deterministic rewrite scaffold validated')
