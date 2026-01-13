<?php

namespace Database\Seeders;

use App\Models\Product;
use App\Models\ProductImage;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductImageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $images = [
            'Fresh Apple Fuji' => [
                'product-images/apple-fuji-1.jpg',
                'product-images/apple-fuji-2.jpg',
            ],
            'Local Banana Cavendish' => [
                'product-images/banana-cavendish-1.jpg',
            ],
            'Organic Carrot' => [
                'product-images/carrot-organic-1.jpg',
            ],
            'Imported Broccoli' => [
                'product-images/broccoli-import-1.jpg',
            ],
            'Chili Seeds Premium' => [
                'product-images/chili-seeds-1.jpg',
            ],
        ];

        foreach ($images as $productName => $files) {
            $product = Product::where('name', $productName)->first();

            if (! $product) {
                continue;
            }

            foreach ($files as $file) {
                ProductImage::create([
                    'product_id' => $product->id,
                    'image' => $file,
                ]);
            }
        }
    }
}
