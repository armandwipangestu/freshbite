<?php

namespace App\Services\RajaOngkirCity;

use App\Repositories\RajaOngkirCity\Interfaces\RajaOngkirCityRepositoryInterface;

class RajaOngkirCityService
{
    protected $RajaOngkirCityRepository;

    public function __construct(RajaOngkirCityRepositoryInterface $RajaOngkirCityRepository)
    {
        $this->RajaOngkirCityRepository = $RajaOngkirCityRepository;
    }

    /**
     * Get all RajaOngkirCity records.
     */
    public function getAll()
    {
        return $this->RajaOngkirCityRepository->getAll();
    }

    /**
     * Create a new RajaOngkirCity.
     * 
     * @param array $data
     */
    public function create(array $data)
    {
        return $this->RajaOngkirCityRepository->create($data);
    }

    /**
     * Find a RajaOngkirCity by ID.
     * 
     * @param int $id
     */
    public function findById(int $id)
    {
        return $this->RajaOngkirCityRepository->findById($id);
    }

    /**
     * Update a RajaOngkirCity by ID.
     * 
     * @param int $id
     * @param array $data
     */
    public function updateById(int $id, array $data)
    {
        return $this->RajaOngkirCityRepository->updateById($id, $data);
    }

    /**
     * Delete a RajaOngkirCity by ID.
     * 
     * @param int $id
     */
    public function deleteById(int $id)
    {
        return $this->RajaOngkirCityRepository->deleteById($id);
    }

    /**
     * Get list of cities for dropdowns.
     * 
     * @param int $provinceId
     */
    public function getCitiesByProvinceId(int $provinceId)
    {
        return $this->RajaOngkirCityRepository->getCitiesByProvinceId($provinceId);
    }
}