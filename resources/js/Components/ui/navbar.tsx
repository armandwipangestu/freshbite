'use client';

import { Link } from '@inertiajs/react';
import { Heart, Search, ShoppingCart } from 'lucide-react';
import { useState } from 'react';
import { Button } from './button';
import { Input } from './input';

interface NavbarProps {
    isAuthenticated: boolean;
    userName?: string;
}

export function Navbar({ isAuthenticated, userName }: NavbarProps) {
    const [search, setSearch] = useState('');

    return (
        <nav className="w-full bg-white shadow-sm">
            <div className="mx-auto flex max-w-7xl items-center justify-between px-6 py-3">
                {/* Left side: Logo + Categories */}
                <div className="flex items-center space-x-6">
                    <Link href="/" className="text-xl font-bold text-green-600">
                        <img
                            src="/assets/logo.svg"
                            alt="FreshBite Logo"
                            className="h-8 w-auto"
                        />
                    </Link>

                    <div className="flex space-x-4 font-medium text-gray-700">
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

                {/* Middle: Search bar */}
                <div className="flex-1 px-6">
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

                {/* Right side */}
                <div className="flex items-center space-x-4">
                    {!isAuthenticated ? (
                        <>
                            <Link href="/login">
                                <Button variant="outline">Sign In</Button>
                            </Link>

                            <Link href="/login">
                                <Button variant="default">Sign Up</Button>
                            </Link>
                        </>
                    ) : (
                        <>
                            <Link href="/wishlist">
                                <Heart className="h-5 w-5" />
                            </Link>

                            <Link href="/cart">
                                <ShoppingCart className="h-5 w-5" />
                            </Link>

                            <div className="flex items-center space-x-2">
                                <img
                                    src={`https://ui-avatars.com/api/?name=${userName}`}
                                    alt="avatar"
                                    className="h-8 w-8 rounded-full border"
                                />
                                <span className="font-medium text-gray-700">
                                    {userName}
                                </span>
                            </div>
                        </>
                    )}
                </div>
            </div>
        </nav>
    );
}
