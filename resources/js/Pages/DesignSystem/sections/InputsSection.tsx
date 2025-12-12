import { Input } from '@/components/ui/input';
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table';
import { SearchIcon } from 'lucide-react';

const sizes = ['sm', 'md', 'lg'] as const;
const variants = [
    'default',
    'underline',
    'withLabel',
    'withIcon',
    'outline',
    'error',
    'success',
] as const;

export default function InputsSection() {
    return (
        <section className="space-y-4">
            <h2 className="text-xl font-semibold">Inputs</h2>
            <p className="text-sm text-muted-foreground">
                <ul>
                    <li>
                        Variants:{' '}
                        {variants.map((variant, i) => (
                            <span key={variant}>
                                <code>{variant}</code>
                                {i < variants.length - 1 && ', '}
                            </span>
                        ))}
                    </li>
                    <li>
                        Sizes:{' '}
                        {sizes.map((size, i) => (
                            <span key={size}>
                                <code>{size}</code>
                                {i < sizes.length - 1 && ', '}
                            </span>
                        ))}
                    </li>
                </ul>
            </p>

            <Table>
                <TableHeader>
                    <TableRow>
                        <TableHead className="text-center">Variant</TableHead>
                        {sizes.map((size) => (
                            <TableHead
                                key={size}
                                className="text-center capitalize"
                            >
                                {size}
                            </TableHead>
                        ))}
                    </TableRow>
                </TableHeader>
                <TableBody>
                    {[
                        {
                            label: 'Default',
                            props: {
                                variant: 'default' as const,
                                placeholder: 'Placeholder...',
                            },
                        },
                        {
                            label: 'Underline',
                            props: {
                                variant: 'underline' as const,
                                placeholder: 'Placeholder...',
                            },
                        },
                        {
                            label: 'With Label',
                            props: {
                                variant: 'default' as const,
                                label: 'Email',
                                placeholder: 'you@example.com',
                            },
                        },
                        {
                            label: 'With Icon',
                            props: {
                                variant: 'default' as const,
                                placeholder: 'Search...',
                                icon: SearchIcon,
                                iconPosition: 'right' as const,
                            },
                        },
                        {
                            label: 'Outline',
                            props: {
                                variant: 'outline' as const,
                                placeholder: 'Placeholder...',
                            },
                        },
                        {
                            label: 'Error',
                            props: {
                                variant: 'error' as const,
                                placeholder: 'Placeholder...',
                            },
                        },
                        {
                            label: 'Success',
                            props: {
                                variant: 'success' as const,
                                placeholder: 'Placeholder...',
                            },
                        },
                    ].map((row) => (
                        <TableRow key={row.label}>
                            <TableCell className="text-center font-medium">
                                {row.label}
                            </TableCell>
                            {sizes.map((size) => (
                                <TableCell key={size} className="text-center">
                                    <Input size={size} {...row.props} />
                                </TableCell>
                            ))}
                        </TableRow>
                    ))}
                </TableBody>
            </Table>
        </section>
    );
}
