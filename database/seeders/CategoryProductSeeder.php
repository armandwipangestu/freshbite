<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\CategoryProduct;
use App\Models\Product;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategoryProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $mappings = [
            'Fresh Apple Fuji' => ['Fruits', 'Import'],
            'Local Banana Cavendish' => ['Fruits', 'Local'],
            'Organic Carrot' => ['Vegetables', 'Local'],
            'Imported Broccoli' => ['Vegetables', 'Import'],
            'Chili Seeds Premium' => ['Seeds'],
        ];

        foreach ($mappings as $productName => $categoryNames) {
            $product = Product::where('name', $productName)->first();

            if (! $product) {
                continue;
            }

            $categories = Category::whereIn('name', $categoryNames)->get();

            foreach ($categories as $category) {
                CategoryProduct::create([
                    'product_id'  => $product->id,
                    'category_id' => $category->id,
                ]);
            }
        }
    }
}
