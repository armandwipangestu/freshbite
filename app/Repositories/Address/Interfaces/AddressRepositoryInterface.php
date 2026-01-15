<?php

namespace App\Repositories\Address\Interfaces;

interface AddressRepositoryInterface
{
    /**
     * Get all addresses for a user.
     *
     * @param int $userId
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function getByUserId(int $userId);

    /**
     * Get paginated addresses for a user with optional search.
     *
     * @param int $userId
     * @param string|null $search
     * @param int $perPage
     * @return \Illuminate\Pagination\LengthAwarePaginator
     */
    public function getPaginatedByUserId(int $userId, ?string $search = null, int $perPage = 5);

    /**
     * Create a new address record.
     *
     * @param array $data
     * @return \App\Models\Address
     */
    public function create(array $data);

    /**
     * Find an address by ID.
     *
     * @param int $id
     * @return \App\Models\Address
     */
    public function findById(int $id);

    /**
     * Update an address by ID.
     *
     * @param int $id
     * @param array $data
     * @return \App\Models\Address
     */
    public function updateById(int $id, array $data);

    /**
     * Delete an address by ID.
     *
     * @param int $id
     * @return bool
     */
    public function deleteById(int $id);

    /**
     * Get the default address for a user.
     *
     * @param int $userId
     * @return \App\Models\Address|null
     */
    public function getDefaultByUserId(int $userId);

    /**
     * Search addresses by label or recipient name.
     *
     * @param int $userId
     * @param string $query
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function search(int $userId, string $query);
}
