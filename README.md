<h1 align="center">FreshBite: Fruit & Vegetable E-Commerce</h1>

<p align="center">An e-commerce (fruits & vegetables) build using Laravel, Filament, Inertia.js, React.js, Shadcn/ui, Midtrans, RajaOngkir, Google SSO </p>

<div align="center">

![Docker](https://img.shields.io/badge/-Docker-131821?style=for-the-badge&logo=docker)&nbsp;
![Laravel](https://img.shields.io/badge/-Laravel-131821?style=for-the-badge&logo=laravel)&nbsp;
![Vite](https://img.shields.io/badge/-Vite-131821?style=for-the-badge&logo=vite)&nbsp;
![React](https://img.shields.io/badge/-React-131821?style=for-the-badge&logo=react)&nbsp;
![Inertia.js](https://img.shields.io/badge/-Inertia.js-131821?style=for-the-badge&logo=inertia)&nbsp;
![TailwindCSS](https://img.shields.io/badge/-TailwindCSS-131821?style=for-the-badge&logo=tailwindcss)&nbsp;
![Shadcn/ui](https://img.shields.io/badge/-Shadcn/ui-131821?style=for-the-badge&logo=shadcnui)&nbsp;
![Filament](https://img.shields.io/badge/-Filament-131821?style=for-the-badge&logo=filament)&nbsp;
![Midtrans](https://img.shields.io/badge/-Midtrans-131821?style=for-the-badge&logo=midtrans)&nbsp;
![RajaOngkir](https://img.shields.io/badge/-RajaOngkir-131821?style=for-the-badge&logo=rajaongkir)&nbsp;
![Google SSO](https://img.shields.io/badge/-Google_SSO-131821?style=for-the-badge&logo=googlecloud)&nbsp;
![Cloudflare](https://img.shields.io/badge/-Cloudflare-131821?style=for-the-badge&logo=cloudflare)&nbsp;
![CI/CD](https://img.shields.io/badge/-CI/CD-131821?style=for-the-badge&logo=githubactions)&nbsp;

</div>

## Features

- **Modern E-Commerce**: Seamless shopping experience for fruits and vegetables.
- **Payment Gateway**: Secure transactions integrated with **Midtrans**.
- **Shipping Integration**: Real-time shipping cost calculations via **RajaOngkir**.
- **Secure Auth**: One-tap login using **Google SSO** (Socialite).
- **Admin Dashboard**: Powerful resource management with **Filament PHP**.
- **Fast Frontend**: Reactive UI powered by **React.js**, **Inertia.js**, and **Shadcn/ui**.
- **Docker Ready**: Optimized multi-stage builds and container orchestration.
- **Automated CI/CD**: Seamless deployment to servers behind NAT using **Cloudflare Tunnel**.

## Running the Application

### Option 1: Local Development (Native)

#### 1. Prerequisites
Ensure you have **PHP 8.2+**, **Composer**, **Node.js**, and **MySQL** installed.

#### 2. Setup
```bash
# Clone the repository
git clone https://github.com/armandwipangestu/freshbite.git
cd freshbite

# Install PHP dependencies
composer install

# Install JS dependencies
npm install

# Setup environment
cp .env.example .env
php artisan key:generate
```

#### 3. Database & Seeds
Update your `.env` with your database credentials, then run:
```bash
php artisan migrate --seed
```

#### 4. Run Development Servers
You will need two terminals running:

**Terminal A (Vite):**
```bash
npm run dev
```

**Terminal B (Laravel):**
```bash
php artisan serve
```

---

### Option 2: Using Docker (Recommended)

This project includes a fully containerized setup with Nginx, PHP-FPM, Queue Workers, and a Scheduler.

#### 1. Setup Environment
Create a `.env.docker` file or use your existing `.env`. Ensure `DB_HOST` is set to your database service name if using a shared network. Create a `.env.freshbite-db` file for the database service.

Here an example of `.env.freshbite-db`:

```env
MYSQL_ROOT_PASSWORD=your_root_password
MYSQL_DATABASE=freshbite
MYSQL_USER=your_database_user
MYSQL_PASSWORD=your_database_password
```

#### 2. Run with Docker Compose
Use the following example as a guide for your `docker-compose.yml`:

```yaml
services:
  db:
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

  app:
    image: ghcr.io/armandwipangestu/freshbite:latest
    container_name: freshbite-app
    restart: unless-stopped
    env_file: .env.production
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
      db:
        condition: service_healthy
    networks:
      - app-network

  proxy:
    image: ghcr.io/armandwipangestu/freshbite-proxy:latest
    container_name: freshbite-proxy
    restart: unless-stopped
    ports:
      - "8080:80"
    volumes:
      - ./storage/app/public:/var/www/html/public/storage
    logging:
      driver: "json-file"
      options:
        max-size: "500M"
        max-file: "3"
    depends_on:
      - app
    networks:
      - app-network

  queue:
    image: ghcr.io/armandwipangestu/freshbite:latest
    container_name: freshbite-queue
    restart: unless-stopped
    env_file: .env.production
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
      - app
    networks:
      - app-network

  scheduler:
    image: ghcr.io/armandwipangestu/freshbite:latest
    container_name: freshbite-scheduler
    restart: unless-stopped
    env_file: .env.production
    environment:
      - RUN_MIGRATIONS=false
    volumes:
      - ./storage:/var/www/html/storage
    command: php artisan schedule:run
    logging:
      driver: "json-file"
      options:
        max-size: "500M"
        max-file: "3"
    depends_on:
      - app
    networks:
      - app-network

networks:
  app-network:
    driver: bridge
```

Run the stack:
```bash
docker compose up -d
```

## Infrastructure

- **Optimization**: Uses a custom base image for PHP dependencies to reduce build times by >70%.
- **Reverse Proxy**: Nginx is configured to serve static assets and proxy PHP requests to the FPM container.
- **Workers**: A dedicated queue worker handles background jobs (emails, etc.).
- **Scheduler**: A lightweight cron-like service runs Laravel schedule commands.

## Sponsor this project

- Saweria: https://saweria.co/armandwipangestu