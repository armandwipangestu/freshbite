# =========================
# Stage 1: Build frontend assets
# =========================

FROM node:22-alpine AS frontend-builder

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

FROM php:8.3-fpm-alpine

WORKDIR /var/www/html

# Install PHP dependencies (OS Level)
RUN apk add --no-cache \
    bash git unzip curl libpng-dev libjpeg-turbo-dev \
    libwebp-dev libxpm-dev freetype-dev oniguruma-dev \
    zip libxml2-dev icu-dev mysql-client supervisor \
    libzip-dev

# Configure & install php extension
RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp --with-xpm \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd intl opcache zip \
    && rm -rf /var/cache/apk/*

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copy Laravel backend
COPY . .

# Clear old cache
RUN rm -rf bootstrap/cache/*.php

# Copy built frontend assets
COPY --from=frontend-builder /var/www/html/public/build ./public/build

# Install PHP dependencies (App Level)
RUN composer install \
    --no-dev \
    --no-interaction \
    --prefer-dist \
    --no-scripts \
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