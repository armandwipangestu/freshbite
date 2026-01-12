import AvatarUploadCard from '@/Components/AvatarUploadCard';
import OrderSummaryCard from '@/Components/OrderSummaryCard';
import ProductCard from '@/Components/ProductCard';
import ProductGalleryCard from '@/Components/ProductGalleryCard';
import ThemePreviewCard from '@/Components/ThemePreviewCard';
import WishlistCard from '@/Components/WishlistCard';

export default function CardsSection() {
    const placeholderImg =
        'https://images.unsplash.com/photo-1557800636-894a64c1696f?auto=format&fit=crop&q=80&w=800';

    return (
        <section className="space-y-12">
            <div>
                <h2 className="mb-6 text-xl font-semibold">Cards - Sizes</h2>

                {/* Vertical Sizes */}
                <div className="mb-10 space-y-4">
                    <p className="text-sm font-medium text-muted-foreground">
                        Vertical Variant (sm, md, lg)
                    </p>
                    <div className="flex flex-wrap items-end gap-6">
                        <ProductCard
                            size="sm"
                            title="Small Card Product"
                            price={15000}
                            rating={4.8}
                            sold="100"
                            image={placeholderImg}
                        />
                        <ProductCard
                            size="md"
                            title="Medium Card Product"
                            price={67000}
                            rating={4.9}
                            sold="250"
                            image={placeholderImg}
                        />
                        <ProductCard
                            size="lg"
                            title="Large Card Product"
                            price={125000}
                            rating={5.0}
                            sold="500"
                            image={placeholderImg}
                        />
                    </div>
                </div>

                {/* Horizontal Sizes */}
                <div className="mb-10 space-y-4">
                    <p className="text-sm font-medium text-muted-foreground">
                        Horizontal Variant (sm, md, lg)
                    </p>
                    <div className="flex max-w-4xl flex-col gap-6">
                        <ProductCard
                            variant="horizontal"
                            size="sm"
                            title="This is small placeholder"
                            description="Get Freshness Today"
                            image={placeholderImg}
                        />
                        <ProductCard
                            variant="horizontal"
                            size="md"
                            title="This is medium placeholder"
                            description="Get Freshness Today and enjoy our services"
                            image={placeholderImg}
                        />
                        <ProductCard
                            variant="horizontal"
                            size="lg"
                            title="This is large placeholder"
                            description="Get Freshness Today. We provide the best quality fruits for you and your family."
                            image={placeholderImg}
                        />
                    </div>
                </div>

                {/* Category Sizes */}
                <div className="space-y-4">
                    <p className="text-sm font-medium text-muted-foreground">
                        Category Variant (sm, md, lg)
                    </p>
                    <div className="flex flex-wrap items-center gap-6">
                        <ProductCard
                            variant="category"
                            size="sm"
                            title="Small Category"
                        />
                        <ProductCard
                            variant="category"
                            size="md"
                            title="Medium Category"
                        />
                        <ProductCard
                            variant="category"
                            size="lg"
                            title="Large Category"
                        />
                    </div>
                </div>
            </div>

            <div>
                <h2 className="mb-6 text-xl font-semibold">Cards - Wishlist</h2>
                <div className="grid grid-cols-1 gap-8 md:grid-cols-2 lg:grid-cols-4">
                    <WishlistCard
                        title="Placeholder"
                        itemCount={1}
                        images={[placeholderImg]}
                    />
                    <WishlistCard
                        title="Placeholder"
                        itemCount={2}
                        images={[
                            placeholderImg,
                            'https://images.unsplash.com/photo-1550989460-0adf9ea622e2?auto=format&fit=crop&q=80&w=800',
                        ]}
                    />
                    <WishlistCard
                        title="Placeholder"
                        itemCount={3}
                        images={[
                            placeholderImg,
                            'https://images.unsplash.com/photo-1550989460-0adf9ea622e2?auto=format&fit=crop&q=80&w=800',
                            'https://images.unsplash.com/photo-1610832958506-aa56368176cf?auto=format&fit=crop&q=80&w=800',
                        ]}
                    />
                    <WishlistCard
                        title="Placeholder"
                        itemCount={4}
                        images={[
                            placeholderImg,
                            'https://images.unsplash.com/photo-1550989460-0adf9ea622e2?auto=format&fit=crop&q=80&w=800',
                            'https://images.unsplash.com/photo-1610832958506-aa56368176cf?auto=format&fit=crop&q=80&w=800',
                            'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?auto=format&fit=crop&q=80&w=800',
                        ]}
                    />
                </div>
            </div>

            <div className="space-y-12">
                <h2 className="-mb-6 text-xl font-semibold">
                    Cards - Order Summary
                </h2>

                {/* Checkout Sizes */}
                <div className="space-y-4">
                    <p className="text-sm font-medium text-muted-foreground">
                        Checkout Variant (sm, md, lg)
                    </p>
                    <div className="flex flex-wrap items-start gap-8">
                        <OrderSummaryCard
                            variant="checkout"
                            size="sm"
                            productName="Navel Orange"
                            price="Rp28.400"
                            stock={6}
                        />
                        <OrderSummaryCard
                            variant="checkout"
                            size="md"
                            productName="Navel Orange"
                            price="Rp28.400"
                            stock={6}
                        />
                        <OrderSummaryCard
                            variant="checkout"
                            size="lg"
                            productName="Navel Orange"
                            price="Rp28.400"
                            stock={6}
                        />
                    </div>
                </div>

                {/* Summary Sizes */}
                <div className="space-y-4">
                    <p className="text-sm font-medium text-muted-foreground">
                        Shopping Summary Variant (sm, md, lg)
                    </p>
                    <div className="flex flex-wrap items-start gap-8">
                        <OrderSummaryCard
                            variant="summary"
                            size="sm"
                            price="Rp134.000"
                            itemCount={1}
                        />
                        <OrderSummaryCard
                            variant="summary"
                            size="md"
                            price="Rp134.000"
                            itemCount={1}
                        />
                        <OrderSummaryCard
                            variant="summary"
                            size="lg"
                            price="Rp134.000"
                            itemCount={1}
                        />
                    </div>
                </div>
            </div>

            <div className="space-y-12">
                <h2 className="-mb-6 text-xl font-semibold">
                    Cards - Specialized
                </h2>

                <div className="grid grid-cols-1 items-start gap-12 xl:grid-cols-2">
                    <div className="space-y-4">
                        <p className="text-sm font-medium text-muted-foreground">
                            Avatar Upload (User Settings)
                        </p>
                        <AvatarUploadCard currentAvatar="https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?auto=format&fit=crop&q=80&w=800" />
                    </div>

                    <div className="space-y-4">
                        <p className="text-sm font-medium text-muted-foreground">
                            Theme Preview (App Appearance)
                        </p>
                        <ThemePreviewCard previewImage="https://images.unsplash.com/photo-1614332287897-cdc485fa562d?auto=format&fit=crop&q=80&w=800" />
                    </div>

                    <div className="col-span-1 space-y-4 xl:col-span-2">
                        <p className="text-sm font-medium text-muted-foreground">
                            Product Gallery (Product Detail - Interative)
                        </p>
                        <ProductGalleryCard
                            images={[
                                'https://images.unsplash.com/photo-1557800636-894a64c1696f?auto=format&fit=crop&q=80&w=1200',
                                'https://images.unsplash.com/photo-1550989460-0adf9ea622e2?auto=format&fit=crop&q=80&w=800',
                                'https://images.unsplash.com/photo-1610832958506-aa56368176cf?auto=format&fit=crop&q=80&w=800',
                                'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?auto=format&fit=crop&q=80&w=800',
                            ]}
                        />
                    </div>
                </div>
            </div>
        </section>
    );
}
