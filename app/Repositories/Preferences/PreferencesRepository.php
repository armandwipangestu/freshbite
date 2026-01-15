<?php

namespace App\Repositories\Preferences;

use App\Models\Profile;
use App\Repositories\Preferences\Interfaces\PreferencesRepositoryInterface;

class PreferencesRepository implements PreferencesRepositoryInterface
{
    /**
     * Get user preferences by user ID.
     *
     * @param int $userId
     * @return array
     */
    public function getByUserId(int $userId): array
    {
        $profile = Profile::where('user_id', $userId)->first();

        return [
            'theme' => $profile?->theme ?? 'system',
        ];
    }

    /**
     * Update user preferences.
     *
     * @param int $userId
     * @param array $data
     * @return array
     */
    public function updateByUserId(int $userId, array $data): array
    {
        $profile = Profile::firstOrCreate(
            ['user_id' => $userId],
            ['theme' => 'system'],
        );

        if (isset($data['theme'])) {
            $profile->update(['theme' => $data['theme']]);
        }

        return [
            'theme' => $profile->theme,
        ];
    }
}
