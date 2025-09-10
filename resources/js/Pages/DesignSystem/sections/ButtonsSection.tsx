import { Button } from '@/components/ui/button';
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table';

const sizes = ['sm', 'md', 'lg'] as const;
const states = ['Default', 'Hover', 'Active', 'Outline'] as const;

export default function ButtonsSection() {
    return (
        <section className="space-y-4">
            <h2 className="text-xl font-semibold">Buttons</h2>
            <p className="text-sm text-muted-foreground">
                <ul>
                    <li>
                        Variants:{' '}
                        {states.map((state, index) => (
                            <span key={state}>
                                <code>{state.toLowerCase()}</code>
                                {index < states.length - 1 && ', '}
                            </span>
                        ))}
                    </li>
                    <li>
                        Sizes:{' '}
                        {sizes.map((size, index) => (
                            <span key={size}>
                                <code>{size}</code>
                                {index < sizes.length - 1 && ', '}
                            </span>
                        ))}
                    </li>
                </ul>
            </p>

            <Table>
                <TableHeader>
                    <TableRow>
                        <TableHead className="text-center">States</TableHead>
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
                    {states.map((state) => (
                        <TableRow key={state}>
                            <TableCell className="text-center font-medium">
                                {state}
                            </TableCell>
                            {sizes.map((size) => (
                                <TableCell key={size} className="text-center">
                                    {state === 'Default' && (
                                        <Button
                                            size={size}
                                            // icon={Plus}
                                            // iconPosition="right"
                                        >
                                            Button
                                        </Button>
                                    )}
                                    {state === 'Hover' && (
                                        <Button
                                            size={size}
                                            // icon={Plus}
                                            // iconPosition="right"
                                            variant="hover"
                                        >
                                            Button
                                        </Button>
                                    )}
                                    {state === 'Active' && (
                                        <Button
                                            size={size}
                                            // icon={Plus}
                                            // iconPosition="right"
                                            variant="active"
                                        >
                                            Button
                                        </Button>
                                    )}
                                    {state === 'Outline' && (
                                        <Button
                                            size={size}
                                            // icon={Plus}
                                            // iconPosition="right"
                                            variant="outline"
                                        >
                                            Button
                                        </Button>
                                    )}
                                </TableCell>
                            ))}
                        </TableRow>
                    ))}
                </TableBody>
            </Table>
        </section>
    );
}
