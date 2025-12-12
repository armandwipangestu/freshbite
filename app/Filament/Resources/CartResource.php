<?php

namespace App\Filament\Resources;

use App\Filament\Resources\CartResource\Pages;
use App\Filament\Resources\CartResource\RelationManagers;
use App\Models\Cart;
use App\Models\CartItem;
use Filament\Forms;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\BulkActionGroup;
use Filament\Tables\Actions\DeleteAction;
use Filament\Tables\Actions\DeleteBulkAction;
use Filament\Tables\Actions\EditAction;
use Filament\Tables\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class CartResource extends Resource
{
    protected static ?string $model = Cart::class;

    protected static ?string $navigationIcon = 'heroicon-o-shopping-cart';

    protected static ?string $navigationGroup = 'Auth & User Management';

    protected static ?string $navigationLabel = 'User Carts';
    protected static ?string $pluralLabel = 'User Carts';
    protected static ?string $label = 'User Cart';

    public static function getNavigationBadge(): ?string
    {
        // return (string) "Total " . Cart::count();
        return (string) "Items " . CartItem::sum('quantity');
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('user_name')
                    ->disabled()
                    ->label('User Name')
                    ->maxLength(255)
                    ->afterStateHydrated(
                        fn($component, $state, $record) =>
                        $component->state($record->user?->name)
                    ),

                TextInput::make('user_email')
                    ->disabled()
                    ->label('Email')
                    ->maxLength(255)
                    ->afterStateHydrated(
                        fn($component, $state, $record) =>
                        $component->state($record->user?->email)
                    ),

                TextInput::make('cart_items_count')
                    ->label('Items Count')
                    ->disabled()
                    ->default(0)
                    ->afterStateHydrated(
                        fn($component, $state, $record) =>
                        $component->state($record->cartItems()->count())
                    ),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('user.name')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('user.email')
                    ->label('Email')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('cart_items_count')
                    ->label('Items Count')
                    ->sortable()
                    ->counts('cartItems')
            ])
            ->filters([
                //
            ])
            ->actions([
                ViewAction::make(),
                EditAction::make(),
                // DeleteAction::make(),
            ])
            ->bulkActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            RelationManagers\CartItemsRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListCarts::route('/'),
            // 'create' => Pages\CreateCart::route('/create'),
            'edit' => Pages\EditCart::route('/{record}/edit'),
            'view' => Pages\ViewCart::route('/{record}'),
        ];
    }
}
