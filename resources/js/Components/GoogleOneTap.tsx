import { router, usePage } from '@inertiajs/react';
import { useEffect } from 'react';

declare global {
    interface Window {
        google: any;
        onGoogleLibraryLoad?: () => void;
    }
}

export default function GoogleOneTap() {
    const { social } = usePage().props as any;
    const clientId = social?.google_client_id;

    useEffect(() => {
        if (!clientId) return;

        const handleCredentialResponse = (response: any) => {
            router.post(route('social.one-tap'), {
                credential: response.credential,
            });
        };

        const initializeGoogleOneTap = () => {
            if (!window.google) return;

            window.google.accounts.id.initialize({
                client_id: clientId,
                callback: handleCredentialResponse,
                auto_select: false, // Optional: auto select if 1 account
                cancel_on_tap_outside: false,
            });

            window.google.accounts.id.prompt((notification: any) => {
                if (notification.isNotDisplayed() || notification.isSkippedMoment()) {
                    // console.log('One Tap skipped or not displayed');
                }
            });
        };

        // Load script if not loaded
        if (!document.querySelector('script[src="https://accounts.google.com/gsi/client"]')) {
            const script = document.createElement('script');
            script.src = 'https://accounts.google.com/gsi/client';
            script.async = true;
            script.defer = true;
            script.onload = initializeGoogleOneTap;
            document.body.appendChild(script);
        } else {
            initializeGoogleOneTap();
        }
    }, [clientId]);

    return null; // This component doesn't render DOM elements, it spawns the popup
}
