# Build Angular app
FROM node:22-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build


# Serve built Angular app with Caddy
FROM caddy:2-alpine

ENV PORT=8080
ENV ANGULAR_OUTPUT_PATH=/srv

COPY Caddyfile /etc/caddy/Caddyfile

# Angular outputPath is dist/my-app
COPY --from=build /app/dist/my-app /srv

EXPOSE 8080

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
