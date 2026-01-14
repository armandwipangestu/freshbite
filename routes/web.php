<?php

use App\Http\Controllers\ProfileController;
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

// Route::get('/dashboard', function () {
//     return Inertia::render('Dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::match(['patch', 'post'], '/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

Route::get('/design-system', function () {
    return Inertia::render('DesignSystem/Index');
})->name('design-system');

Route::get('/health', function () {
    return response()->json(['status' => 'ok']);
});

require __DIR__ . '/auth.php';
