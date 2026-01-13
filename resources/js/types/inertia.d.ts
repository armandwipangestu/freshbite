export interface SocialConfig {
    google_client_id?: string;
}

declare module '@inertiajs/core' {
    interface PageProps {
        social?: SocialConfig;
    }
}
