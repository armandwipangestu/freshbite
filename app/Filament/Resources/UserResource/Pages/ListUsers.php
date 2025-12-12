<?php

namespace App\Filament\Resources\UserResource\Pages;

use App\Filament\Resources\UserResource;
use App\Filament\Resources\UserResource\Widgets\UserStatsFooter;
use App\Filament\Resources\UserResource\Widgets\UserStatsHeader;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListUsers extends ListRecords
{
    protected static string $resource = UserResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }

    public function getHeaderWidgets(): array
    {
        return [
            UserStatsHeader::class,
        ];
    }

    public function getFooterWidgets(): array
    {
        return [
            UserStatsFooter::class,
        ];
    }
}
