import type { Meta, StoryObj } from '@storybook/react-vite';
import { Plus, Trash2 } from 'lucide-react'; // contoh ikon
import { Button } from './button';

const meta: Meta<typeof Button> = {
    title: 'UI/Button', // akan muncul di sidebar Storybook
    component: Button,
    tags: ['autodocs'], // biar otomatis generate docs & controls
    argTypes: {
        onClick: { action: 'clicked' }, // action logger di storybook
    },
};
export default meta;

type Story = StoryObj<typeof Button>;

export const Default: Story = {
    args: {
        children: 'Default Button',
    },
};

export const Primary: Story = {
    args: {
        children: 'Primary',
        variant: 'default',
    },
};

export const Outline: Story = {
    args: {
        children: 'Outline',
        variant: 'outline',
    },
};

export const WithIconLeft: Story = {
    args: {
        children: 'Add Item',
        icon: Plus,
        iconPosition: 'left',
        variant: 'default',
    },
};

export const WithIconRight: Story = {
    args: {
        children: 'Delete',
        icon: Trash2,
        iconPosition: 'right',
        variant: 'destructive',
    },
};

export const Large: Story = {
    args: {
        children: 'Large Button',
        size: 'lg',
    },
};
