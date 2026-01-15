<?php

namespace Database\Factories;

use App\Models\RajaOngkirCity;
use App\Models\RajaOngkirProvince;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Address>
 */
class AddressFactory extends Factory
{
    public function definition(): array
    {
        $province = RajaOngkirProvince::inRandomOrder()->first();

        $city = RajaOngkirCity::where('province_id', $province->id)
            ->inRandomOrder()
            ->first();

        $streets = [
            'Jl. Sudirman',
            'Jl. Thamrin',
            'Jl. Gatot Subroto',
            'Jl. Diponegoro',
            'Jl. Ahmad Yani',
        ];

        $courierNotes = [
            'Mohon hubungi penerima sebelum pengiriman.',
            'Titip ke satpam jika penerima tidak ada.',
            'Rumah pagar hitam, dekat masjid.',
            'Pengiriman pagi lebih diutamakan.',
            'Harap jangan meninggalkan paket tanpa konfirmasi.',
        ];

        return [
            'label_name' => fake()->randomElement(['House', 'Apartment', 'Office', 'Other']),
            'recipient_name' => fake()->name(),
            'phone_number' => fake()->numerify('08##########'),

            'province_id' => $province->id,
            'city_id' => $city->id,

            'address' => sprintf(
                '%s No. %d, RT %02d/RW %02d',
                fake()->randomElement($streets),
                fake()->numberBetween(1, 200),
                fake()->numberBetween(1, 10),
                fake()->numberBetween(1, 10),
            ),

            'note_for_courier' => fake()->randomElement($courierNotes),

            'is_default' => false,
        ];
    }

    /**
     * State: default address
     */
    public function default(): static
    {
        return $this->state(fn() => [
            'is_default' => true,
        ]);
    }
}
