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
    public function getLandingPageData()
    {
        return [
            'banners' => $this->bannerService->getActiveBanners(),
            'flashSaleProducts' => $this->productService->getFlashSaleProducts(5),
            'popularProducts' => $this->productService->getPopularProducts(4),
            'categories' => $this->categoryService->getAll(),
        ];
    }
}
