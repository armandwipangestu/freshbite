<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\PasswordUpdateRequest;
use App\Services\User\UserService;
use Illuminate\Http\RedirectResponse;

class PasswordController extends Controller
{
    protected $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    /**
     * Update the user's password.
     */
    public function update(PasswordUpdateRequest $request): RedirectResponse
    {
        $this->userService->updatePassword(
            $request->user(),
            $request->validated()['password']
        );

        return back()->with('status', 'password-updated');
    }
}
