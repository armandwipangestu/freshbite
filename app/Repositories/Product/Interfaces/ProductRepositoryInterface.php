<?php

namespace App\Repositories\Product\Interfaces;

interface ProductRepositoryInterface
{
    /**
     * Get all Product records.
     */
    public function getAll();

    /**
     * Create a new Product record.
     * 
     * @param array $data
     */
    public function create(array $data);

    /**
     * Find a record Product by ID.
     * 
     * @param int $id
     */
    public function findById(int $id);

    /**
     * Update a record Product by ID.
     * 
     * @param int $id
     * @param array $data
     */
    public function updateById(int $id, array $data);

    /**
     * Delete a record Product by ID.
     * 
     * @param int $id
     */
    public function deleteById(int $id);

    /**
     * Get flash sale products.
     */
    public function getFlashSaleProducts(int $limit = 5);

    /**
     * Get products by coupon.
     * 
     * @param \App\Models\Coupon $coupon
     * @param int $limit
     */
    public function getProductsByCoupon(\App\Models\Coupon $coupon, int $limit = 5);

    /**
     * Get most popular products of all time.
     */
    public function getMostPopularLifetime(int $limit = 1);

    /**
     * Get customer favorites (wishlist based).
     */
    public function getCustomerFavorites(int $limit = 1);

    /**
     * Get top selling products (review based).
     */
    public function getTopSellingReviewBased(int $limit = 1);

    /**
     * Get this week's best seller.
     */
    public function getWeeklyBestSeller(int $limit = 1);

    /**
     * Get popular products.
     */
    public function getPopularProducts(int $limit = 4);

    /**
     * Get products by category.
     */
    public function getProductsByCategory(string $categorySlug, int $limit = 10);

    /**
     * Get products with relationships.
     */
    public function getWithRelationships(array $relations = ['images', 'categories'], int $limit = 10);
}
