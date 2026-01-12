import AuthCard from "@/Components/AuthCard";
import ForgotPasswordCard from "@/Components/ForgotPasswordCard";

export default function AuthSection() {
    return (
        <section className="space-y-6">
            <h2 className="text-xl font-semibold">Auth Cards</h2>
            <div className="bg-gray-50 border border-gray-100 rounded-[32px] p-6 lg:p-12 overflow-hidden">
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-start justify-center">
                    <div className="space-y-4 flex flex-col items-center">
                        <p className="text-sm font-medium text-muted-foreground italic">Login Variant</p>
                        <AuthCard variant="login" />
                    </div>
                    <div className="space-y-4 flex flex-col items-center">
                        <p className="text-sm font-medium text-muted-foreground italic">Register Variant</p>
                        <AuthCard variant="register" />
                    </div>
                </div>

                <div className="mt-20 space-y-4 flex flex-col items-center bg-white p-12 rounded-[24px] border border-gray-100 max-w-2xl mx-auto shadow-sm">
                    <p className="text-sm font-medium text-muted-foreground italic">Forgot Password Variant</p>
                    <ForgotPasswordCard />
                </div>
            </div>
            <div className="space-y-2">
                <p className="text-sm font-medium text-muted-foreground italic">
                    Note: These cards are designed for user authentication (Login/Register) and integrate several reusable components.
                </p>
            </div>
        </section>
    );
}
