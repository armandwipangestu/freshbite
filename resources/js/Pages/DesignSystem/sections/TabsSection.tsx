import SettingsTabs from '@/Components/SettingsTabs';

export default function TabsSection() {
    return (
        <section className="space-y-6">
            <h2 className="text-xl font-semibold">Tabs Component</h2>
            <div className="rounded-[32px] border border-gray-100 bg-gray-50 p-6 lg:p-12">
                <SettingsTabs />
            </div>
            <div className="space-y-2">
                <p className="text-sm font-medium italic text-muted-foreground">
                    Note: The SettingsTabs component integrates
                    AvatarUploadCard, Profile Information fields, Address
                    Management, and Theme Preferences.
                </p>
            </div>
        </section>
    );
}
