<?php

namespace App\Http\Controllers;

use App\Services\Home\HomeService;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

class HomeController extends Controller
{
    protected $homeService;

    public function __construct(HomeService $homeService)
    {
        $this->homeService = $homeService;
    }

    public function index()
    {
        $data = $this->homeService->getLandingPageData();

        return Inertia::render('Welcome', array_merge($data, [
            'canLogin' => Route::has('login'),
            'canRegister' => Route::has('register'),
            'laravelVersion' => Application::VERSION,
            'phpVersion' => PHP_VERSION,
        ]));
    }
}
