import AuthCard from '@/Components/AuthCard';
import GuestLayout from '@/Layouts/GuestLayout';
import { Head, router, usePage } from '@inertiajs/react';

export default function Register() {
    return (
        <GuestLayout>
            <Head title="Register" />

            <div className="flex min-h-[80vh] w-full flex-col items-center justify-center px-4">
                <AuthCard
                    variant="register"
                    errors={usePage().props.errors}
                    onSubmit={(data) => {
                        router.post(route('register'), data);
                    }}
                    onSwitchVariant={() => {
                        router.get(route('login'));
                    }}
                    onGoogleContinue={() => {
                        window.location.href = route('social.redirect');
                    }}
                />
            </div>
        </GuestLayout>
    );
}
