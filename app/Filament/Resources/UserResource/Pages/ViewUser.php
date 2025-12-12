<?php

namespace App\Filament\Resources\UserResource\Pages;

use App\Filament\Resources\UserResource;
use Filament\Resources\Pages\ViewRecord;

class ViewUser extends ViewRecord
{
    protected static string $resource = UserResource::class;

    protected function mutateFormDataBeforeFill(array $data): array
    {
        $user = $this->getRecord();

        $data['theme'] = $user->profile?->theme ?? 'system';
        $data['gender'] = $user->profile?->gender ?? 'prefer_not_to_say';

        return $data;
    }
}
