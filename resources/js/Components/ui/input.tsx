import { cn } from '@/lib/utils';
import { cva, type VariantProps } from 'class-variance-authority';
import * as React from 'react';

const inputVariants = cva(
    'flex w-full rounded-md border bg-background px-3 py-2 text-sm transition-colors placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 disabled:cursor-not-allowed disabled:opacity-50',
    {
        variants: {
            variant: {
                default:
                    'border-input focus:outline-none focus-visible:outline-none focus-visible:ring-0 focus-visible:border-2 focus-visible:border-primary',
                underline:
                    'border-0 border-b border-ground-500 focus-visible:ring-ring rounded-none px-0 focus-visible:ring-0 focus-visible:border-b-2 focus-visible:border-primary',
                outline:
                    'border-2 border-primary-800 focus-visible:ring-0 focus-visible:border-2 focus-visible:border-primary',
                error: 'border-red-500 focus-visible:ring-0 focus-visible:border-red-500',
                success:
                    'border-green-500 focus-visible:ring-0 focus-visible:border-green-500',
            },
            size: {
                sm: 'h-8 text-sm',
                md: 'h-10 text-base',
                lg: 'h-12 text-lg',
            },
            state: {
                inactive: '',
                active: 'ring-2 ring-ring border-ring',
            },
        },
        defaultVariants: {
            variant: 'default',
            size: 'md',
            state: 'inactive',
        },
    },
);

export interface InputProps
    extends Omit<React.InputHTMLAttributes<HTMLInputElement>, 'size'>,
        VariantProps<typeof inputVariants> {
    label?: string;
    icon?: React.ElementType;
    iconPosition?: 'left' | 'right';
}

const Input = React.forwardRef<HTMLInputElement, InputProps>(
    (
        {
            className,
            variant,
            size,
            state,
            label,
            icon: Icon,
            iconPosition = 'left',
            ...props
        },
        ref,
    ) => {
        return (
            <div
                className={cn(
                    'flex w-full flex-col space-y-1',
                    label && 'items-start',
                )}
            >
                {label && (
                    <label className="text-sm font-medium">{label}</label>
                )}
                <div className={cn('relative flex w-full items-center')}>
                    {Icon && iconPosition === 'left' && (
                        <Icon className="absolute left-4 h-4 w-4 text-muted-foreground" />
                    )}
                    <input
                        ref={ref}
                        className={cn(
                            inputVariants({ variant, size, state }),
                            Icon && iconPosition === 'left' ? 'pl-10' : '',
                            Icon && iconPosition === 'right' ? 'pr-10' : '',
                            className,
                        )}
                        {...props}
                    />
                    {Icon && iconPosition === 'right' && (
                        <Icon className="absolute right-4 h-4 w-4 text-muted-foreground" />
                    )}
                </div>
            </div>
        );
    },
);

Input.displayName = 'Input';

export { Input };
