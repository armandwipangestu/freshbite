<?php

namespace App\Repositories\RajaOngkirProvince;

use App\Models\RajaOngkirProvince;
use App\Repositories\RajaOngkirProvince\Interfaces\RajaOngkirProvinceRepositoryInterface;

class RajaOngkirProvinceRepository implements RajaOngkirProvinceRepositoryInterface
{
    /**
     * Get all RajaOngkirProvince records.
     */
    public function getAll()
    {
        return RajaOngkirProvince::all();
    }

    /**
     * Create a new RajaOngkirProvince record.
     * 
     * @param array $data
     */
    public function create(array $data)
    {
        return RajaOngkirProvince::create($data);
    }

    /**
     * Find a record RajaOngkirProvince by ID.
     * 
     * @param int $id
     */
    public function findById(int $id)
    {
        return RajaOngkirProvince::findOrFail($id);
    }

    /**
     * Update a record RajaOngkirProvince by ID.
     * 
     * @param int $id
     * @param array $data
     */
    public function updateById(int $id, array $data)
    {
        $model = RajaOngkirProvince::findOrFail($id);
        $model->update($data);

        return $model;
    }

    /**
     * Delete a record RajaOngkirProvince by ID.
     * 
     * @param int $id
     */
    public function deleteById(int $id)
    {
        $model = RajaOngkirProvince::findOrFail($id);
        return $model->delete();
    }

    /**
     * Get list of provinces for dropdowns.
     */
    public function getProvinces()
    {
        return RajaOngkirProvince::query()
            ->select('id', 'name')
            ->orderBy('name')
            ->get();
    }
}