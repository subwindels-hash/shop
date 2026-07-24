# WINDELS MarketPlace Community

WINDELS MarketPlace Community is being built as an enterprise commerce operating system. This repository currently contains **Session 1, Slice 1.0** only: workspace scaffolding, local development infrastructure, quality tooling, CI, and minimal hello applications.

## Current scope

- Node.js/Express TypeScript API foundation
- Next.js App Router TypeScript frontend foundation
- Local PostgreSQL 16, Redis 7, and Mailpit infrastructure
- pnpm workspace, formatting, linting, type checking, tests, builds, and CI
- No authentication, migrations, product logic, mock data, or business modules yet

## Prerequisites

- Node.js `20.20.0` or newer (but lower than 23)
- Corepack
- Docker Desktop or Docker Engine with Docker Compose

## Local setup

```bash
corepack pnpm install
cp .env.example .env
cp apps/api/.env.example apps/api/.env
cp apps/web/.env.example apps/web/.env.local
corepack pnpm dev:infra
corepack pnpm dev
```

Local endpoints after both applications start:

- Web: <http://localhost:3000>
- API: <http://localhost:4000>
- Mailpit: <http://localhost:8025>

## Quality commands

```bash
corepack pnpm format:check
corepack pnpm lint
corepack pnpm typecheck
corepack pnpm test
corepack pnpm build
corepack pnpm verify
```

## Staging topology

The selected staging topology is **Vercel** for `@windels/web` and **Railway** for `@windels/api`, PostgreSQL, and Redis. Both providers deploy the protected `staging` branch through their native Git integrations; GitHub Actions remains a validation workflow and stores no cloud deployment tokens.

Provider setup and external verification are still required before Slice 1.0 can close. Follow `docs/runbooks/vercel-railway-staging.md` and the high-level prerequisites in `docs/runbooks/staging-deployment.md`.
