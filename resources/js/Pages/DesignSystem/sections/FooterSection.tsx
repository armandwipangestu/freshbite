import Footer from "@/Components/Footer";

export default function FooterSection() {
    return (
        <section className="space-y-6">
            <h2 className="text-xl font-semibold">Footer Component</h2>
            <div className="border border-gray-100 rounded-[24px] overflow-hidden">
                <Footer />
            </div>
            <div className="space-y-2">
                <p className="text-sm font-medium text-muted-foreground italic">
                    Note: The footer is fully responsive. Resize the window to see the layout adjust.
                </p>
            </div>
        </section>
    );
}
