<?php

namespace App\Repositories\Address;

use App\Models\Address;
use App\Repositories\Address\Interfaces\AddressRepositoryInterface;

class AddressRepository implements AddressRepositoryInterface
{
    /**
     * Get all addresses for a user.
     *
     * @param int $userId
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function getByUserId(int $userId)
    {
        return Address::where('user_id', $userId)
            ->orderBy('is_default', 'desc')
            ->orderBy('created_at', 'desc')
            ->get();
    }

    /**
     * Get paginated addresses for a user with optional search.
     *
     * @param int $userId
     * @param string|null $search
     * @param int $perPage
     * @return \Illuminate\Pagination\LengthAwarePaginator
     */
    public function getPaginatedByUserId(int $userId, ?string $search = null, int $perPage = 5)
    {
        $query = Address::where('user_id', $userId);

        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('label_name', 'like', "%{$search}%")
                    ->orWhere('recipient_name', 'like', "%{$search}%")
                    ->orWhere('address', 'like', "%{$search}%");
            });
        }

        return $query->orderBy('is_default', 'desc')
            ->orderBy('created_at', 'desc')
            ->paginate($perPage);
    }

    /**
     * Create a new address record.
     *
     * @param array $data
     * @return \App\Models\Address
     */
    public function create(array $data)
    {
        return Address::create($data);
    }

    /**
     * Find an address by ID.
     *
     * @param int $id
     * @return \App\Models\Address
     */
    public function findById(int $id)
    {
        return Address::findOrFail($id);
    }

    /**
     * Update an address by ID.
     *
     * @param int $id
     * @param array $data
     * @return \App\Models\Address
     */
    public function updateById(int $id, array $data)
    {
        $address = Address::findOrFail($id);
        $address->update($data);

        return $address;
    }

    /**
     * Delete an address by ID.
     *
     * @param int $id
     * @return bool
     */
    public function deleteById(int $id)
    {
        $address = Address::findOrFail($id);
        return $address->delete();
    }

    /**
     * Get the default address for a user.
     *
     * @param int $userId
     * @return \App\Models\Address|null
     */
    public function getDefaultByUserId(int $userId)
    {
        return Address::where('user_id', $userId)
            ->where('is_default', true)
            ->first();
    }

    /**
     * Search addresses by label or recipient name.
     *
     * @param int $userId
     * @param string $query
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function search(int $userId, string $query)
    {
        return Address::where('user_id', $userId)
            ->where(function ($q) use ($query) {
                $q->where('label_name', 'like', "%{$query}%")
                    ->orWhere('recipient_name', 'like', "%{$query}%")
                    ->orWhere('address', 'like', "%{$query}%");
            })
            ->orderBy('is_default', 'desc')
            ->orderBy('created_at', 'desc')
            ->get();
    }
}
