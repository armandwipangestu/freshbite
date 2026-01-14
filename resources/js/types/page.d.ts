import type { PageProps as InertiaPageProps } from '@inertiajs/core';
import type { AuthUser } from './auth';

export type AppPageProps<
    T extends Record<string, unknown> = Record<string, unknown>,
> = InertiaPageProps & {
    auth: {
        user: AuthUser | null;
    };
} & T;
