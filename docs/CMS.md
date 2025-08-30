# Create Resource

1. Create Filament Resource

> [!NOTE]
> Example
>
> ```bash
> php artisan make:filament-resource Coupon
> ```

```bash
php artisan make:filament-resource <ModelName>
```

2. Create Filament Exporter

> [!NOTE]
> Example
>
> ```bash
> php artisan make:filament-exporter Coupon
> ```

```bash
php artisan make:filament-exporter <ModelName>
```

3. Create Filament Relation Manager

> [!NOTE]
> Example
>
> ```bash
> php artisan make:filament-relation-manager CouponResource product name
> ```

```bash
php artisan make:filament-relation-manager <ResourceName> <relation_method> <field_name>
```

4. Create Filament View Resource

> [!NOTE]
> Example
>
> ```bash
> php artisan make:filament-page ViewCart --resource=CartResource --type=ViewRecord
> ```

```bash
php artisan make:filament-page View<ModelName> --resource=<ResourceName> --type=ViewRecord
```
