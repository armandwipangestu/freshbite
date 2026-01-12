import MainLayout from '@/Layouts/MainLayout';
import { Banner, Category, Coupon, Product } from '@/types/models';
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
    activeCoupon: Coupon | null;
    flashSaleProducts: Product[];
    popularProducts: {
        most_popular: Product;
        customer_favorite: Product;
        top_selling: Product;
        weekly_best_seller: Product;
    };
    categories: Category[];
    categoryProducts: Product[];
    selectedCategory: string | null;
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
    activeCoupon,
    flashSaleProducts,
    popularProducts,
    categories,
    categoryProducts,
    selectedCategory,
}: WelcomeProps) {
    const activeBanner = banners.find((b) => b.is_active) || banners[0];

    // Helper to calculate discounted price
    const getProductDiscount = (product: Product) => {
        // Priority 1: Check for active coupon explicitly linked to flash sale
        if (activeCoupon && flashSaleProducts.some(p => p.id === product.id)) {
            return {
                discountedPrice: product.price - (product.price * activeCoupon.discount / 100),
                originalPrice: product.price,
                activeCoupon: activeCoupon
            };
        }

        // Priority 2: Check product's own coupons
        const productCoupon = product.coupons?.find(c => c.is_active && new Date(c.expired_at) > new Date());
        if (productCoupon) {
            return {
                discountedPrice: product.price - (product.price * productCoupon.discount / 100),
                originalPrice: product.price,
                activeCoupon: productCoupon
            };
        }

        return { discountedPrice: product.price, originalPrice: undefined, activeCoupon: null };
    };

    // Simple countdown timer for Flash Sale
    const [timeLeft, setTimeLeft] = useState({
        hours: 0,
        minutes: 0,
        seconds: 0,
    });

    useEffect(() => {
        if (!activeCoupon) return;

        const calculateTimeLeft = () => {
            const difference = +new Date(activeCoupon.expired_at) - +new Date();
            let timeLeft = { hours: 0, minutes: 0, seconds: 0 };

            if (difference > 0) {
                timeLeft = {
                    hours: Math.floor(difference / (1000 * 60 * 60)),
                    minutes: Math.floor((difference / 1000 / 60) % 60),
                    seconds: Math.floor((difference / 1000) % 60),
                };
            }
            return timeLeft;
        };

        const timer = setInterval(() => {
            setTimeLeft(calculateTimeLeft());
        }, 1000);

        setTimeLeft(calculateTimeLeft());

        return () => clearInterval(timer);
    }, [activeCoupon]);

    const formatNumber = (num: number) => num.toString().padStart(2, '0');

    return (
        <>
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
                {activeCoupon && flashSaleProducts.length > 0 && (
                    <section className="mb-16">
                        <div className="mb-8 flex items-center gap-6">
                            <h2 className="text-2xl font-black text-[#1A1A1A] md:text-3xl">Flash Sale</h2>
                            <div className="flex items-center gap-2 text-lg font-bold text-[#666666] md:text-xl">
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
                            {flashSaleProducts.map((product) => {
                                const { discountedPrice, originalPrice } = getProductDiscount(product);

                                return (
                                    <ProductCard
                                        key={product.id}
                                        variant="vertical"
                                        size="sm"
                                        title={product.name}
                                        price={discountedPrice}
                                        originalPrice={originalPrice}
                                        image={`storage/${product.images?.[0]?.image}` || 'https://via.placeholder.com/300'}
                                        rating={product.reviews_avg_star ? Number(Number(product.reviews_avg_star).toFixed(1)) : 4.5}
                                        sold={product.total_sold}
                                        className="w-full"
                                    />
                                );
                            })}
                        </div>
                    </section>
                )}

                {/* Most Popular Section */}
                <section className="mb-16">
                    <div className="mb-8">
                        <h2 className="text-2xl font-black text-[#1A1A1A] md:text-3xl">Most Popular</h2>
                    </div>

                    <div className="grid grid-cols-1 gap-4 md:grid-cols-2 lg:grid-cols-2 xl:grid-cols-4">
                        {[
                            { title: "Most Popular Product", description: "Get Freshness Today", product: popularProducts.most_popular, filter: 'most-popular' },
                            { title: "Customer's Favorite", description: "Fresh from the farm", product: popularProducts.customer_favorite, filter: 'favorite' },
                            { title: "Top-Selling Fruits & Veggies", description: "Guaranteed Quality", product: popularProducts.top_selling, filter: 'top-selling' },
                            { title: "This Week's Best Seller", description: "Limited Stock, Order Now!", product: popularProducts.weekly_best_seller, filter: 'weekly-best-seller' }
                        ].map((item, idx) => {
                            const { discountedPrice, originalPrice } = item.product ? getProductDiscount(item.product) : { discountedPrice: 0, originalPrice: undefined };

                            return (
                                <Link key={idx} href={`/shop?filter=${item.filter}`}>
                                    <ProductCard
                                        variant="horizontal"
                                        size="sm"
                                        title={item.title}
                                        description={item.description}
                                        price={discountedPrice || undefined}
                                        originalPrice={originalPrice}
                                        image={item.product?.images?.[0]?.image ? `storage/${item.product.images[0].image}` : 'https://via.placeholder.com/300'}
                                        className="w-full transition-transform hover:scale-105"
                                    />
                                </Link>
                            );
                        })}
                    </div>
                </section>

                {/* Category Products */}
                <section className="mb-16">
                    <div className="mb-8">
                        <h2 className="text-2xl font-black text-[#1A1A1A] md:text-3xl">Category</h2>
                    </div>

                    {/* Category Tabs/Buttons */}
                    <div className="mb-10 flex gap-4 overflow-x-auto pb-4 scrollbar-hide">
                        <Link
                            href="/"
                            preserveScroll
                            className={cn(
                                "flex min-w-[140px] flex-1 cursor-pointer items-center justify-center rounded-2xl border-2 px-6 py-4 transition-all duration-300",
                                !selectedCategory
                                    ? "border-[#22C55E] bg-[#22C55E] text-white shadow-md"
                                    : "border-gray-200 bg-transparent text-gray-600 hover:border-[#22C55E] hover:text-[#22C55E]"
                            )}
                        >
                            <span className="text-lg font-bold">Show All</span>
                        </Link>
                        {categories.map((cat) => (
                            <Link
                                key={cat.id}
                                href={`/?category=${cat.slug}`}
                                preserveScroll
                                className={cn(
                                    "flex min-w-[140px] flex-1 cursor-pointer items-center justify-center rounded-2xl border-2 px-6 py-4 transition-all duration-300",
                                    selectedCategory === cat.slug
                                        ? "border-[#22C55E] bg-[#22C55E] text-white shadow-md"
                                        : "border-gray-200 bg-transparent text-gray-600 hover:border-[#22C55E] hover:text-[#22C55E]"
                                )}
                            >
                                <span className="text-lg font-bold">{cat.name}</span>
                            </Link>
                        ))}
                    </div>

                    {/* Category Products */}
                    <div className="grid grid-cols-2 gap-6 md:grid-cols-3 lg:grid-cols-5">
                        {categoryProducts.map((product, idx) => {
                            const { discountedPrice, originalPrice } = getProductDiscount(product);

                            return (
                                <ProductCard
                                    key={`${product.id}-${idx}`}
                                    variant="vertical"
                                    size="sm"
                                    title={product.name}
                                    price={discountedPrice}
                                    originalPrice={originalPrice}
                                    image={`storage/${product.images?.[0]?.image}` || 'https://via.placeholder.com/300'}
                                    rating={product.reviews_avg_star ? Number(Number(product.reviews_avg_star).toFixed(1)) : 4.8}
                                    sold={product.total_sold}
                                    className="w-full"
                                />
                            );
                        })}
                    </div>
                </section>
            </div>
        </>
    );
}
