# Contributing

## Required checks

Before opening a pull request, run:

```bash
corepack pnpm verify
```

## Engineering rules

- Keep database changes additive and migration-backed.
- Do not commit environment files or secrets.
- Keep API route authorization on the backend; frontend route checks are never a substitute.
- Add tests with each vertical slice.
- Record architectural changes in `docs/architecture/adr/`.
- Do not implement future-session features early.
