import MainLayout from '@/Layouts/MainLayout';
import { Banner, Category, Product } from '@/types/models';
import { Head, Link } from '@inertiajs/react';
import ProductCard from '@/Components/ProductCard';
import { cn } from '@/lib/utils';
import { useEffect, useState } from 'react';

import { User } from '@/types';

interface WelcomeProps {
    auth: {
        user: User | null;
    };
    banners: Banner[];
    flashSaleProducts: Product[];
    popularProducts: Product[];
    categories: Category[];
}

const CATEGORY_COLORS = [
    'from-green-400 to-green-600',
    'from-cyan-400 to-cyan-600',
    'from-yellow-400 to-yellow-600',
    'from-orange-400 to-orange-600',
    'from-pink-400 to-purple-600',
];

export default function Welcome({
    auth,
    banners,
    flashSaleProducts,
    popularProducts,
    categories,
}: WelcomeProps) {
    const activeBanner = banners.find((b) => b.is_active) || banners[0];

    // Simple countdown timer for Flash Sale
    const [timeLeft, setTimeLeft] = useState({
        hours: 3,
        minutes: 51,
        seconds: 49,
    });

    useEffect(() => {
        const timer = setInterval(() => {
            setTimeLeft((prev) => {
                if (prev.seconds > 0) return { ...prev, seconds: prev.seconds - 1 };
                if (prev.minutes > 0)
                    return { ...prev, minutes: prev.minutes - 1, seconds: 59 };
                if (prev.hours > 0)
                    return { hours: prev.hours - 1, minutes: 59, seconds: 59 };
                return prev;
            });
        }, 1000);
        return () => clearInterval(timer);
    }, []);

    const formatNumber = (num: number) => num.toString().padStart(2, '0');

    return (
        <MainLayout
            isAuthenticated={!!auth.user}
            userName={auth.user?.name}
        >
            <Head title="FreshBite - Menyediakan Berbagai Macam Pilihan Buah dan Sayuran" />

            <div className="mx-auto max-w-7xl px-6 py-8">
                {/* Banner Section */}
                <div className="mb-12 overflow-hidden rounded-[40px] shadow-sm">
                    {activeBanner ? (
                        <div className="relative aspect-[1200/400] w-full">
                            <img
                                src={`storage/${activeBanner.image}`}
                                alt="Main Banner"
                                className="h-full w-full object-cover"
                            />
                        </div>
                    ) : (
                        <div className="flex aspect-[1200/400] w-full items-center justify-center bg-gray-100">
                            <p className="text-gray-400">Loading banner...</p>
                        </div>
                    )}
                </div>

                {/* Flash Sale Section */}
                <section className="mb-16">
                    <div className="mb-8 flex items-center gap-6">
                        <h2 className="text-3xl font-black text-[#1A1A1A]">Flash Sale</h2>
                        <div className="flex items-center gap-2 text-xl font-bold text-[#666666]">
                            <span>Ended in</span>
                            <div className="flex gap-1.5">
                                <span className="flex h-10 w-10 items-center justify-center rounded-lg bg-[#22C55E] text-white">
                                    {formatNumber(timeLeft.hours)}
                                </span>
                                <span className="text-[#22C55E]">:</span>
                                <span className="flex h-10 w-10 items-center justify-center rounded-lg bg-[#22C55E] text-white">
                                    {formatNumber(timeLeft.minutes)}
                                </span>
                                <span className="text-[#22C55E]">:</span>
                                <span className="flex h-10 w-10 items-center justify-center rounded-lg bg-[#22C55E] text-white">
                                    {formatNumber(timeLeft.seconds)}
                                </span>
                            </div>
                        </div>
                    </div>

                    <div className="grid grid-cols-2 gap-6 md:grid-cols-3 lg:grid-cols-5">
                        {flashSaleProducts.map((product) => (
                            <ProductCard
                                key={product.id}
                                variant="vertical"
                                size="sm"
                                title={product.name}
                                price={product.price}
                                image={`storage/${product.images?.[0]?.image}` || 'https://via.placeholder.com/300'}
                                rating={4.5}
                                sold={product.total_sold}
                                className="w-full"
                            />
                        ))}
                    </div>
                </section>

                {/* Most Popular Section */}
                <section className="mb-16">
                    <div className="mb-8">
                        <h2 className="text-3xl font-black text-[#1A1A1A]">Most Popular</h2>
                    </div>

                    <div className="grid grid-cols-1 gap-6 md:grid-cols-2 lg:grid-cols-4">
                        {[
                            { title: "Most Popular Product", description: "Get Freshness Today" },
                            { title: "Customer's Favorite", description: "Fresh from the farm" },
                            { title: "Top-Selling Fruits & Veggies", description: "Guaranteed Quality" },
                            { title: "This Week's Best Seller", description: "Limited Stock, Order Now!" }
                        ].map((item, idx) => {
                            const product = popularProducts[idx] || popularProducts[0];
                            return (
                                <ProductCard
                                    key={idx}
                                    variant="horizontal"
                                    size="sm"
                                    title={item.title}
                                    description={item.description}
                                    image={`storage/${product?.images?.[0]?.image}` || 'https://via.placeholder.com/300'}
                                    className="w-full"
                                />
                            );
                        })}
                    </div>
                </section>

                {/* Category Section */}
                <section className="mb-16">
                    <div className="mb-8">
                        <h2 className="text-3xl font-black text-[#1A1A1A]">Category</h2>
                    </div>

                    {/* Category Tabs/Buttons */}
                    <div className="mb-10 flex gap-4 overflow-x-auto pb-4">
                        {categories.map((cat, idx) => (
                            <div
                                key={cat.id}
                                className={cn(
                                    "flex min-w-[200px] flex-1 cursor-pointer items-center justify-center rounded-2xl bg-gradient-to-r p-8 shadow-sm transition-transform hover:scale-105",
                                    CATEGORY_COLORS[idx % CATEGORY_COLORS.length]
                                )}
                            >
                                <span className="text-xl font-bold text-white">{cat.name}</span>
                            </div>
                        ))}
                    </div>

                    {/* Category Products */}
                    <div className="grid grid-cols-2 gap-6 md:grid-cols-3 lg:grid-cols-5">
                        {flashSaleProducts.concat(popularProducts).slice(0, 10).map((product, idx) => (
                            <ProductCard
                                key={`${product.id}-${idx}`}
                                variant="vertical"
                                size="sm"
                                title={product.name}
                                price={product.price}
                                image={`storage/${product.images?.[0]?.image}` || 'https://via.placeholder.com/300'}
                                rating={4.8}
                                sold={product.total_sold}
                                className="w-full"
                            />
                        ))}
                    </div>
                </section>
            </div>
        </MainLayout>
    );
}
