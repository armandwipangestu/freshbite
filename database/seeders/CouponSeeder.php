<?php

namespace Database\Seeders;

use App\Models\Coupon;
use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class CouponSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Coupon::updateOrCreate([
            'code'          => strtoupper(Str::random(10)),
            'discount'      => 9.00,
            'stock'         => 10,
            'expired_at'    => Carbon::now()->addDays(2),
            'is_active'     => true,
        ]);
    }
}
