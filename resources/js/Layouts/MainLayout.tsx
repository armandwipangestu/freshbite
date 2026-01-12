import Footer from '@/Components/Footer';
import { Navbar } from '@/Components/ui/navbar';
import { usePage } from '@inertiajs/react';
import { PropsWithChildren } from 'react';
import { User } from '@/types';

interface PageProps {
    auth: {
        user: User | null;
    };
    [key: string]: unknown;
}

export default function MainLayout({ children }: PropsWithChildren) {
    const { auth } = usePage<PageProps>().props;
    const isAuthenticated = !!auth.user;
    const userName = auth.user?.name;

    return (
        <div className="flex min-h-screen flex-col bg-white">
            <Navbar isAuthenticated={isAuthenticated} userName={userName} />
            <main className="flex-grow">{children}</main>
            <Footer />
        </div>
    );
}
