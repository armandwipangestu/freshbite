import * as React from "react"
import { Eye, EyeOff } from "lucide-react"
import { cn } from "@/lib/utils"
import { Button } from "@/Components/ui/button"
import { Input } from "@/Components/ui/input"
import { Label } from "@/Components/ui/label"
import { Card, CardContent } from "@/Components/ui/card"

interface AuthCardProps {
    variant?: "login" | "register"
    onSubmit?: (data: any) => void
    onSwitchVariant?: () => void
    onGoogleContinue?: () => void
    className?: string
}

export default function AuthCard({
    variant = "login",
    onSubmit,
    onSwitchVariant,
    onGoogleContinue,
    className,
}: AuthCardProps) {
    const [showPassword, setShowPassword] = React.useState(false)

    const isLogin = variant === "login"

    return (
        <Card className={cn("rounded-[32px] border border-gray-100 bg-white shadow-sm overflow-hidden w-full max-w-[480px]", className)}>
            <CardContent className="p-8 sm:p-12">
                <div className="text-center mb-10">
                    <h2 className="text-3xl font-bold text-[#1A1A1A] mb-2">
                        {isLogin ? "Login" : "Register"}
                    </h2>
                    {isLogin && (
                        <p className="text-2xl font-semibold text-[#1A1A1A]">Welcome back!</p>
                    )}
                </div>

                <form
                    className="space-y-6"
                    onSubmit={(e) => {
                        e.preventDefault()
                        const formData = new FormData(e.currentTarget)
                        onSubmit?.(Object.fromEntries(formData))
                    }}
                >
                    {!isLogin && (
                        <div className="space-y-2">
                            <Label htmlFor="name" className="text-lg text-[#1A1A1A] font-medium">Name</Label>
                            <Input
                                id="name"
                                name="name"
                                placeholder="Foo Bar"
                                className="h-14 rounded-[16px] border-gray-200 text-lg px-6"
                                required
                            />
                        </div>
                    )}

                    <div className="space-y-2">
                        <Label htmlFor="email" className="text-lg text-[#1A1A1A] font-medium">Email</Label>
                        <Input
                            id="email"
                            name="email"
                            type="email"
                            placeholder="foobar@example.com"
                            className="h-14 rounded-[16px] border-gray-200 text-lg px-6"
                            required
                        />
                    </div>

                    <div className="space-y-2">
                        <Label htmlFor="password" className="text-lg text-[#1A1A1A] font-medium">Password</Label>
                        <div className="relative">
                            <Input
                                id="password"
                                name="password"
                                type={showPassword ? "text" : "password"}
                                placeholder="******"
                                className="h-14 rounded-[16px] border-gray-200 text-lg px-6 pr-14"
                                required
                            />
                            <button
                                type="button"
                                onClick={() => setShowPassword(!showPassword)}
                                className="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600 p-1"
                            >
                                {showPassword ? <EyeOff className="h-6 w-6" /> : <Eye className="h-6 w-6" />}
                            </button>
                        </div>
                    </div>

                    {isLogin && (
                        <div className="text-right">
                            <a href="#" className="text-[#22C55E] font-bold text-lg hover:underline">
                                Forgot password?
                            </a>
                        </div>
                    )}

                    <Button
                        type="submit"
                        className="w-full h-16 rounded-[18px] bg-[#22C55E] hover:bg-[#1AAA4B] text-white text-xl font-bold shadow-none"
                    >
                        {isLogin ? "Login" : "Register"}
                    </Button>
                </form>

                <div className="mt-6 text-center">
                    <p className="text-lg text-[#1A1A1A]">
                        {isLogin ? "Don't have an account? " : "Already have an account? "}
                        <button
                            onClick={onSwitchVariant}
                            className="text-[#22C55E] font-bold hover:underline"
                        >
                            {isLogin ? "Sign up" : "Sign in"}
                        </button>
                    </p>
                </div>

                <div className="relative my-10">
                    <div className="absolute inset-0 flex items-center">
                        <span className="w-full border-t border-gray-300" />
                    </div>
                    <div className="relative flex justify-center text-lg uppercase">
                        <span className="bg-white px-4 text-[#1A1A1A]">OR</span>
                    </div>
                </div>

                <Button
                    variant="outline"
                    type="button"
                    onClick={onGoogleContinue}
                    className="w-full h-16 rounded-[18px] border-gray-300 text-[#1A1A1A] text-lg font-bold flex items-center justify-center gap-4 hover:bg-gray-50"
                >
                    <svg className="h-6 w-6" viewBox="0 0 24 24">
                        <path
                            d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"
                            fill="#4285F4"
                        />
                        <path
                            d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"
                            fill="#34A853"
                        />
                        <path
                            d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l3.66-2.84z"
                            fill="#FBBC05"
                        />
                        <path
                            d="M12 5.38c1.62 0 3.06.56 4.21 1.66l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"
                            fill="#EA4335"
                        />
                    </svg>
                    Continue with Google
                </Button>
            </CardContent>
        </Card>
    )
}
