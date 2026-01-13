<?php

namespace App\Services\Product;

use App\Repositories\Product\Interfaces\ProductRepositoryInterface;

class ProductService
{
    protected $ProductRepository;

    public function __construct(ProductRepositoryInterface $ProductRepository)
    {
        $this->ProductRepository = $ProductRepository;
    }

    /**
     * Get all Product records.
     */
    public function getAll()
    {
        return $this->ProductRepository->getAll();
    }

    /**
     * Create a new Product.
     * 
     * @param array $data
     */
    public function create(array $data)
    {
        return $this->ProductRepository->create($data);
    }

    /**
     * Find a Product by ID.
     * 
     * @param int $id
     */
    public function findById(int $id)
    {
        return $this->ProductRepository->findById($id);
    }

    /**
     * Update a Product by ID.
     * 
     * @param int $id
     * @param array $data
     */
    public function updateById(int $id, array $data)
    {
        return $this->ProductRepository->updateById($id, $data);
    }

    /**
     * Delete a Product by ID.
     * 
     * @param int $id
     */
    public function deleteById(int $id)
    {
        return $this->ProductRepository->deleteById($id);
    }

    /**
     * Get flash sale products.
     */
    public function getFlashSaleProducts(int $limit = 5)
    {
        return $this->ProductRepository->getFlashSaleProducts($limit);
    }

    /**
     * Get products by coupon.
     */
    public function getProductsByCoupon(\App\Models\Coupon $coupon, int $limit = 5)
    {
        return $this->ProductRepository->getProductsByCoupon($coupon, $limit);
    }

    /**
     * Get most popular products of all time.
     */
    public function getMostPopularLifetime(int $limit = 1)
    {
        return $this->ProductRepository->getMostPopularLifetime($limit);
    }

    /**
     * Get customer favorites.
     */
    public function getCustomerFavorites(int $limit = 1)
    {
        return $this->ProductRepository->getCustomerFavorites($limit);
    }

    /**
     * Get top selling products.
     */
    public function getTopSellingReviewBased(int $limit = 1)
    {
        return $this->ProductRepository->getTopSellingReviewBased($limit);
    }

    /**
     * Get this week's best seller.
     */
    public function getWeeklyBestSeller(int $limit = 1)
    {
        return $this->ProductRepository->getWeeklyBestSeller($limit);
    }

    /**
     * Get popular products.
     */
    public function getPopularProducts(int $limit = 4)
    {
        return $this->ProductRepository->getPopularProducts($limit);
    }

    /**
     * Get products by category slug.
     */
    public function getProductsByCategory(string $categorySlug, int $limit = 10)
    {
        return $this->ProductRepository->getProductsByCategory($categorySlug, $limit);
    }

    /**
     * Get products with relationships.
     */
    public function getWithRelationships(array $relations = ['images', 'categories'], int $limit = 10)
    {
        return $this->ProductRepository->getWithRelationships($relations, $limit);
    }
}
