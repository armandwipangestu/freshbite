'use client';

import { Link } from '@inertiajs/react';
import { Heart, Search, ShoppingCart, Menu, X } from 'lucide-react';
import { useState } from 'react';
import { Button } from './button';
import { Input } from './input';
import { cn } from '@/lib/utils';

interface NavbarProps {
    isAuthenticated: boolean;
    userName?: string;
}

export function Navbar({ isAuthenticated, userName }: NavbarProps) {
    const [search, setSearch] = useState('');
    const [isMenuOpen, setIsMenuOpen] = useState(false);

    const toggleMenu = () => setIsMenuOpen(!isMenuOpen);

    return (
        <nav className="w-full bg-white shadow-sm sticky top-0 z-50">
            <div className="mx-auto flex max-w-7xl items-center justify-between px-6 py-4 lg:py-3">
                {/* Left side: Hamburger (Mobile) + Logo + Categories (Desktop) */}
                <div className="flex items-center space-x-4 lg:space-x-6">
                    <button
                        onClick={toggleMenu}
                        className="lg:hidden text-gray-700 hover:text-green-600 transition-colors"
                    >
                        {isMenuOpen ? <X className="h-7 w-7" /> : <Menu className="h-7 w-7" />}
                    </button>

                    <Link href="/" className="flex items-center">
                        <img
                            src="/assets/logo.svg"
                            alt="FreshBite Logo"
                            className="h-8 w-auto"
                        />
                        {/* <span className="hidden lg:inline ml-2 text-xl font-bold text-[#22C55E]">FreshBite.</span> */}
                    </Link>

                    <div className="hidden lg:flex space-x-4 font-medium text-gray-700">
                        <Link href="/fruits" className="hover:text-green-600">
                            Fruits
                        </Link>
                        <Link
                            href="/vegetables"
                            className="hover:text-green-600"
                        >
                            Vegetables
                        </Link>
                    </div>
                </div>

                {/* Middle: Search bar (Desktop) */}
                <div className="hidden lg:flex flex-1 px-12">
                    <Input
                        variant="default"
                        size="md"
                        placeholder="Search..."
                        value={search}
                        onChange={(e) => setSearch(e.target.value)}
                        icon={Search}
                        iconPosition="right"
                    />
                </div>

                {/* Right side: Desktop Auth/Profile + Mobile Icons */}
                <div className="flex items-center space-x-4">
                    {/* Desktop Right side */}
                    <div className="hidden lg:flex items-center space-x-4">
                        {!isAuthenticated ? (
                            <>
                                <Link href="/login">
                                    <Button variant="outline" className="h-11 px-6">Sign In</Button>
                                </Link>

                                <Link href="/login">
                                    <Button variant="default" className="bg-[#22C55E] h-11 px-6 shadow-none">Sign Up</Button>
                                </Link>
                            </>
                        ) : (
                            <>
                                <Link href="/wishlist">
                                    <Heart className="h-6 w-6 text-gray-600 hover:text-red-500 transition-colors" />
                                </Link>

                                <Link href="/cart" className="relative">
                                    <ShoppingCart className="h-6 w-6 text-gray-600 hover:text-green-600 transition-colors" />
                                </Link>

                                <Link href="/settings" className="flex items-center space-x-2 border border-gray-100 rounded-full pl-1 pr-4 py-1 hover:bg-gray-50 transition-colors">
                                    <img
                                        src={`https://ui-avatars.com/api/?name=${userName}&background=22C55E&color=fff`}
                                        alt="avatar"
                                        className="h-8 w-8 rounded-full"
                                    />
                                    <span className="font-semibold text-gray-700">
                                        {userName}
                                    </span>
                                </Link>
                            </>
                        )}
                    </div>

                    {/* Mobile Search Icon (optional if not in drawer) */}
                    <div className="lg:hidden flex items-center space-x-4">
                        <Link href="/cart">
                            <ShoppingCart className="h-7 w-7 text-gray-700" />
                        </Link>
                    </div>
                </div>
            </div>

            {/* Mobile-only Slide-out Drawer */}
            <div className={cn(
                "fixed inset-0 z-40 lg:hidden transition-transform duration-300 ease-in-out bg-white",
                isMenuOpen ? "translate-x-0" : "-translate-x-full"
            )} style={{ top: '64px' }}>
                <div className="flex flex-col h-full p-6 space-y-8 overflow-y-auto">
                    {/* Search in Mobile Drawer */}
                    <div className="w-full">
                        <Input
                            placeholder="Search..."
                            value={search}
                            onChange={(e) => setSearch(e.target.value)}
                            icon={Search}
                            iconPosition="right"
                            className="h-14 rounded-2xl"
                        />
                    </div>

                    {/* Categories Links */}
                    <div className="space-y-6">
                        <p className="text-sm font-bold text-gray-400 uppercase tracking-widest">Categories</p>
                        <div className="flex flex-col space-y-4">
                            <Link href="/fruits" className="text-2xl font-bold text-gray-900 border-b border-gray-100 pb-2">Fruits</Link>
                            <Link href="/vegetables" className="text-2xl font-bold text-gray-900 border-b border-gray-100 pb-2">Vegetables</Link>
                        </div>
                    </div>

                    {/* Auth / Profile in Mobile Drawer */}
                    <div className="mt-auto pt-8 border-t border-gray-100">
                        {!isAuthenticated ? (
                            <div className="grid grid-cols-2 gap-4">
                                <Link href="/login" className="w-full">
                                    <Button variant="outline" className="w-full h-14 rounded-2xl text-lg font-bold">Sign In</Button>
                                </Link>
                                <Link href="/login" className="w-full">
                                    <Button variant="default" className="w-full h-14 rounded-2xl bg-[#22C55E] text-lg font-bold shadow-none">Sign Up</Button>
                                </Link>
                            </div>
                        ) : (
                            <div className="space-y-6">
                                <Link href="/settings" className="flex items-center space-x-4 bg-gray-50 p-4 rounded-3xl">
                                    <img
                                        src={`https://ui-avatars.com/api/?name=${userName}&background=22C55E&color=fff`}
                                        alt="avatar"
                                        className="h-14 w-14 rounded-full"
                                    />
                                    <div>
                                        <p className="font-bold text-xl text-gray-900">{userName}</p>
                                        <p className="text-gray-500">View Settings</p>
                                    </div>
                                </Link>
                                <div className="grid grid-cols-2 gap-4">
                                    <Link href="/wishlist" className="flex items-center justify-center gap-2 h-14 border border-gray-100 rounded-2xl font-bold">
                                        <Heart className="h-6 w-6 text-red-500" /> Wishlist
                                    </Link>
                                    <Link href="/cart" className="flex items-center justify-center gap-2 h-14 border border-gray-100 rounded-2xl font-bold">
                                        <ShoppingCart className="h-6 w-6 text-green-600" /> Cart
                                    </Link>
                                </div>
                            </div>
                        )}
                    </div>
                </div>
            </div>
        </nav>
    );
}
