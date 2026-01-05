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

# Fix permission
chown -R www-data:www-data storage bootstrap/cache public/build

log "entrypoint" "INFO" "Starting main process"
exec "$@"
