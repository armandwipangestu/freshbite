<?php

namespace App\Filament\Resources\UserResource\Widgets;

use App\Models\User;
use Filament\Support\Enums\IconPosition;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Flowframe\Trend\Trend;
use Flowframe\Trend\TrendValue;

class UserStatsHeader extends BaseWidget
{
    protected function getStats(): array
    {
        $total_users = User::count();
        $total_male = User::whereHas('profile', function ($query) {
            $query->where('gender', 'male');
        })->count();
        $total_female = User::whereHas('profile', function ($query) {
            $query->where('gender', 'female');
        })->count();

        $trend = Trend::model(User::class)
            ->between(
                start: now()->subYear(),
                end: now(),
            )
            ->perMonth()
            ->count();

        $chart_data = $trend->map(fn(TrendValue $value) => $value->aggregate)->toArray();

        return [
            Stat::make('Total Users', $total_users)
                ->description('New users that have joined')
                ->descriptionColor('success')
                ->descriptionIcon('heroicon-m-user-group', IconPosition::Before)
                ->chart($chart_data)
                ->color('success'),
            Stat::make('Total Male', $total_male)
                ->description('Male users')
                ->descriptionColor('success'),
            Stat::make('Total Female', $total_female)
                ->description('Female users')
                ->descriptionColor('success'),
        ];
    }
}
