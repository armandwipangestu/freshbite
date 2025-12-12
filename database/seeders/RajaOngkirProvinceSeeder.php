<?php

namespace Database\Seeders;

use App\Models\RajaOngkirCity;
use App\Models\RajaOngkirProvince;
use App\Services\RajaOngkir\RajaOngkirService;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RajaOngkirProvinceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $rajaOngkirService = new RajaOngkirService();

        if (RajaOngkirProvince::count() == 0) {
            $provincesResponse = $rajaOngkirService->getProvinces();

            foreach ($provincesResponse['data'] as $provinceData) {
                $province = RajaOngkirProvince::create([
                    'id' => $provinceData['id'],
                    'name' => $provinceData['name'],
                ]);

                // ambil city berdasarkan province id
                $citiesResponse = $rajaOngkirService->getCitiesByProvince($province->id);

                foreach ($citiesResponse['data'] as $cityData) {
                    RajaOngkirCity::create([
                        'id' => $cityData['id'],
                        'name' => $cityData['name'],
                        'type' => $cityData['type'] ?? null,
                        'postal_code' => $cityData['zip_code'] ?? null,
                        'province_id' => $province->id,
                    ]);
                }
            }
        }
    }
}
