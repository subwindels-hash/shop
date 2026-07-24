FROM node:20.20.2-alpine AS build

WORKDIR /workspace
RUN corepack enable

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
COPY apps/api/package.json apps/api/package.json
RUN corepack pnpm install --frozen-lockfile --filter @windels/api...

COPY tsconfig.base.json ./
COPY apps/api ./apps/api
RUN corepack pnpm --filter @windels/api build

FROM node:20.20.2-alpine AS runtime

WORKDIR /workspace
ENV NODE_ENV=production
RUN corepack enable

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
COPY apps/api/package.json apps/api/package.json
RUN corepack pnpm install --frozen-lockfile --prod --filter @windels/api...

COPY --from=build /workspace/apps/api/dist ./apps/api/dist

WORKDIR /workspace/apps/api
EXPOSE 4000
CMD ["node", "dist/server.js"]
