<?php

namespace App\Repositories\Preferences\Interfaces;

use App\Models\User;

interface PreferencesRepositoryInterface
{
    /**
     * Get user preferences by user ID.
     *
     * @param int $userId
     * @return array
     */
    public function getByUserId(int $userId): array;

    /**
     * Update user preferences.
     *
     * @param int $userId
     * @param array $data
     * @return array
     */
    public function updateByUserId(int $userId, array $data): array;
}
