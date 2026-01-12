import { cn } from "@/lib/utils"
import { Card, CardContent } from "@/Components/ui/card"

interface WishlistCardProps {
    title: string
    itemCount: number
    images: string[]
    className?: string
}

export default function WishlistCard({
    title,
    itemCount,
    images = [],
    className,
}: WishlistCardProps) {
    const displayImages = images.slice(0, 4)
    const len = displayImages.length

    const renderImages = () => {
        if (len === 0) {
            return (
                <div className="aspect-[4/3] w-full bg-gray-100 flex items-center justify-center">
                    <span className="text-gray-400">No items</span>
                </div>
            )
        }

        if (len === 1) {
            return (
                <div className="aspect-[4/3] w-full overflow-hidden rounded-[24px]">
                    <img
                        src={displayImages[0]}
                        alt={title}
                        className="h-full w-full object-cover"
                    />
                </div>
            )
        }

        if (len === 2) {
            return (
                <div className="grid grid-cols-2 gap-1 aspect-[4/3] w-full overflow-hidden rounded-[24px]">
                    <img
                        src={displayImages[0]}
                        alt={`${title} 1`}
                        className="h-full w-full object-cover"
                    />
                    <img
                        src={displayImages[1]}
                        alt={`${title} 2`}
                        className="h-full w-full object-cover"
                    />
                </div>
            )
        }

        if (len === 3) {
            return (
                <div className="grid grid-cols-3 gap-1 aspect-[4/3] w-full overflow-hidden rounded-[24px]">
                    <div className="col-span-2 row-span-2 h-full">
                        <img
                            src={displayImages[0]}
                            alt={`${title} 1`}
                            className="h-full w-full object-cover"
                        />
                    </div>
                    <div className="flex flex-col gap-1 h-full">
                        <div className="h-1/2 overflow-hidden">
                            <img
                                src={displayImages[1]}
                                alt={`${title} 2`}
                                className="h-full w-full object-cover"
                            />
                        </div>
                        <div className="h-1/2 overflow-hidden">
                            <img
                                src={displayImages[2]}
                                alt={`${title} 3`}
                                className="h-full w-full object-cover"
                            />
                        </div>
                    </div>
                </div>
            )
        }

        // len >= 4
        return (
            <div className="grid grid-cols-2 grid-rows-2 gap-1 aspect-[4/3] w-full overflow-hidden rounded-[24px]">
                {displayImages.map((img, i) => (
                    <img
                        key={i}
                        src={img}
                        alt={`${title} ${i + 1}`}
                        className="h-full w-full object-cover"
                    />
                ))}
            </div>
        )
    }

    return (
        <Card className={cn("border-none shadow-none bg-transparent max-w-[400px] rounded-none", className)}>
            <CardContent className="p-0">
                <div className="mb-4">
                    {renderImages()}
                </div>
                <div className="space-y-1">
                    <h3 className="text-3xl font-semibold text-[#1A1A1A]">
                        {title}
                    </h3>
                    <p className="text-lg text-[#666666]">
                        {itemCount} {itemCount === 1 ? 'Item' : 'Items'}
                    </p>
                </div>
            </CardContent>
        </Card>
    )
}
