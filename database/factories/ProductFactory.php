<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
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
            'name' => fake()->sentence(6),
            'description' => fake()->paragraph(3),
            'price' => fake()->numberBetween(10000, 100000),
            'stock' => fake()->numberBetween(10, 100),
            'total_sold' => fake()->numberBetween(10, 100),
            'is_published' => fake()->boolean,
            'created_at' => $created_at,
            'updated_at' => $updated_at,
        ];
    }
}
