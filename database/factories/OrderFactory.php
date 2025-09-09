<?php

namespace Database\Factories;

use App\Models\RajaOngkirCourier;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Order>
 */
class OrderFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $courier_code = ['jne', 'pos', 'tiki'];

        return [
            'total_price' => fake()->numberBetween(10000, 1000000),
            'payment_status' => fake()->randomElement(['pending', 'paid', 'failed', 'waiting']),
            'payment_url' => 'https://app.sandbox.midtrans.com/snap/v4/redirection/' . fake()->uuid(),
            'payment_booking_code' => fake()->regexify('[0-9]-[0-9][A-Z][0-9]{3}'),
            'user_id' => User::inRandomOrder()->value('id'),
            'courier_id' => RajaOngkirCourier::where('code', fake()->randomElement($courier_code))->value('id'),
            'created_at' => fake()->dateTimeBetween('-1 years', 'now'),
        ];
    }
}
