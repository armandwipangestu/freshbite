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
restore_assets() {
    SRC=$1
    DEST=$2
    NAME=$3
    
    if [ -d "$SRC" ]; then
        log "entrypoint" "INFO" "Syncing $NAME assets..."
        mkdir -p "$DEST"
        cp -rup "$SRC/." "$DEST/"
        log "entrypoint" "INFO" "$NAME assets synced."
    fi
}

# 1. Restore Main Images
restore_assets "docker/defaults/images" "storage/app/public/assets/images" "General"

# 2. Restore Banner Images
restore_assets "docker/defaults/banner-images" "storage/app/public/banner-images" "Banner"

# 3. Restore Product Images
restore_assets "docker/defaults/product-images" "storage/app/public/product-images" "Product"

# Fix permission
chown -R www-data:www-data storage bootstrap/cache public/build

log "entrypoint" "INFO" "Starting main process"
exec "$@"
