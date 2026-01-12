import { Instagram, Facebook, Twitter, Music2 } from "lucide-react"
import { cn } from "@/lib/utils"

interface FooterProps {
    className?: string
}

export default function Footer({ className }: FooterProps) {
    const currentYear = new Date().getFullYear()

    return (
        <footer className={cn("bg-white py-16 px-6 md:px-12 lg:px-24 border-t border-gray-100", className)}>
            <div className="max-w-7xl mx-auto">
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-12 lg:gap-8">
                    {/* Brand Section */}
                    <div className="space-y-6">
                        <div className="flex items-center gap-2">
                            <img
                                src="/assets/logo.svg"
                                alt="FreshBite Logo"
                                className="h-10 w-auto"
                            />
                            {/* <span className="text-3xl font-bold text-[#22C55E]">FreshBite.</span> */}
                        </div>
                        <p className="text-[#666666] text-lg leading-relaxed max-w-xs">
                            Lorem ipsum dolor sit amet consectetur. Sed cursus viverra at pellentesque nunc id potenti elementum id.
                        </p>
                    </div>

                    {/* Discover Section */}
                    <div>
                        <h3 className="text-xl font-bold text-[#1A1A1A] mb-6">Discover</h3>
                        <ul className="space-y-4">
                            <li><a href="#" className="text-[#1A1A1A] hover:text-[#22C55E] transition-colors text-lg">Buy & Sell</a></li>
                            <li><a href="#" className="text-[#1A1A1A] hover:text-[#22C55E] transition-colors text-lg">Merchant</a></li>
                            <li><a href="#" className="text-[#1A1A1A] hover:text-[#22C55E] transition-colors text-lg">Giving back</a></li>
                            <li><a href="#" className="text-[#1A1A1A] hover:text-[#22C55E] transition-colors text-lg">Help & Support</a></li>
                        </ul>
                    </div>

                    {/* Service Section */}
                    <div>
                        <h3 className="text-xl font-bold text-[#1A1A1A] mb-6">Service</h3>
                        <ul className="space-y-4">
                            <li><a href="#" className="text-[#1A1A1A] hover:text-[#22C55E] transition-colors text-lg">Fruits</a></li>
                            <li><a href="#" className="text-[#1A1A1A] hover:text-[#22C55E] transition-colors text-lg">Vegetables</a></li>
                            <li><a href="#" className="text-[#1A1A1A] hover:text-[#22C55E] transition-colors text-lg">Seeds</a></li>
                            <li><a href="#" className="text-[#1A1A1A] hover:text-[#22C55E] transition-colors text-lg">Molds</a></li>
                        </ul>
                    </div>

                    {/* Social Section */}
                    <div>
                        <h3 className="text-xl font-bold text-[#1A1A1A] mb-6">Social</h3>
                        <div className="flex items-center gap-4">
                            <a href="#" className="bg-[#22C55E] p-2.5 rounded-xl text-white hover:bg-[#1AAA4B] transition-colors shadow-sm">
                                <Instagram className="h-6 w-6" />
                            </a>
                            <a href="#" className="bg-[#22C55E] p-2.5 rounded-xl text-white hover:bg-[#1AAA4B] transition-colors shadow-sm">
                                <Facebook className="h-6 w-6" />
                            </a>
                            <a href="#" className="bg-[#22C55E] p-2.5 rounded-xl text-white hover:bg-[#1AAA4B] transition-colors shadow-sm">
                                <Music2 className="h-6 w-6" />
                            </a>
                            <a href="#" className="bg-[#22C55E] p-2.5 rounded-xl text-white hover:bg-[#1AAA4B] transition-colors shadow-sm">
                                <Twitter className="h-6 w-6" />
                            </a>
                        </div>
                    </div>
                </div>

                <div className="mt-20 pt-8 border-t border-gray-100 flex flex-col md:flex-row justify-between items-center gap-4 text-gray-500 text-sm">
                    <p>© {currentYear} FreshBite. All rights reserved.</p>
                    <div className="flex gap-8">
                        <a href="#" className="hover:text-[#22C55E]">Privacy Policy</a>
                        <a href="#" className="hover:text-[#22C55E]">Terms of Service</a>
                    </div>
                </div>
            </div>
        </footer>
    )
}
