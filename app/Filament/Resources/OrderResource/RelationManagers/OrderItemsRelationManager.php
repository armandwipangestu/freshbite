<?php

namespace App\Filament\Resources\OrderResource\RelationManagers;

use App\Models\Product;
use Filament\Forms;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use \Filament\Forms\Components\TextInput\Mask;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Support\RawJs;
use Filament\Tables;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class OrderItemsRelationManager extends RelationManager
{
    protected static string $relationship = 'orderItems';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('product_id')
                    ->relationship('product', 'name')
                    ->required()
                    ->searchable()
                    ->reactive()
                    ->afterStateUpdated(function ($state, callable $get, callable $set) {
                        if ($state && $get('quantity')) {
                            $product = Product::find($state);
                            if ($product) {
                                $total = $product->price * $get('quantity');
                                $set('price', number_format($total, 0, ',', '.'));
                            }
                        }
                    }),

                TextInput::make('quantity')
                    ->numeric()
                    ->required()
                    ->minValue(1)
                    ->default(1)
                    ->reactive()
                    ->afterStateUpdated(function ($state, callable $get, callable $set) {
                        if ($get('product_id')) {
                            $product = Product::find($get('product_id'));
                            if ($product) {
                                $total = $product->price * $state;
                                $set('price', number_format($total, 0, ',', '.'));
                            }
                        }
                    }),

                TextInput::make('price')
                    ->label('Total Price')
                    ->numeric()
                    ->required()
                    ->readOnly()
                    ->dehydrated() // store to DB while disabled
                    ->reactive()
                    ->afterStateHydrated(function ($component, $state) {
                        $component->state(number_format($state, 0, ',', '.'));
                    })
                    ->mask(RawJs::make("
                        function(input) {
                            // remove all non-digit
                            let value = input.replace(/\\D/g,'');
                            // formatting to IDR thousand format
                            return new Intl.NumberFormat('id-ID').format(value);
                        }
                    "))
                    ->stripCharacters('.') // remove dot thousand when store to DB
                    ->prefix('Rp '),
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

                TextColumn::make('price')
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
