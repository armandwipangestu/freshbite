import type { StorybookConfig } from '@storybook/react-vite';

const config: StorybookConfig = {
    stories: [
        '../stories/**/*.mdx',
        '../stories/**/*.stories.@(js|jsx|mjs|ts|tsx)',
        '../resources/js/**/*.stories.@(js|jsx|mjs|ts|tsx|mdx)',
        '../resources/js/Components/ui/*.stories.@(js|jsx|mjs|ts|tsx|mdx)',
    ],
    addons: [
        '@chromatic-com/storybook',
        '@storybook/addon-docs',
        '@storybook/addon-onboarding',
        '@storybook/addon-a11y',
        '@storybook/addon-vitest',
    ],
    framework: {
        name: '@storybook/react-vite',
        options: {},
    },
};
export default config;
