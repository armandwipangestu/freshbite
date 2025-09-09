<?php

namespace App\Filament\Resources\ProductResource\Pages;

use App\Filament\Resources\ProductResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\DB;

class CreateProduct extends CreateRecord
{
    protected static string $resource = ProductResource::class;

    protected function handleRecordCreation(array $data): \Illuminate\Database\Eloquent\Model
    {
        // Start a database transaction
        return DB::transaction(function () use ($data) {
            // Create the product
            $product = static::getModel()::create($data);

            // Save images to product_images table
            if (isset($data['images'])) {
                foreach ($data['images'] as $image) {
                    $product->images()->create(['image' => $image]);
                }
            }

            return $product;
        });
    }
}
