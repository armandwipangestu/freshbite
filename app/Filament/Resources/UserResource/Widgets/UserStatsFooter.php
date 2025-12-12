<?php

namespace App\Filament\Resources\UserResource\Widgets;

use App\Models\User;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class UserStatsFooter extends BaseWidget
{
    protected function getStats(): array
    {
        $total_light_mode = User::whereHas('profile', function ($query) {
            $query->where('theme', 'light');
        })->count();
        $total_dark_mode = User::whereHas('profile', function ($query) {
            $query->where('theme', 'dark');
        })->count();
        $total_system_theme = User::whereHas('profile', function ($query) {
            $query->where('theme', 'system');
        })->count();

        return [
            Stat::make('Total Light Mode', $total_light_mode)
                ->description('Light mode users')
                ->descriptionColor('success'),
            Stat::make('Total Dark Mode', $total_dark_mode)
                ->description('Dark mode users')
                ->descriptionColor('success'),
            Stat::make('Total System Theme', $total_system_theme)
                ->description('System theme users')
                ->descriptionColor('success'),
        ];
    }
}
