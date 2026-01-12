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
     * Get products by coupon.
     */
    public function getProductsByCoupon(\App\Models\Coupon $coupon, int $limit = 5)
    {
        return $coupon->products()
            ->with(['images', 'categories', 'coupons'])
            ->withAvg('reviews', 'star')
            ->where('is_published', true)
            ->limit($limit)
            ->get();
    }

    /**
     * Get most popular products of all time.
     */
    public function getMostPopularLifetime(int $limit = 1)
    {
        return Product::with(['images', 'categories', 'coupons'])
            ->withAvg('reviews', 'star')
            ->where('is_published', true)
            ->orderBy('total_sold', 'desc')
            ->limit($limit)
            ->get();
    }

    /**
     * Get customer favorites (wishlist based).
     */
    public function getCustomerFavorites(int $limit = 1)
    {
        return Product::with(['images', 'categories', 'coupons'])
            ->withAvg('reviews', 'star')
            ->where('is_published', true)
            ->withCount('wishlistItems')
            ->orderBy('wishlist_items_count', 'desc')
            ->limit($limit)
            ->get();
    }

    /**
     * Get top selling products (review based).
     */
    public function getTopSellingReviewBased(int $limit = 1)
    {
        return Product::with(['images', 'categories', 'coupons'])
            ->where('is_published', true)
            ->withAvg('reviews', 'star')
            ->orderBy('reviews_avg_star', 'desc')
            ->limit($limit)
            ->get();
    }

    /**
     * Get this week's best seller.
     */
    public function getWeeklyBestSeller(int $limit = 1)
    {
        return Product::with(['images', 'categories', 'coupons'])
            ->withAvg('reviews', 'star')
            ->where('is_published', true)
            ->whereHas('orderItems', function ($query) {
                $query->whereHas('order', function ($q) {
                    $q->whereBetween('created_at', [now()->startOfWeek(), now()->endOfWeek()]);
                });
            })
            ->withCount(['orderItems as weekly_sold' => function ($query) {
                $query->whereHas('order', function ($q) {
                    $q->whereBetween('created_at', [now()->startOfWeek(), now()->endOfWeek()]);
                });
            }])
            ->orderBy('weekly_sold', 'desc')
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
     * Get products by category slug.
     */
    public function getProductsByCategory(string $categorySlug, int $limit = 10)
    {
        $query = Product::with(['images', 'categories'])
            ->withAvg('reviews', 'star')
            ->where('is_published', true);

        if ($categorySlug !== 'all') {
            $query->whereHas('categories', function ($query) use ($categorySlug) {
                $query->where('slug', $categorySlug);
            });
        }

        return $query->latest()
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
