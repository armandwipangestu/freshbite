<?php

namespace App\Filament\Resources;

use App\Filament\Exports\OrderExporter;
use App\Filament\Resources\OrderResource\Pages;
use App\Filament\Resources\OrderResource\RelationManagers;
use App\Filament\Resources\OrderResource\Widgets\OrderStatsHeader;
use App\Models\Order;
use Filament\Actions\Exports\Enums\ExportFormat;
use Filament\Forms;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\BulkActionGroup;
use Filament\Tables\Actions\DeleteAction;
use Filament\Tables\Actions\DeleteBulkAction;
use Filament\Tables\Actions\EditAction;
use Filament\Tables\Actions\ExportAction;
use Filament\Tables\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class OrderResource extends Resource
{
    protected static ?string $model = Order::class;

    protected static ?string $navigationIcon = 'heroicon-o-shield-check';

    protected static ?string $navigationGroup = 'Transaction Management';

    public static function getNavigationBadge(): ?string
    {
        return (string) "Paid " . Order::where('payment_status', 'paid')->count();
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Create or Edit a Order')
                    ->description('Create a new order or edit an existing one over here.')
                    ->collapsible()
                    ->schema([
                        TextInput::make('user_name')
                            ->label('User Name')
                            ->disabled()
                            ->required()
                            ->afterStateHydrated(fn($component, $state, $record) => $component->state($record->user?->name)),

                        TextInput::make('user_email')
                            ->label('Email')
                            ->disabled()
                            ->required()
                            ->afterStateHydrated(fn($component, $state, $record) => $component->state($record->user?->email)),

                        TextInput::make('payment_booking_code')
                            ->label('Payment Code')
                            ->required(),

                        TextInput::make('total_price')
                            ->label('Total Price')
                            ->numeric()
                            ->required()
                            ->prefix('IDR '),

                        Select::make('payment_status')
                            ->label('Payment Status')
                            ->options([
                                'paid' => 'Paid',
                                'pending' => 'Pending',
                                'failed' => 'Failed',
                                'waiting' => 'Waiting',
                            ])
                            ->required(),

                        TextInput::make('payment_url')
                            ->label('Payment URL')
                            ->url()
                            ->required(),

                        Select::make('courier_id')
                            ->label('Courier')
                            ->relationship('courier', 'code')
                            ->preload()
                            ->searchable()
                            ->required(),
                    ])
                    ->columnSpan('full')
                    ->columns(2),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('user.name')
                    ->label('User Name')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('user.email')
                    ->label('Email')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('payment_booking_code')
                    ->label('Payment Code')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('total_price')
                    ->money('idr', true)
                    ->label('Total Price')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('payment_status')
                    ->label('Payment Status')
                    ->badge()
                    ->formatStateUsing(fn(string $state): string => ucfirst($state))
                    ->color(fn(string $state): string => match ($state) {
                        'paid' => 'success',
                        'pending' => 'warning',
                        'failed' => 'danger',
                        'waiting' => 'warning',
                    })
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('payment_url')
                    ->label('Payment URL')
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->sortable()
                    ->searchable(),

                TextColumn::make('courier.code')
                    ->label('Courier')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('created_at')
                    ->label('Added At')
                    ->date('d-M-Y H:i')
                    ->sortable()
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),

                TextColumn::make('updated_at')
                    ->label('Last Updated At')
                    ->date('d-M-Y H:i')
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
            ])
            ->filters([
                TrashedFilter::make(),
            ])
            ->headerActions([
                ExportAction::make()
                    ->exporter(OrderExporter::class)
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
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            // RelationManagers\ProductRelationManager::class,
            RelationManagers\OrderItemsRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListOrders::route('/'),
            // 'create' => Pages\CreateOrder::route('/create'),
            'edit' => Pages\EditOrder::route('/{record}/edit'),
        ];
    }

    public static function getWidgets(): array
    {
        return [
            OrderStatsHeader::class,
        ];
    }
}
