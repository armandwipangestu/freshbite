import { cn } from "@/lib/utils"
import { Button } from "@/Components/ui/button"
import { Input } from "@/Components/ui/input"
import { Card, CardContent } from "@/Components/ui/card"

interface ForgotPasswordCardProps {
    onSubmit?: (email: string) => void
    className?: string
}

export default function ForgotPasswordCard({
    onSubmit,
    className,
}: ForgotPasswordCardProps) {
    return (
        <Card className={cn("border-none shadow-none bg-transparent w-full max-w-[480px] mx-auto", className)}>
            <CardContent className="p-8 sm:p-12 space-y-12">
                <div className="space-y-4">
                    <h2 className="text-3xl font-bold text-[#1A1A1A]">
                        Reset your password
                    </h2>
                    <p className="text-xl text-gray-500 leading-relaxed">
                        Enter registered e-mail. We will send you a verification code to reset your password.
                    </p>
                </div>

                <form
                    className="space-y-10"
                    onSubmit={(e) => {
                        e.preventDefault()
                        const formData = new FormData(e.currentTarget)
                        onSubmit?.(formData.get("email") as string)
                    }}
                >
                    <div className="space-y-2">
                        <Input
                            id="email"
                            name="email"
                            type="email"
                            placeholder="Email"
                            variant="underline"
                            className="text-lg py-4 placeholder:text-gray-300"
                            required
                        />
                    </div>

                    <Button
                        type="submit"
                        className="w-full h-16 rounded-[18px] bg-[#22C55E] hover:bg-[#1AAA4B] text-white text-xl font-bold shadow-none"
                    >
                        Continue
                    </Button>
                </form>
            </CardContent>
        </Card>
    )
}
