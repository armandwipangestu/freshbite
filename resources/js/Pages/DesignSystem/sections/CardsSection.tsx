import ProductCard from "@/Components/ProductCard";
import WishlistCard from "@/Components/WishlistCard";

export default function CardsSection() {
    const placeholderImg = "https://images.unsplash.com/photo-1557800636-894a64c1696f?auto=format&fit=crop&q=80&w=800";

    return (
        <section className="space-y-12">
            <div>
                <h2 className="text-xl font-semibold mb-6">Cards - Sizes</h2>

                {/* Vertical Sizes */}
                <div className="space-y-4 mb-10">
                    <p className="text-sm font-medium text-muted-foreground">Vertical Variant (sm, md, lg)</p>
                    <div className="flex flex-wrap items-end gap-6">
                        <ProductCard
                            size="sm"
                            title="Small Card Product"
                            price="Rp15.000"
                            rating={4.8}
                            sold="100"
                            image={placeholderImg}
                        />
                        <ProductCard
                            size="md"
                            title="Medium Card Product"
                            price="Rp67.000"
                            rating={4.9}
                            sold="250"
                            image={placeholderImg}
                        />
                        <ProductCard
                            size="lg"
                            title="Large Card Product"
                            price="Rp125.000"
                            rating={5.0}
                            sold="500"
                            image={placeholderImg}
                        />
                    </div>
                </div>

                {/* Horizontal Sizes */}
                <div className="space-y-4 mb-10">
                    <p className="text-sm font-medium text-muted-foreground">Horizontal Variant (sm, md, lg)</p>
                    <div className="flex flex-col gap-6 max-w-4xl">
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
                    <p className="text-sm font-medium text-muted-foreground">Category Variant (sm, md, lg)</p>
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
                <h2 className="text-xl font-semibold mb-6">Cards - Wishlist</h2>
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
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
                            "https://images.unsplash.com/photo-1550989460-0adf9ea622e2?auto=format&fit=crop&q=80&w=800"
                        ]}
                    />
                    <WishlistCard
                        title="Placeholder"
                        itemCount={3}
                        images={[
                            placeholderImg,
                            "https://images.unsplash.com/photo-1550989460-0adf9ea622e2?auto=format&fit=crop&q=80&w=800",
                            placeholderImg
                        ]}
                    />
                    <WishlistCard
                        title="Placeholder"
                        itemCount={4}
                        images={[
                            placeholderImg,
                            "https://images.unsplash.com/photo-1550989460-0adf9ea622e2?auto=format&fit=crop&q=80&w=800",
                            placeholderImg,
                            "https://images.unsplash.com/photo-1550989460-0adf9ea622e2?auto=format&fit=crop&q=80&w=800"
                        ]}
                    />
                </div>
            </div>
        </section>
    );
}
