# Create Service & Repository Resource

1. Create Service Resource

> [!NOTE]
> Example
>
> ```bash
> php artisan make:service User
> ```
>
> You can also send arguments to create a repository and interface at the same time
>
> ```bash
> php artisan make:service User --r|--repository
> ```

```bash
php artisan make:service <ModelName>
```

2. Create Repository Resource

> [!NOTE]
> Example
>
> ```bash
> php artisan make:repository User
> ```
>
> You can also send arguments to create a service at the same time
>
> ```bash
> php artisan make:repository User --s|--service
> ```

```bash
php artisan make:repository <ModelName>
```
