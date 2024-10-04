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
            $provinces = $rajaOngkirService->getProvinces();

            foreach ($provinces['rajaongkir']['results'] as $provinceData) {
                $province = RajaOngkirProvince::create([
                    'id' => $provinceData['province_id'],
                    'name' => $provinceData['province'],
                ]);

                // Ambil data kota berdasarkan provinsi
                $cities = $rajaOngkirService->getCity(null, $province->id);

                foreach ($cities['rajaongkir']['results'] as $cityData) {
                    RajaOngkirCity::create([
                        'id' => $cityData['city_id'],
                        'name' => $cityData['city_name'],
                        'type' => $cityData['type'],
                        'postal_code' => $cityData['postal_code'],
                        'province_id' => $cityData['province_id'],
                    ]);
                }
            }
        }
    }
}
