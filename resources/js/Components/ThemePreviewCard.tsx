import { Card, CardContent } from '@/Components/ui/card';
import { cn } from '@/lib/utils';

interface ThemePreviewCardProps {
    title?: string;
    description?: string;
    previewImage: string;
    className?: string;
}

export default function ThemePreviewCard({
    title = 'Preview appearance',
    description,
    previewImage,
    className,
}: ThemePreviewCardProps) {
    return (
        <Card
            className={cn(
                'w-full max-w-[600px] overflow-hidden rounded-[24px] border border-gray-100 bg-white shadow-sm',
                className,
            )}
        >
            <CardContent className="p-0">
                <div className="p-8 pb-4">
                    <h2 className="text-3xl font-semibold text-[#1A1A1A]">
                        {title}
                    </h2>
                    {description && (
                        <p className="mt-2 text-lg text-gray-500">
                            {description}
                        </p>
                    )}
                </div>

                <hr className="border-gray-100" />

                <div className="p-8">
                    <div className="relative aspect-[4/3] w-full overflow-hidden rounded-[24px] border border-gray-200 bg-[#E9EEF5] p-6 shadow-inner">
                        <img
                            src={previewImage}
                            alt="Theme Preview"
                            className="h-full w-full rounded-[16px] object-contain shadow-lg"
                        />
                    </div>
                </div>
            </CardContent>
        </Card>
    );
}
