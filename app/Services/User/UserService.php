<?php

namespace App\Services\User;

use App\Models\User;
use App\Repositories\User\Interfaces\UserRepositoryInterface;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Laravel\Socialite\Contracts\User as SocialUser;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;

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

    /**
     * Update user profile information including avatar.
     * 
     * @param User $user
     * @param array $data
     * @return User
     */
    public function updateProfile(User $user, array $data): User
    {
        if (isset($data['avatar']) && $data['avatar'] instanceof UploadedFile) {
            // Delete old avatar if exists and it's a local file
            if ($user->avatar) {
                // Check if it's a local storage path (contains 'avatars/' and '/storage/')
                // Handle both full URLs and relative paths
                $avatarPath = $user->avatar;

                // Extract path from full URL if needed
                if (filter_var($avatarPath, FILTER_VALIDATE_URL)) {
                    $parsedUrl = parse_url($avatarPath);
                    $avatarPath = $parsedUrl['path'] ?? $avatarPath;
                }

                // If it's a local storage path, delete the old file
                if (Str::contains($avatarPath, 'avatars/')) {
                    // Extract the relative path from storage URL
                    $relativePath = str_replace('/storage/', '', $avatarPath);
                    if (Storage::disk('public')->exists($relativePath)) {
                        Storage::disk('public')->delete($relativePath);
                    }
                }
            }

            // Store new avatar
            $path = $data['avatar']->store('avatars', 'public');
            $data['avatar'] = $path;
        }

        // Email is not changeable, so we don't need to check for email changes

        $this->updateById($user->id, $data);

        return $user->refresh();
    }

    /**
     * Update user password.
     * 
     * @param User $user
     * @param string $newPassword
     * @return User
     */
    public function updatePassword(User $user, string $newPassword): User
    {
        $this->updateById($user->id, [
            'password' => Hash::make($newPassword),
        ]);

        return $user->refresh();
    }
}
