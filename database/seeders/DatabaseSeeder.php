<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Create roles
        $adminRole = Role::create(['name' => 'admin']);
        $userRole = Role::create(['name' => 'user']);

        // Create permissions
        $manageUsersPermission = Permission::create(['name' => 'manage users']);
        $viewDashboardPermission = Permission::create(['name' => 'view dashboard']);

        // Assign permissions to roles
        $adminRole->givePermissionTo($manageUsersPermission);
        $adminRole->givePermissionTo($viewDashboardPermission);
        $userRole->givePermissionTo($viewDashboardPermission);

        // Create users and assign roles
        $admin = User::factory()->create([
            'name' => 'Admin User',
            'email' => 'admin@example.com',
        ]);
        $admin->assignRole($adminRole);

        $user = User::factory()->create([
            'name' => 'Regular User',
            'email' => 'user@example.com',
        ]);
        $user->assignRole($userRole);
    }
}
