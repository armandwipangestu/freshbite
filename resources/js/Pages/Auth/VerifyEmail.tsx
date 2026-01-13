import { Button } from '@/Components/ui/button';
import { Card, CardContent } from '@/Components/ui/card';
import GuestLayout from '@/Layouts/GuestLayout';
import { Head, Link, useForm } from '@inertiajs/react';
import { Mail } from 'lucide-react';
import { FormEventHandler } from 'react';

export default function VerifyEmail({ status }: { status?: string }) {
    const { post, processing } = useForm({});

    const submit: FormEventHandler = (e) => {
        e.preventDefault();
        post(route('verification.send'));
    };

    return (
        <GuestLayout>
            <Head title="Email Verification" />

            <div className="flex min-h-[80vh] w-full flex-col items-center justify-center px-4">
                <Card className="w-full max-w-[640px] overflow-hidden rounded-[32px] border border-gray-100 bg-white shadow-sm">
                    <CardContent className="p-6 sm:p-10">
                        <div className="mb-8 flex flex-col items-center text-center">
                            <div className="mb-6 flex h-20 w-20 items-center justify-center rounded-full bg-[#22C55E]/10">
                                <Mail className="h-10 w-10 text-[#22C55E]" />
                            </div>
                            <h2 className="mb-2 text-2xl font-bold text-[#1A1A1A]">
                                Verify your email
                            </h2>
                            <p className="max-w-sm text-base text-gray-500">
                                Thanks for signing up! Before getting started,
                                please verify your email address by clicking on
                                the link we just sent to you.
                            </p>
                        </div>

                        {status === 'verification-link-sent' && (
                            <div className="mb-6 rounded-xl bg-green-50 p-4 text-center text-sm font-medium text-green-600">
                                A new verification link has been sent to your
                                email address.
                            </div>
                        )}

                        <form onSubmit={submit} className="space-y-4">
                            <Button
                                type="submit"
                                disabled={processing}
                                className="h-12 w-full rounded-xl bg-[#22C55E] text-base font-bold text-white shadow-none hover:bg-[#1AAA4B]"
                            >
                                {processing
                                    ? 'Sending...'
                                    : 'Resend Verification Email'}
                            </Button>

                            <div className="text-center">
                                <Link
                                    href={route('logout')}
                                    method="post"
                                    as="button"
                                    className="text-sm font-medium text-gray-500 hover:text-gray-700 hover:underline"
                                >
                                    Log Out
                                </Link>
                            </div>
                        </form>
                    </CardContent>
                </Card>
            </div>
        </GuestLayout>
    );
}
