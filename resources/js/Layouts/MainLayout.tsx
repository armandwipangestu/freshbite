import Footer from '@/Components/Footer';
import { Navbar } from '@/Components/ui/navbar';
import { PropsWithChildren } from 'react';

export default function MainLayout({ children }: PropsWithChildren) {
    return (
        <div className="flex min-h-screen flex-col">
            <Navbar />
            <main className="flex-grow bg-background">{children}</main>
            <Footer />
        </div>
    );
}
