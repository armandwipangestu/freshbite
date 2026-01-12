import AuthCard from '@/Components/AuthCard';
import GuestLayout from '@/Layouts/GuestLayout';
import { Head, router, usePage } from '@inertiajs/react';

export default function Login({
    status,
    canResetPassword,
}: {
    status?: string;
    canResetPassword: boolean;
}) {
    return (
        <GuestLayout>
            <Head title="Log in" />

            <div className="flex min-h-[80vh] w-full flex-col items-center justify-center px-4">
                {status && (
                    <div className="mb-4 text-sm font-medium text-green-600">
                        {status}
                    </div>
                )}

                <AuthCard
                    variant="login"
                    errors={usePage().props.errors}
                    onSubmit={(data) => {
                        router.post(route('login'), {
                            ...data,
                            remember: 'false', // AuthCard doesn't have remember me yet, defaulting to false or we can add it later
                        });
                    }}
                    onSwitchVariant={() => {
                        router.get(route('register'));
                    }}
                    onGoogleContinue={() => {
                        // Implement Google login logic if needed, or leave generic for now
                        console.log('Google login');
                    }}
                />
            </div>
        </GuestLayout>
    );
}
