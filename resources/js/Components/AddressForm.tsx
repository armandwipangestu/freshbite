import InputError from '@/Components/InputError';
import Modal from '@/Components/Modal';
import { Button } from '@/Components/ui/button';
import { Input } from '@/Components/ui/input';
import { Label } from '@/Components/ui/label';
import { useForm } from '@inertiajs/react';
import { FormEventHandler, useEffect, useState } from 'react';

interface Province {
    id: number;
    name: string;
}

interface City {
    id: number;
    name: string;
    province_id: number;
}

interface AddressData {
    id: number;
    label_name: string;
    recipient_name: string;
    phone_number: string;
    province_id: number;
    city_id: number;
    address: string;
    note_for_courier?: string;
    is_default: boolean;
}

interface AddressFormProps {
    show: boolean;
    onClose: () => void;
    onSuccess?: () => void;
    initialData?: AddressData;
}

export default function AddressForm({
    show,
    onClose,
    onSuccess,
    initialData,
}: AddressFormProps) {
    const isEditing = !!initialData;
    const [provinces, setProvinces] = useState<Province[]>([]);
    const [cities, setCities] = useState<City[]>([]);
    const [loadingGeo, setLoadingGeo] = useState(false);

    const { data, setData, post, patch, processing, errors, reset } = useForm({
        label_name: '',
        recipient_name: '',
        phone_number: '',
        province_id: '',
        city_id: '',
        address: '',
        note_for_courier: '',
        is_default: false,
    });

    // Fetch provinces on component mount
    useEffect(() => {
        fetchProvinces();
    }, []);

    // Update form when initialData changes
    useEffect(() => {
        if (show && initialData) {
            setData({
                label_name: initialData.label_name,
                recipient_name: initialData.recipient_name,
                phone_number: initialData.phone_number,
                province_id: initialData.province_id.toString(),
                city_id: initialData.city_id.toString(),
                address: initialData.address,
                note_for_courier: initialData.note_for_courier || '',
                is_default: initialData.is_default,
            });
            // Fetch cities for this province
            fetchCities(initialData.province_id);
        } else if (show && !initialData) {
            reset();
        }
    }, [show, initialData]);

    const fetchProvinces = async () => {
        try {
            const response = await fetch('/api/provinces', {
                headers: {
                    'X-Requested-With': 'XMLHttpRequest',
                },
            });
            const provinceList = await response.json();
            setProvinces(provinceList);
        } catch (error) {
            console.error('Error fetching provinces:', error);
        }
    };

    const fetchCities = async (provinceId: number | string) => {
        if (!provinceId) {
            setCities([]);
            return;
        }

        setLoadingGeo(true);
        try {
            const response = await fetch(
                `/api/cities?province_id=${provinceId}`,
                {
                    headers: {
                        'X-Requested-With': 'XMLHttpRequest',
                    },
                },
            );
            const citiesList = await response.json();
            setCities(citiesList);
        } catch (error) {
            console.error('Error fetching cities:', error);
            setCities([]);
        } finally {
            setLoadingGeo(false);
        }
    };

    const handleProvinceChange = (value: string) => {
        setData('province_id', value);
        setData('city_id', '');
        if (value) {
            fetchCities(parseInt(value, 10));
        }
    };

    const submit: FormEventHandler = (e) => {
        e.preventDefault();

        if (isEditing && initialData) {
            patch(route('addresses.update', initialData.id), {
                preserveScroll: true,
                onSuccess: () => {
                    reset();
                    onClose();
                    onSuccess?.();
                },
            });
        } else {
            post(route('addresses.store'), {
                preserveScroll: true,
                onSuccess: () => {
                    reset();
                    onClose();
                    onSuccess?.();
                },
            });
        }
    };

    const handleClose = () => {
        reset();
        onClose();
    };

    return (
        <Modal show={show} onClose={handleClose} maxWidth="lg">
            <div className="max-h-[90vh] overflow-y-auto p-6 sm:p-8">
                <div className="sticky top-0 z-10 -mx-6 -mt-6 mb-6 bg-white px-6 py-4 sm:-mx-8 sm:px-8">
                    <h2 className="mb-2 text-2xl font-bold text-[#1A1A1A]">
                        {isEditing ? 'Edit Address' : 'Add New Address'}
                    </h2>

                    <p className="text-gray-600">
                        {isEditing
                            ? 'Update your address information.'
                            : 'Add a new delivery address.'}
                    </p>
                </div>

                <form onSubmit={submit} className="space-y-6">
                    {/* Label Name */}
                    <div className="space-y-2">
                        <Label
                            htmlFor="label_name"
                            className="text-base text-[#666666]"
                        >
                            Label Name (e.g., Home, Office)
                        </Label>
                        <Input
                            id="label_name"
                            value={data.label_name}
                            onChange={(e) =>
                                setData('label_name', e.target.value)
                            }
                            placeholder="e.g., Home"
                            className="h-12 rounded-[16px] px-6 text-base"
                            disabled={processing}
                        />
                        <InputError
                            message={errors.label_name}
                            className="mt-2"
                        />
                    </div>

                    {/* Recipient Name */}
                    <div className="space-y-2">
                        <Label
                            htmlFor="recipient_name"
                            className="text-base text-[#666666]"
                        >
                            Recipient Name
                        </Label>
                        <Input
                            id="recipient_name"
                            value={data.recipient_name}
                            onChange={(e) =>
                                setData('recipient_name', e.target.value)
                            }
                            placeholder="Full name"
                            className="h-12 rounded-[16px] px-6 text-base"
                            disabled={processing}
                        />
                        <InputError
                            message={errors.recipient_name}
                            className="mt-2"
                        />
                    </div>

                    {/* Phone Number */}
                    <div className="space-y-2">
                        <Label
                            htmlFor="phone_number"
                            className="text-base text-[#666666]"
                        >
                            Phone Number
                        </Label>
                        <Input
                            id="phone_number"
                            type="tel"
                            value={data.phone_number}
                            onChange={(e) =>
                                setData('phone_number', e.target.value)
                            }
                            placeholder="e.g., +62812345678"
                            className="h-12 rounded-[16px] px-6 text-base"
                            disabled={processing}
                        />
                        <InputError
                            message={errors.phone_number}
                            className="mt-2"
                        />
                    </div>

                    {/* Province */}
                    <div className="space-y-2">
                        <Label
                            htmlFor="province_id"
                            className="text-base text-[#666666]"
                        >
                            Province
                        </Label>
                        <select
                            id="province_id"
                            value={data.province_id}
                            onChange={(e) =>
                                handleProvinceChange(e.target.value)
                            }
                            className="h-12 rounded-[16px] border border-gray-200 px-6 text-base"
                            disabled={processing}
                        >
                            <option value="">Select Province</option>
                            {provinces.map((province) => (
                                <option
                                    key={province.id}
                                    value={province.id.toString()}
                                >
                                    {province.name}
                                </option>
                            ))}
                        </select>
                        <InputError
                            message={errors.province_id}
                            className="mt-2"
                        />
                    </div>

                    {/* City */}
                    <div className="space-y-2">
                        <Label
                            htmlFor="city_id"
                            className="text-base text-[#666666]"
                        >
                            City
                        </Label>
                        <select
                            id="city_id"
                            value={data.city_id}
                            onChange={(e) => setData('city_id', e.target.value)}
                            className="h-12 rounded-[16px] border border-gray-200 px-6 text-base"
                            disabled={
                                processing || loadingGeo || !data.province_id
                            }
                        >
                            <option value="">
                                {!data.province_id
                                    ? 'Select Province First'
                                    : 'Select City'}
                            </option>
                            {cities.map((city) => (
                                <option
                                    key={city.id}
                                    value={city.id.toString()}
                                >
                                    {city.name}
                                </option>
                            ))}
                        </select>
                        <InputError message={errors.city_id} className="mt-2" />
                    </div>

                    {/* Address */}
                    <div className="space-y-2">
                        <Label
                            htmlFor="address"
                            className="text-base text-[#666666]"
                        >
                            Address
                        </Label>
                        <textarea
                            id="address"
                            value={data.address}
                            onChange={(e) => setData('address', e.target.value)}
                            placeholder="Enter your full address"
                            rows={4}
                            className="w-full rounded-[16px] border border-gray-200 px-6 py-3 text-base"
                            disabled={processing}
                        />
                        <InputError message={errors.address} className="mt-2" />
                    </div>

                    {/* Note for Courier */}
                    <div className="space-y-2">
                        <Label
                            htmlFor="note_for_courier"
                            className="text-base text-[#666666]"
                        >
                            Note for Courier (Optional)
                        </Label>
                        <textarea
                            id="note_for_courier"
                            value={data.note_for_courier}
                            onChange={(e) =>
                                setData('note_for_courier', e.target.value)
                            }
                            placeholder="e.g., Ring the doorbell twice"
                            rows={3}
                            className="w-full rounded-[16px] border border-gray-200 px-6 py-3 text-base"
                            disabled={processing}
                        />
                        <InputError
                            message={errors.note_for_courier}
                            className="mt-2"
                        />
                    </div>

                    {/* Set as Default */}
                    <div className="flex items-center gap-3">
                        <input
                            id="is_default"
                            type="checkbox"
                            checked={data.is_default}
                            onChange={(e) =>
                                setData('is_default', e.target.checked)
                            }
                            className="h-4 w-4 rounded border-gray-300 text-[#22C55E] focus:ring-[#22C55E]"
                            disabled={processing}
                        />
                        <label
                            htmlFor="is_default"
                            className="text-base text-[#666666]"
                        >
                            Set as default address
                        </label>
                    </div>

                    <div className="sticky bottom-0 -mx-6 -mb-6 flex justify-end gap-3 bg-gray-50 px-6 py-4 sm:-mx-8 sm:px-8">
                        <Button
                            type="button"
                            variant="outline"
                            onClick={handleClose}
                            disabled={processing}
                            className="h-12 rounded-[16px] border-gray-300 px-8 font-semibold sm:h-14"
                        >
                            Cancel
                        </Button>
                        <Button
                            type="submit"
                            disabled={processing}
                            className="h-12 rounded-[16px] bg-[#22C55E] px-8 font-semibold text-white shadow-none hover:bg-[#1AAA4B] disabled:opacity-50 sm:h-14"
                        >
                            {processing
                                ? 'Saving...'
                                : isEditing
                                  ? 'Update Address'
                                  : 'Add Address'}
                        </Button>
                    </div>
                </form>
            </div>
        </Modal>
    );
}
