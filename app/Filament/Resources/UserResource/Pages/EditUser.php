<?php

namespace App\Filament\Resources\UserResource\Pages;

use App\Filament\Resources\UserResource;
use App\Models\User;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Support\Facades\Log;

class EditUser extends EditRecord
{
    protected static string $resource = UserResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }

    protected function mutateFormDataBeforeFill(array $data): array
    {
        if (empty($data['theme'])) {
            $data['theme'] = $this->getRecord()->profile?->theme;
        }

        if (empty($data['gender'])) {
            $data['gender'] = $this->getRecord()->profile?->gender;
        }

        return $data;
    }

    protected function mutateFormDataBeforeSave(array $data): array
    {
        $user = $this->getRecord();

        if (!empty($data['password'])) {
            $user->password = bcrypt($data['password']);
        } else {
            $data['password'] = $user->password;
        }

        if ($user->profile) {
            $user->profile->update([
                'theme' => $data['theme'],
                'gender' => $data['gender'],
            ]);
        } else {
            if ($data['theme']) {
                $user->profile()->create([
                    'theme' => $data['theme'],
                ]);
            }

            if ($data['gender']) {
                $user->profile()->create([
                    'gender' => $data['gender'],
                ]);
            }
        }

        return $data;
    }
}
