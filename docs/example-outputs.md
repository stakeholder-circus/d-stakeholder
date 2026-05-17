# D Example Outputs

## Enumerate contract values
```bash
dub run --compiler=ldc2 -- --list-values
```

## Focused JSON run
```bash
dub run --compiler=ldc2 -- --output-format json --seed 7 --duration 1 --focus-family metrics
```

## Security text run
```bash
dub run --compiler=ldc2 -- --dev-type security --jargon high --complexity extreme --alerts --seed 42
```

## Experimental fail-fast
```bash
dub run --compiler=ldc2 -- --experimental-provider local-demo
```
