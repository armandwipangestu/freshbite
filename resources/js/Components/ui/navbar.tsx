'use client';

import { cn, resolveAvatarUrl } from '@/lib/utils';
import type { AppPageProps } from '@/types/page';
import { Link, usePage } from '@inertiajs/react';
import { Heart, Menu, Search, ShoppingCart, X } from 'lucide-react';
import { useEffect, useState } from 'react';
import Dropdown from '../Dropdown';
import { Button } from './button';
import { Input } from './input';

export function Navbar() {
    const { auth } = usePage<AppPageProps>().props;

    const isAuthenticated = Boolean(auth.user);
    const userName = auth.user?.name ? auth.user.name.split(' ')[0] : '';

    const avatarUrl = resolveAvatarUrl(auth.user?.avatar);

    const [search, setSearch] = useState('');
    const [isMenuOpen, setIsMenuOpen] = useState(false);

    const toggleMenu = () => setIsMenuOpen(!isMenuOpen);
    const closeMenu = () => setIsMenuOpen(false);

    useEffect(() => {
        if (isMenuOpen) {
            document.body.style.overflow = 'hidden';
        } else {
            document.body.style.overflow = 'unset';
        }
        return () => {
            document.body.style.overflow = 'unset';
        };
    }, [isMenuOpen]);

    return (
        <nav className="sticky top-0 z-50 w-full bg-background shadow-sm">
            <div className="mx-auto flex max-w-7xl items-center justify-between px-6 py-4 lg:py-3">
                {/* Left side: Hamburger (Mobile) + Logo + Categories (Desktop) */}
                <div className="flex items-center space-x-4 lg:space-x-6">
                    <button
                        onClick={toggleMenu}
                        className="text-foreground transition-colors hover:text-green-600 lg:hidden"
                    >
                        {isMenuOpen ? (
                            <X className="h-7 w-7" />
                        ) : (
                            <Menu className="h-7 w-7" />
                        )}
                    </button>

                    <Link
                        href="/"
                        onClick={closeMenu}
                        className="flex items-center"
                    >
                        <img
                            src="/assets/logo.svg"
                            alt="FreshBite Logo"
                            className="h-8 w-auto"
                        />
                        {/* <span className="hidden lg:inline ml-2 text-xl font-bold text-[#22C55E]">FreshBite.</span> */}
                    </Link>

                    <div className="text-foregound hidden space-x-4 font-medium lg:flex">
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
                <div className="hidden flex-1 px-12 lg:flex">
                    <Input
                        variant="default"
                        size="md"
                        placeholder="Search..."
                        value={search}
                        onChange={(e) => setSearch(e.target.value)}
                        icon={Search}
                        iconPosition="right"
                        className="rounded-lg border-2 border-ground-800"
                    />
                </div>

                {/* Right side: Desktop Auth/Profile + Mobile Icons */}
                <div className="flex items-center space-x-4">
                    {/* Desktop Right side */}
                    <div className="hidden items-center space-x-4 lg:flex">
                        {!isAuthenticated ? (
                            <>
                                <Link href="/login">
                                    <Button
                                        variant="outline"
                                        className="h-11 px-6"
                                    >
                                        Sign In
                                    </Button>
                                </Link>

                                <Link href="/register">
                                    <Button
                                        variant="default"
                                        className="h-11 bg-[#22C55E] px-6 shadow-none"
                                    >
                                        Sign Up
                                    </Button>
                                </Link>
                            </>
                        ) : (
                            <>
                                <Link href="/wishlist">
                                    <Heart className="h-6 w-6 text-gray-600 transition-colors hover:text-red-500" />
                                </Link>

                                <Link href="/cart" className="relative">
                                    <ShoppingCart className="h-6 w-6 text-gray-600 transition-colors hover:text-green-600" />
                                </Link>

                                <Dropdown>
                                    <Dropdown.Trigger>
                                        <button className="flex items-center space-x-2 rounded-full border border-muted-foreground py-1 pl-1 pr-4 transition-colors hover:bg-gray-50 focus:outline-none dark:hover:bg-primary-50">
                                            <img
                                                src={avatarUrl}
                                                alt="avatar"
                                                className="h-8 w-8 rounded-full"
                                            />
                                            <span className="font-semibold text-foreground">
                                                {userName}
                                            </span>
                                        </button>
                                    </Dropdown.Trigger>

                                    <Dropdown.Content contentClasses="bg-primary-50">
                                        <Dropdown.Link
                                            href="/profile"
                                            className="dark:text-white dark:hover:bg-primary-200 dark:hover:text-foreground"
                                        >
                                            Settings
                                        </Dropdown.Link>
                                        <Dropdown.Link
                                            href="/logout"
                                            className="dark:text-white dark:hover:bg-primary-200 dark:hover:text-foreground"
                                            method="post"
                                            as="button"
                                        >
                                            Log Out
                                        </Dropdown.Link>
                                    </Dropdown.Content>
                                </Dropdown>
                            </>
                        )}
                    </div>

                    {/* Mobile Search Icon (optional if not in drawer) */}
                    <div className="flex items-center space-x-4 lg:hidden">
                        <Link href="/cart" onClick={closeMenu}>
                            <ShoppingCart className="h-7 w-7 text-foreground" />
                        </Link>
                    </div>
                </div>
            </div>

            {/* Mobile-only Slide-out Drawer */}
            <div
                className={cn(
                    'fixed inset-0 z-40 bg-background transition-transform duration-300 ease-in-out lg:hidden',
                    isMenuOpen ? 'translate-x-0' : '-translate-x-full',
                )}
                style={{ top: '64px' }}
            >
                <div className="flex h-full flex-col space-y-8 overflow-y-auto p-6">
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
                        <p className="text-sm font-bold uppercase tracking-widest text-foreground">
                            Categories
                        </p>
                        <div className="flex flex-col space-y-4">
                            <Link
                                href="/fruits"
                                onClick={closeMenu}
                                className="border-b border-gray-100 pb-2 text-2xl font-bold text-foreground"
                            >
                                Fruits
                            </Link>
                            <Link
                                href="/vegetables"
                                onClick={closeMenu}
                                className="border-b border-gray-100 pb-2 text-2xl font-bold text-foreground"
                            >
                                Vegetables
                            </Link>
                        </div>
                    </div>

                    {/* Auth / Profile in Mobile Drawer */}
                    <div className="mt-auto border-t border-gray-100 pt-8">
                        {!isAuthenticated ? (
                            <div className="grid grid-cols-2 gap-4">
                                <Link
                                    href="/login"
                                    onClick={closeMenu}
                                    className="w-full"
                                >
                                    <Button
                                        variant="outline"
                                        className="h-14 w-full rounded-2xl text-lg font-bold"
                                    >
                                        Sign In
                                    </Button>
                                </Link>
                                <Link
                                    href="/register"
                                    onClick={closeMenu}
                                    className="w-full"
                                >
                                    <Button
                                        variant="default"
                                        className="h-14 w-full rounded-2xl bg-[#22C55E] text-lg font-bold shadow-none"
                                    >
                                        Sign Up
                                    </Button>
                                </Link>
                            </div>
                        ) : (
                            <div className="space-y-6">
                                <Link
                                    href="/profile"
                                    onClick={closeMenu}
                                    className="flex items-center space-x-4 rounded-3xl bg-gray-50 p-4 dark:bg-primary-50"
                                >
                                    <img
                                        src={avatarUrl}
                                        alt="avatar"
                                        className="h-14 w-14 rounded-full"
                                    />
                                    <div>
                                        <p className="text-xl font-bold text-foreground">
                                            {userName}
                                        </p>
                                        <p className="text-gray-500">
                                            View Profiles
                                        </p>
                                    </div>
                                </Link>
                                <div className="grid grid-cols-2 gap-4">
                                    <Link
                                        href="/wishlist"
                                        onClick={closeMenu}
                                        className="flex h-14 items-center justify-center gap-2 rounded-2xl border border-gray-100 font-bold"
                                    >
                                        <Heart className="h-6 w-6 text-red-500" />{' '}
                                        Wishlist
                                    </Link>
                                    <Link
                                        href="/cart"
                                        onClick={closeMenu}
                                        className="flex h-14 items-center justify-center gap-2 rounded-2xl border border-gray-100 font-bold"
                                    >
                                        <ShoppingCart className="h-6 w-6 text-green-600" />{' '}
                                        Cart
                                    </Link>
                                </div>
                                <Link
                                    href={route('logout')}
                                    method="post"
                                    as="button"
                                    onClick={closeMenu}
                                    className="flex h-14 w-full items-center justify-center rounded-2xl border border-red-100 bg-red-50 text-lg font-bold text-red-600 dark:border-red-900/30 dark:bg-red-950/30"
                                >
                                    Log Out
                                </Link>
                            </div>
                        )}
                    </div>
                </div>
            </div>
        </nav>
    );
}
