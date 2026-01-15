<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreAddressRequest;
use App\Http\Requests\UpdateAddressRequest;
use App\Models\RajaOngkirCity;
use App\Models\RajaOngkirProvince;
use App\Services\Address\AddressService;
use App\Services\RajaOngkirCity\RajaOngkirCityService;
use App\Services\RajaOngkirProvince\RajaOngkirProvinceService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class AddressController extends Controller
{
    protected $addressService;
    protected $rajaOngkirProvinceService;
    protected $rajaOngkirCityService;

    public function __construct(AddressService $addressService, RajaOngkirProvinceService $rajaOngkirProvinceService, RajaOngkirCityService $rajaOngkirCityService)
    {
        $this->addressService = $addressService;
        $this->rajaOngkirProvinceService = $rajaOngkirProvinceService;
        $this->rajaOngkirCityService = $rajaOngkirCityService;
    }

    /**
     * Get paginated addresses for the authenticated user.
     */
    public function index(Request $request)
    {
        $search = $request->query('search');
        $addresses = $this->addressService->getPaginatedByUser($request->user(), $search);

        return response()->json([
            'data' => $addresses->items(),
            'total' => $addresses->total(),
            'per_page' => $addresses->perPage(),
            'current_page' => $addresses->currentPage(),
            'last_page' => $addresses->lastPage(),
            'links' => [
                'prev' => $addresses->previousPageUrl(),
                'next' => $addresses->nextPageUrl(),
            ],
        ]);
    }

    /**
     * Store a newly created address.
     */
    public function store(StoreAddressRequest $request)
    {
        $address = $this->addressService->createAddress($request->user(), $request->validated());

        return Redirect::back()->with('status', 'address-created');
    }

    /**
     * Update the specified address.
     */
    public function update(UpdateAddressRequest $request, int $id)
    {
        $address = $this->addressService->updateAddress($id, $request->validated());

        return Redirect::back()->with('status', 'address-updated');
    }

    /**
     * Delete the specified address.
     */
    public function destroy(Request $request, int $id)
    {
        $this->addressService->deleteAddress($id);

        return Redirect::back()->with('status', 'address-deleted');
    }

    /**
     * Set an address as default.
     */
    public function setDefault(Request $request, int $id)
    {
        $this->addressService->setAsDefault($request->user(), $id);

        return Redirect::back()->with('status', 'address-default-set');
    }

    /**
     * Get all provinces for the province select dropdown.
     */
    public function getProvinces()
    {
        $provinces = $this->rajaOngkirProvinceService->getProvinces();

        return response()->json($provinces);
    }

    /**
     * Get cities for a specific province.
     */
    public function getCities(Request $request)
    {
        $provinceId = $request->query('province_id');

        if (!$provinceId) {
            return response()->json([], 400);
        }

        $cities = $this->rajaOngkirCityService->getCitiesByProvinceId((int)$provinceId);

        return response()->json($cities);
    }
}
