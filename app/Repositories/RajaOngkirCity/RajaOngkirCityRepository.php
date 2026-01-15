<?php

namespace App\Repositories\RajaOngkirCity;

use App\Models\RajaOngkirCity;
use App\Repositories\RajaOngkirCity\Interfaces\RajaOngkirCityRepositoryInterface;

class RajaOngkirCityRepository implements RajaOngkirCityRepositoryInterface
{
    /**
     * Get all RajaOngkirCity records.
     */
    public function getAll()
    {
        return RajaOngkirCity::all();
    }

    /**
     * Create a new RajaOngkirCity record.
     * 
     * @param array $data
     */
    public function create(array $data)
    {
        return RajaOngkirCity::create($data);
    }

    /**
     * Find a record RajaOngkirCity by ID.
     * 
     * @param int $id
     */
    public function findById(int $id)
    {
        return RajaOngkirCity::findOrFail($id);
    }

    /**
     * Update a record RajaOngkirCity by ID.
     * 
     * @param int $id
     * @param array $data
     */
    public function updateById(int $id, array $data)
    {
        $model = RajaOngkirCity::findOrFail($id);
        $model->update($data);

        return $model;
    }

    /**
     * Delete a record RajaOngkirCity by ID.
     * 
     * @param int $id
     */
    public function deleteById(int $id)
    {
        $model = RajaOngkirCity::findOrFail($id);
        return $model->delete();
    }

    /**
     * Get list of cities for dropdowns.
     * 
     * @param int $provinceId
     */
    public function getCitiesByProvinceId(int $provinceId)
    {
        $model = RajaOngkirCity::query()
            ->where('province_id', $provinceId)
            ->select('id', 'name', 'province_id')
            ->orderBy('name')
            ->get();

        return $model;
    }
}
