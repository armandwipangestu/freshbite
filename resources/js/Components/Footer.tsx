import { cn } from '@/lib/utils';
import { Facebook, Instagram, Music2, Twitter } from 'lucide-react';

interface FooterProps {
    className?: string;
}

export default function Footer({ className }: FooterProps) {
    const currentYear = new Date().getFullYear();

    return (
        <footer
            className={cn(
                'border-t border-gray-100 bg-white px-6 py-16 md:px-12 lg:px-24',
                className,
            )}
        >
            <div className="mx-auto max-w-7xl">
                <div className="grid grid-cols-1 gap-12 md:grid-cols-2 lg:grid-cols-4 lg:gap-8">
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
                        <p className="max-w-xs text-lg leading-relaxed text-[#666666]">
                            Lorem ipsum dolor sit amet consectetur. Sed cursus
                            viverra at pellentesque nunc id potenti elementum
                            id.
                        </p>
                    </div>

                    {/* Discover Section */}
                    <div>
                        <h3 className="mb-6 text-xl font-bold text-[#1A1A1A]">
                            Discover
                        </h3>
                        <ul className="space-y-4">
                            <li>
                                <a
                                    href="#"
                                    className="text-lg text-[#1A1A1A] transition-colors hover:text-[#22C55E]"
                                >
                                    Giving back
                                </a>
                            </li>
                            <li>
                                <a
                                    href="#"
                                    className="text-lg text-[#1A1A1A] transition-colors hover:text-[#22C55E]"
                                >
                                    Help & Support
                                </a>
                            </li>
                        </ul>
                    </div>

                    {/* Service Section */}
                    <div>
                        <h3 className="mb-6 text-xl font-bold text-[#1A1A1A]">
                            Service
                        </h3>
                        <ul className="space-y-4">
                            <li>
                                <a
                                    href="#"
                                    className="text-lg text-[#1A1A1A] transition-colors hover:text-[#22C55E]"
                                >
                                    Fruits
                                </a>
                            </li>
                            <li>
                                <a
                                    href="#"
                                    className="text-lg text-[#1A1A1A] transition-colors hover:text-[#22C55E]"
                                >
                                    Vegetables
                                </a>
                            </li>
                            <li>
                                <a
                                    href="#"
                                    className="text-lg text-[#1A1A1A] transition-colors hover:text-[#22C55E]"
                                >
                                    Seeds
                                </a>
                            </li>
                        </ul>
                    </div>

                    {/* Social Section */}
                    <div>
                        <h3 className="mb-6 text-xl font-bold text-[#1A1A1A]">
                            Social
                        </h3>
                        <div className="flex items-center gap-4">
                            <a
                                href="#"
                                className="rounded-xl bg-[#22C55E] p-2.5 text-white shadow-sm transition-colors hover:bg-[#1AAA4B]"
                            >
                                <Instagram className="h-6 w-6" />
                            </a>
                            <a
                                href="#"
                                className="rounded-xl bg-[#22C55E] p-2.5 text-white shadow-sm transition-colors hover:bg-[#1AAA4B]"
                            >
                                <Facebook className="h-6 w-6" />
                            </a>
                            <a
                                href="#"
                                className="rounded-xl bg-[#22C55E] p-2.5 text-white shadow-sm transition-colors hover:bg-[#1AAA4B]"
                            >
                                <Music2 className="h-6 w-6" />
                            </a>
                            <a
                                href="#"
                                className="rounded-xl bg-[#22C55E] p-2.5 text-white shadow-sm transition-colors hover:bg-[#1AAA4B]"
                            >
                                <Twitter className="h-6 w-6" />
                            </a>
                        </div>
                    </div>
                </div>

                <div className="mt-20 flex flex-col items-center justify-between gap-4 border-t border-gray-100 pt-8 text-sm text-gray-500 md:flex-row">
                    <p>© {currentYear} FreshBite. All rights reserved.</p>
                    <div className="flex gap-8">
                        <a href="#" className="hover:text-[#22C55E]">
                            Privacy Policy
                        </a>
                        <a href="#" className="hover:text-[#22C55E]">
                            Terms of Service
                        </a>
                    </div>
                </div>
            </div>
        </footer>
    );
}
