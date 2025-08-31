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

# Create Api Resource

> [!TIP]
> The api resource used for expected return data from model when used api formatting
>
> Example content file of api resource
>
> ```php
> <?php
>
> namespace App\Http\Resources\Api;
>
> use Illuminate\Http\Request;
> use Illuminate\Http\Resources\Json\JsonResource;
>
> class UserResource extends JsonResource
> {
>     /**
>      * Transform the resource into an array.
>      *
>      * @return array<string, mixed>
>      */
>     public function toArray(Request $request): array
>     {
>         return [
>             'id' => $this->id,
>             'email' => $this->email,
>             'created_at' => $this->created_at->format('d/m/Y'),
>             'updated_at' => $this->updated_at->format('d/m/Y'),
>         ];
>     }
> }
> ```

1. Create Api Resource

> [!NOTE]
> Example
>
> ```bash
> php artisan make:resource Api/User/UpdateUserResource
> ```

```bash
php artisan make:resource Api/<FolderName|ModelName>/<Action><FolderName|ModelName>Resource
```

# Create Controller Resource

1. Create Ui Controller

> [!NOTE]
> Example
>
> ```bash
> php artisan make:controller Ui/User/UserController
> ```

```bash
php artisan make:controller Ui/<FolderName|ModelName>/<ModelName>Controller
```

2. Create Api Controller

> [!NOTE]
> Example
>
> ```bash
> php artisan make:controller Api/User/UserController --api
> ```

```bash
php artisan make:controller Api/<FolderName|ModelName>/<ModelName>Controller --api
```
