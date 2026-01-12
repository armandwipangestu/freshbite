import { Button } from '@/Components/ui/button';
import { Card, CardContent } from '@/Components/ui/card';
import { cn } from '@/lib/utils';

interface AvatarUploadCardProps {
    currentAvatar?: string;
    onUpload?: (file: File) => void;
    maxSize?: string;
    allowedExtensions?: string;
    className?: string;
}

export default function AvatarUploadCard({
    currentAvatar,
    onUpload,
    maxSize = '10MB',
    allowedExtensions = '.JPG, .JPEG, .PNG',
    className,
}: AvatarUploadCardProps) {
    return (
        <Card
            className={cn(
                'max-w-[400px] overflow-hidden rounded-[24px] border border-gray-100 bg-white shadow-sm',
                className,
            )}
        >
            <CardContent className="p-6">
                <div className="mb-6 aspect-square w-full overflow-hidden rounded-[20px] bg-gray-100">
                    {currentAvatar ? (
                        <img
                            src={currentAvatar}
                            alt="Current Avatar"
                            className="h-full w-full object-cover"
                        />
                    ) : (
                        <div className="flex h-full w-full items-center justify-center text-gray-400">
                            No photo
                        </div>
                    )}
                </div>

                <Button
                    variant="outline"
                    className="mb-8 h-14 w-full rounded-[16px] border-gray-300 text-lg font-semibold text-[#1A1A1A] hover:bg-gray-50"
                    onClick={() => {
                        const input = document.createElement('input');
                        input.type = 'file';
                        input.accept = allowedExtensions
                            .split(',')
                            .map((ext) => ext.trim().toLowerCase())
                            .join(',');
                        input.onchange = (e) => {
                            const file = (e.target as HTMLInputElement)
                                .files?.[0];
                            if (file) onUpload?.(file);
                        };
                        input.click();
                    }}
                >
                    Choose photo
                </Button>

                <ul className="space-y-4">
                    <li className="flex items-center justify-between text-[#1A1A1A]">
                        <span className="flex items-center gap-2">
                            <span className="h-1.5 w-1.5 rounded-full bg-[#1A1A1A]" />
                            Max upload file size:
                        </span>
                        <span className="font-bold">{maxSize}</span>
                    </li>
                    <li className="flex items-center justify-between text-[#1A1A1A]">
                        <span className="flex items-center gap-2">
                            <span className="h-1.5 w-1.5 rounded-full bg-[#1A1A1A]" />
                            Allowed extension:
                        </span>
                        <span className="font-bold">{allowedExtensions}</span>
                    </li>
                </ul>
            </CardContent>
        </Card>
    );
}
