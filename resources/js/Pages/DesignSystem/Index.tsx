import { Head } from '@inertiajs/react';
import MainLayout from '@/Layouts/MainLayout';
import ButtonsSection from './sections/ButtonsSection';
import InputsSection from './sections/InputsSection';
import NavbarSection from './sections/NavbarSection';
import TypographySection from './sections/TypographySection';
import CardsSection from './sections/CardsSection';
import FooterSection from './sections/FooterSection';
import TabsSection from './sections/TabsSection';
import AuthSection from './sections/AuthSection';

export default function DesignSystem() {
    return (
        <MainLayout>
            <Head title="Design System" />
            <div className="space-y-6 p-6">
                <h1 className="flex items-center gap-2 text-2xl font-bold">
                    <img
                        src="/assets/logo.svg"
                        alt="FreshBite Logo"
                        className="h-8 w-auto"
                    />
                    - Design System
                </h1>

                <ButtonsSection />
                <NavbarSection />
                <InputsSection />
                <TypographySection />
                <CardsSection />
                <FooterSection />
                <TabsSection />
                <AuthSection />
            </div>
        </MainLayout>
    );
}
