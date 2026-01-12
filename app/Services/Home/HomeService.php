<?php

namespace App\Services\Home;

use App\Services\Banner\BannerService;
use App\Services\Category\CategoryService;
use App\Services\Product\ProductService;

class HomeService
{
    protected $bannerService;
    protected $productService;
    protected $categoryService;

    public function __construct(
        BannerService $bannerService,
        ProductService $productService,
        CategoryService $categoryService
    ) {
        $this->bannerService = $bannerService;
        $this->productService = $productService;
        $this->categoryService = $categoryService;
    }

    /**
     * Get data for landing page.
     */
    public function getLandingPageData(?string $categorySlug = null)
    {
        $activeCoupon = \App\Models\Coupon::where('is_active', true)
            ->where('expired_at', '>', now())
            ->first();

        $flashSaleProducts = $activeCoupon
            ? $this->productService->getProductsByCoupon($activeCoupon, 5)
            : collect([]);

        $categoryProducts = $categorySlug
            ? $this->productService->getProductsByCategory($categorySlug, 10)
            : $this->productService->getProductsByCategory('all', 10);

        return [
            'banners' => $this->bannerService->getActiveBanners(),
            'activeCoupon' => $activeCoupon,
            'flashSaleProducts' => $flashSaleProducts,
            'popularProducts' => [
                'most_popular' => $this->productService->getMostPopularLifetime(1)->first(),
                'customer_favorite' => $this->productService->getCustomerFavorites(1)->first(),
                'top_selling' => $this->productService->getTopSellingReviewBased(1)->first(),
                'weekly_best_seller' => $this->productService->getWeeklyBestSeller(1)->first(),
            ],
            'categories' => $this->categoryService->getAll(),
            'categoryProducts' => $categoryProducts,
            'selectedCategory' => $categorySlug,
        ];
    }
}
