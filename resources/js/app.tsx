import '@fontsource/manrope/400.css';
import '@fontsource/manrope/500.css';
import '@fontsource/manrope/600.css';
import '@fontsource/manrope/700.css';
import '../css/app.css';
import './bootstrap';

import MainLayout from '@/Layouts/MainLayout';
import { createInertiaApp } from '@inertiajs/react';
import { resolvePageComponent } from 'laravel-vite-plugin/inertia-helpers';
import { createRoot } from 'react-dom/client';

const appName = import.meta.env.VITE_APP_NAME || 'Laravel';

interface PageModule {
    default: {
        layout?: (page: React.ReactNode) => React.ReactNode;
    };
}

createInertiaApp({
    title: (title) => `${title} - ${appName}`,
    resolve: (name) =>
        resolvePageComponent(
            `./Pages/${name}.tsx`,
            import.meta.glob('./Pages/**/*.tsx'),
        ).then((page) => {
            const pageModule = page as unknown as PageModule;
            pageModule.default.layout =
                pageModule.default.layout ||
                (name.startsWith('Filament/')
                    ? undefined
                    : (pageContent: React.ReactNode) => (
                        <MainLayout>{pageContent}</MainLayout>
                    ));
            return page;
        }),
    setup({ el, App, props }) {
        const root = createRoot(el);

        root.render(<App {...props} />);
    },
    progress: {
        color: '#4B5563',
    },
});
