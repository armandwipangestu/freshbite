<?php

namespace App\Filament\Resources\ProductResource\Pages;

use App\Filament\Resources\ProductResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Support\Facades\DB;

class EditProduct extends EditRecord
{
    protected static string $resource = ProductResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }

    protected function mutateFormDataBeforeFill(array $data): array
    {
        // Load the images associated with the product
        if (empty($data['images'])) {
            $data['images'] = $this->record->images->pluck('image')->toArray();
        }

        return $data;
    }

    protected function mutateFormDataBeforeSave(array $data): array
    {
        // Start a database transaction
        DB::transaction(function () use ($data) {
            // Update the product
            $this->record->update($data);

            // Update images in product_images table
            if (isset($data['images'])) {
                // Delete old images
                $this->record->images()->delete();

                // Save new images
                foreach ($data['images'] as $image) {
                    $this->record->images()->create(['image' => $image]);
                }
            }
        });

        return $data;
    }
}
