<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        $products = [
            [
                'name' => 'Fresh Apple Fuji',
                'description' => 'Fresh and crispy Fuji apples, perfect for daily consumption.',
                'price' => 25000,
                'stock' => 100,
            ],
            [
                'name' => 'Local Banana Cavendish',
                'description' => 'Sweet local Cavendish bananas from local farmers.',
                'price' => 18000,
                'stock' => 120,
            ],
            [
                'name' => 'Organic Carrot',
                'description' => 'Organic carrots grown without pesticides.',
                'price' => 15000,
                'stock' => 80,
            ],
            [
                'name' => 'Imported Broccoli',
                'description' => 'Fresh imported broccoli with high nutritional value.',
                'price' => 32000,
                'stock' => 60,
            ],
            [
                'name' => 'Chili Seeds Premium',
                'description' => 'High quality chili seeds with fast germination.',
                'price' => 12000,
                'stock' => 200,
            ],
        ];

        foreach ($products as $data) {
            Product::create([
                'name' => $data['name'], // slug auto
                'description' => $data['description'],
                'price' => $data['price'],
                'stock' => $data['stock'],
                'total_sold' => 0,
                'is_published' => true,
            ]);
        }
    }
}
