FROM node:23-bookworm

WORKDIR /app

RUN npm install -g pnpm@9.13.2

COPY . .

RUN --mount=type=cache,target=/root/.local/share/pnpm/store/v3 \
    pnpm install --frozen-lockfile

RUN pnpm build:config

CMD ["pnpm", "liquidate:docker"] 