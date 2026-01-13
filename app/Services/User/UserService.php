<?php

namespace App\Services\User;

use App\Models\User;
use App\Repositories\User\Interfaces\UserRepositoryInterface;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Laravel\Socialite\Contracts\User as SocialUser;

class UserService
{
    protected $UserRepository;

    public function __construct(UserRepositoryInterface $UserRepository)
    {
        $this->UserRepository = $UserRepository;
    }

    /**
     * Get all User records.
     */
    public function getAll()
    {
        return $this->UserRepository->getAll();
    }

    /**
     * Create a new User.
     * 
     * @param array $data
     */
    public function create(array $data)
    {
        return $this->UserRepository->create($data);
    }

    /**
     * Find a User by ID.
     * 
     * @param int $id
     */
    public function findById(int $id)
    {
        return $this->UserRepository->findById($id);
    }

    /**
     * Update a User by ID.
     * 
     * @param int $id
     * @param array $data
     */
    public function updateById(int $id, array $data)
    {
        return $this->UserRepository->updateById($id, $data);
    }

    /**
     * Delete a User by ID.
     * 
     * @param int $id
     */
    public function deleteById(int $id)
    {
        return $this->UserRepository->deleteById($id);
    }

    /**
     * Handle user data from social provider.
     *
     * @param SocialUser $socialUser
     * @param string $provider
     * @return User
     */
    public function handleSocialUser(SocialUser $socialUser, string $provider): User
    {
        $user = $this->UserRepository->updateOrCreate(
            ['email' => $socialUser->getEmail()],
            [
                'name' => $socialUser->getName(),
                'email_verified_at' => now(), // Assume social login emails are verified
                'avatar' => $socialUser->getAvatar(),
                // 'provider' => $provider, // Optimize: Can store provider/provider_id if needed in separate table or columns
                // 'provider_id' => $socialUser->getId(),
                'password' => Hash::make(Str::random(24)), // Random password for social users
            ]
        );

        return $user;
    }
}
