<?php

namespace App\Http\Controllers;

use App\Http\Requests\UpdatePreferencesRequest;
use App\Services\Preferences\PreferencesService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;

class PreferencesController extends Controller
{
    protected $preferencesService;

    public function __construct(PreferencesService $preferencesService)
    {
        $this->preferencesService = $preferencesService;
    }

    /**
     * Get user preferences.
     */
    public function show(Request $request)
    {
        $preferences = $this->preferencesService->getPreferences($request->user());

        return response()->json($preferences);
    }

    /**
     * Update user preferences.
     */
    public function update(UpdatePreferencesRequest $request)
    {
        $this->preferencesService->updatePreferences($request->user(), $request->validated());

        return Redirect::back()->with('status', 'preferences-updated');
    }
}
