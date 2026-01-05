# Insallation Setup

1. Clone this repository

```bash
git clone git@github.com:armandwipangestu/freshbite.git
cd freshbite
```

2. Install dependency

```bash
composer install
npm install
npm run dev

# or if you want to build production, run this
# npm run build
```

3. Copy environment file

> [!IMPORTANT]
> Update configuration `.env` with your own configuration (DB, Mailtrap, Google OIDC, Midtrans, RajaOngkir)

```bash
cp .env.example .env
php artisan key:generate
```

4. Migrate & Seed Database

```bash
php artisan migrate:fresh --seed
```

5. Generate Shield Permission & Policies

```bash
php artisan shield:generate --all
```

6. Assign Super Admin User

```bash
php artisan shield:super-admin
```

7. Clear Cache (opsional)

```bash
php artisan optimize:clear
```

8. Remove & Re-Symlink Folder Storage

```bash
rm public/storage
php artisan storage:link
```

9. Run Development Server

```bash
php artisan serve
```

Login and access panel admin at `http://localhost:8000/admin`

10. Run the queue background process on other terminal session

```bash
php artisan queue:work
```

# Docker Setup

1. Build Container Image

```bash
git clone git@github.com:armandwipangestu/freshbite.git
cd freshbite

docker build --platform linux/amd64 -f Dockerfile -t freshbite-app:test .
docker build --platform linux/amd64 -f Dockerfile.proxy -t freshbite-proxy:test .
```

2. Create docker-compose.yml

```bash
cd /opt/docker-app/freshbite
```

```bash
nvim docker-compose.yml
```

```yml
services:
  freshbite-db:
    image: mariadb:12.0.2-noble
    container_name: freshbite-db
    restart: unless-stopped
    env_file: .env.freshbite-db
    volumes:
      - ./docker-data/freshbite-db:/var/lib/mysql
    healthcheck:
      test: ["CMD", "healthcheck.sh", "--connect", "--innodb_initialized"]
      interval: 5s
      timeout: 3s
      retries: 5
      start_period: 5s
    logging:
      driver: "json-file"
      options:
        max-size: "500M"
        max-file: "3"
    ports:
      - "3309:3306"

  freshbite-app:
    image: freshbite-app:test
    container_name: freshbite-app
    restart: unless-stopped
    env_file: .env.freshbite-app
    environment:
      - RUN_MIGRATIONS=true
    volumes:
      - ./storage:/var/www/html/storage
    logging:
      driver: "json-file"
      options:
        max-size: "500M"
        max-file: "3"
    depends_on:
      freshbite-db:
        condition: service_healthy

  freshbite-proxy:
    image: freshbite-proxy:test
    container_name: freshbite-proxy
    restart: unless-stopped
    ports:
      - "89:80"
    volumes:
      - ./storage/app/public:/var/www/html/public/storage
      - ./docker/nginx.conf:/etc/nginx/conf.d/default.conf
    logging:
      driver: "json-file"
      options:
        max-size: "500M"
        max-file: "3"
    depends_on:
      - freshbite-app

  freshbite-queue:
    image: freshbite-app:test
    container_name: freshbite-queue
    restart: unless-stopped
    env_file: .env.freshbite-app
    environment:
      - RUN_MIGRATIONS=false
    volumes:
      - ./storage:/var/www/html/storage
    command: php artisan queue:work --verbose --tries=3 --timeout=90
    logging:
      driver: "json-file"
      options:
        max-size: "500M"
        max-file: "3"
    depends_on:
      - freshbite-app

  freshbite-scheduler:
    image: freshbite-app:test
    container_name: freshbite-scheduler
    restart: unless-stopped
    env_file: .env.freshbite-app
    environment:
      - RUN_MIGRATIONS=false
    volumes:
      - ./storage:/var/www/html/storage
    command: sh -c "while true; do php artisan schedule:run --verbose; sleep 60; done"
    logging:
      driver: "json-file"
      options:
        max-size: "500M"
        max-file: "3"
    depends_on:
      - freshbite-app
```

3. Create nginx configuration

```bash
mkdir docker
nvim docker/nginx.conf
```

```nginx
server {
    listen 80;
    server_name _;
    root /var/www/html/public;
    index index.php;

    location /build/ {
        try_files $uri =404;
        expires 1y;
        add_header Cache-Control "public, immutable";
    }

    location /storage/ {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_pass freshbite-app:9000;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param DOCUMENT_ROOT $document_root;
    }
}
```

4. Create environment file

```bash
nvim .env.freshbite-app
```

```env
APP_NAME=FreshBite-Dummy
APP_ENV=production
APP_KEY=base64:AZnRvz4CETXiIsyYw7Jwpr23jObOeQXXtcn8KCvua1o=
APP_DEBUG=false
APP_TIMEZONE=UTC
APP_URL=http://localhost:89

APP_LOCALE=en
APP_FALLBACK_LOCALE=en
APP_FAKER_LOCALE=en_US

APP_MAINTENANCE_DRIVER=file
# APP_MAINTENANCE_STORE=database

BCRYPT_ROUNDS=12

LOG_CHANNEL=stack
LOG_STACK=single
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=debug

DB_CONNECTION=mysql
DB_HOST=freshbite-db
DB_PORT=3306
DB_DATABASE=freshbite_dummy
DB_USERNAME=freshbite_user
DB_PASSWORD="freshbite_password"

# DB_CONNECTION=pgsql # make sure enable pgsql extension in php.ini
# DB_HOST=127.0.0.1
# DB_PORT=5432
# DB_DATABASE=freshbite_dummy
# DB_USERNAME=user_freshbite_dummy
# DB_PASSWORD=

SESSION_DRIVER=database
SESSION_LIFETIME=120
SESSION_ENCRYPT=false
SESSION_PATH=/
SESSION_DOMAIN=null

BROADCAST_CONNECTION=log
FILESYSTEM_DISK=local
QUEUE_CONNECTION=database

CACHE_STORE=database
CACHE_PREFIX=

MEMCACHED_HOST=127.0.0.1

REDIS_CLIENT=phpredis
REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=log
MAIL_HOST=127.0.0.1
MAIL_PORT=2525
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS="hello@example.com"
MAIL_FROM_NAME="${APP_NAME}"

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
AWS_USE_PATH_STYLE_ENDPOINT=false

VITE_APP_NAME="${APP_NAME}"

GOOGLE_CLIENT_ID=
GOOGLE_CLIENT_SECRET=
GOOGLE_CLIENT_REDIRECT=http://localhost:89/auth/google/callback

MIDTRANS_SERVER_KEY=""
MIDTRANS_CLIENT_KEY=""
MIDTRANS_IS_PRODUCTION=false
MIDTRANS_IS_SANITIZED=false
MIDTRANS_IS_3DS=false

RAJAONGKIR_API_KEY=
```

```bash
nvim .env.freshbite-db
```

```env
MYSQL_ROOT_PASSWORD=""
MYSQL_DATABASE="freshbite_dummy"
MYSQL_USER="freshbite_user"
MYSQL_PASSWORD="freshbite_password"
```

5. Run the container

```bash
docker compose up -d
```

6. Database Seeder and Filament Admin Init

```bash
docker exec -it freshbite-app php artisan db:seed
docker exec -it freshbite-app php artisan shield:generate --all
docker exec -it freshbite-app php artisan shield:super-admin
```

7. Fix permission & symlink

```bash
sudo chmod -R 775 storage
docker exec -it freshbite-app rm -f public/storage
docker exec -it freshbite-app mkdir -p storage/app/public
docker exec -it freshbite-app php artisan storage:link

# Copy you assets file (e.g., favicon, logo, etc.)
sudo cp -R <freshbite_path>/storage/app/public/* storage/app/public
sudo chown -R 82:82 storage
```