FROM oven/bun:1.1.42-slim AS builder

ARG PUBLIC_DIRECTUS_URL
ENV PUBLIC_DIRECTUS_URL=$PUBLIC_DIRECTUS_URL 

# Set working directory
WORKDIR /app

# Copy package files first for better caching
COPY package.json ./

# Install dependencies
RUN bun install --verbose

# Copy the rest of the application files
COPY . .

# Build the SvelteKit application
RUN bun run build

# Use a lightweight runtime image
FROM oven/bun:1.1.42-slim AS runner

WORKDIR /app

# Copy built app and dependencies
COPY --from=builder /app /app

# Expose the port SvelteKit runs on
EXPOSE 3000

# Start the application
CMD ["bun", "./build/index.js"]
