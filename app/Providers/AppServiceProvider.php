<?php

namespace App\Providers;

use App\Repositories\Category\Interfaces\CategoryRepositoryInterface;
use App\Repositories\Category\CategoryRepository;

use App\Repositories\Product\Interfaces\ProductRepositoryInterface;
use App\Repositories\Product\ProductRepository;

use App\Repositories\Banner\Interfaces\BannerRepositoryInterface;
use App\Repositories\Banner\BannerRepository;

use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Vite;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->bind(CategoryRepositoryInterface::class, CategoryRepository::class);
        $this->app->bind(ProductRepositoryInterface::class, ProductRepository::class);
        $this->app->bind(BannerRepositoryInterface::class, BannerRepository::class);
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        if (app()->environment('production') || str_starts_with(config('app.url') ?? '', 'https://')) {
            URL::forceScheme('https');
        }

        Vite::prefetch(concurrency: 3);
    }
}
