<?php

namespace App\Filament\Resources\BannerResource\Widgets;

use App\Models\Banner;
use Filament\Support\Enums\IconPosition;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Flowframe\Trend\Trend;
use Flowframe\Trend\TrendValue;

class BannerStatsHeader extends BaseWidget
{
    protected function getStats(): array
    {
        $total_banners = Banner::count();

        $trend = Trend::model(Banner::class)
            ->between(
                start: now()->subYear(),
                end: now(),
            )
            ->perMonth()
            ->count();

        $chart_data = $trend->map(fn(TrendValue $value) => $value->aggregate)->toArray();

        return [
            Stat::make('Total Banners', $total_banners)
                ->description('Total number of banners')
                ->descriptionColor('primary')
                ->descriptionIcon('heroicon-m-arrow-trending-up', IconPosition::After)
                ->chart($chart_data)
                ->color('primary'),
        ];
    }
}
