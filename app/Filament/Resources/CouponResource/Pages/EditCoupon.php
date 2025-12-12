<?php

namespace App\Filament\Resources\CouponResource\Pages;

use App\Filament\Resources\CouponResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Support\Carbon;

class EditCoupon extends EditRecord
{
    protected static string $resource = CouponResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }

    protected function mutateFormDataBeforeFill(array $data): array
    {
        $expired = $data['expired_at'] ?? null;

        if (!empty($expired)) {
            $c = $expired instanceof \DateTimeInterface ? Carbon::instance($expired) : Carbon::parse($expired);
            $data['expired_date'] = $c->toDateString();   // 'Y-m-d'
            $data['expired_time'] = $c->format('H:i');    // 'HH:MM'
        }

        return $data;
    }

    protected function mutateFormDataBeforeSave(array $data): array
    {
        if (!empty($data['expired_date']) && !empty($data['expired_time'])) {
            $data['expired_at'] = Carbon::parse($data['expired_date'] . ' ' . $data['expired_time'] . ':00');
        }

        unset($data['expired_date'], $data['expired_time']);

        return $data;
    }
}
