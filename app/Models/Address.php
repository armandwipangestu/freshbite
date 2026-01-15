<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Address extends Model
{
    use HasFactory;

    protected $fillable = [
        'label_name',
        'recipient_name',
        'phone_number',
        'province_id',
        'city_id',
        'address',
        'note_for_courier',
        'is_default',
        'user_id',
    ];

    protected $casts = [
        'is_default' => 'boolean',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function province(): BelongsTo
    {
        return $this->belongsTo(RajaOngkirProvince::class);
    }

    public function city(): BelongsTo
    {
        return $this->belongsTo(RajaOngkirCity::class);
    }
}
