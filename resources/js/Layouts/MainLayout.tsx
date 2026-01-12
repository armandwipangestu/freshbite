import { PropsWithChildren } from 'react';
import { Navbar } from '@/Components/ui/navbar';
import Footer from '@/Components/Footer';

interface LayoutProps extends PropsWithChildren {
    isAuthenticated?: boolean;
    userName?: string;
}

export default function MainLayout({ children, isAuthenticated = false, userName }: LayoutProps) {
    return (
        <div className="flex min-h-screen flex-col bg-white">
            <Navbar isAuthenticated={isAuthenticated} userName={userName} />
            <main className="flex-grow">
                {children}
            </main>
            <Footer />
        </div>
    );
}
