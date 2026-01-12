import { Minus, Plus, MessageSquare, Heart, Share2 } from "lucide-react"
import { cn } from "@/lib/utils"
import { Card, CardContent } from "@/Components/ui/card"
import { Button } from "@/Components/ui/button"
import { cva, type VariantProps } from "class-variance-authority"

const orderSummaryCardVariants = cva(
    "rounded-[24px] border border-gray-100 bg-white shadow-sm overflow-hidden w-full",
    {
        variants: {
            size: {
                sm: "max-w-[320px]",
                md: "max-w-[360px]",
                lg: "max-w-[400px]",
            }
        },
        defaultVariants: {
            size: "md",
        }
    }
)

interface OrderSummaryCardProps extends VariantProps<typeof orderSummaryCardVariants> {
    variant?: "checkout" | "summary"
    title?: string
    productName?: string
    price: string | number
    stock?: number
    quantity?: number
    onQuantityChange?: (q: number) => void
    itemCount?: number
    onAddToCart?: () => void
    onBuy?: () => void
    onChat?: () => void
    onWishlist?: () => void
    onShare?: () => void
    onApplyCoupon?: () => void
    className?: string
}

export default function OrderSummaryCard({
    variant = "checkout",
    size = "md",
    title,
    productName,
    price,
    stock,
    quantity = 1,
    onQuantityChange,
    itemCount,
    onAddToCart,
    onBuy,
    onChat,
    onWishlist,
    onShare,
    onApplyCoupon,
    className,
}: OrderSummaryCardProps) {
    // Styles based on size
    const headerSize = {
        sm: "text-xl mb-4",
        md: "text-2xl mb-6",
        lg: "text-3xl mb-8",
    }[size || "md"]

    const productNameSize = {
        sm: "text-base",
        md: "text-lg",
        lg: "text-xl",
    }[size || "md"]

    const labelSize = {
        sm: "text-base",
        md: "text-lg",
        lg: "text-xl",
    }[size || "md"]

    const priceSize = {
        sm: "text-lg",
        md: "text-xl",
        lg: "text-2xl",
    }[size || "md"]

    const buttonHeight = {
        sm: "h-10 text-base rounded-[12px]",
        md: "h-12 text-lg rounded-[14px]",
        lg: "h-16 text-lg rounded-[18px]",
    }[size || "md"]

    const padding = {
        sm: "p-4",
        md: "p-5",
        lg: "p-6",
    }[size || "md"]

    const spacing = {
        sm: "space-y-3 mb-6",
        md: "space-y-4 mb-8",
        lg: "space-y-4 mb-8",
    }[size || "md"]

    const footerIconSize = {
        sm: "h-4 w-4",
        md: "h-5 w-5",
        lg: "h-5 w-5",
    }[size || "md"]

    if (variant === "summary") {
        return (
            <Card className={cn(orderSummaryCardVariants({ size, className }))}>
                <CardContent className={padding}>
                    <h2 className={cn("font-bold text-[#1A1A1A]", headerSize)}>
                        {title || "Shopping summary"}
                    </h2>

                    <div className={cn("flex items-center justify-between border-b border-gray-100",
                        size === "sm" ? "mb-4 pb-4" : size === "md" ? "mb-5 pb-5" : "mb-6 pb-6"
                    )}>
                        <span className={labelSize}>Total</span>
                        <span className={cn("font-bold text-[#1A1A1A]", priceSize)}>
                            {typeof price === "number" ? `Rp${price.toLocaleString("id-ID")}` : price}
                        </span>
                    </div>

                    <button
                        onClick={onApplyCoupon}
                        className={cn("w-full flex items-center justify-center gap-2 bg-[#E8F5E9] border-2 border-dashed border-[#22C55E] rounded-2xl text-[#1A1A1A] font-medium transition-colors hover:bg-[#DCF5E0]",
                            size === "sm" ? "p-3 mb-4 text-sm" : size === "md" ? "p-4 mb-6 text-base" : "p-6 mb-8 text-base"
                        )}
                    >
                        Enter coupon code
                    </button>

                    <Button
                        onClick={onBuy}
                        className={cn("w-full hover:bg-[#1AAA4B] text-white font-semibold shadow-none bg-[#22C55E]", buttonHeight)}
                    >
                        Buy {itemCount !== undefined ? `(${itemCount})` : ""}
                    </Button>
                </CardContent>
            </Card>
        )
    }

    // Default checkout variant
    return (
        <Card className={cn(orderSummaryCardVariants({ size, className }))}>
            <CardContent className={padding}>
                <h2 className={cn("font-bold text-[#1A1A1A]", headerSize)}>
                    {title || "Set quantity"}
                </h2>

                <div className={size === "sm" ? "mb-4" : size === "md" ? "mb-5" : "mb-6"}>
                    <p className={cn("text-[#666666]", productNameSize)}>
                        {productName || "Product"}
                    </p>
                </div>

                <div className={cn("border-t border-gray-100 flex items-center gap-4",
                    size === "sm" ? "pt-4 mb-6" : size === "md" ? "pt-5 mb-8" : "pt-6 mb-10"
                )}>
                    <div className={cn("flex items-center border border-gray-300 rounded-xl px-2",
                        size === "sm" ? "h-9" : "h-12"
                    )}>
                        <button
                            onClick={() => onQuantityChange?.(Math.max(1, quantity - 1))}
                            className="p-1 text-gray-400 hover:text-gray-600"
                        >
                            <Minus className={cn("", size === "sm" ? "h-3 w-3" : "h-4 w-4")} />
                        </button>
                        <span className={cn("text-center font-medium", size === "sm" ? "w-6 text-sm" : "w-10")}>{quantity}</span>
                        <button
                            onClick={() => onQuantityChange?.(quantity + 1)}
                            className="p-1 text-[#22C55E] hover:text-[#1AAA4B]"
                        >
                            <Plus className={cn("", size === "sm" ? "h-3 w-3" : "h-4 w-4")} />
                        </button>
                    </div>
                    <p className={size === "sm" ? "text-sm" : "text-lg"}>
                        Stock: <span className="text-[#F59E0B] font-semibold">{stock || 0}</span>
                    </p>
                </div>

                <div className={cn("flex items-center justify-between",
                    size === "sm" ? "mb-4" : size === "md" ? "mb-6" : "mb-8")
                }>
                    <span className={labelSize}>Subtotal</span>
                    <span className={cn("font-bold text-[#1A1A1A]", priceSize)}>
                        {typeof price === "number" ? `Rp${price.toLocaleString("id-ID")}` : price}
                    </span>
                </div>

                <div className={spacing}>
                    <Button
                        onClick={onAddToCart}
                        className={cn("w-full hover:bg-[#1AAA4B] text-white font-semibold shadow-none flex items-center justify-center gap-2 bg-[#22C55E]", buttonHeight)}
                    >
                        <Plus className={cn("", size === "sm" ? "h-4 w-4" : "h-5 w-5")} /> Cart
                    </Button>
                    <Button
                        onClick={onBuy}
                        variant="outline"
                        className={cn("w-full border-[#22C55E] text-[#22C55E] hover:bg-[#F0FDF4] hover:text-[#1AAA4B] font-semibold border-2", buttonHeight)}
                    >
                        Buy
                    </Button>
                </div>

                <div className="flex items-center justify-center divide-x divide-gray-300">
                    <button
                        onClick={onChat}
                        className="px-2 sm:px-4 flex items-center gap-1 sm:gap-2 text-gray-500 hover:text-[#1A1A1A] transition-colors"
                    >
                        <MessageSquare className={footerIconSize} />
                        <span className={cn("", size === "sm" ? "text-[10px]" : "text-sm")}>Chat</span>
                    </button>
                    <button
                        onClick={onWishlist}
                        className="px-2 sm:px-4 flex items-center gap-1 sm:gap-2 text-gray-500 hover:text-[#1A1A1A] transition-colors"
                    >
                        <Heart className={footerIconSize} />
                        <span className={cn("", size === "sm" ? "text-[10px]" : "text-sm")}>Wishlist</span>
                    </button>
                    <button
                        onClick={onShare}
                        className="px-2 sm:px-4 flex items-center gap-1 sm:gap-2 text-gray-500 hover:text-[#1A1A1A] transition-colors"
                    >
                        <Share2 className={footerIconSize} />
                        <span className={cn("", size === "sm" ? "text-[10px]" : "text-sm")}>Share</span>
                    </button>
                </div>
            </CardContent>
        </Card>
    )
}
