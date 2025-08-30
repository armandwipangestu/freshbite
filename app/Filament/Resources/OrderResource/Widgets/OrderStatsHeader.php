<?php

namespace App\Filament\Resources\OrderResource\Widgets;

use App\Models\Order;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Flowframe\Trend\Trend;
use Flowframe\Trend\TrendValue;

class OrderStatsHeader extends BaseWidget
{
    protected function getStats(): array
    {
        $total_revenue = Order::where('payment_status', 'paid')->sum('total_price');
        $total_orders = Order::count();
        $total_paid_orders = Order::where('payment_status', 'paid')->count();
        $total_pending_orders = Order::where('payment_status', 'pending')->count();

        $revenue_trend = Trend::model(Order::class)
            ->between(
                start: now()->subYear(),
                end: now(),
            )
            ->perMonth()
            ->sum(
                'total_price',
                fn($query) => $query->where('payment_status', 'paid')
            );

        $revenue_chart_data = $revenue_trend->map(fn(TrendValue $value) => $value->aggregate)->toArray();

        $order_trend = Trend::model(Order::class)
            ->between(
                start: now()->subYear(),
                end: now(),
            )
            ->perMonth()
            ->count();

        $order_chart_data = $order_trend->map(fn(TrendValue $value) => $value->aggregate)->toArray();

        $paid_orders_trend = Trend::model(Order::class)
            ->between(
                start: now()->subYear(),
                end: now(),
            )
            ->perMonth()
            ->count(
                'id',
                fn($query) => $query->where('payment_status', 'paid')
            );

        $paid_chart_data = $paid_orders_trend->map(fn(TrendValue $value) => $value->aggregate)->toArray();

        $pending_orders_trend = Trend::model(Order::class)
            ->between(
                start: now()->subYear(),
                end: now(),
            )
            ->perMonth()
            ->count(
                'id',
                fn($query) => $query->where('payment_status', 'pending')
            );

        $pending_chart_data = $pending_orders_trend->map(fn(TrendValue $value) => $value->aggregate)->toArray();

        return [
            Stat::make('Total Revenue', "Rp " . number_format($total_revenue, 2, ',', '.'))
                ->description('Total revenue from paid orders')
                ->descriptionColor('success')
                ->color('success')
                ->chart($revenue_chart_data),

            Stat::make('Total Orders', $total_orders)
                ->description('All orders placed')
                ->descriptionColor('primary')
                ->chart($order_chart_data),

            Stat::make('Paid Orders', $total_paid_orders)
                ->description('Orders with payment completed')
                ->descriptionColor('success')
                ->chart($paid_chart_data),

            Stat::make('Pending Orders', $total_pending_orders)
                ->description('Orders awaiting payment')
                ->descriptionColor('warning')
                ->color('warning')
                ->chart($pending_chart_data),
        ];
    }
}
