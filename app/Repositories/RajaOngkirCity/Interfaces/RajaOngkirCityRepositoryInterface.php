<?php

namespace App\Repositories\RajaOngkirCity\Interfaces;

interface RajaOngkirCityRepositoryInterface
{
    /**
     * Get all RajaOngkirCity records.
     */
    public function getAll();

    /**
     * Create a new RajaOngkirCity record.
     * 
     * @param array $data
     */
    public function create(array $data);

    /**
     * Find a record RajaOngkirCity by ID.
     * 
     * @param int $id
     */
    public function findById(int $id);

    /**
     * Update a record RajaOngkirCity by ID.
     * 
     * @param int $id
     * @param array $data
     */
    public function updateById(int $id, array $data);

    /**
     * Delete a record RajaOngkirCity by ID.
     * 
     * @param int $id
     */
    public function deleteById(int $id);

    /**
     * Get list of cities for dropdowns.
     * 
     * @param int $provinceId
     */
    public function getCitiesByProvinceId(int $provinceId);
}
