# D Docker

## Build and test
- `docker build -t d-stakeholder .`
- `docker run --rm d-stakeholder --list-values`

## Rationale
- The image builds the D runtime with `ldc2` and packages the CLI binary.
- Docker is not part of Tranche D native validation on this workstation.
