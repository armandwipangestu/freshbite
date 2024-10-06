<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Banner>
 */
class BannerFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $created_at = fake()->dateTimeBetween('-1 year', 'now');
        $updated_at = fake()->dateTimeBetween($created_at, 'now');

        return [
            'image' => fake()->imageUrl(),
            'is_active' => fake()->boolean(),
            'target_url' => fake()->url(),
            'created_at' => $created_at,
            'updated_at' => $updated_at,
        ];
    }
}
