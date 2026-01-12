import { Button } from '@/Components/ui/button';
import InputError from '@/Components/InputError';
import { Card, CardContent } from '@/Components/ui/card';
import { Input } from '@/Components/ui/input';
import { cn } from '@/lib/utils';

interface ForgotPasswordCardProps {
    onSubmit?: (email: string) => void;
    className?: string;
    errors?: Record<string, string>;
}

export default function ForgotPasswordCard({
    onSubmit,
    className,
    errors = {},
}: ForgotPasswordCardProps) {
    return (
        <Card
            className={cn(
                'mx-auto w-full max-w-[640px] border-none bg-transparent shadow-none',
                className,
            )}
        >
            <CardContent className="space-y-8 p-6 sm:p-10">
                <div className="space-y-2">
                    <h2 className="text-2xl font-bold text-[#1A1A1A]">
                        Reset your password
                    </h2>
                    <p className="text-base leading-relaxed text-gray-500">
                        Enter registered e-mail. We will send you a verification
                        code to reset your password.
                    </p>
                </div>

                <form
                    className="space-y-6"
                    onSubmit={(e) => {
                        e.preventDefault();
                        const formData = new FormData(e.currentTarget);
                        onSubmit?.(formData.get('email') as string);
                    }}
                >
                    <div className="space-y-2">
                        <Input
                            id="email"
                            name="email"
                            type="email"
                            placeholder="Email"
                            variant="underline"
                            className="h-11 py-2 text-base placeholder:text-gray-300"
                            required
                        />
                        <InputError message={errors.email} className="mt-2" />
                    </div>

                    <Button
                        type="submit"
                        className="h-12 w-full rounded-xl bg-[#22C55E] text-base font-bold text-white shadow-none hover:bg-[#1AAA4B]"
                    >
                        Continue
                    </Button>
                </form>
            </CardContent>
        </Card>
    );
}
