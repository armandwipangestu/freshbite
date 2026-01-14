import { Button } from '@/Components/ui/button';
import { Card, CardContent } from '@/Components/ui/card';
import { cn } from '@/lib/utils';
import * as React from 'react';

interface AvatarUploadCardProps {
    currentAvatar?: string;
    value?: File | null;
    onChange?: (file: File | null) => void;
    error?: string;
    maxSize?: number; // in bytes
    allowedExtensions?: string[];
    className?: string;
}

const MAX_SIZE_BYTES = 5 * 1024 * 1024; // 5MB
const ALLOWED_EXTENSIONS = ['jpg', 'jpeg', 'png'];

export default function AvatarUploadCard({
    currentAvatar,
    value,
    onChange,
    error,
    maxSize = MAX_SIZE_BYTES,
    allowedExtensions = ALLOWED_EXTENSIONS,
    className,
}: AvatarUploadCardProps) {
    const [preview, setPreview] = React.useState<string | null>(null);

    React.useEffect(() => {
        if (!value) {
            setPreview(null);
            return;
        }

        const objectUrl = URL.createObjectURL(value);
        setPreview(objectUrl);

        return () => URL.revokeObjectURL(objectUrl);
    }, [value]);

    const handleFileSelect = (file: File | null) => {
        if (!file) {
            onChange?.(null);
            return;
        }

        // Validate file type
        const fileExtension = file.name.split('.').pop()?.toLowerCase();
        if (!fileExtension || !allowedExtensions.includes(fileExtension)) {
            onChange?.(null);
            return;
        }

        // Validate file size
        if (file.size > maxSize) {
            onChange?.(null);
            return;
        }

        onChange?.(file);
    };

    const handleClick = () => {
        const input = document.createElement('input');
        input.type = 'file';
        input.accept = allowedExtensions.map((ext) => `.${ext}`).join(',');
        input.onchange = (e) => {
            const file = (e.target as HTMLInputElement).files?.[0] || null;
            handleFileSelect(file);
        };
        input.click();
    };

    const displayImage = preview
        ? preview
        : currentAvatar
          ? `/storage/${currentAvatar}`
          : null;

    return (
        <Card
            className={cn(
                'max-w-[400px] overflow-hidden rounded-[24px] border border-gray-100 bg-white shadow-sm',
                className,
            )}
        >
            <CardContent className="p-6">
                <div className="mb-6 aspect-square w-full overflow-hidden rounded-[20px] bg-gray-100">
                    {displayImage ? (
                        <img
                            src={displayImage}
                            alt="Current Avatar"
                            className="h-full w-full object-cover"
                        />
                    ) : (
                        <div className="flex h-full w-full items-center justify-center text-gray-400">
                            No photo
                        </div>
                    )}
                </div>

                {error && <p className="mb-4 text-sm text-red-500">{error}</p>}

                <Button
                    variant="outline"
                    type="button"
                    className="mb-8 h-14 w-full rounded-[16px] border-gray-300 text-lg font-semibold text-[#1A1A1A] hover:bg-gray-50 hover:text-[#1A1A1A]"
                    onClick={handleClick}
                >
                    Choose photo
                </Button>

                <ul className="space-y-4">
                    <li className="flex items-center justify-between text-[#1A1A1A]">
                        <span className="flex items-center gap-2">
                            <span className="h-1.5 w-1.5 rounded-full bg-[#1A1A1A]" />
                            Max upload file size:
                        </span>
                        <span className="font-bold">
                            {(maxSize / (1024 * 1024)).toFixed(0)}MB
                        </span>
                    </li>
                    <li className="flex items-center justify-between text-[#1A1A1A]">
                        <span className="flex items-center gap-2">
                            <span className="h-1.5 w-1.5 rounded-full bg-[#1A1A1A]" />
                            Allowed extension:
                        </span>
                        <span className="font-bold">
                            {allowedExtensions
                                .map((ext) => ext.toUpperCase())
                                .join(', ')}
                        </span>
                    </li>
                </ul>
            </CardContent>
        </Card>
    );
}
