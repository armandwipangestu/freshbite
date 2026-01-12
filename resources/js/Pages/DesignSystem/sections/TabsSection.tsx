import SettingsTabs from "@/Components/SettingsTabs";

export default function TabsSection() {
    return (
        <section className="space-y-6">
            <h2 className="text-xl font-semibold">Tabs Component</h2>
            <div className="bg-gray-50 border border-gray-100 rounded-[32px] p-6 lg:p-12">
                <SettingsTabs />
            </div>
            <div className="space-y-2">
                <p className="text-sm font-medium text-muted-foreground italic">
                    Note: The SettingsTabs component integrates AvatarUploadCard, Profile Information fields, Address Management, and Theme Preferences.
                </p>
            </div>
        </section>
    );
}
