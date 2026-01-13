import { router, usePage } from '@inertiajs/react';
import { useEffect } from 'react';

export default function GoogleOneTap() {
    const { social } = usePage().props;
    const clientId = social?.google_client_id;

    useEffect(() => {
        if (!clientId) return;

        const handleCredentialResponse = (
            response: google.accounts.id.CredentialResponse,
        ) => {
            router.post(route('social.one-tap'), {
                credential: response.credential,
            });
        };

        const initializeGoogleOneTap = () => {
            if (!window.google) return;

            window.google.accounts.id.initialize({
                client_id: clientId,
                callback: handleCredentialResponse,
                auto_select: false,
                cancel_on_tap_outside: false,
            });

            window.google.accounts.id.prompt(
                (notification: google.accounts.id.PromptMomentNotification) => {
                    if (
                        notification.isNotDisplayed() ||
                        notification.isSkippedMoment()
                    ) {
                        // console.log('One Tap skipped or not displayed');
                        // optional debug / analytics
                    }
                },
            );
        };

        const scriptSelector =
            'script[src="https://accounts.google.com/gsi/client"]';

        if (!document.querySelector(scriptSelector)) {
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
