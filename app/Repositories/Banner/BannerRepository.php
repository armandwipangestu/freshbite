<?php

namespace App\Repositories\Banner;

use App\Models\Banner;
use App\Repositories\Banner\Interfaces\BannerRepositoryInterface;

class BannerRepository implements BannerRepositoryInterface
{
    /**
     * Get all Banner records.
     */
    public function getAll()
    {
        return Banner::all();
    }

    /**
     * Create a new Banner record.
     * 
     * @param array $data
     */
    public function create(array $data)
    {
        return Banner::create($data);
    }

    /**
     * Find a record Banner by ID.
     * 
     * @param int $id
     */
    public function findById(int $id)
    {
        return Banner::findOrFail($id);
    }

    /**
     * Update a record Banner by ID.
     * 
     * @param int $id
     * @param array $data
     */
    public function updateById(int $id, array $data)
    {
        $model = Banner::findOrFail($id);
        $model->update($data);

        return $model;
    }

    /**
     * Delete a record Banner by ID.
     * 
     * @param int $id
     */
    public function deleteById(int $id)
    {
        $model = Banner::findOrFail($id);
        return $model->delete();
    }

    /**
     * Get active banners.
     */
    public function getActiveBanners()
    {
        return Banner::where('is_active', true)->get();
    }
}
