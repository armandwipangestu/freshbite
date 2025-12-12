<?php

namespace App\Filament\Resources\CartResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class CartItemsRelationManager extends RelationManager
{
    protected static string $relationship = 'cartItems';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('product_id')
                    ->relationship('product', 'name')
                    ->required()
                    ->searchable(),

                TextInput::make('quantity')
                    ->numeric()
                    ->required()
                    ->minValue(1)
                    ->default(1),
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

                TextColumn::make('quantity')
                    ->label('Quantity')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('product.price')
                    ->label('Price')
                    ->money('idr', true)
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('total_price')
                    ->label('Total Price')
                    ->money('idr', true)
                    ->getStateUsing(fn($record) => $record->product ? $record->product->price * $record->quantity : 0)
                    ->toggleable()
                    ->sortable()
                    ->searchable(),
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
