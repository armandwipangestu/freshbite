import { Navbar } from '@/Components/ui/navbar';

export default function NavbarSection() {
    return (
        <section className="space-y-4">
            <h2 className="text-xl font-semibold">Navbar</h2>

            <p className="text-sm text-gray-500">Variant: Before Login</p>
            <div className="overflow-hidden rounded-lg border">
                <Navbar />
            </div>

            <p className="text-sm text-gray-500">Variant: After Login</p>
            <div className="overflow-hidden rounded-lg border">
                <Navbar />
            </div>
        </section>
    );
}
