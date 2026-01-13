<?php

namespace Database\Seeders;

use App\Models\Coupon;
use App\Models\CouponProduct;
use App\Models\Product;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CouponProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $coupon = Coupon::first();

        if (! $coupon) {
            return;
        }

        $productNames = [
            'Fresh Apple Fuji',
            'Organic Carrot',
            'Imported Broccoli',
        ];

        $products = Product::whereIn('name', $productNames)->get();

        foreach ($products as $product) {
            CouponProduct::create([
                'coupon_id'  => $coupon->id,
                'product_id' => $product->id,
            ]);
        }
    }
}
