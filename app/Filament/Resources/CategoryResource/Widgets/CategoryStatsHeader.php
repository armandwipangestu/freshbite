<?php

namespace App\Filament\Resources\CategoryResource\Widgets;

use App\Models\Category;
use Filament\Support\Enums\IconPosition;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Flowframe\Trend\Trend;
use Flowframe\Trend\TrendValue;

class CategoryStatsHeader extends BaseWidget
{
    protected function getStats(): array
    {
        $total_categories = Category::count();

        $trend = Trend::model(Category::class)
            ->between(
                start: now()->subYear(),
                end: now(),
            )
            ->perMonth()
            ->count();

        $chart_data = $trend->map(fn(TrendValue $value) => $value->aggregate)->toArray();

        return [
            Stat::make('Total Categories', $total_categories)
                ->description('Total number of categories')
                ->descriptionColor('primary')
                ->descriptionIcon('heroicon-m-arrow-trending-up', IconPosition::After)
                ->chart($chart_data)
                ->color('primary'),
        ];
    }
}
