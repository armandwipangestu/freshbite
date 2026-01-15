<?php

namespace App\Repositories\RajaOngkirProvince\Interfaces;

interface RajaOngkirProvinceRepositoryInterface
{
    /**
     * Get all RajaOngkirProvince records.
     */
    public function getAll();

    /**
     * Create a new RajaOngkirProvince record.
     * 
     * @param array $data
     */
    public function create(array $data);

    /**
     * Find a record RajaOngkirProvince by ID.
     * 
     * @param int $id
     */
    public function findById(int $id);

    /**
     * Update a record RajaOngkirProvince by ID.
     * 
     * @param int $id
     * @param array $data
     */
    public function updateById(int $id, array $data);

    /**
     * Delete a record RajaOngkirProvince by ID.
     * 
     * @param int $id
     */
    public function deleteById(int $id);

    /**
     * Get list of provinces for dropdowns.
     */
    public function getProvinces();
}
