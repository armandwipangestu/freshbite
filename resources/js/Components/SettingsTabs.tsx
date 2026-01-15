import AddressForm from '@/Components/AddressForm';
import AvatarUploadCard from '@/Components/AvatarUploadCard';
import InputError from '@/Components/InputError';
import PasswordChangeDialog from '@/Components/PasswordChangeDialog';
import ThemePreviewCard from '@/Components/ThemePreviewCard';
import { Button } from '@/Components/ui/button';
import { Input } from '@/Components/ui/input';
import { Label } from '@/Components/ui/label';
import { cn } from '@/lib/utils';
import { router, useForm } from '@inertiajs/react';
import { Edit2, Plus, Search, Trash2 } from 'lucide-react';
import * as React from 'react';
import { FormEventHandler } from 'react';

import { User } from '@/types';

type TabType = 'profile' | 'address' | 'preferences';

interface AddressData {
    id: number;
    label_name: string;
    recipient_name: string;
    phone_number: string;
    address: string;
    note_for_courier?: string;
    is_default: boolean;
    province_id: number;
    city_id: number;
    province?: { name: string };
    city?: { name: string };
}

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
    const [showAddressForm, setShowAddressForm] = React.useState(false);
    const [editingAddress, setEditingAddress] =
        React.useState<AddressData | null>(null);
    const [searchQuery, setSearchQuery] = React.useState('');
    const [addresses, setAddresses] = React.useState<AddressData[]>([]);
    const [pagination, setPagination] = React.useState({
        current_page: 1,
        last_page: 1,
        per_page: 5,
        total: 0,
    });
    const [loading, setLoading] = React.useState(false);
    const [deleting, setDeleting] = React.useState<number | null>(null);
    const searchTimeoutRef = React.useRef<NodeJS.Timeout | null>(null);

    // Fetch addresses
    const fetchAddresses = React.useCallback(
        async (page = 1, search?: string) => {
            setLoading(true);
            try {
                const query = new URLSearchParams({
                    page: page.toString(),
                    search: search ?? searchQuery,
                });
                const response = await fetch(
                    route('addresses.index') + `?${query}`,
                    {
                        headers: {
                            'X-Requested-With': 'XMLHttpRequest',
                        },
                    },
                );
                const data = await response.json();
                setAddresses(data.data);
                setPagination({
                    current_page: data.current_page,
                    last_page: data.last_page,
                    per_page: data.per_page,
                    total: data.total,
                });
            } catch (error) {
                console.error('Error fetching addresses:', error);
            } finally {
                setLoading(false);
            }
        },
        [],
    );

    React.useEffect(() => {
        fetchAddresses(1);
    }, [fetchAddresses]);

    const handleDeleteAddress = (id: number) => {
        if (!confirm('Delete this address?')) return;

        router.delete(route('addresses.destroy', id), {
            preserveScroll: true,
            onStart: () => setDeleting(id),
            onFinish: () => setDeleting(null),
            onSuccess: () => fetchAddresses(pagination.current_page),
        });
    };

    const handleSetDefault = (addressId: number) => {
        router.patch(
            route('addresses.set-default', addressId),
            {},
            {
                preserveScroll: true,
                onSuccess: () => {
                    fetchAddresses(pagination.current_page);
                },
                onError: (errors) => {
                    console.error(errors);
                },
            },
        );
    };

    const handleAddressFormClose = () => {
        setShowAddressForm(false);
        setEditingAddress(null);
    };

    const handleAddressFormSuccess = () => {
        setSearchQuery('');
        fetchAddresses(1, '');
    };

    const handleSearch = (query: string) => {
        setSearchQuery(query);

        // Clear existing timeout
        if (searchTimeoutRef.current) {
            clearTimeout(searchTimeoutRef.current);
        }

        // Set new timeout for debounced search
        searchTimeoutRef.current = setTimeout(() => {
            fetchAddresses(1, query);
        }, 300);
    };

    // Clean up timeout on unmount
    React.useEffect(() => {
        return () => {
            if (searchTimeoutRef.current) {
                clearTimeout(searchTimeoutRef.current);
            }
        };
    }, []);

    return (
        <div className="space-y-8">
            {/* Search and New Address Button */}
            <div className="flex flex-col items-center justify-between gap-4 sm:flex-row">
                <div className="relative w-full max-w-md">
                    <Input
                        placeholder="Search by label, name, or address..."
                        value={searchQuery}
                        onChange={(e) => handleSearch(e.target.value)}
                        className="h-12 rounded-[16px] border-gray-200 pl-4 pr-6 text-base sm:h-14 sm:text-lg"
                        icon={Search}
                        iconPosition="right"
                        disabled={loading}
                    />
                </div>
                <Button
                    onClick={() => setShowAddressForm(true)}
                    className="flex h-14 w-full items-center gap-2 rounded-[16px] bg-[#22C55E] px-8 text-lg font-semibold text-white shadow-none hover:bg-[#1AAA4B] sm:w-auto"
                >
                    <Plus className="h-5 w-5" /> New Address
                </Button>
            </div>

            {/* Addresses List */}
            {loading && addresses.length === 0 ? (
                <div className="py-12 text-center">
                    <p className="text-gray-500">Loading addresses...</p>
                </div>
            ) : addresses.length === 0 ? (
                <div className="rounded-[24px] border border-gray-100 bg-white p-8 text-center">
                    <p className="mb-4 text-gray-500">
                        No addresses found. Add your first address to get
                        started.
                    </p>
                    <Button
                        onClick={() => setShowAddressForm(true)}
                        className="bg-[#22C55E] px-8 py-2 text-white hover:bg-[#1AAA4B]"
                    >
                        Add Address
                    </Button>
                </div>
            ) : (
                <div className="space-y-6">
                    {addresses.map((addr) => (
                        <div
                            key={addr.id}
                            className={cn(
                                'rounded-[24px] border p-6 transition-all',
                                addr.is_default
                                    ? 'border-[#22C55E] bg-[#F0FDF4] shadow-[0_4px_20px_-4px_rgba(34,197,94,0.1)]'
                                    : 'border-gray-100 bg-white hover:border-gray-200',
                            )}
                        >
                            <div className="mb-4 flex items-start justify-between">
                                <div className="flex-1 space-y-1">
                                    <div className="flex items-center gap-2 text-sm font-bold text-[#1A1A1A]">
                                        {addr.label_name}
                                        {addr.is_default && (
                                            <span className="rounded bg-[#22C55E] px-2 py-1 text-[10px] uppercase tracking-wider text-white">
                                                Default
                                            </span>
                                        )}
                                    </div>
                                    <h4 className="text-lg font-bold text-[#1A1A1A]">
                                        {addr.recipient_name}
                                    </h4>
                                    <p className="font-medium text-gray-500">
                                        {addr.phone_number}
                                    </p>
                                </div>
                                <div className="flex gap-2">
                                    <Button
                                        size="sm"
                                        variant="outline"
                                        onClick={() => {
                                            setEditingAddress(addr);
                                            setShowAddressForm(true);
                                        }}
                                        className="h-9 rounded-lg border-gray-300 px-3 sm:px-4"
                                    >
                                        <Edit2 className="h-4 w-4" />
                                    </Button>
                                    <Button
                                        size="sm"
                                        variant="outline"
                                        onClick={() =>
                                            handleDeleteAddress(addr.id)
                                        }
                                        disabled={deleting === addr.id}
                                        className="h-9 rounded-lg border-red-300 px-3 text-red-600 hover:bg-red-50 sm:px-4"
                                    >
                                        <Trash2 className="h-4 w-4" />
                                    </Button>
                                </div>
                            </div>

                            <p className="mb-4 leading-relaxed text-gray-600">
                                {addr.address}
                                {addr.city && addr.province && (
                                    <span className="text-gray-500">
                                        . {addr.city.name}, {addr.province.name}
                                    </span>
                                )}
                            </p>

                            {addr.note_for_courier && (
                                <p className="mb-4 text-sm text-gray-500">
                                    <span className="font-semibold">
                                        Note:{' '}
                                    </span>
                                    {addr.note_for_courier}
                                </p>
                            )}

                            {!addr.is_default && (
                                <button
                                    onClick={() => handleSetDefault(addr.id)}
                                    className="text-sm font-bold text-[#22C55E] hover:underline"
                                >
                                    Set as default
                                </button>
                            )}
                        </div>
                    ))}
                </div>
            )}

            {/* Pagination */}
            {pagination.last_page > 1 && (
                <div className="flex items-center justify-between gap-4 border-t border-gray-100 pt-6">
                    <div className="text-sm text-gray-500">
                        Showing {addresses.length} of {pagination.total}{' '}
                        addresses
                    </div>
                    <div className="flex gap-2">
                        <Button
                            variant="outline"
                            onClick={() =>
                                fetchAddresses(
                                    Math.max(1, pagination.current_page - 1),
                                )
                            }
                            disabled={pagination.current_page === 1 || loading}
                            className="rounded-lg border-gray-300 px-4 py-2"
                        >
                            Previous
                        </Button>
                        <div className="flex items-center gap-2">
                            {Array.from(
                                { length: pagination.last_page },
                                (_, i) => i + 1,
                            ).map((page) => (
                                <Button
                                    key={page}
                                    variant={
                                        page === pagination.current_page
                                            ? 'default'
                                            : 'outline'
                                    }
                                    onClick={() => fetchAddresses(page)}
                                    disabled={loading}
                                    className={
                                        page === pagination.current_page
                                            ? 'bg-[#22C55E] text-white hover:bg-[#1AAA4B]'
                                            : 'border-gray-300'
                                    }
                                >
                                    {page}
                                </Button>
                            ))}
                        </div>
                        <Button
                            variant="outline"
                            onClick={() =>
                                fetchAddresses(
                                    Math.min(
                                        pagination.last_page,
                                        pagination.current_page + 1,
                                    ),
                                )
                            }
                            disabled={
                                pagination.current_page ===
                                    pagination.last_page || loading
                            }
                            className="rounded-lg border-gray-300 px-4 py-2"
                        >
                            Next
                        </Button>
                    </div>
                </div>
            )}

            {/* Address Form Modal */}
            <AddressForm
                show={showAddressForm}
                onClose={handleAddressFormClose}
                onSuccess={handleAddressFormSuccess}
                initialData={editingAddress ?? undefined}
            />
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
