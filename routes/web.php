<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\AddressController;
use App\Http\Controllers\PreferencesController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/role', function () {
    return 'Role Admin Page';
})->middleware(['role:admin']);

Route::get('/permission', function () {
    return 'Permission View Dashboard Page';
})->middleware(['permission:view dashboard']);

use App\Http\Controllers\HomeController;

Route::get('/', [HomeController::class, 'index'])->name('home');

// --- Default Breeze Routes ---
// Route::get('/dashboard', function () {
//     return Inertia::render('Dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

// --- Alias dashboard to home ---
Route::get('/dashboard', function () {
    return redirect()->route('home');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::match(['patch', 'post'], '/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    // Address routes
    Route::get('/addresses', [AddressController::class, 'index'])->name('addresses.index');
    Route::post('/addresses', [AddressController::class, 'store'])->name('addresses.store');
    Route::patch('/addresses/{id}', [AddressController::class, 'update'])->name('addresses.update');
    Route::delete('/addresses/{id}', [AddressController::class, 'destroy'])->name('addresses.destroy');
    Route::patch('/addresses/{id}/set-default', [AddressController::class, 'setDefault'])->name('addresses.set-default');

    // Address API endpoints for dropdowns
    Route::get('/api/provinces', [AddressController::class, 'getProvinces'])->name('api.provinces');
    Route::get('/api/cities', [AddressController::class, 'getCities'])->name('api.cities');

    // Preferences routes
    Route::get('/api/preferences', [PreferencesController::class, 'show'])->name('preferences.show');
    Route::patch('/preferences', [PreferencesController::class, 'update'])->name('preferences.update');
});

Route::get('/design-system', function () {
    return Inertia::render('DesignSystem/Index');
})->name('design-system');

Route::get('/health', function () {
    return response()->json(['status' => 'ok']);
});

require __DIR__ . '/auth.php';
