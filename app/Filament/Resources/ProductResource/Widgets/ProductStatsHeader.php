<?php

namespace App\Filament\Resources\ProductResource\Widgets;

use App\Models\Product;
use Filament\Support\Enums\IconPosition;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Flowframe\Trend\Trend;
use Flowframe\Trend\TrendValue;

class ProductStatsHeader extends BaseWidget
{
    protected function getStats(): array
    {
        $total_products = Product::count();
        $total_products_published = Product::where('is_published', true)->count();
        $total_products_draft = Product::where('is_published', false)->count();

        $trend = Trend::model(Product::class)
            ->between(
                start: now()->subYear(),
                end: now(),
            )
            ->perMonth()
            ->count();

        $chart_data = $trend->map(fn(TrendValue $value) => $value->aggregate)->toArray();

        return [
            Stat::make('Total Products', $total_products)
                ->description('Total products')
                ->descriptionColor('primary')
                ->descriptionIcon('heroicon-m-arrow-trending-up', IconPosition::After)
                ->chart($chart_data)
                ->color('primary'),
            Stat::make('Total Products Published', $total_products_published)
                ->description('Total products published')
                ->descriptionColor('primary'),
            Stat::make('Total Products Draft', $total_products_draft)
                ->description('Total products draft')
                ->descriptionColor('primary'),
        ];
    }
}
