<?php

namespace App\Repositories\Banner\Interfaces;

interface BannerRepositoryInterface
{
    /**
     * Get all Banner records.
     */
    public function getAll();

    /**
     * Create a new Banner record.
     * 
     * @param array $data
     */
    public function create(array $data);

    /**
     * Find a record Banner by ID.
     * 
     * @param int $id
     */
    public function findById(int $id);

    /**
     * Update a record Banner by ID.
     * 
     * @param int $id
     * @param array $data
     */
    public function updateById(int $id, array $data);

    /**
     * Delete a record Banner by ID.
     * 
     * @param int $id
     */
    public function deleteById(int $id);

    /**
     * Get active banners.
     */
    public function getActiveBanners();
}
