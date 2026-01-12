import { Button } from '@/Components/ui/button';
import { Card, CardContent } from '@/Components/ui/card';
import { Input } from '@/Components/ui/input';
import { cn } from '@/lib/utils';

interface ForgotPasswordCardProps {
    onSubmit?: (email: string) => void;
    className?: string;
}

export default function ForgotPasswordCard({
    onSubmit,
    className,
}: ForgotPasswordCardProps) {
    return (
        <Card
            className={cn(
                'mx-auto w-full max-w-[480px] border-none bg-transparent shadow-none',
                className,
            )}
        >
            <CardContent className="space-y-12 p-8 sm:p-12">
                <div className="space-y-4">
                    <h2 className="text-3xl font-bold text-[#1A1A1A]">
                        Reset your password
                    </h2>
                    <p className="text-xl leading-relaxed text-gray-500">
                        Enter registered e-mail. We will send you a verification
                        code to reset your password.
                    </p>
                </div>

                <form
                    className="space-y-10"
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
                            className="py-4 text-lg placeholder:text-gray-300"
                            required
                        />
                    </div>

                    <Button
                        type="submit"
                        className="h-16 w-full rounded-[18px] bg-[#22C55E] text-xl font-bold text-white shadow-none hover:bg-[#1AAA4B]"
                    >
                        Continue
                    </Button>
                </form>
            </CardContent>
        </Card>
    );
}
