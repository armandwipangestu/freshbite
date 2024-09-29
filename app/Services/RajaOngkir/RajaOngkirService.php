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
        $url = 'https://api.rajaongkir.com/starter/' . $endpoint;
        $options = [
            'headers' => [
                'key' => $this->apiKey,
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

    public function getProvinces($id = null)
    {
        $params = [];
        if ($id) {
            $params['id'] = $id;
        }

        return $this->request('province', $params);
    }

    public function getCity($id = null, $provinceId = null)
    {
        $params = [];
        if ($id) {
            $params['id'] = $id;
        }
        if ($provinceId) {
            $params['province'] = $provinceId;
        }

        return $this->request('city', $params);
    }

    public function getCost($origin, $destination, $weight, $courier)
    {
        $params = [
            'origin' => $origin,
            'destination' => $destination,
            'weight' => $weight,
            'courier' => $courier,
        ];

        return $this->request('cost', $params, 'POST');
    }
}
