<?php

namespace Database\Seeders;

use App\Models\RajaOngkirCourier;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RajaOngkirCourierSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $code = [
            'jne',
            'pos',
            'tiki',
            'rpx',
            'esl',
            'pcp',
            'pandu',
            'wahana',
            'sicepat',
            'jnt',
            'pahata',
            'cahaya',
            'sap',
            'jet',
            'indah',
            'dse',
            'slis',
            'first',
            'ncs',
            'star',
        ];

        foreach ($code as $c) {
            RajaOngkirCourier::create([
                'code' => $c,
            ]);
        }
    }
}
