const typographySizes = [
    { name: 'h1', class: 'text-h1', rem: '5rem', px: '80px' },
    { name: 'h2', class: 'text-h2', rem: '3.812rem', px: '61px' },
    { name: 'h3', class: 'text-h3', rem: '2.938rem', px: '47px' },
    { name: 'h4', class: 'text-h4', rem: '2.25rem', px: '36px' },
    { name: 'h5', class: 'text-h5', rem: '1.688rem', px: '27px' },
    { name: 'Body Large', class: 'text-body-lg', rem: '1.312rem', px: '21px' },
    { name: 'Body', class: 'text-body', rem: '1rem', px: '16px' },
    { name: 'Caption', class: 'text-caption', rem: '0.75rem', px: '12px' },
];

const typographyVariants = [
    { name: 'Normal', class: 'font-normal' },
    { name: 'Medium', class: 'font-medium' },
    { name: 'Semi Bold', class: 'font-semibold' },
    { name: 'Bold', class: 'font-bold' },
];

export default function TypographySection() {
    return (
        <section className="space-y-8">
            <h2 className="text-xl font-semibold">Typography</h2>
            <p className="text-sm text-muted-foreground">
                <ul>
                    <li>
                        Variants:{' '}
                        {typographyVariants.map((variant, index) => (
                            <span key={variant.name}>
                                <code>{variant.name}</code>
                                {index < typographyVariants.length - 1 && ', '}
                            </span>
                        ))}
                    </li>
                    <li>
                        Sizes:{' '}
                        {typographySizes.map((size, index) => (
                            <span key={size.name}>
                                <code>
                                    {size.name.toLowerCase().replace(' ', '-')}
                                </code>
                                {index < typographySizes.length - 1 && ', '}
                            </span>
                        ))}
                    </li>
                </ul>
            </p>

            {typographyVariants.map((variant) => (
                <div key={variant.name} className="space-y-4">
                    <h3 className="text-lg font-semibold">
                        Variant {variant.name}
                    </h3>
                    <div className="space-y-3">
                        {typographySizes.map((size) => (
                            <div key={size.name}>
                                <div className="mb-1 flex items-center gap-3 text-sm text-muted-foreground">
                                    <span>{size.name}</span>
                                    <span className="text-xs text-muted-foreground">
                                        ({size.rem} / {size.px})
                                    </span>
                                </div>
                                <p className={`${size.class} ${variant.class}`}>
                                    Lorem ipsum dolor sit amet.
                                </p>
                            </div>
                        ))}
                    </div>
                </div>
            ))}
        </section>
    );
}
