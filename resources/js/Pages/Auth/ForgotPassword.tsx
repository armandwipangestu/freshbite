import ForgotPasswordCard from '@/Components/ForgotPasswordCard';
import GuestLayout from '@/Layouts/GuestLayout';
import { Head, router, usePage } from '@inertiajs/react';

export default function ForgotPassword({ status }: { status?: string }) {
    return (
        <GuestLayout>
            <Head title="Forgot Password" />

            <div className="flex min-h-[80vh] w-full flex-col items-center justify-center px-4">
                {status && (
                    <div className="mb-4 text-sm font-medium text-green-600">
                        {status}
                    </div>
                )}

                <ForgotPasswordCard
                    errors={usePage().props.errors}
                    onSubmit={(email) => {
                        router.post(route('password.email'), { email });
                    }}
                />
            </div>
        </GuestLayout>
    );
}
