export interface Category {
    id: number;
    name: string;
    slug: string;
    created_at?: string;
    updated_at?: string;
}

export interface ProductImage {
    id: number;
    image: string;
    product_id: number;
    created_at?: string;
    updated_at?: string;
}

export interface Product {
    id: number;
    name: string;
    slug: string;
    description: string;
    price: number;
    stock: number;
    total_sold: number;
    is_published: boolean;
    created_at?: string;
    updated_at?: string;
    images?: ProductImage[];
    categories?: Category[];
}

export interface Banner {
    id: number;
    image: string;
    is_active: boolean;
    target_url?: string;
    created_at?: string;
    updated_at?: string;
}
