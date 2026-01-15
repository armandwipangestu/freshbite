import { clsx, type ClassValue } from 'clsx';
import { twMerge } from 'tailwind-merge';

export function cn(...inputs: ClassValue[]) {
    return twMerge(clsx(inputs));
}

export const resolveAvatarUrl = (
    avatar?: string | null,
): string | undefined => {
    if (!avatar) return undefined;

    if (avatar.startsWith('http://') || avatar.startsWith('https://')) {
        return avatar;
    }

    if (avatar.startsWith('/storage/') || avatar.startsWith('storage/')) {
        return avatar.startsWith('/') ? avatar : `/${avatar}`;
    }

    return `/storage/${avatar}`;
};
