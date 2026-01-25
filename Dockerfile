# Base image for dependencies
FROM node:18-alpine AS deps
WORKDIR /app

# Install OpenSSL for Prisma
RUN apk add --no-cache openssl libc6-compat

COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* ./
COPY prisma ./prisma/

RUN \
  if [ -f yarn.lock ]; then yarn --frozen-lockfile; \
  elif [ -f package-lock.json ]; then npm ci; \
  elif [ -f pnpm-lock.yaml ]; then corepack enable pnpm && pnpm i --frozen-lockfile; \
  else echo "Warning: Lockfile not found. Running npm install..." && npm install; \
  fi

# Builder image
FROM node:18-alpine AS builder
WORKDIR /app

# Install OpenSSL for Prisma
RUN apk add --no-cache openssl libc6-compat

COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Set a dummy DATABASE_URL for Prisma to generate the client
# This is required because Prisma validates the connection string format at build time
# The actual database connection will be provided at runtime
ENV DATABASE_URL="postgresql://placeholder:placeholder@localhost:5432/placeholder?schema=public"

# Generate Prisma Client
RUN npx prisma generate

# Build Next.js application
# The SKIP_ENV_VALIDATION flag prevents environment variable checks during build
ENV NEXT_TELEMETRY_DISABLED=1
RUN npm run build

# Production image
FROM node:18-alpine AS runner
WORKDIR /app

# Install OpenSSL for Prisma runtime
RUN apk add --no-cache openssl libc6-compat

ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1

# Create a non-root user for security
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

# Copy necessary files for standalone output
COPY --from=builder /app/public ./public

# Set correct permissions for Next.js cache
RUN mkdir .next
RUN chown nextjs:nodejs .next

# Copy standalone build output
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

# Copy Prisma files for runtime
COPY --from=builder /app/node_modules/.prisma ./node_modules/.prisma
COPY --from=builder /app/node_modules/@prisma ./node_modules/@prisma

USER nextjs

EXPOSE 3000

ENV PORT=3000
ENV HOSTNAME="0.0.0.0"

CMD ["node", "server.js"]
