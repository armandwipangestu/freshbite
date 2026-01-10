ARG BASE_IMAGE=php:8.3-fpm-alpine

# =========================
# Stage 1: Build frontend assets
# =========================

FROM node:22-alpine AS frontend-builder

# Add the link to your new repository here
LABEL org.opencontainers.image.source="https://github.com/armandwipangestu/freshbite"

WORKDIR /var/www/html

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source frontend
COPY resources resources
COPY .storybook .storybook
COPY tsconfig.json vite.config.js tailwind.config.js postcss.config.js ./

# Build assets (production build for Vite + React + TailwindCSS)
RUN npm run build

# =========================
# Stage 2: PHP-FPM Laravel
# =========================

FROM ${BASE_IMAGE}

WORKDIR /var/www/html

# Copy Laravel backend
COPY . .

# Clear old cache
RUN rm -rf bootstrap/cache/*.php

# Copy built frontend assets
COPY --from=frontend-builder /var/www/html/public/build ./public/build

# Install PHP dependencies (App Level)
RUN composer install \
    # --no-dev \
    --no-interaction \
    --prefer-dist \
    # --no-scripts \
    --classmap-authoritative

# Copy entrypoint
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Permissions
RUN chown -R www-data:www-data storage bootstrap/cache public/build \
    && chmod -R 775 storage bootstrap/cache public/build

# Expose PHP-FPM port
EXPOSE 9000

# Entrypoint & CMD
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["php-fpm"]
