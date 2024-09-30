<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Coupon>
 */
class CouponFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'code' => fake()->unique()->word,
            'discount' => fake()->randomFloat(2, 0, 100),
            'stock' => fake()->numberBetween(1, 100),
            'expired_at' => fake()->dateTimeBetween('now', '+1 year'),
            'is_active' => fake()->boolean(80),
        ];
    }
}
