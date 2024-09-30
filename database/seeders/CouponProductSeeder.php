<?php

namespace Database\Seeders;

use App\Models\CouponProduct;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CouponProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        CouponProduct::factory(10)->create();
    }
}
