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
