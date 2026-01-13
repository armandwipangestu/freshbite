import AuthCard from '@/Components/AuthCard';
import ForgotPasswordCard from '@/Components/ForgotPasswordCard';

export default function AuthSection() {
    return (
        <section className="space-y-6">
            <h2 className="text-xl font-semibold">Auth Cards</h2>
            <div className="overflow-hidden rounded-[32px] border border-gray-100 bg-gray-50 p-6 lg:p-12">
                <div className="grid grid-cols-1 items-start justify-center gap-12 lg:grid-cols-2">
                    <div className="flex flex-col items-center space-y-4">
                        <p className="text-sm font-medium italic text-muted-foreground">
                            Login Variant
                        </p>
                        <AuthCard variant="login" />
                    </div>
                    <div className="flex flex-col items-center space-y-4">
                        <p className="text-sm font-medium italic text-muted-foreground">
                            Register Variant
                        </p>
                        <AuthCard variant="register" />
                    </div>
                </div>

                <div className="mx-auto mt-20 flex max-w-2xl flex-col items-center space-y-4 rounded-[24px] border border-gray-100 bg-white p-12 shadow-sm">
                    <p className="text-sm font-medium italic text-muted-foreground">
                        Forgot Password Variant
                    </p>
                    <ForgotPasswordCard />
                </div>
            </div>
            <div className="space-y-2">
                <p className="text-sm font-medium italic text-muted-foreground">
                    Note: These cards are designed for user authentication
                    (Login/Register) and integrate several reusable components.
                </p>
            </div>
        </section>
    );
}
