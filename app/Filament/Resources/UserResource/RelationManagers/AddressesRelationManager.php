<?php

namespace App\Filament\Resources\UserResource\RelationManagers;

use App\Models\RajaOngkirCity;
use App\Models\RajaOngkirProvince;
use Filament\Forms;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Form;
use Filament\Forms\Set;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class AddressesRelationManager extends RelationManager
{
    protected static string $relationship = 'addresses';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Province and City')
                    ->collapsible()
                    ->schema([
                        Select::make('province_id')
                            ->relationship('province', 'name')
                            ->searchable()
                            ->preload()
                            ->live()
                            ->afterStateUpdated(function (Set $set) {
                                $set('city_id', null);
                                $set('type', null);
                                $set('postal_code', null);
                            })
                            ->required(),

                        Select::make('city_id')
                            ->relationship('city', 'name')
                            ->searchable()
                            ->preload()
                            ->options(function (callable $get) {
                                $province_id = $get('province_id');
                                if ($province_id) {
                                    return RajaOngkirCity::where('province_id', $province_id)->pluck('name', 'id');
                                }
                                return RajaOngkirCity::pluck('name', 'id');
                            })
                            ->live()
                            ->afterStateUpdated(function (Set $set, $state) {
                                if ($state) {
                                    $city = RajaOngkirCity::find($state);
                                    if ($city) {
                                        $set('type', $city->type);
                                        $set('postal_code', $city->postal_code);
                                    }
                                }
                            })
                            ->afterStateHydrated(function (Set $set, $state) {
                                if ($state) {
                                    $city = RajaOngkirCity::find($state);
                                    if ($city) {
                                        $set('type', $city->type);
                                        $set('postal_code', $city->postal_code);
                                    }
                                }
                            })
                            ->required(),

                        TextInput::make('type')
                            ->label('Type')
                            ->disabled(),

                        TextInput::make('postal_code')
                            ->label('Postal Code')
                            ->disabled(),
                    ])->columns(2),

                Section::make('User Information')
                    ->collapsible()
                    ->schema([
                        TextInput::make('label_name')
                            ->required()
                            ->maxLength(255),

                        TextInput::make('recipient_name')
                            ->required()
                            ->maxLength(255),

                        TextInput::make('phone_number')
                            ->required()
                            ->maxLength(255),
                    ])->columns(3),

                Section::make('User Address')
                    ->collapsible()
                    ->schema([
                        TextInput::make('address')
                            ->required()
                            ->maxLength(255),

                        TextInput::make('note_for_courier')
                            ->required()
                            ->maxLength(255),

                        Toggle::make('is_default')
                            ->label('Active')
                            ->inline(false)
                    ])->columns(3),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('address')
            ->columns([
                TextColumn::make('label_name')
                    ->label('Label Name')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('recipient_name')
                    ->label('Recipient Name')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('phone_number')
                    ->label('Phone Number'),

                TextColumn::make('address')
                    ->label('Address'),

                TextColumn::make('province.name')
                    ->label('Province')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('city.name')
                    ->label('City')
                    ->toggleable()
                    ->sortable()
                    ->searchable(),

                TextColumn::make('city.type')
                    ->label('Type')
                    ->toggleable(),

                TextColumn::make('city.postal_code')
                    ->label('Postal Code')
                    ->toggleable(),

                TextColumn::make('is_default')
                    ->label('Active')
                    ->badge()
                    ->formatStateUsing(fn($state) => $state ? 'Active' : 'Inactive')
                    ->colors([
                        'success' => fn($state) => $state === 1,
                        'gray' => fn($state) => $state === 0,
                    ]),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
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
