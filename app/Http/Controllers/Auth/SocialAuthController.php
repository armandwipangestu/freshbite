<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Services\User\UserService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;

class SocialAuthController extends Controller
{
    protected UserService $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    /**
     * Redirect the user to the Google authentication page.
     *
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function redirect(Request $request)
    {
        if ($request->input('display') === 'popup') {
            $request->session()->put('display', 'popup');
        }

        return Socialite::driver('google')->redirect();
    }

    /**
     * Obtain the user information from Google.
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\Response
     */
    public function callback(Request $request)
    {
        try {
            $socialUser = Socialite::driver('google')->user();
        } catch (\Exception $e) {
            return redirect()->route('login')->withErrors(['email' => 'Unable to login with Google. Please try again.']);
        }

        $user = $this->userService->handleSocialUser($socialUser, 'google');

        Auth::login($user);

        if ($request->session()->pull('display') === 'popup') {
            return response(view('auth.popup-callback'));
        }

        return redirect()->intended(route('dashboard', absolute: false));
    }

    /**
     * Handle the One Tap callback from Google.
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function oneTapCallback(Request $request)
    {
        try {
            $client = new \Google\Client(['client_id' => config('services.google.client_id')]);
            $payload = $client->verifyIdToken($request->credential);

            if (!$payload) {
                return redirect()->back()->withErrors(['email' => 'Invalid Google ID Token.']);
            }

            $socialUser = new \Laravel\Socialite\Two\User();
            $socialUser->map([
                'id' => $payload['sub'],
                'name' => $payload['name'],
                'email' => $payload['email'],
                'avatar' => $payload['picture'] ?? null,
            ]);

            $user = $this->userService->handleSocialUser($socialUser, 'google');

            Auth::login($user);

            return redirect()->intended(route('dashboard', absolute: false));
        } catch (\Exception $e) {
            return redirect()->back()->withErrors(['email' => 'Google One Tap failed. Please try again.']);
        }
    }
}
