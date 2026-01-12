import * as React from "react"
import { Search, Plus, MapPin, CheckCircle2, Circle } from "lucide-react"
import { cn } from "@/lib/utils"
import { Button } from "@/Components/ui/button"
import { Input } from "@/Components/ui/input"
import { Label } from "@/Components/ui/label"
import AvatarUploadCard from "@/Components/AvatarUploadCard"
import ThemePreviewCard from "@/Components/ThemePreviewCard"

type TabType = "profile" | "address" | "preferences"

export default function SettingsTabs() {
    const [activeTab, setActiveTab] = React.useState<TabType>("profile")

    const tabs = [
        { id: "profile", label: "Profile" },
        { id: "address", label: "Address" },
        { id: "preferences", label: "Preferences" },
    ]

    return (
        <div className="w-full bg-white rounded-[24px] border border-gray-100 shadow-sm overflow-hidden">
            {/* Tab Headers */}
            <div className="flex border-b border-gray-100 px-4 sm:px-8 pt-6 overflow-x-auto scrollbar-hide flex-nowrap">
                {tabs.map((tab) => (
                    <button
                        key={tab.id}
                        onClick={() => setActiveTab(tab.id as TabType)}
                        className={cn(
                            "px-4 sm:px-8 py-4 text-lg sm:text-xl font-medium transition-all relative whitespace-nowrap",
                            activeTab === tab.id
                                ? "text-[#22C55E]"
                                : "text-gray-400 hover:text-gray-600"
                        )}
                    >
                        {tab.label}
                        {activeTab === tab.id && (
                            <div className="absolute bottom-0 left-0 right-0 h-1 bg-[#22C55E] rounded-t-full" />
                        )}
                    </button>
                ))}
            </div>

            {/* Tab Content */}
            <div className="p-4 sm:p-8">
                {activeTab === "profile" && <ProfileTab />}
                {activeTab === "address" && <AddressTab />}
                {activeTab === "preferences" && <PreferencesTab />}
            </div>
        </div>
    )
}

function ProfileTab() {
    return (
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 items-start">
            <div className="lg:col-span-4">
                <AvatarUploadCard
                    currentAvatar="https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&q=80&w=800"
                />
            </div>
            <div className="lg:col-span-8 space-y-8">
                <div className="space-y-4">
                    <h3 className="text-xl sm:text-2xl font-bold text-[#1A1A1A]">Change information</h3>
                    <hr className="border-gray-100" />
                </div>

                <div className="grid grid-cols-1 gap-6">
                    <div className="space-y-2">
                        <Label htmlFor="name" className="text-base sm:text-lg text-[#666666]">Name</Label>
                        <Input id="name" defaultValue="Jane Doe" className="h-12 sm:h-14 rounded-[16px] text-base sm:text-lg px-6" />
                    </div>
                    <div className="space-y-2">
                        <Label htmlFor="email" className="text-base sm:text-lg text-[#666666]">Email</Label>
                        <Input id="email" type="email" defaultValue="jane.doe@example.com" className="h-12 sm:h-14 rounded-[16px] text-base sm:text-lg px-6" />
                    </div>
                </div>

                <div className="flex flex-col sm:flex-row justify-between items-center gap-4 pt-4">
                    <Button variant="outline" className="h-14 px-8 rounded-[16px] border-gray-300 text-lg font-semibold w-full sm:w-auto">
                        Change password
                    </Button>
                    <Button className="h-14 px-8 rounded-[16px] bg-[#22C55E] hover:bg-[#1AAA4B] text-white text-lg font-semibold w-full sm:w-auto shadow-none">
                        Update profile
                    </Button>
                </div>
            </div>
        </div>
    )
}

function AddressTab() {
    const addresses = [
        {
            id: 1,
            label: "Home",
            isMain: true,
            name: "Jane Doe",
            phone: "6281234567890",
            address: "[Fresh Bite Note: Jl. FooBar, Gg. BarFoo No. 99 RT. 01 RW 01, Kelurahan Foo, Kecamatan Bar, Kota Bandung] (White House)"
        },
        {
            id: 2,
            label: "Office",
            isMain: false,
            name: "John Doe",
            phone: "6281234567890",
            address: "[Fresh Bite Note: Jl. BarFoo, Gg. FooBar No. 33 RT. 09 RW 09, Kelurahan Bar, Kecamatan Foo, Kota Jakarta] (White House)"
        }
    ]

    return (
        <div className="space-y-8">
            <div className="flex flex-col sm:flex-row gap-4 items-center justify-between">
                <div className="relative w-full max-w-md">
                    <Input
                        placeholder="Search here..."
                        className="h-12 sm:h-14 pl-4 pr-6 rounded-[16px] border-gray-200 text-base sm:text-lg"
                        icon={Search}
                        iconPosition="right"
                    />
                </div>
                <Button className="h-14 px-8 rounded-[16px] bg-[#22C55E] hover:bg-[#1AAA4B] text-white text-lg font-semibold flex items-center gap-2 shadow-none w-full sm:w-auto">
                    <Plus className="h-5 w-5" /> New Address
                </Button>
            </div>

            <div className="space-y-6">
                {addresses.map((addr) => (
                    <div
                        key={addr.id}
                        className={cn(
                            "p-6 rounded-[24px] border transition-all",
                            addr.isMain
                                ? "bg-[#F0FDF4] border-[#22C55E] shadow-[0_4px_20px_-4px_rgba(34,197,94,0.1)]"
                                : "bg-white border-gray-100 hover:border-gray-200"
                        )}
                    >
                        <div className="flex justify-between items-start mb-4">
                            <div className="space-y-1">
                                <div className="flex items-center gap-2 text-sm font-bold text-[#1A1A1A]">
                                    {addr.label}
                                    {addr.isMain && (
                                        <span className="bg-gray-200 text-gray-600 text-[10px] px-1.5 py-0.5 rounded uppercase tracking-wider">Main</span>
                                    )}
                                </div>
                                <h4 className="text-lg font-bold text-[#1A1A1A]">{addr.name}</h4>
                                <p className="text-gray-500 font-medium">{addr.phone}</p>
                            </div>
                            {!addr.isMain && (
                                <Button className="h-9 sm:h-10 px-4 sm:px-6 rounded-lg bg-[#22C55E] hover:bg-[#1AAA4B] text-white font-semibold shadow-none text-sm">
                                    Choose
                                </Button>
                            )}
                        </div>
                        <p className="text-gray-600 leading-relaxed mb-4">
                            {addr.address}
                        </p>
                        <button className="text-[#22C55E] font-bold text-sm hover:underline">
                            Change Address
                        </button>
                    </div>
                ))}
            </div>
        </div>
    )
}

function PreferencesTab() {
    const [theme, setTheme] = React.useState<"system" | "light" | "dark">("light")

    const themeOptions = [
        { id: "system", label: "Use system preferences", description: "Customize the display by following the settings on your device." },
        { id: "light", label: "Light", description: "" },
        { id: "dark", label: "Dark", description: "" },
    ]

    return (
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-12 items-start">
            <div className="lg:col-span-7 space-y-8">
                <p className="text-lg sm:text-xl text-gray-600 leading-relaxed max-w-2xl">
                    Freely set the color filter that you like and that is comfortable to look at.
                </p>

                <div className="space-y-6">
                    <h3 className="text-2xl font-bold text-[#1A1A1A]">Theme</h3>
                    <div className="space-y-4">
                        {themeOptions.map((opt) => (
                            <div
                                key={opt.id}
                                onClick={() => setTheme(opt.id as any)}
                                className="flex items-center justify-between py-4 border-b border-gray-100 cursor-pointer group"
                            >
                                <div className="space-y-1">
                                    <h4 className="text-lg sm:text-xl font-bold text-[#1A1A1A] group-hover:text-[#22C55E] transition-colors">
                                        {opt.label}
                                    </h4>
                                    {opt.description && (
                                        <p className="text-gray-500">{opt.description}</p>
                                    )}
                                </div>
                                <div className={cn(
                                    "h-8 w-8 rounded-full border-2 flex items-center justify-center transition-all",
                                    theme === opt.id
                                        ? "border-[#22C55E] bg-[#F0FDF4]"
                                        : "border-gray-200 group-hover:border-gray-300"
                                )}>
                                    {theme === opt.id && <div className="h-4 w-4 rounded-full bg-[#22C55E]" />}
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </div>

            <div className="lg:col-span-5">
                <ThemePreviewCard
                    previewImage="https://images.unsplash.com/photo-1614332287897-cdc485fa562d?auto=format&fit=crop&q=80&w=800"
                />
            </div>
        </div>
    )
}
