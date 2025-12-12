<?php

namespace App\Filament\Resources\WishlistResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Actions\AttachAction;
use Filament\Tables\Actions\DetachAction;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ProductRelationManager extends RelationManager
{
    protected static string $relationship = 'products';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('name')
            ->columns([
                ImageColumn::make('images')
                    ->label('Product Image')
                    ->getStateUsing(fn($record) => $record->images?->first()?->image),

                TextColumn::make('name')
                    ->label('Product Name')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('description')
                    ->label('Description')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable()
                    ->searchable(),

                TextColumn::make('price')
                    ->label('Price')
                    ->money('idr', true)
                    ->toggleable(),

                TextColumn::make('stock')
                    ->label('Stock')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('is_published')
                    ->label('Publish')
                    ->badge()
                    ->formatStateUsing(fn($state) => $state ? 'Published' : 'Unpublished')
                    ->colors([
                        'success' => fn($state) => $state === 1,
                        'gray' => fn($state) => $state === 0,
                    ]),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                AttachAction::make(),
            ])
            ->actions([
                DetachAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
}
