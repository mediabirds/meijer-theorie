FROM oven/bun:1.1.42-slim AS builder

ARG PUBLIC_DIRECTUS_URL
ENV PUBLIC_DIRECTUS_URL=$PUBLIC_DIRECTUS_URL

ARG EMAIL_FROM
ENV EMAIL_FROM=$EMAIL_FROM

ARG EMAIL_SMTP
ENV EMAIL_SMTP=$EMAIL_SMTP

ARG EMAIL_SMTP_HOST
ENV EMAIL_SMTP_HOST=$EMAIL_SMTP_HOST

ARG EMAIL_SMTP_PASSWORD
ENV EMAIL_SMTP_PASSWORD=$EMAIL_SMTP_PASSWORD

ARG EMAIL_SMTP_PORT
ENV EMAIL_SMTP_PORT=$EMAIL_SMTP_PORT

ARG EMAIL_SMTP_USER
ENV EMAIL_SMTP_USER=$EMAIL_SMTP_USER

ARG S3_ACCESS_KEY
ENV S3_ACCESS_KEY=$S3_ACCESS_KEY

ARG S3_SECRET_KEY
ENV S3_SECRET_KEY=$S3_SECRET_KEY

# Set working directory
WORKDIR /app

# Copy package files first for better caching
COPY package.json ./

# Install dependencies
RUN bun install

# Copy the rest of the application files
COPY . .

# Build the SvelteKit application
RUN bun run build

# Use a lightweight runtime image
FROM node:22-slim AS runner

WORKDIR /app

# Copy built app and dependencies
COPY --from=builder /app /app

# Expose the port SvelteKit runs on
EXPOSE 3000

# Start the application
CMD [ "node ./build/index.js" ]
