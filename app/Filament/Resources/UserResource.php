<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserResource\Pages;
use App\Filament\Resources\UserResource\RelationManagers;
use App\Filament\Resources\UserResource\Widgets\UserStatsFooter;
use App\Filament\Resources\UserResource\Widgets\UserStatsHeader;
use App\Models\Profile;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Components\Component;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Group;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\DeleteAction;
use Filament\Tables\Actions\DeleteBulkAction;
use Filament\Tables\Actions\EditAction;
use Filament\Tables\Actions\ViewAction;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\SelectColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class UserResource extends Resource
{
    protected static ?string $model = User::class;

    protected static ?string $navigationIcon = 'heroicon-o-user-group';

    protected static ?string $navigationGroup = 'Auth & User Management';

    public static function getNavigationBadge(): ?string
    {
        return (string) User::count();
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Create or Edit a User')
                    ->description('Create a new user or edit an existing one over here.')
                    ->collapsible()
                    ->schema([
                        TextInput::make('name')
                            ->required()
                            ->suffixIcon('heroicon-m-credit-card')
                            ->maxLength(255),

                        TextInput::make('email')
                            ->email()
                            ->suffixIcon('heroicon-m-envelope')
                            ->required()
                            ->maxLength(255),

                        TextInput::make('password')
                            ->password()
                            ->revealable()
                            ->maxLength(255)
                            ->rules([
                                'min:8',
                                'regex:/[a-z]/',
                                'regex:/[A-Z]/',
                                'regex:/[0-9]/',
                                'regex:/[@$!%*?&]/',
                            ])
                            ->validationMessages([
                                'min' => 'Password must be at least 8 characters long.',
                                'regex' => 'Password must contain at least 1 lowercase letter, 1 uppercase letter, 1 number, and 1 special character.',
                            ]),

                        Select::make('theme')
                            ->label('Theme')
                            ->suffixIcon('heroicon-m-swatch')
                            ->relationship('profile', 'theme')
                            ->options([
                                'light' => 'Light',
                                'dark' => 'Dark',
                                'system' => 'System',
                            ]),

                        Select::make('gender')
                            ->label('Gender')
                            ->suffixIcon('heroicon-m-users')
                            ->relationship('profile', 'gender')
                            ->options([
                                'male' => 'Male',
                                'female' => 'Female',
                                'prefer_not_to_say' => 'Prefer Not To Say',
                            ]),
                    ])
                    ->columnSpan(2)
                    ->columns(2),

                Section::make('Meta')
                    ->description('Meta data for the user.')
                    ->collapsible()
                    ->schema([
                        FileUpload::make('avatar')
                            ->image()
                            ->disk('public')
                            ->directory('avatars'),
                    ])
                    ->columnSpan(1)
                    ->columns(1),
            ])->columns(3);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                ImageColumn::make('avatar')
                    ->circular(),

                TextColumn::make('name')
                    ->sortable()
                    ->searchable(),

                TextColumn::make('email')
                    ->searchable(),

                TextColumn::make('profile.theme')
                    ->label('Theme')
                    ->badge()
                    ->formatStateUsing(fn(string $state): string => ucfirst($state))
                    ->color(fn(string $state): string => match ($state) {
                        'light' => 'success',
                        'dark' => 'warning',
                        'system' => 'gray',
                    })
                    ->searchable()
                    ->toggleable(),

                TextColumn::make('profile.gender')
                    ->label('Gender')
                    ->badge()
                    ->formatStateUsing(fn(string $state): string => ucfirst(str_replace('_', ' ', $state)))
                    ->color(fn(string $state): string => match ($state) {
                        'male' => 'success',
                        'female' => 'warning',
                        'prefer_not_to_say' => 'gray',
                    })
                    ->searchable()
                    ->toggleable(),

                TextColumn::make('created_at')
                    ->label('Registered At')
                    ->date('M d, Y')
                    ->sortable()
                    ->searchable()
                    ->toggleable(),
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
                Tables\Actions\BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            RelationManagers\AddressesRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListUsers::route('/'),
            'create' => Pages\CreateUser::route('/create'),
            'edit' => Pages\EditUser::route('/{record}/edit'),
            'view' => Pages\ViewUser::route('/{record}'),
        ];
    }

    public static function getWidgets(): array
    {
        return [
            UserStatsHeader::class,
            UserStatsFooter::class,
        ];
    }
}
