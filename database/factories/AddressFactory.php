<?php

namespace Database\Factories;

use App\Models\RajaOngkirCity;
use App\Models\RajaOngkirProvince;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Address>
 */
class AddressFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $province_id = RajaOngkirProvince::inRandomOrder()->value('id');
        return [
            'label_name' => fake()->randomElement(['House', 'Apartment', 'Office', 'Other']),
            'recipient_name' => fake()->name(),
            'phone_number' => fake()->regexify('[0-9]{10,13}'),
            'province_id' => $province_id,
            'city_id' => RajaOngkirCity::where('province_id', $province_id)->inRandomOrder()->value('id'),
            'address' => fake()->address(),
            'note_for_courier' => fake()->sentence(),
            'is_default' => fake()->boolean(),
            'user_id' => User::inRandomOrder()->value('id'),
        ];
    }
}
