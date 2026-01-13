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
            // 1. Core / Master
            ShieldSeeder::class,
            RajaOngkirProvinceSeeder::class,
            RajaOngkirCourierSeeder::class,

            // 2. User
            UserSeeder::class,
            ProfileSeeder::class,
            AddressSeeder::class,

            // 3. Product & Category
            CategorySeeder::class,
            ProductSeeder::class,
            ProductImageSeeder::class,
            CategoryProductSeeder::class,

            // 4. Coupon
            CouponSeeder::class,
            CouponProductSeeder::class,

            // 5. Cart
            CartSeeder::class,
            CartItemSeeder::class,

            // 6. Order
            OrderSeeder::class,
            OrderItemSeeder::class,

            // 7. Review
            ReviewSeeder::class,

            // 8. Banner
            BannerSeeder::class,
        ]);
    }
}
