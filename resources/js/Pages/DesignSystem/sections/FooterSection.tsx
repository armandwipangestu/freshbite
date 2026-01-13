import Footer from '@/Components/Footer';

export default function FooterSection() {
    return (
        <section className="space-y-6">
            <h2 className="text-xl font-semibold">Footer Component</h2>
            <div className="overflow-hidden rounded-[24px] border border-gray-100">
                <Footer />
            </div>
            <div className="space-y-2">
                <p className="text-sm font-medium italic text-muted-foreground">
                    Note: The footer is fully responsive. Resize the window to
                    see the layout adjust.
                </p>
            </div>
        </section>
    );
}
