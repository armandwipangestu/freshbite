#!/bin/bash
set -e

log() {
    NAME=$1
    LEVEL=$2
    MESSAGE=$3
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$TIMESTAMP] - $NAME - $LEVEL - $MESSAGE"
}

log "entrypoint" "INFO" "Starting entrypoint.sh"

mkdir -p storage/{app,debugbar,framework,logs} \
        storage/framework/{cache,sessions,testing,views}

# Wait for database to be ready 
until php -r "
try {
    new PDO(
        'mysql:host=' . getenv('DB_HOST') . ';port=' . getenv('DB_PORT'),
        getenv('DB_USERNAME'),
        getenv('DB_PASSWORD')
    );
} catch (Exception \$e) {
    exit(1);
}
"; do
  log "entrypoint" "INFO" "Waiting for database..."
  sleep 3
done

log "entrypoint" "INFO" "Database is available"

# Run migrations
if [ "$RUN_MIGRATIONS" = "true" ]; then
    log "entrypoint" "INFO" "Running migrations"
    php artisan migrate --force
fi

# Clear cache
log "entrypoint" "INFO" "Clearing & optimizing cache"
php artisan optimize:clear
php artisan optimize

# Storage symlink
php artisan storage:link || true

# Ensure default assets exist in volume
if [ ! -f "storage/app/public/assets/images/logo.png" ]; then
    log "entrypoint" "INFO" "Restoring default logo.png"
    mkdir -p storage/app/public/assets/images
    cp -n docker/defaults/logo.png storage/app/public/assets/images/logo.png || true
fi

if [ ! -f "storage/app/public/assets/images/favicon.png" ]; then
    log "entrypoint" "INFO" "Restoring default favicon.png"
    mkdir -p storage/app/public/assets/images
    cp -n docker/defaults/favicon.png storage/app/public/assets/images/favicon.png || true
fi

# Copy default banner images if missing
if [ -d "docker/defaults/banner-images" ]; then
    for img in docker/defaults/banner-images/*; do
        base=$(basename "$img")
        target="storage/app/public/banner-images/$base"
        if [ ! -f "$target" ]; then
            log "entrypoint" "INFO" "Restoring default banner image $base"
            mkdir -p "$(dirname "$target")"
            cp -n "$img" "$target" || true
        fi
    done
fi

# Copy default product images if missing
if [ -d "docker/defaults/product-images" ]; then
    for img in docker/defaults/product-images/*; do
        base=$(basename "$img")
        target="storage/app/public/product-images/$base"
        if [ ! -f "$target" ]; then
            log "entrypoint" "INFO" "Restoring default product image $base"
            mkdir -p "$(dirname "$target")"
            cp -n "$img" "$target" || true
        fi
    done
fi

# Fix permission
chown -R www-data:www-data storage bootstrap/cache public/build

log "entrypoint" "INFO" "Starting main process"
exec "$@"
