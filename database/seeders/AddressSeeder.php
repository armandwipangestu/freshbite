<?php

namespace Database\Seeders;

use App\Models\Address;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AddressSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $admin = User::where('email', 'admin@freshbite.com')->first();

        if (! $admin) {
            $this->command->warn('Admin user not found.');
            return;
        }

        $admin->addresses()->delete();

        Address::factory()
            ->for($admin)
            ->default()
            ->create([
                'label_name' => 'Primary Address',
            ]);

        Address::factory()
            ->for($admin)
            ->create([
                'label_name' => 'Secondary Address',
            ]);

        Address::factory()
            ->for($admin)
            ->create([
                'label_name' => 'Third Address',
            ]);

        Address::factory()
            ->for($admin)
            ->create([
                'label_name' => 'Fourth Address',
            ]);

        Address::factory()
            ->for($admin)
            ->create([
                'label_name' => 'Fifth Address',
            ]);

        Address::factory()
            ->for($admin)
            ->create([
                'label_name' => 'Sixth Address',
            ]);

        Address::factory()
            ->for($admin)
            ->create([
                'label_name' => 'Seventh Address',
            ]);
    }
}
