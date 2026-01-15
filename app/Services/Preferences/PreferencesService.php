<?php

namespace App\Services\Preferences;

use App\Models\User;
use App\Repositories\Preferences\Interfaces\PreferencesRepositoryInterface;

class PreferencesService
{
    protected $preferencesRepository;

    public function __construct(PreferencesRepositoryInterface $preferencesRepository)
    {
        $this->preferencesRepository = $preferencesRepository;
    }

    /**
     * Get preferences for a user.
     *
     * @param User $user
     * @return array
     */
    public function getPreferences(User $user): array
    {
        return $this->preferencesRepository->getByUserId($user->id);
    }

    /**
     * Update preferences for a user.
     *
     * @param User $user
     * @param array $data
     * @return array
     */
    public function updatePreferences(User $user, array $data): array
    {
        return $this->preferencesRepository->updateByUserId($user->id, $data);
    }
}
