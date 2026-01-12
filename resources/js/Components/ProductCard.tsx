import { Card, CardContent } from '@/Components/ui/card';
import { cn } from '@/lib/utils';
import { cva, type VariantProps } from 'class-variance-authority';
import { Star } from 'lucide-react';

const productCardVariants = cva(
    'overflow-hidden border border-gray-100 bg-white shadow-sm transition-all duration-300',
    {
        variants: {
            size: {
                sm: 'max-w-[200px]',
                md: 'max-w-[300px]',
                lg: 'max-w-[400px]',
            },
            variant: {
                vertical: '',
                horizontal: 'max-w-full',
                category: 'border-none shadow-none',
            },
        },
        defaultVariants: {
            size: 'md',
            variant: 'vertical',
        },
    },
);

interface ProductCardProps extends VariantProps<typeof productCardVariants> {
    image?: string;
    title: string;
    price?: string | number;
    rating?: number;
    sold?: string | number;
    description?: string;
    className?: string;
}

export default function ProductCard({
    variant = 'vertical',
    size = 'md',
    image,
    title,
    price,
    rating,
    sold,
    description,
    className,
}: ProductCardProps) {
    // Styles based on size
    const titleSize = {
        sm: 'text-base',
        md: 'text-xl',
        lg: 'text-2xl',
    }[size || 'md'];

    const priceSize = {
        sm: 'text-lg',
        md: 'text-2xl',
        lg: 'text-3xl',
    }[size || 'md'];

    const paddingSize = {
        sm: 'p-3',
        md: 'p-4',
        lg: 'p-6',
    }[size || 'md'];

    if (variant === 'category') {
        return (
            <Card
                className={cn(
                    productCardVariants({ variant, size, className }),
                )}
            >
                <CardContent
                    className={cn(
                        'flex items-center justify-center bg-[#F9F9F9] text-center',
                        size === 'sm'
                            ? 'min-h-[100px] p-4'
                            : size === 'lg'
                              ? 'min-h-[180px] p-8'
                              : 'min-h-[140px] p-6',
                    )}
                >
                    <h3 className={cn('font-medium text-[#1A1A1A]', titleSize)}>
                        {title}
                    </h3>
                </CardContent>
            </Card>
        );
    }

    if (variant === 'horizontal') {
        return (
            <Card
                className={cn(
                    productCardVariants({ variant, size, className }),
                )}
            >
                <CardContent className="flex flex-col p-0 sm:flex-row">
                    <div
                        className={cn(
                            'flex-shrink-0 overflow-hidden',
                            size === 'sm'
                                ? 'w-full sm:w-1/3'
                                : size === 'lg'
                                  ? 'w-full sm:w-3/5'
                                  : 'w-full sm:w-1/2',
                        )}
                    >
                        <img
                            src={image}
                            alt={title}
                            className="h-full w-full object-cover transition-transform duration-300 hover:scale-105"
                        />
                    </div>
                    <div
                        className={cn(
                            'flex flex-col justify-center',
                            paddingSize,
                            size === 'sm'
                                ? 'w-full sm:w-2/3'
                                : size === 'lg'
                                  ? 'w-full sm:w-2/5'
                                  : 'w-full sm:w-1/2',
                        )}
                    >
                        <h3
                            className={cn(
                                'font-semibold leading-tight text-[#1A1A1A]',
                                titleSize,
                                size === 'lg' ? 'mb-4' : 'mb-2',
                            )}
                        >
                            {title}
                        </h3>
                        <p
                            className={cn(
                                'leading-relaxed text-[#666666]',
                                size === 'sm'
                                    ? 'line-clamp-2 text-sm'
                                    : size === 'lg'
                                      ? 'text-xl'
                                      : 'text-lg',
                            )}
                        >
                            {description}
                        </p>
                    </div>
                </CardContent>
            </Card>
        );
    }

    // Default vertical variant
    return (
        <Card className={cn(productCardVariants({ variant, size, className }))}>
            <CardContent className="p-0">
                <div className="aspect-square overflow-hidden bg-gray-50">
                    <img
                        src={image}
                        alt={title}
                        className="h-full w-full object-cover transition-transform duration-300 hover:scale-105"
                    />
                </div>
                <div
                    className={cn(
                        paddingSize,
                        size === 'md'
                            ? 'pt-6'
                            : size === 'lg'
                              ? 'pt-8'
                              : 'pt-4',
                    )}
                >
                    <h3
                        className={cn(
                            'mb-2 font-normal leading-tight text-[#1A1A1A]',
                            titleSize,
                        )}
                    >
                        {title}
                    </h3>
                    {price && (
                        <div
                            className={cn(
                                'font-bold text-[#1A1A1A]',
                                priceSize,
                                size === 'lg' ? 'mb-4' : 'mb-3',
                            )}
                        >
                            {typeof price === 'number'
                                ? `Rp${price.toLocaleString('id-ID')}`
                                : price}
                        </div>
                    )}
                    {(rating !== undefined || sold !== undefined) && (
                        <div
                            className={cn(
                                'flex items-center gap-1.5 text-[#999999]',
                                size === 'sm' ? 'text-xs' : 'text-sm',
                            )}
                        >
                            {rating !== undefined && (
                                <div className="flex items-center gap-1">
                                    <Star
                                        className={cn(
                                            'fill-[#FDC12A] text-[#FDC12A]',
                                            size === 'sm'
                                                ? 'h-3 w-3'
                                                : 'h-4 w-4',
                                        )}
                                    />
                                    <span className="font-medium text-[#666666]">
                                        {rating}
                                    </span>
                                </div>
                            )}
                            {rating !== undefined && sold !== undefined && (
                                <span className="mx-0.5">|</span>
                            )}
                            {sold !== undefined && <span>{sold}+ terjual</span>}
                        </div>
                    )}
                </div>
            </CardContent>
        </Card>
    );
}
