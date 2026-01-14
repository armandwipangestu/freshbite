import SettingsTabs from '@/Components/SettingsTabs';
import { PageProps } from '@/types';
import { Head, usePage } from '@inertiajs/react';

export default function Edit({
    mustVerifyEmail,
    status,
}: PageProps<{ mustVerifyEmail: boolean; status?: string }>) {
    const user = usePage().props.auth.user!;

    return (
        <>
            <Head title="Profile" />

            <div className="bg-gray-50/50 py-12">
                <div className="mx-auto max-w-7xl space-y-6 px-4 sm:px-6 lg:px-8">
                    {/* Header Section */}
                    <div className="flex flex-col gap-2">
                        <h2 className="text-3xl font-bold tracking-tight text-[#1A1A1A]">
                            Settings
                        </h2>
                        <p className="text-lg text-gray-500">
                            Manage your account settings and preferences.
                        </p>
                    </div>

                    {/* Settings Tabs Component */}
                    <SettingsTabs user={user} />
                </div>
            </div>
        </>
    );
}
