<?php

namespace App\Services\Banner;

use App\Repositories\Banner\Interfaces\BannerRepositoryInterface;

class BannerService
{
    protected $BannerRepository;

    public function __construct(BannerRepositoryInterface $BannerRepository)
    {
        $this->BannerRepository = $BannerRepository;
    }

    /**
     * Get all Banner records.
     */
    public function getAll()
    {
        return $this->BannerRepository->getAll();
    }

    /**
     * Create a new Banner.
     * 
     * @param array $data
     */
    public function create(array $data)
    {
        return $this->BannerRepository->create($data);
    }

    /**
     * Find a Banner by ID.
     * 
     * @param int $id
     */
    public function findById(int $id)
    {
        return $this->BannerRepository->findById($id);
    }

    /**
     * Update a Banner by ID.
     * 
     * @param int $id
     * @param array $data
     */
    public function updateById(int $id, array $data)
    {
        return $this->BannerRepository->updateById($id, $data);
    }

    /**
     * Delete a Banner by ID.
     * 
     * @param int $id
     */
    public function deleteById(int $id)
    {
        return $this->BannerRepository->deleteById($id);
    }

    /**
     * Get active banners.
     */
    public function getActiveBanners()
    {
        return $this->BannerRepository->getActiveBanners();
    }
}
