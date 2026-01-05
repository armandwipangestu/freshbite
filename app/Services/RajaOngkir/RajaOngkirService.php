<?php

namespace App\Services\RajaOngkir;

use GuzzleHttp\Client;

class RajaOngkirService
{
    protected $client;
    protected $apiKey;

    public function __construct()
    {
        $this->client = new Client();
        $this->apiKey = env('RAJAONGKIR_API_KEY'); // Pastikan API key disimpan di file .env
    }

    protected function request($endpoint, $params = [], $method = 'GET')
    {
        $url = 'https://rajaongkir.komerce.id/api/v1/' . $endpoint;
        $options = [
            'headers' => [
                'Key' => $this->apiKey,
            ],
        ];

        if ($method === 'POST') {
            $options['form_params'] = $params;
        } else {
            if (!empty($params)) {
                $url .= '?' . http_build_query($params);
            }
        }

        $response = $this->client->request($method, $url, $options);

        return json_decode($response->getBody(), true);
    }

    protected function getCachedOrFetch($filename, $callback)
    {
        $path = database_path('data/rajaongkir/' . $filename . '.json');

        if (file_exists($path)) {
            $content = file_get_contents($path);
            return json_decode($content, true);
        }

        $data = $callback();

        if (!file_exists(dirname($path))) {
            mkdir(dirname($path), 0755, true);
        }

        file_put_contents($path, json_encode($data, JSON_PRETTY_PRINT));

        return $data;
    }

    public function getProvinces()
    {
        return $this->getCachedOrFetch('provinces', function () {
            return $this->request('destination/province');
        });
    }

    public function getCitiesByProvince($provinceId)
    {
        return $this->getCachedOrFetch('cities_prov_' . $provinceId, function () use ($provinceId) {
            return $this->request("destination/city/{$provinceId}");
        });
    }

    public function getDistrictsByCity($cityId)
    {
        return $this->request("destination/district/{$cityId}");
    }

    public function getSubDistrictsByDistrict($districtId)
    {
        return $this->request("destination/sub-district/{$districtId}");
    }

    public function getCost($origin, $destination, $weight, $couriers)
    {
        $params = [
            'origin' => $origin,
            'destination' => $destination,
            'weight' => $weight,
            'courier' => $couriers,
            'price' => 'lowest',
        ];

        return $this->request('calculate/district/domestic-cost', $params, 'POST');
    }
}
