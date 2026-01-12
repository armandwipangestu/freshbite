import { Card, CardContent } from '@/Components/ui/card';
import { cn } from '@/lib/utils';
import * as React from 'react';

interface ProductGalleryCardProps {
    images: string[];
    className?: string;
}

export default function ProductGalleryCard({
    images = [],
    className,
}: ProductGalleryCardProps) {
    const [activeIndex, setActiveIndex] = React.useState(0);

    if (images.length === 0) return null;

    return (
        <Card
            className={cn(
                'max-w-[600px] border-none bg-transparent shadow-none',
                className,
            )}
        >
            <CardContent className="p-0">
                <div className="mb-4 aspect-square w-full overflow-hidden rounded-[24px] bg-gray-50">
                    <img
                        src={images[activeIndex]}
                        alt={`Product image ${activeIndex + 1}`}
                        className="h-full w-full object-cover transition-all duration-300"
                    />
                </div>

                <div className="scrollbar-hide flex items-center gap-4 overflow-x-auto pb-2">
                    {images.map((img, index) => (
                        <button
                            key={index}
                            onClick={() => setActiveIndex(index)}
                            className={cn(
                                'relative aspect-square w-24 flex-shrink-0 overflow-hidden rounded-[16px] border-2 transition-all',
                                activeIndex === index
                                    ? 'border-[#22C55E]'
                                    : 'border-transparent opacity-70 hover:opacity-100',
                            )}
                        >
                            <img
                                src={img}
                                alt={`Thumbnail ${index + 1}`}
                                className="h-full w-full object-cover"
                            />
                        </button>
                    ))}
                </div>
            </CardContent>
        </Card>
    );
}
