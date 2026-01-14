import AvatarUploadCard from '@/Components/AvatarUploadCard';
import InputError from '@/Components/InputError';
import PasswordChangeDialog from '@/Components/PasswordChangeDialog';
import ThemePreviewCard from '@/Components/ThemePreviewCard';
import { Button } from '@/Components/ui/button';
import { Input } from '@/Components/ui/input';
import { Label } from '@/Components/ui/label';
import { cn } from '@/lib/utils';
import { useForm } from '@inertiajs/react';
import { Plus, Search } from 'lucide-react';
import * as React from 'react';
import { FormEventHandler } from 'react';

import { User } from '@/types';

type TabType = 'profile' | 'address' | 'preferences';

interface SettingsTabsProps {
    user: User;
}

export default function SettingsTabs({ user }: SettingsTabsProps) {
    const [activeTab, setActiveTab] = React.useState<TabType>('profile');

    const tabs = [
        { id: 'profile', label: 'Profile' },
        { id: 'address', label: 'Address' },
        { id: 'preferences', label: 'Preferences' },
    ];

    return (
        <div className="w-full overflow-hidden rounded-[24px] border border-gray-100 bg-white shadow-sm">
            {/* Tab Headers */}
            <div className="scrollbar-hide flex flex-nowrap overflow-x-auto border-b border-gray-100 px-4 pt-6 sm:px-8">
                {tabs.map((tab) => (
                    <button
                        key={tab.id}
                        onClick={() => setActiveTab(tab.id as TabType)}
                        className={cn(
                            'relative whitespace-nowrap px-4 py-4 text-lg font-medium transition-all sm:px-8 sm:text-xl',
                            activeTab === tab.id
                                ? 'text-[#22C55E]'
                                : 'text-gray-400 hover:text-gray-600',
                        )}
                    >
                        {tab.label}
                        {activeTab === tab.id && (
                            <div className="absolute bottom-0 left-0 right-0 h-1 rounded-t-full bg-[#22C55E]" />
                        )}
                    </button>
                ))}
            </div>

            {/* Tab Content */}
            <div className="p-4 sm:p-8">
                {activeTab === 'profile' && <ProfileTab user={user} />}
                {activeTab === 'address' && <AddressTab />}
                {activeTab === 'preferences' && <PreferencesTab />}
            </div>
        </div>
    );
}

function ProfileTab({ user }: { user: User }) {
    const [showPasswordDialog, setShowPasswordDialog] = React.useState(false);
    const [initialName] = React.useState(user.name || '');

    const { data, setData, post, processing, errors, recentlySuccessful } =
        useForm({
            name: user.name || '',
            avatar: null as File | null,
        });

    const submit: FormEventHandler = (e) => {
        e.preventDefault();

        // Check if there are actual changes
        const hasNameChange = data.name !== initialName;
        const hasAvatarChange = data.avatar !== null;

        if (!hasNameChange && !hasAvatarChange) {
            return;
        }

        post(route('profile.update'), {
            preserveScroll: true,
            forceFormData: true,
            data: {
                ...data,
                _method: 'PATCH',
            },
            onSuccess: () => setData('avatar', null),
        });
    };

    // Get avatar URL - check if user has avatar property
    const avatarUrl = (user as User & { avatar?: string }).avatar || undefined;

    return (
        <>
            <form onSubmit={submit}>
                <div className="grid grid-cols-1 items-start gap-12 lg:grid-cols-12">
                    <div className="lg:col-span-4">
                        <AvatarUploadCard
                            currentAvatar={avatarUrl}
                            value={data.avatar}
                            onChange={(file) => setData('avatar', file)}
                            error={errors.avatar}
                        />
                    </div>
                    <div className="space-y-8 lg:col-span-8">
                        <div className="space-y-4">
                            <h3 className="text-xl font-bold text-[#1A1A1A] sm:text-2xl">
                                Change information
                            </h3>
                            <hr className="border-gray-100" />
                        </div>

                        <div className="grid grid-cols-1 gap-6">
                            <div className="space-y-2">
                                <Label
                                    htmlFor="name"
                                    className="text-base text-[#666666] sm:text-lg"
                                >
                                    Name
                                </Label>
                                <Input
                                    id="name"
                                    value={data.name}
                                    onChange={(e) =>
                                        setData('name', e.target.value)
                                    }
                                    className="h-12 rounded-[16px] px-6 text-base sm:h-14 sm:text-lg"
                                    disabled={processing}
                                />
                                <InputError
                                    message={errors.name}
                                    className="mt-2"
                                />
                            </div>
                            <div className="space-y-2">
                                <Label
                                    htmlFor="email"
                                    className="text-base text-[#666666] sm:text-lg"
                                >
                                    Email
                                </Label>
                                <Input
                                    id="email"
                                    type="email"
                                    value={user.email}
                                    className="h-12 cursor-not-allowed rounded-[16px] bg-gray-50 px-6 text-base text-gray-500 sm:h-14 sm:text-lg"
                                    disabled
                                />
                            </div>
                        </div>

                        <div className="flex flex-col gap-4 pt-4 sm:flex-row">
                            <Button
                                type="button"
                                variant="outline"
                                className="h-14 flex-1 rounded-[16px] border-gray-300 px-8 text-lg font-semibold sm:flex-none"
                                onClick={() => setShowPasswordDialog(true)}
                            >
                                Change password
                            </Button>
                            <Button
                                type="submit"
                                disabled={processing}
                                className="h-14 flex-1 rounded-[16px] bg-[#22C55E] px-8 text-lg font-semibold text-white shadow-none hover:bg-[#1AAA4B] disabled:opacity-50 sm:flex-none"
                            >
                                {processing ? 'Updating...' : 'Update profile'}
                            </Button>
                        </div>

                        {recentlySuccessful && (
                            <div className="rounded-[12px] border border-green-200 bg-green-50 p-4 text-sm text-green-700">
                                ✓ Profile updated successfully.
                            </div>
                        )}
                    </div>
                </div>
            </form>

            <PasswordChangeDialog
                show={showPasswordDialog}
                onClose={() => setShowPasswordDialog(false)}
            />
        </>
    );
}

function AddressTab() {
    const addresses = [
        {
            id: 1,
            label: 'Home',
            isMain: true,
            name: 'Jane Doe',
            phone: '6281234567890',
            address:
                '[Fresh Bite Note: Jl. FooBar, Gg. BarFoo No. 99 RT. 01 RW 01, Kelurahan Foo, Kecamatan Bar, Kota Bandung] (White House)',
        },
        {
            id: 2,
            label: 'Office',
            isMain: false,
            name: 'John Doe',
            phone: '6281234567890',
            address:
                '[Fresh Bite Note: Jl. BarFoo, Gg. FooBar No. 33 RT. 09 RW 09, Kelurahan Bar, Kecamatan Foo, Kota Jakarta] (White House)',
        },
    ];

    return (
        <div className="space-y-8">
            <div className="flex flex-col items-center justify-between gap-4 sm:flex-row">
                <div className="relative w-full max-w-md">
                    <Input
                        placeholder="Search here..."
                        className="h-12 rounded-[16px] border-gray-200 pl-4 pr-6 text-base sm:h-14 sm:text-lg"
                        icon={Search}
                        iconPosition="right"
                    />
                </div>
                <Button className="flex h-14 w-full items-center gap-2 rounded-[16px] bg-[#22C55E] px-8 text-lg font-semibold text-white shadow-none hover:bg-[#1AAA4B] sm:w-auto">
                    <Plus className="h-5 w-5" /> New Address
                </Button>
            </div>

            <div className="space-y-6">
                {addresses.map((addr) => (
                    <div
                        key={addr.id}
                        className={cn(
                            'rounded-[24px] border p-6 transition-all',
                            addr.isMain
                                ? 'border-[#22C55E] bg-[#F0FDF4] shadow-[0_4px_20px_-4px_rgba(34,197,94,0.1)]'
                                : 'border-gray-100 bg-white hover:border-gray-200',
                        )}
                    >
                        <div className="mb-4 flex items-start justify-between">
                            <div className="space-y-1">
                                <div className="flex items-center gap-2 text-sm font-bold text-[#1A1A1A]">
                                    {addr.label}
                                    {addr.isMain && (
                                        <span className="rounded bg-gray-200 px-1.5 py-0.5 text-[10px] uppercase tracking-wider text-gray-600">
                                            Main
                                        </span>
                                    )}
                                </div>
                                <h4 className="text-lg font-bold text-[#1A1A1A]">
                                    {addr.name}
                                </h4>
                                <p className="font-medium text-gray-500">
                                    {addr.phone}
                                </p>
                            </div>
                            {!addr.isMain && (
                                <Button className="h-9 rounded-lg bg-[#22C55E] px-4 text-sm font-semibold text-white shadow-none hover:bg-[#1AAA4B] sm:h-10 sm:px-6">
                                    Choose
                                </Button>
                            )}
                        </div>
                        <p className="mb-4 leading-relaxed text-gray-600">
                            {addr.address}
                        </p>
                        <button className="text-sm font-bold text-[#22C55E] hover:underline">
                            Change Address
                        </button>
                    </div>
                ))}
            </div>
        </div>
    );
}

type ThemeType = 'system' | 'light' | 'dark';

function PreferencesTab() {
    const [theme, setTheme] = React.useState<ThemeType>('light');

    const themeOptions: {
        id: ThemeType;
        label: string;
        description: string;
    }[] = [
        {
            id: 'system',
            label: 'Use system preferences',
            description:
                'Customize the display by following the settings on your device.',
        },
        { id: 'light', label: 'Light', description: '' },
        { id: 'dark', label: 'Dark', description: '' },
    ];

    return (
        <div className="grid grid-cols-1 items-start gap-12 lg:grid-cols-12">
            <div className="space-y-8 lg:col-span-7">
                <p className="max-w-2xl text-lg leading-relaxed text-gray-600 sm:text-xl">
                    Freely set the color filter that you like and that is
                    comfortable to look at.
                </p>

                <div className="space-y-6">
                    <h3 className="text-2xl font-bold text-[#1A1A1A]">Theme</h3>
                    <div className="space-y-4">
                        {themeOptions.map((opt) => (
                            <div
                                key={opt.id}
                                onClick={() => setTheme(opt.id)}
                                className="group flex cursor-pointer items-center justify-between border-b border-gray-100 py-4"
                            >
                                <div className="space-y-1">
                                    <h4 className="text-lg font-bold text-[#1A1A1A] transition-colors group-hover:text-[#22C55E] sm:text-xl">
                                        {opt.label}
                                    </h4>
                                    {opt.description && (
                                        <p className="text-gray-500">
                                            {opt.description}
                                        </p>
                                    )}
                                </div>
                                <div
                                    className={cn(
                                        'flex h-8 w-8 items-center justify-center rounded-full border-2 transition-all',
                                        theme === opt.id
                                            ? 'border-[#22C55E] bg-[#F0FDF4]'
                                            : 'border-gray-200 group-hover:border-gray-300',
                                    )}
                                >
                                    {theme === opt.id && (
                                        <div className="h-4 w-4 rounded-full bg-[#22C55E]" />
                                    )}
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </div>

            <div className="lg:col-span-5">
                <ThemePreviewCard previewImage="https://images.unsplash.com/photo-1614332287897-cdc485fa562d?auto=format&fit=crop&q=80&w=800" />
            </div>
        </div>
    );
}
