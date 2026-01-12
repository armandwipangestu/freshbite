<?php

namespace App\Repositories\Product;

use App\Models\Product;
use App\Repositories\Product\Interfaces\ProductRepositoryInterface;

class ProductRepository implements ProductRepositoryInterface
{
    /**
     * Get all Product records.
     */
    public function getAll()
    {
        return Product::all();
    }

    /**
     * Create a new Product record.
     * 
     * @param array $data
     */
    public function create(array $data)
    {
        return Product::create($data);
    }

    /**
     * Find a record Product by ID.
     * 
     * @param int $id
     */
    public function findById(int $id)
    {
        return Product::findOrFail($id);
    }

    /**
     * Update a record Product by ID.
     * 
     * @param int $id
     * @param array $data
     */
    public function updateById(int $id, array $data)
    {
        $model = Product::findOrFail($id);
        $model->update($data);

        return $model;
    }

    /**
     * Delete a record Product by ID.
     * 
     * @param int $id
     */
    public function deleteById(int $id)
    {
        $model = Product::findOrFail($id);
        return $model->delete();
    }

    /**
     * Get flash sale products.
     */
    public function getFlashSaleProducts(int $limit = 5)
    {
        return Product::with(['images', 'categories'])
            ->where('is_published', true)
            ->latest()
            ->limit($limit)
            ->get();
    }

    /**
     * Get popular products.
     */
    public function getPopularProducts(int $limit = 4)
    {
        return Product::with(['images', 'categories'])
            ->where('is_published', true)
            ->orderBy('total_sold', 'desc')
            ->limit($limit)
            ->get();
    }

    /**
     * Get products with relationships.
     */
    public function getWithRelationships(array $relations = ['images', 'categories'], int $limit = 10)
    {
        return Product::with($relations)
            ->where('is_published', true)
            ->latest()
            ->limit($limit)
            ->get();
    }
}
