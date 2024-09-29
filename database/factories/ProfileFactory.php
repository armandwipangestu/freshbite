<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Profile>
 */
class ProfileFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'theme' => fake()->randomElement(['light', 'dark', 'system']),
            'gender' => fake()->randomElement(['male', 'female']),
            'user_id' => User::inRandomOrder()->value('id'),
        ];
    }
}
