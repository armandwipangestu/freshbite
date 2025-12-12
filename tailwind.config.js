import forms from '@tailwindcss/forms';
import typography from '@tailwindcss/typography';
import defaultTheme from 'tailwindcss/defaultTheme';

/** @type {import('tailwindcss').Config} */
export default {
    darkMode: ['class'],
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
        './resources/js/**/*.tsx',
    ],

    theme: {
        extend: {
            typography: (theme) => ({
                DEFAULT: {
                    css: {
                        color: 'hsl(var(--foreground))',
                        a: {
                            color: 'hsl(var(--primary))',
                            '&:hover': {
                                color: 'hsl(var(--primary-foreground))',
                            },
                        },
                        h1: {
                            fontWeight: '700',
                            color: 'hsl(var(--foreground))',
                        },
                        h2: {
                            fontWeight: '600',
                            color: 'hsl(var(--foreground))',
                        },
                        h3: {
                            fontWeight: '600',
                            color: 'hsl(var(--foreground))',
                        },
                        p: { color: 'hsl(var(--muted-foreground))' },
                        strong: { color: 'hsl(var(--foreground))' },
                        code: {
                            backgroundColor: 'hsl(var(--muted))',
                            padding: '0.25rem 0.4rem',
                            borderRadius: '0.25rem',
                        },
                        blockquote: {
                            color: 'hsl(var(--foreground))',
                            borderLeftColor: 'hsl(var(--primary))',
                        },
                    },
                },
                dark: {
                    css: {
                        color: 'hsl(var(--foreground))',
                        a: { color: 'hsl(var(--primary))' },
                        h1: { color: 'hsl(var(--foreground))' },
                        h2: { color: 'hsl(var(--foreground))' },
                        h3: { color: 'hsl(var(--foreground))' },
                        p: { color: 'hsl(var(--muted-foreground))' },
                        strong: { color: 'hsl(var(--foreground))' },
                        blockquote: { borderLeftColor: 'hsl(var(--primary))' },
                    },
                },
            }),
            fontSize: {
                h1: 'var(--font-h1)',
                h2: 'var(--font-h2)',
                h3: 'var(--font-h3)',
                h4: 'var(--font-h4)',
                h5: 'var(--font-h5)',
                body: 'var(--font-body)',
                'body-lg': 'var(--font-body-lg)',
                caption: 'var(--font-caption)',

                // Tailwind alias override
                xs: 'var(--font-xs)',
                sm: 'var(--font-sm)',
                base: 'var(--font-base)',
                lg: 'var(--font-lg)',
                xl: 'var(--font-xl)',
                '2xl': 'var(--font-2xl)',
                '3xl': 'var(--font-3xl)',
                '4xl': 'var(--font-4xl)',
                '5xl': 'var(--font-5xl)',
            },
            lineHeight: {
                normal: 'var(--leading-normal)',
                relaxed: 'var(--leading-relaxed)',
                loose: 'var(--leading-loose)',
            },
            fontFamily: {
                // sans: ['Figtree', ...defaultTheme.fontFamily.sans],
                sans: ['Manrope', ...defaultTheme.fontFamily.sans],
                // sans: ['Poppins', ...defaultTheme.fontFamily.sans],
            },
            borderRadius: {
                lg: 'var(--radius)',
                md: 'calc(var(--radius) - 2px)',
                sm: 'calc(var(--radius) - 4px)',
            },
            colors: {
                background: 'hsl(var(--background))',
                foreground: 'hsl(var(--foreground))',
                card: {
                    DEFAULT: 'hsl(var(--card))',
                    foreground: 'hsl(var(--card-foreground))',
                },
                popover: {
                    DEFAULT: 'hsl(var(--popover))',
                    foreground: 'hsl(var(--popover-foreground))',
                },
                primary: {
                    50: 'hsl(var(--primary-50))',
                    100: 'hsl(var(--primary-100))',
                    200: 'hsl(var(--primary-200))',
                    300: 'hsl(var(--primary-300))',
                    400: 'hsl(var(--primary-400))',
                    500: 'hsl(var(--primary-500))',
                    600: 'hsl(var(--primary-600))',
                    700: 'hsl(var(--primary-700))',
                    800: 'hsl(var(--primary-800))',
                    900: 'hsl(var(--primary-900))',
                    1000: 'hsl(var(--primary-1000))',
                    1100: 'hsl(var(--primary-1100))',
                    DEFAULT: 'hsl(var(--primary))',
                    foreground: 'hsl(var(--primary-foreground))',
                },
                ground: {
                    50: 'hsl(var(--ground-50))',
                    100: 'hsl(var(--ground-100))',
                    200: 'hsl(var(--ground-200))',
                    300: 'hsl(var(--ground-300))',
                    400: 'hsl(var(--ground-400))',
                    500: 'hsl(var(--ground-500))',
                    600: 'hsl(var(--ground-600))',
                    700: 'hsl(var(--ground-700))',
                    800: 'hsl(var(--ground-800))',
                    900: 'hsl(var(--ground-900))',
                    1000: 'hsl(var(--ground-1000))',
                    1100: 'hsl(var(--ground-1100))',
                    DEFAULT: 'hsl(var(--ground))',
                },
                secondary: {
                    DEFAULT: 'hsl(var(--secondary))',
                    foreground: 'hsl(var(--secondary-foreground))',
                },
                muted: {
                    DEFAULT: 'hsl(var(--muted))',
                    foreground: 'hsl(var(--muted-foreground))',
                },
                accent: {
                    DEFAULT: 'hsl(var(--accent))',
                    foreground: 'hsl(var(--accent-foreground))',
                },
                destructive: {
                    DEFAULT: 'hsl(var(--destructive))',
                    foreground: 'hsl(var(--destructive-foreground))',
                },
                border: 'hsl(var(--border))',
                input: 'hsl(var(--input))',
                ring: 'hsl(var(--ring))',
                chart: {
                    1: 'hsl(var(--chart-1))',
                    2: 'hsl(var(--chart-2))',
                    3: 'hsl(var(--chart-3))',
                    4: 'hsl(var(--chart-4))',
                    5: 'hsl(var(--chart-5))',
                },
            },
        },
    },

    plugins: [forms, typography, require('tailwindcss-animate')],
};
