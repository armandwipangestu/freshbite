<?php

namespace App\Filament\Resources\WishlistResource\RelationManagers;

use App\Models\WishlistItem;
use Filament\Forms;
use Filament\Forms\Components\Select;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Validation\Rule;

class WishlistItemsRelationManager extends RelationManager
{
    protected static string $relationship = 'wishlistItems';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('product_id')
                    ->label('Product')
                    ->relationship(
                        'product',
                        'name',
                        function ($query, $get, $livewire) {
                            $wishlistId = $this->getOwnerRecord()->id;

                            $usedProductIds = WishlistItem::where('wishlist_id', $wishlistId)
                                ->pluck('product_id');

                            $currentRecord = $this->getMountedTableActionRecord();
                            $currentId = $currentRecord?->product_id;

                            if ($currentId) {
                                $usedProductIds = $usedProductIds->filter(fn($id) => $id !== $currentId);
                            }

                            $query->whereNotIn('id', $usedProductIds);
                        }
                    )
                    ->searchable()
                    ->preload()
                    ->required(),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('name')
            ->columns([
                ImageColumn::make('product.images')
                    ->label('Product Image')
                    ->getStateUsing(fn($record) => $record->product?->images?->first()?->image),

                TextColumn::make('product.name')
                    ->label('Product Name')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('product.price')
                    ->label('Price')
                    ->money('idr', true)
                    ->toggleable(),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
}
