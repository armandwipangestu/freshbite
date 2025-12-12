<?php

namespace App\Filament\Resources;

use App\Filament\Exports\BannerExporter;
use App\Filament\Resources\BannerResource\Pages;
use App\Filament\Resources\BannerResource\RelationManagers;
use App\Filament\Resources\BannerResource\Widgets\BannerStatsHeader;
use App\Models\Banner;
use Filament\Actions\Exports\Enums\ExportFormat;
use Filament\Forms;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Form;
use Filament\Forms\Set;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\BulkActionGroup;
use Filament\Tables\Actions\DeleteAction;
use Filament\Tables\Actions\DeleteBulkAction;
use Filament\Tables\Actions\EditAction;
use Filament\Tables\Actions\ExportAction;
use Filament\Tables\Actions\ExportBulkAction;
use Filament\Tables\Actions\ViewAction;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Contracts\HasTable;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Str;
use stdClass;

class BannerResource extends Resource
{
    protected static ?string $model = Banner::class;

    protected static ?string $navigationIcon = 'heroicon-o-photo';

    protected static ?string $navigationGroup = 'Product Management';

    public static function getNavigationBadge(): ?string
    {
        return (string) "Active " . Banner::where('is_active', true)->count();
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Create or Edit a Banner')
                    ->description('Create a new banner or edit an existing one over here.')
                    ->collapsible()
                    ->schema([
                        TextInput::make('target_url')
                            ->label('Target URL')
                            ->required()
                            ->maxLength(255),

                        Toggle::make('is_active')
                            ->label('Active')
                            ->inline(false)
                    ])
                    ->columnSpan(2)
                    ->columns(2),

                Section::make('Banner Image')
                    ->collapsible()
                    ->schema([
                        FileUpload::make('image')
                            ->label('Banner Image')
                            ->directory('banner-images')
                            ->image()
                            ->openable()
                            ->previewable()
                            ->downloadable(),
                    ])
                    ->columnSpan(1)
                    ->columns(1),
            ])
            ->columns(3);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')
                    ->label('ID')
                    ->sortable()
                    ->toggleable(),

                ImageColumn::make('image')
                    ->label('Banner Image')
                    ->toggleable(),

                TextColumn::make('target_url')
                    ->label('Target URL')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),

                TextColumn::make('is_active')
                    ->label('Active')
                    ->badge()
                    ->formatStateUsing(fn($state) => $state ? 'Active' : 'Inactive')
                    ->colors([
                        'success' => fn($state) => $state === 1,
                        'gray' => fn($state) => $state === 0,
                    ])
                    ->toggleable(),
            ])
            ->filters([
                TrashedFilter::make(),
            ])
            ->headerActions([
                ExportAction::make()
                    ->exporter(BannerExporter::class)
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
                ExportBulkAction::make()
                    ->exporter(BannerExporter::class)
                    ->color('primary')
                    ->formats([
                        ExportFormat::Csv,
                        ExportFormat::Xlsx,
                    ])
                    ->icon('heroicon-m-arrow-up-tray'),
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
            'index' => Pages\ListBanners::route('/'),
            'create' => Pages\CreateBanner::route('/create'),
            'edit' => Pages\EditBanner::route('/{record}/edit'),
        ];
    }

    public static function getWidgets(): array
    {
        return [
            BannerStatsHeader::class,
        ];
    }
}
