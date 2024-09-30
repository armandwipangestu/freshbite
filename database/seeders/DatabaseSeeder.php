<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            UserSeeder::class,
            ProfileSeeder::class,
            RajaOngkirProvinceSeeder::class,
            AddressSeeder::class,
            CategorySeeder::class,
            ProductSeeder::class,
            ProductImageSeeder::class,
            CategoryProductSeeder::class,
            CartSeeder::class,
            CartItemSeeder::class,
            WishlistSeeder::class,
            WishlistItemSeeder::class,
            RajaOngkirCourierSeeder::class,
            OrderSeeder::class,
            OrderItemSeeder::class,
        ]);
    }
}
