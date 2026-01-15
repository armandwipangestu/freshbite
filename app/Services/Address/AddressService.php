<?php

namespace App\Services\Address;

use App\Models\User;
use App\Repositories\Address\Interfaces\AddressRepositoryInterface;

class AddressService
{
    protected $addressRepository;

    public function __construct(AddressRepositoryInterface $addressRepository)
    {
        $this->addressRepository = $addressRepository;
    }

    /**
     * Get all addresses for a user.
     *
     * @param User $user
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function getAllByUser(User $user)
    {
        return $this->addressRepository->getByUserId($user->id);
    }

    /**
     * Get paginated addresses for a user.
     *
     * @param User $user
     * @param string|null $search
     * @return \Illuminate\Pagination\LengthAwarePaginator
     */
    public function getPaginatedByUser(User $user, ?string $search = null)
    {
        return $this->addressRepository->getPaginatedByUserId($user->id, $search, perPage: 5);
    }

    /**
     * Create a new address for a user.
     *
     * @param User $user
     * @param array $data
     * @return \App\Models\Address
     */
    public function createAddress(User $user, array $data)
    {
        $data['user_id'] = $user->id;

        // If this should be the default address, unset other defaults first
        if (isset($data['is_default']) && $data['is_default']) {
            $this->addressRepository->updateById(
                $this->addressRepository->getDefaultByUserId($user->id)?->id ?? 0,
                ['is_default' => false]
            );
        }

        return $this->addressRepository->create($data);
    }

    /**
     * Update an address.
     *
     * @param int $addressId
     * @param array $data
     * @return \App\Models\Address
     */
    public function updateAddress(int $addressId, array $data)
    {
        $address = $this->addressRepository->findById($addressId);

        // If setting as default, unset other defaults for this user
        if (isset($data['is_default']) && $data['is_default']) {
            $currentDefault = $this->addressRepository->getDefaultByUserId($address->user_id);
            if ($currentDefault && $currentDefault->id !== $addressId) {
                $this->addressRepository->updateById($currentDefault->id, ['is_default' => false]);
            }
        }

        return $this->addressRepository->updateById($addressId, $data);
    }

    /**
     * Delete an address.
     *
     * @param int $addressId
     * @return bool
     */
    public function deleteAddress(int $addressId)
    {
        return $this->addressRepository->deleteById($addressId);
    }

    /**
     * Set an address as default.
     *
     * @param User $user
     * @param int $addressId
     * @return \App\Models\Address
     */
    public function setAsDefault(User $user, int $addressId)
    {
        // Verify the address belongs to the user
        $address = $this->addressRepository->findById($addressId);
        if ($address->user_id !== $user->id) {
            throw new \Exception('Address does not belong to this user.');
        }

        // Unset current default
        $currentDefault = $this->addressRepository->getDefaultByUserId($user->id);
        if ($currentDefault && $currentDefault->id !== $addressId) {
            $this->addressRepository->updateById($currentDefault->id, ['is_default' => false]);
        }

        // Set new default
        return $this->addressRepository->updateById($addressId, ['is_default' => true]);
    }

    /**
     * Search addresses for a user.
     *
     * @param User $user
     * @param string $query
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function search(User $user, string $query)
    {
        return $this->addressRepository->search($user->id, $query);
    }
}
