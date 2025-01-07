<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ReviewResource\Pages;
use App\Filament\Resources\ReviewResource\RelationManagers;
use App\Models\Review;
use Filament\Forms;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\BulkActionGroup;
use Filament\Tables\Actions\DeleteAction;
use Filament\Tables\Actions\DeleteBulkAction;
use Filament\Tables\Actions\EditAction;
use Filament\Tables\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class ReviewResource extends Resource
{
    protected static ?string $model = Review::class;

    protected static ?string $navigationIcon = 'heroicon-o-chat-bubble-bottom-center-text';

    protected static ?string $navigationGroup = 'Product Management';

    public static function getNavigationBadge(): ?string
    {
        return (string) "Published " . Review::where('is_published', true)->count();
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Create or Edit a Review')
                    ->description('Create a new review or edit an existing one over here.')
                    ->collapsible()
                    ->schema([
                        TextInput::make('star')
                            ->label('Rating')
                            ->numeric()
                            ->required()
                            ->suffixIcon('heroicon-m-star'),

                        Toggle::make('is_published')
                            ->label('Publish')
                            ->inline(false),

                        RichEditor::make('message')
                            ->required()
                            ->columnSpanFull()
                            ->toolbarButtons([
                                'blockquote',
                                'bold',
                                'bulletList',
                                'h2',
                                'h3',
                                'italic',
                                'link',
                                'orderedList',
                                'redo',
                                'strike',
                                'underline',
                                'undo',
                            ]),

                        Select::make('order_item_id')
                            ->label('Order Item')
                            ->suffixIcon('heroicon-m-swatch')
                            ->relationship('orderItem', 'id')
                            ->preload()
                            ->searchable(),

                        Select::make('product_id')
                            ->label('Product')
                            ->suffixIcon('heroicon-m-users')
                            ->relationship('product', 'name')
                            ->preload()
                            ->searchable(),

                        Select::make('roles')
                            ->suffixIcon('heroicon-m-shield-check')
                            ->relationship('roles', 'name')
                            ->multiple()
                            ->preload()
                            ->searchable(),
                    ])
                    ->columnSpan('full')
                    ->columns(2),
            ])->columns(2);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('user.name')
                    ->label('User')
                    ->sortable(),

                TextColumn::make('star')
                    ->label('Rating')
                    ->numeric()
                    ->sortable(),

                TextColumn::make('message')
                    ->label('Message')
                    ->sortable()
                    ->limit(50)
                    ->toggleable(isToggledHiddenByDefault: true),

                TextColumn::make('product.name')
                    ->label('Product')
                    ->sortable()
                    ->limit(50)
                    ->toggleable(),

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
                TrashedFilter::make(),
            ])
            ->actions([
                ViewAction::make(),
                EditAction::make(),
                DeleteAction::make(),
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
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListReviews::route('/'),
            'create' => Pages\CreateReview::route('/create'),
            'edit' => Pages\EditReview::route('/{record}/edit'),
        ];
    }
}
