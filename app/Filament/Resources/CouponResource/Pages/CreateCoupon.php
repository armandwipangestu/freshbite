<?php

namespace App\Filament\Resources\CouponResource\Pages;

use App\Filament\Resources\CouponResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Carbon;

class CreateCoupon extends CreateRecord
{
    protected static string $resource = CouponResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        if (!empty($data['expired_date']) && !empty($data['expired_time'])) {
            $data['expired_at'] = Carbon::parse($data['expired_date'] . ' ' . $data['expired_time'] . ':00');
        }

        unset($data['expired_date'], $data['expired_time']);

        return $data;
    }
}
