<?php

namespace App\Filament\Resources\CategoryResource\RelationManagers;

use App\Filament\Exports\ProductExporter;
use Filament\Actions\Exports\Enums\ExportFormat;
use Filament\Forms;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Form;
use Filament\Forms\Set;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Actions\CreateAction;
use Filament\Tables\Actions\DeleteAction;
use Filament\Tables\Actions\EditAction;
use Filament\Tables\Actions\ExportAction;
use Filament\Tables\Actions\ExportBulkAction;
use Filament\Tables\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Str;

class ProductsRelationManager extends RelationManager
{
    protected static string $relationship = 'products';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Create or Edit a Product')
                    ->description('Create a new product or edit an existing one over here.')
                    ->collapsible()
                    ->schema([
                        TextInput::make('name')
                            ->required()
                            ->afterStateUpdated(fn(Set $set, ?string $state) => $set('slug', Str::slug($state)))
                            ->live(debounce: 500)
                            ->maxLength(255),

                        TextInput::make('slug')
                            ->disabled(),

                        RichEditor::make('description')
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

                        Select::make('categories')
                            ->label('Categories')
                            ->relationship('categories', 'name')
                            ->multiple()
                            ->preload()
                            ->searchable(),

                        TextInput::make('price')
                            ->required()
                            ->numeric()
                            ->prefix('Rp'),

                        TextInput::make('stock')
                            ->required()
                            ->numeric()
                            ->default(0),

                        TextInput::make('total_sold')
                            ->required()
                            ->numeric()
                            ->default(0),

                        Toggle::make('is_published')
                            ->label('Publish')
                            ->inline(false)
                    ])
                    ->columnSpan(2)
                    ->columns(2),

                Section::make('Product Image')
                    ->collapsible()
                    ->schema([
                        FileUpload::make('images')
                            ->label('Product Image')
                            ->multiple()
                            ->directory('product-images')
                            ->image()
                            ->reorderable()
                            ->appendFiles()
                            ->openable()
                            ->previewable()
                            ->downloadable()
                    ])
                    ->columnSpan(1)
                    ->columns(1),
            ])
            ->columns(3);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('name')
            ->columns([
                TextColumn::make('name')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('slug')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable()
                    ->searchable(),

                TextColumn::make('description')
                    ->toggleable(isToggledHiddenByDefault: true),

                TextColumn::make('price')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('stock')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('total_sold')
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

                TextColumn::make('created_at')
                    ->label('Added At')
                    ->date('M d, Y')
                    ->sortable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),

                TextColumn::make('updated_at')
                    ->label('Last Updated At')
                    ->date('M d, Y')
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
            ])
            ->filters([
                TrashedFilter::make(),
            ])
            ->headerActions([
                CreateAction::make(),
                ExportAction::make()
                    ->exporter(ProductExporter::class)
                    ->color('primary')
                    ->formats([
                        ExportFormat::Csv,
                        ExportFormat::Xlsx,
                    ])
                    ->icon('heroicon-m-arrow-up-tray'),
            ])
            ->actions([
                ViewAction::make(),
                EditAction::make(),
                DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
                ExportBulkAction::make()
                    ->exporter(ProductExporter::class)
                    ->color('primary')
                    ->formats([
                        ExportFormat::Csv,
                        ExportFormat::Xlsx,
                    ])
                    ->icon('heroicon-m-arrow-up-tray'),
            ]);
    }
}
