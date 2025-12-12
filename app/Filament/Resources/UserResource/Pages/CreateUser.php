<?php

namespace App\Filament\Resources\UserResource\Pages;

use App\Filament\Resources\UserResource;
use App\Models\User;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class CreateUser extends CreateRecord
{
    protected static string $resource = UserResource::class;

    protected function handleRecordCreation(array $data): User
    {
        return DB::transaction(function () use ($data) {
            // Buat pengguna baru
            $user = User::create([
                'name' => $data['name'],
                'email' => $data['email'],
                'avatar' => $data['avatar'],
                // Tambahkan field lain yang diperlukan
            ]);

            // Buat profil baru yang berelasi dengan pengguna
            $user->profile()->create([
                'theme' => $data['theme'],
                'gender' => $data['gender'],
                // Tambahkan field lain yang diperlukan
            ]);

            return $user;
        });
    }
}
