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

log "entrypoint" "INFO" "Database ready. Running migrations..."

# Storage symlink
php artisan storage:link || true

# Migration
php artisan migrate --force

# Fix permission
chown -R www-data:www-data storage bootstrap/cache public/build

log "entrypoint" "INFO" "Starting container..."
exec "$@"
