import { Button } from '@/Components/ui/button';
import InputError from '@/Components/InputError';
import { Card, CardContent } from '@/Components/ui/card';
import { Input } from '@/Components/ui/input';
import { Label } from '@/Components/ui/label';
import { cn } from '@/lib/utils';
import { Eye, EyeOff } from 'lucide-react';
import * as React from 'react';

interface ResetPasswordCardProps {
    className?: string;
    errors?: Record<string, string>;
    token: string;
    email: string;
    onSubmit?: (data: FormData) => void;
}

export default function ResetPasswordCard({
    className,
    errors = {},
    token,
    email,
    onSubmit,
}: ResetPasswordCardProps) {
    const [showPassword, setShowPassword] = React.useState(false);
    const [showConfirmPassword, setShowConfirmPassword] = React.useState(false);

    return (
        <Card
            className={cn(
                'mx-auto w-full max-w-[640px] border-none bg-transparent shadow-none',
                className,
            )}
        >
            <CardContent className="space-y-8 p-6 sm:p-10">
                <div className="space-y-2 text-center">
                    <h2 className="text-2xl font-bold text-[#1A1A1A]">
                        Reset Password
                    </h2>
                    <p className="text-base leading-relaxed text-gray-500">
                        Create a new password for your account.
                    </p>
                </div>

                <form
                    className="space-y-6"
                    onSubmit={(e) => {
                        e.preventDefault();
                        const formData = new FormData(e.currentTarget);
                        formData.append('token', token);
                        formData.append('email', email);
                        onSubmit?.(formData);
                    }}
                >
                    <div className="space-y-1.5">
                        <Label
                            htmlFor="email"
                            className="text-sm font-medium text-[#1A1A1A]"
                        >
                            Email
                        </Label>
                        <Input
                            id="email"
                            type="email"
                            name="email"
                            value={email}
                            disabled
                            className="h-11 rounded-xl border-gray-200 bg-gray-50 px-4 text-base text-gray-500"
                            required
                        />
                        <InputError message={errors.email} className="mt-2" />
                    </div>

                    <div className="space-y-1.5">
                        <Label
                            htmlFor="password"
                            className="text-sm font-medium text-[#1A1A1A]"
                        >
                            Password
                        </Label>
                        <div className="relative">
                            <Input
                                id="password"
                                name="password"
                                type={showPassword ? 'text' : 'password'}
                                placeholder="******"
                                className="h-11 rounded-xl border-gray-200 px-4 pr-10 text-base"
                                required
                            />
                            <button
                                type="button"
                                onClick={() => setShowPassword(!showPassword)}
                                className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
                            >
                                {showPassword ? (
                                    <EyeOff className="h-4 w-4" />
                                ) : (
                                    <Eye className="h-4 w-4" />
                                )}
                            </button>
                        </div>
                        <InputError
                            message={errors.password}
                            className="mt-2"
                        />
                    </div>

                    <div className="space-y-1.5">
                        <Label
                            htmlFor="password_confirmation"
                            className="text-sm font-medium text-[#1A1A1A]"
                        >
                            Confirm Password
                        </Label>
                        <div className="relative">
                            <Input
                                id="password_confirmation"
                                name="password_confirmation"
                                type={showConfirmPassword ? 'text' : 'password'}
                                placeholder="******"
                                className="h-11 rounded-xl border-gray-200 px-4 pr-10 text-base"
                                required
                            />
                            <button
                                type="button"
                                onClick={() => setShowConfirmPassword(!showConfirmPassword)}
                                className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
                            >
                                {showConfirmPassword ? (
                                    <EyeOff className="h-4 w-4" />
                                ) : (
                                    <Eye className="h-4 w-4" />
                                )}
                            </button>
                        </div>
                        <InputError
                            message={errors.password_confirmation}
                            className="mt-2"
                        />
                    </div>

                    <Button
                        type="submit"
                        className="h-12 w-full rounded-xl bg-[#22C55E] text-base font-bold text-white shadow-none hover:bg-[#1AAA4B]"
                    >
                        Reset Password
                    </Button>
                </form>
            </CardContent>
        </Card>
    );
}
