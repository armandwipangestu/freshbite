import InputError from '@/Components/InputError';
import Modal from '@/Components/Modal';
import { Button } from '@/Components/ui/button';
import { Input } from '@/Components/ui/input';
import { Label } from '@/Components/ui/label';
import { useForm } from '@inertiajs/react';
import { Eye, EyeOff } from 'lucide-react';
import { FormEventHandler, useRef, useState } from 'react';

interface PasswordChangeDialogProps {
    show: boolean;
    onClose: () => void;
}

export default function PasswordChangeDialog({
    show,
    onClose,
}: PasswordChangeDialogProps) {
    const passwordInput = useRef<HTMLInputElement>(null);
    const currentPasswordInput = useRef<HTMLInputElement>(null);

    const [showCurrentPassword, setShowCurrentPassword] = useState(false);
    const [showPassword, setShowPassword] = useState(false);
    const [showConfirmPassword, setShowConfirmPassword] = useState(false);

    const {
        data,
        setData,
        put,
        processing,
        errors,
        reset,
        recentlySuccessful,
    } = useForm({
        current_password: '',
        password: '',
        password_confirmation: '',
    });

    const updatePassword: FormEventHandler = (e) => {
        e.preventDefault();

        put(route('password.update'), {
            preserveScroll: true,
            onSuccess: () => {
                reset();
                // Close dialog after 1.5 seconds to show success message
                setTimeout(() => {
                    onClose();
                }, 1500);
            },
            onError: (errors) => {
                if (errors.password) {
                    reset('password', 'password_confirmation');
                    passwordInput.current?.focus();
                }

                if (errors.current_password) {
                    reset('current_password');
                    currentPasswordInput.current?.focus();
                }
            },
        });
    };

    return (
        <Modal show={show} onClose={onClose} maxWidth="md">
            <div className="bg-background p-6 sm:p-8">
                <h2 className="mb-2 text-2xl font-bold text-foreground">
                    Change Password
                </h2>

                <p className="mb-6 text-gray-600">
                    Ensure your account is using a long, random password to stay
                    secure.
                </p>

                <form onSubmit={updatePassword} className="space-y-6">
                    <div className="space-y-2">
                        <Label
                            htmlFor="current_password"
                            className="text-base text-[#666666] sm:text-lg"
                        >
                            Current Password
                        </Label>
                        <div className="relative">
                            <Input
                                id="current_password"
                                ref={currentPasswordInput}
                                type={showCurrentPassword ? 'text' : 'password'}
                                value={data.current_password}
                                onChange={(e) =>
                                    setData('current_password', e.target.value)
                                }
                                className="h-12 rounded-[16px] px-6 pr-12 text-base sm:h-14 sm:text-lg"
                                disabled={processing}
                                autoComplete="current-password"
                            />
                            <button
                                type="button"
                                onClick={() =>
                                    setShowCurrentPassword(!showCurrentPassword)
                                }
                                className="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 transition-colors hover:text-gray-600"
                                disabled={processing}
                            >
                                {showCurrentPassword ? (
                                    <EyeOff className="h-5 w-5" />
                                ) : (
                                    <Eye className="h-5 w-5" />
                                )}
                            </button>
                        </div>
                        <InputError
                            message={errors.current_password}
                            className="mt-2"
                        />
                    </div>

                    <div className="space-y-2">
                        <Label
                            htmlFor="password"
                            className="text-base text-[#666666] sm:text-lg"
                        >
                            New Password
                        </Label>
                        <div className="relative">
                            <Input
                                id="password"
                                ref={passwordInput}
                                type={showPassword ? 'text' : 'password'}
                                value={data.password}
                                onChange={(e) =>
                                    setData('password', e.target.value)
                                }
                                className="h-12 rounded-[16px] px-6 pr-12 text-base sm:h-14 sm:text-lg"
                                disabled={processing}
                                autoComplete="new-password"
                            />
                            <button
                                type="button"
                                onClick={() => setShowPassword(!showPassword)}
                                className="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 transition-colors hover:text-gray-600"
                                disabled={processing}
                            >
                                {showPassword ? (
                                    <EyeOff className="h-5 w-5" />
                                ) : (
                                    <Eye className="h-5 w-5" />
                                )}
                            </button>
                        </div>
                        <InputError
                            message={errors.password}
                            className="mt-2"
                        />
                    </div>

                    <div className="space-y-2">
                        <Label
                            htmlFor="password_confirmation"
                            className="text-base text-[#666666] sm:text-lg"
                        >
                            Confirm Password
                        </Label>
                        <div className="relative">
                            <Input
                                id="password_confirmation"
                                type={showConfirmPassword ? 'text' : 'password'}
                                value={data.password_confirmation}
                                onChange={(e) =>
                                    setData(
                                        'password_confirmation',
                                        e.target.value,
                                    )
                                }
                                className="h-12 rounded-[16px] px-6 pr-12 text-base sm:h-14 sm:text-lg"
                                disabled={processing}
                                autoComplete="new-password"
                            />
                            <button
                                type="button"
                                onClick={() =>
                                    setShowConfirmPassword(!showConfirmPassword)
                                }
                                className="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 transition-colors hover:text-gray-600"
                                disabled={processing}
                            >
                                {showConfirmPassword ? (
                                    <EyeOff className="h-5 w-5" />
                                ) : (
                                    <Eye className="h-5 w-5" />
                                )}
                            </button>
                        </div>
                        <InputError
                            message={errors.password_confirmation}
                            className="mt-2"
                        />
                    </div>

                    {recentlySuccessful && (
                        <div className="rounded-[12px] border border-green-200 bg-green-50 p-4 text-sm text-green-700">
                            ✓ Password updated successfully.
                        </div>
                    )}

                    <div className="flex flex-col justify-end gap-3 pt-4 sm:flex-row">
                        <Button
                            type="button"
                            variant="outline"
                            onClick={onClose}
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
                            {processing ? 'Updating...' : 'Update Password'}
                        </Button>
                    </div>
                </form>
            </div>
        </Modal>
    );
}
