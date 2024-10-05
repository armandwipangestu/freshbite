<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $superAdminRole = Role::firstOrCreate(['name' => 'super_admin']);
        $permissions = Permission::all();
        $superAdminRole->syncPermissions($permissions);
        $superAdminUser = User::create([
            'name' => 'Admin',
            'avatar' => fake()->imageUrl(),
            'email' => 'admin@freshbite.com',
            'email_verified_at' => now(),
            'password' => Hash::make('password'),
        ]);
        $superAdminUser->assignRole($superAdminRole);

        User::factory(10)->create();
    }
}
