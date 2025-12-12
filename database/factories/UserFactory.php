<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use App\Models\User;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class UserFactory extends Factory
{
    /**
     * The current password being used by the factory.
     */
    protected static ?string $password;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        // Create roles if they don't exist
        $adminRole = Role::firstOrCreate(['name' => 'admin']);
        $userRole = Role::firstOrCreate(['name' => 'user']);

        // Create permissions if they don't exist
        $manageUsersPermission = Permission::firstOrCreate(['name' => 'manage users']);
        $viewDashboardPermission = Permission::firstOrCreate(['name' => 'view dashboard']);

        // Assign permissions to roles
        $adminRole->syncPermissions([$manageUsersPermission, $viewDashboardPermission]);
        $userRole->syncPermissions([$viewDashboardPermission]);

        $created_at = fake()->dateTimeBetween('-1 year', 'now');
        $updated_at = fake()->dateTimeBetween($created_at, 'now');

        return [
            'name' => fake()->name(),
            'avatar' => 'https://i.pravatar.cc/200?img=' . fake()->numberBetween(1, 70),
            'email' => fake()->unique()->safeEmail(),
            'email_verified_at' => now(),
            'password' => static::$password ??= Hash::make('password'),
            'remember_token' => Str::random(10),
            'created_at' => $created_at,
            'updated_at' => $updated_at,
        ];
    }

    /**
     * Configure the model factory.
     *
     * @return $this
     */
    public function configure()
    {
        return $this->afterCreating(function (User $user) {
            // Get all roles and permissions
            $roles = Role::all();
            $permissions = Permission::all();

            // Assign a random role to the user
            $user->assignRole($roles->random());

            // Assign random permissions to the user
            $user->givePermissionTo($permissions->random(rand(1, $permissions->count())));
        });
    }

    /**
     * Indicate that the model's email address should be unverified.
     */
    public function unverified(): static
    {
        return $this->state(fn(array $attributes) => [
            'email_verified_at' => null,
        ]);
    }
}
