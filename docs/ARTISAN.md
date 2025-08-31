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

# Create Request Resource

> [!TIP]
> The request resource used for validation scheme from the request parameter, if you from JavaScript family, the request resource is like Zod Scheme Validation.

1. Create Request Resource

> [!NOTE]
> Example
>
> ```bash
> php artisan make:request User/UpdateUserRequest
> ```

```bash
php artisan make:request <FolderName|ModelName>/<Action><FolderName|ModelName>Request
```
