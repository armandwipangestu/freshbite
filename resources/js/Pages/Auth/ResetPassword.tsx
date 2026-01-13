import ResetPasswordCard from '@/Components/ResetPasswordCard';
import GuestLayout from '@/Layouts/GuestLayout';
import { Head, router, usePage } from '@inertiajs/react';

export default function ResetPassword({
    token,
    email,
}: {
    token: string;
    email: string;
}) {
    return (
        <GuestLayout>
            <Head title="Reset Password" />

            <div className="flex min-h-[80vh] w-full flex-col items-center justify-center px-4">
                <ResetPasswordCard
                    token={token}
                    email={email}
                    errors={usePage().props.errors}
                    onSubmit={(formData) => {
                        // Convert FormData to plain object for Inertia
                        const data = Object.fromEntries(formData);
                        router.post(route('password.store'), data);
                    }}
                />
            </div>
        </GuestLayout>
    );
}
