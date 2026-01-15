<?php

namespace App\Providers;

use App\Repositories\RajaOngkirCity\Interfaces\RajaOngkirCityRepositoryInterface;
use App\Repositories\RajaOngkirCity\RajaOngkirCityRepository;

use App\Repositories\RajaOngkirProvince\Interfaces\RajaOngkirProvinceRepositoryInterface;
use App\Repositories\RajaOngkirProvince\RajaOngkirProvinceRepository;

use App\Repositories\User\Interfaces\UserRepositoryInterface;
use App\Repositories\User\UserRepository;

use App\Repositories\Category\Interfaces\CategoryRepositoryInterface;
use App\Repositories\Category\CategoryRepository;

use App\Repositories\Product\Interfaces\ProductRepositoryInterface;
use App\Repositories\Product\ProductRepository;

use App\Repositories\Banner\Interfaces\BannerRepositoryInterface;
use App\Repositories\Banner\BannerRepository;

use App\Repositories\Address\Interfaces\AddressRepositoryInterface;
use App\Repositories\Address\AddressRepository;

use App\Repositories\Preferences\Interfaces\PreferencesRepositoryInterface;
use App\Repositories\Preferences\PreferencesRepository;

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
        $this->app->bind(RajaOngkirCityRepositoryInterface::class, RajaOngkirCityRepository::class);
        $this->app->bind(RajaOngkirProvinceRepositoryInterface::class, RajaOngkirProvinceRepository::class);
        $this->app->bind(UserRepositoryInterface::class, UserRepository::class);
        $this->app->bind(CategoryRepositoryInterface::class, CategoryRepository::class);
        $this->app->bind(ProductRepositoryInterface::class, ProductRepository::class);
        $this->app->bind(BannerRepositoryInterface::class, BannerRepository::class);
        $this->app->bind(AddressRepositoryInterface::class, AddressRepository::class);
        $this->app->bind(PreferencesRepositoryInterface::class, PreferencesRepository::class);
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
