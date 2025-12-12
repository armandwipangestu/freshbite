import { Head } from '@inertiajs/react';
import ButtonsSection from './sections/ButtonsSection';
import NavbarSection from './sections/NavbarSection';
import TypographySection from './sections/TypographySection';

export default function DesignSystem() {
    return (
        <>
            <Head title="Design System" />
            <div className="space-y-6 p-6">
                <h1 className="text-2xl font-bold">
                    FreshBite - Design System
                </h1>

                <ButtonsSection />
                <NavbarSection />
                <TypographySection />
            </div>
        </>
    );
}
