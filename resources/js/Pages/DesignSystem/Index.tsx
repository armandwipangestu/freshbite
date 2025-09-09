import { Button } from '@/components/ui/button';
import { Head } from '@inertiajs/react';
import { Plus } from 'lucide-react';

const sizes = ['sm', 'md', 'lg'] as const;
const states = ['Default', 'Hover', 'Active'] as const;

export default function DesignSystem() {
    return (
        <>
            <Head title="Design System" />
            <div className="space-y-6 p-6">
                <h1 className="text-2xl font-bold">Design System</h1>

                {/* Section: Buttons */}
                <section className="space-y-4">
                    <h2 className="text-xl font-semibold">Buttons</h2>
                    <table className="min-w-full border-collapse border border-gray-300 text-center">
                        <thead>
                            <tr>
                                <th className="border border-gray-300 px-4 py-2">
                                    States
                                </th>
                                {sizes.map((size) => (
                                    <th
                                        key={size}
                                        className="border border-gray-300 px-4 py-2 capitalize"
                                    >
                                        {size}
                                    </th>
                                ))}
                            </tr>
                        </thead>
                        <tbody>
                            {states.map((state) => (
                                <tr key={state}>
                                    <td className="border border-gray-300 px-4 py-2 font-medium">
                                        {state}
                                    </td>
                                    {sizes.map((size) => (
                                        <td
                                            key={size}
                                            className="border border-gray-300 px-4 py-2"
                                        >
                                            {state === 'Default' && (
                                                <Button
                                                    size={size}
                                                    icon={Plus}
                                                    iconPosition="right"
                                                >
                                                    Button
                                                </Button>
                                            )}
                                            {state === 'Hover' && (
                                                <Button
                                                    size={size}
                                                    icon={Plus}
                                                    iconPosition="right"
                                                    variant={'hover'}
                                                >
                                                    Button
                                                </Button>
                                            )}
                                            {state === 'Active' && (
                                                <Button
                                                    size={size}
                                                    icon={Plus}
                                                    iconPosition="right"
                                                    variant={'active'}
                                                >
                                                    Button
                                                </Button>
                                            )}
                                        </td>
                                    ))}
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </section>
            </div>
        </>
    );
}
