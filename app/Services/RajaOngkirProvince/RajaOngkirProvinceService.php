<?php

namespace App\Services\RajaOngkirProvince;

use App\Repositories\RajaOngkirProvince\Interfaces\RajaOngkirProvinceRepositoryInterface;

class RajaOngkirProvinceService
{
    protected $RajaOngkirProvinceRepository;

    public function __construct(RajaOngkirProvinceRepositoryInterface $RajaOngkirProvinceRepository)
    {
        $this->RajaOngkirProvinceRepository = $RajaOngkirProvinceRepository;
    }

    /**
     * Get all RajaOngkirProvince records.
     */
    public function getAll()
    {
        return $this->RajaOngkirProvinceRepository->getAll();
    }

    /**
     * Create a new RajaOngkirProvince.
     * 
     * @param array $data
     */
    public function create(array $data)
    {
        return $this->RajaOngkirProvinceRepository->create($data);
    }

    /**
     * Find a RajaOngkirProvince by ID.
     * 
     * @param int $id
     */
    public function findById(int $id)
    {
        return $this->RajaOngkirProvinceRepository->findById($id);
    }

    /**
     * Update a RajaOngkirProvince by ID.
     * 
     * @param int $id
     * @param array $data
     */
    public function updateById(int $id, array $data)
    {
        return $this->RajaOngkirProvinceRepository->updateById($id, $data);
    }

    /**
     * Delete a RajaOngkirProvince by ID.
     * 
     * @param int $id
     */
    public function deleteById(int $id)
    {
        return $this->RajaOngkirProvinceRepository->deleteById($id);
    }

    /**
     * Get list of provinces for dropdowns.
     */
    public function getProvinces()
    {
        return $this->RajaOngkirProvinceRepository->getProvinces();
    }
}
