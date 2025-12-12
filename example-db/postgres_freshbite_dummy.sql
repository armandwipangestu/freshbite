--
-- PostgreSQL database dump
--

\restrict LlX242FPEkVXe7Srj0fcybYELwOWvCXNF61bwvkZlD8iZtB8UfLf1bzP8Ie0QGB

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg12+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-1.pgdg12+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    label_name character varying(255) NOT NULL,
    recipient_name character varying(255) NOT NULL,
    phone_number character(13) NOT NULL,
    province_id bigint NOT NULL,
    city_id bigint NOT NULL,
    address text NOT NULL,
    note_for_courier text,
    is_default boolean DEFAULT false NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.addresses OWNER TO user_freshbite_dummy;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.addresses_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: banners; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.banners (
    id bigint NOT NULL,
    image character varying(255) NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    target_url character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.banners OWNER TO user_freshbite_dummy;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.banners_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.banners_id_seq OWNED BY public.banners.id;


--
-- Name: cache; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO user_freshbite_dummy;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO user_freshbite_dummy;

--
-- Name: cart_items; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.cart_items (
    id bigint NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    cart_id bigint NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.cart_items OWNER TO user_freshbite_dummy;

--
-- Name: cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.cart_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_items_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: cart_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.cart_items_id_seq OWNED BY public.cart_items.id;


--
-- Name: carts; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.carts (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.carts OWNER TO user_freshbite_dummy;

--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carts_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.categories OWNER TO user_freshbite_dummy;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: category_products; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.category_products (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.category_products OWNER TO user_freshbite_dummy;

--
-- Name: category_products_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.category_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_products_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: category_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.category_products_id_seq OWNED BY public.category_products.id;


--
-- Name: coupon_products; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.coupon_products (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    coupon_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.coupon_products OWNER TO user_freshbite_dummy;

--
-- Name: coupon_products_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.coupon_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coupon_products_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: coupon_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.coupon_products_id_seq OWNED BY public.coupon_products.id;


--
-- Name: coupons; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.coupons (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    discount numeric(5,2) NOT NULL,
    stock integer NOT NULL,
    expired_at timestamp(0) without time zone NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.coupons OWNER TO user_freshbite_dummy;

--
-- Name: coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coupons_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.coupons_id_seq OWNED BY public.coupons.id;


--
-- Name: exports; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.exports (
    id bigint NOT NULL,
    completed_at timestamp(0) without time zone,
    file_disk character varying(255) NOT NULL,
    file_name character varying(255),
    exporter character varying(255) NOT NULL,
    processed_rows integer DEFAULT 0 NOT NULL,
    total_rows integer NOT NULL,
    successful_rows integer DEFAULT 0 NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.exports OWNER TO user_freshbite_dummy;

--
-- Name: exports_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.exports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exports_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: exports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.exports_id_seq OWNED BY public.exports.id;


--
-- Name: failed_import_rows; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.failed_import_rows (
    id bigint NOT NULL,
    data json NOT NULL,
    import_id bigint NOT NULL,
    validation_error text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.failed_import_rows OWNER TO user_freshbite_dummy;

--
-- Name: failed_import_rows_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.failed_import_rows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_import_rows_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: failed_import_rows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.failed_import_rows_id_seq OWNED BY public.failed_import_rows.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO user_freshbite_dummy;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: imports; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.imports (
    id bigint NOT NULL,
    completed_at timestamp(0) without time zone,
    file_name character varying(255) NOT NULL,
    file_path character varying(255) NOT NULL,
    importer character varying(255) NOT NULL,
    processed_rows integer DEFAULT 0 NOT NULL,
    total_rows integer NOT NULL,
    successful_rows integer DEFAULT 0 NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.imports OWNER TO user_freshbite_dummy;

--
-- Name: imports_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.imports_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.imports_id_seq OWNED BY public.imports.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO user_freshbite_dummy;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO user_freshbite_dummy;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO user_freshbite_dummy;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO user_freshbite_dummy;

--
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO user_freshbite_dummy;

--
-- Name: notifications; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.notifications (
    id uuid NOT NULL,
    type character varying(255) NOT NULL,
    notifiable_type character varying(255) NOT NULL,
    notifiable_id bigint NOT NULL,
    data text NOT NULL,
    read_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.notifications OWNER TO user_freshbite_dummy;

--
-- Name: order_items; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.order_items (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.order_items OWNER TO user_freshbite_dummy;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    total_price numeric(10,2) NOT NULL,
    payment_status character varying(255) NOT NULL,
    payment_url character varying(255),
    payment_booking_code character varying(255),
    user_id bigint NOT NULL,
    courier_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    CONSTRAINT orders_payment_status_check CHECK (((payment_status)::text = ANY ((ARRAY['pending'::character varying, 'paid'::character varying, 'failed'::character varying, 'waiting'::character varying])::text[])))
);


ALTER TABLE public.orders OWNER TO user_freshbite_dummy;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO user_freshbite_dummy;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO user_freshbite_dummy;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: product_images; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.product_images (
    id bigint NOT NULL,
    image character varying(255) NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.product_images OWNER TO user_freshbite_dummy;

--
-- Name: product_images_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.product_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_images_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: product_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.product_images_id_seq OWNED BY public.product_images.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    description text NOT NULL,
    price numeric(10,2) NOT NULL,
    stock integer NOT NULL,
    total_sold integer DEFAULT 0 NOT NULL,
    is_published boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.products OWNER TO user_freshbite_dummy;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.profiles (
    id bigint NOT NULL,
    theme character varying(255) DEFAULT 'system'::character varying,
    gender character varying(255) DEFAULT 'prefer_not_to_say'::character varying,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    CONSTRAINT profiles_gender_check CHECK (((gender)::text = ANY ((ARRAY['male'::character varying, 'female'::character varying, 'prefer_not_to_say'::character varying])::text[]))),
    CONSTRAINT profiles_theme_check CHECK (((theme)::text = ANY ((ARRAY['light'::character varying, 'dark'::character varying, 'system'::character varying])::text[])))
);


ALTER TABLE public.profiles OWNER TO user_freshbite_dummy;

--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.profiles_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;


--
-- Name: raja_ongkir_cities; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.raja_ongkir_cities (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    postal_code character varying(255),
    province_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.raja_ongkir_cities OWNER TO user_freshbite_dummy;

--
-- Name: raja_ongkir_cities_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.raja_ongkir_cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.raja_ongkir_cities_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: raja_ongkir_cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.raja_ongkir_cities_id_seq OWNED BY public.raja_ongkir_cities.id;


--
-- Name: raja_ongkir_couriers; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.raja_ongkir_couriers (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.raja_ongkir_couriers OWNER TO user_freshbite_dummy;

--
-- Name: raja_ongkir_couriers_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.raja_ongkir_couriers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.raja_ongkir_couriers_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: raja_ongkir_couriers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.raja_ongkir_couriers_id_seq OWNED BY public.raja_ongkir_couriers.id;


--
-- Name: raja_ongkir_provinces; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.raja_ongkir_provinces (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.raja_ongkir_provinces OWNER TO user_freshbite_dummy;

--
-- Name: raja_ongkir_provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.raja_ongkir_provinces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.raja_ongkir_provinces_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: raja_ongkir_provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.raja_ongkir_provinces_id_seq OWNED BY public.raja_ongkir_provinces.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    star character varying(255) NOT NULL,
    message text NOT NULL,
    is_published boolean DEFAULT false NOT NULL,
    order_item_id bigint NOT NULL,
    product_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    CONSTRAINT reviews_star_check CHECK (((star)::text = ANY ((ARRAY['1'::character varying, '2'::character varying, '3'::character varying, '4'::character varying, '5'::character varying])::text[])))
);


ALTER TABLE public.reviews OWNER TO user_freshbite_dummy;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO user_freshbite_dummy;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO user_freshbite_dummy;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO user_freshbite_dummy;

--
-- Name: users; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    avatar character varying(255),
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255),
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO user_freshbite_dummy;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: wishlist_items; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.wishlist_items (
    id bigint NOT NULL,
    wishlist_id bigint NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.wishlist_items OWNER TO user_freshbite_dummy;

--
-- Name: wishlist_items_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.wishlist_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wishlist_items_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: wishlist_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.wishlist_items_id_seq OWNED BY public.wishlist_items.id;


--
-- Name: wishlists; Type: TABLE; Schema: public; Owner: user_freshbite_dummy
--

CREATE TABLE public.wishlists (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.wishlists OWNER TO user_freshbite_dummy;

--
-- Name: wishlists_id_seq; Type: SEQUENCE; Schema: public; Owner: user_freshbite_dummy
--

CREATE SEQUENCE public.wishlists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wishlists_id_seq OWNER TO user_freshbite_dummy;

--
-- Name: wishlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_freshbite_dummy
--

ALTER SEQUENCE public.wishlists_id_seq OWNED BY public.wishlists.id;


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: banners id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.banners ALTER COLUMN id SET DEFAULT nextval('public.banners_id_seq'::regclass);


--
-- Name: cart_items id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.cart_items ALTER COLUMN id SET DEFAULT nextval('public.cart_items_id_seq'::regclass);


--
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: category_products id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.category_products ALTER COLUMN id SET DEFAULT nextval('public.category_products_id_seq'::regclass);


--
-- Name: coupon_products id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.coupon_products ALTER COLUMN id SET DEFAULT nextval('public.coupon_products_id_seq'::regclass);


--
-- Name: coupons id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.coupons ALTER COLUMN id SET DEFAULT nextval('public.coupons_id_seq'::regclass);


--
-- Name: exports id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.exports ALTER COLUMN id SET DEFAULT nextval('public.exports_id_seq'::regclass);


--
-- Name: failed_import_rows id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.failed_import_rows ALTER COLUMN id SET DEFAULT nextval('public.failed_import_rows_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: imports id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.imports ALTER COLUMN id SET DEFAULT nextval('public.imports_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: product_images id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.product_images ALTER COLUMN id SET DEFAULT nextval('public.product_images_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: profiles id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);


--
-- Name: raja_ongkir_cities id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.raja_ongkir_cities ALTER COLUMN id SET DEFAULT nextval('public.raja_ongkir_cities_id_seq'::regclass);


--
-- Name: raja_ongkir_couriers id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.raja_ongkir_couriers ALTER COLUMN id SET DEFAULT nextval('public.raja_ongkir_couriers_id_seq'::regclass);


--
-- Name: raja_ongkir_provinces id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.raja_ongkir_provinces ALTER COLUMN id SET DEFAULT nextval('public.raja_ongkir_provinces_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: wishlist_items id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.wishlist_items ALTER COLUMN id SET DEFAULT nextval('public.wishlist_items_id_seq'::regclass);


--
-- Name: wishlists id; Type: DEFAULT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.wishlists ALTER COLUMN id SET DEFAULT nextval('public.wishlists_id_seq'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.addresses (id, label_name, recipient_name, phone_number, province_id, city_id, address, note_for_courier, is_default, user_id, created_at, updated_at, deleted_at) FROM stdin;
1	House	Kaycee Gottlieb IV	8713828262   	27	512	13002 Alfonso Rest Suite 000\nJaketon, OR 12662	Atque alias molestiae id rerum voluptate.	t	9	2025-09-03 18:11:10	2025-09-03 18:11:10	\N
2	Other	Dimitri Sporer Jr.	371641476191 	14	176	84840 Jayne Ports Suite 972\nKingchester, MO 89892	Maiores accusamus magnam blanditiis ut autem aut.	f	9	2025-09-03 18:11:10	2025-09-03 18:11:10	\N
3	Office	Dr. Kari Lockman DDS	7009394231   	30	603	839 Buckridge Springs Suite 441\nFraneckishire, HI 60739	Libero est adipisci qui incidunt sint occaecati.	f	9	2025-09-03 18:11:10	2025-09-03 18:11:10	\N
4	House	Prof. Keith Wisozk	905169560799 	16	228	4726 Jonatan Mill\nCandidoborough, MT 24881	Itaque fugiat non officiis delectus qui non.	f	3	2025-09-03 18:11:10	2025-09-03 18:11:10	\N
5	Office	Dr. Romaine Raynor	462545488723 	19	260	25532 Anderson Grove Suite 409\nBrentbury, KS 61747-7532	Recusandae sed et earum et.	t	11	2025-09-03 18:11:10	2025-09-03 18:11:10	\N
6	Office	Dr. Maxwell Oberbrunner	2895825857261	28	514	26117 Jacynthe Square\nNew Eliseo, UT 83416-7803	Eaque expedita ipsam reiciendis voluptatem repellat.	f	10	2025-09-03 18:11:10	2025-09-03 18:11:10	\N
7	Office	Mrs. Ivy Daugherty	8735341198   	33	686	31984 Dave Rapids\nEast Oralfurt, MS 55128-4933	Optio ut quaerat sapiente fugit sit provident aut.	f	7	2025-09-03 18:11:10	2025-09-03 18:11:10	\N
8	House	Julianne Mosciski	5980393656912	29	556	18916 Anjali Springs Apt. 329\nLake Eulaliafort, TN 75268	Dolorum ea sapiente exercitationem eligendi facilis aliquid.	f	4	2025-09-03 18:11:10	2025-09-03 18:11:10	\N
9	Office	Darrell Ruecker	1669236639   	22	347	191 Scotty Highway\nNew Myron, TX 78957	Nam voluptatem voluptas et labore.	f	4	2025-09-03 18:11:11	2025-09-03 18:11:11	\N
10	Other	Leanne McLaughlin I	371924867707 	34	662	22574 Chad Path\nWest Reese, AL 98294-6891	Voluptatum omnis esse et est eos non.	f	1	2025-09-03 18:11:11	2025-09-03 18:11:11	\N
11	House	Mrs. Alisha Von PhD	3362421893   	10	135	9884 Bethel Estates\nLake Roxaneton, TX 89669	Necessitatibus aut vero aliquam.	f	3	2025-09-03 18:11:11	2025-09-03 18:11:11	\N
12	House	Gina Bayer	859373428094 	16	378	61463 Mauricio Crescent\nLehnermouth, TX 76789	Et similique quia placeat quo voluptatem.	f	6	2025-09-03 18:11:11	2025-09-03 18:11:11	\N
13	Other	Kathlyn Mosciski III	298783799873 	29	557	2968 Murazik Square\nHammesport, NM 32982	Quod esse ad consequatur sint eius fuga.	t	1	2025-09-03 18:11:11	2025-09-03 18:11:11	\N
14	Office	Mrs. Katlyn Marks V	57309741045  	22	341	256 Bosco Port Suite 975\nBartontown, NH 67477	Qui quia ut hic vero quia.	f	1	2025-09-03 18:11:11	2025-09-03 18:11:11	\N
15	Office	Cletus Bashirian MD	5435116167298	17	255	33637 Ward Isle\nSouth Jakob, AL 55119	Quis occaecati sed officia ea non.	f	9	2025-09-03 18:11:11	2025-09-03 18:11:11	\N
16	House	Darrin Bahringer	40237305812  	34	662	504 Jerrod Gardens Apt. 172\nSouth Candidomouth, MN 99789-8447	Necessitatibus voluptates voluptas veniam nihil.	t	1	2025-09-03 18:11:11	2025-09-03 18:11:11	\N
17	Apartment	Everett Abbott	747932319749 	23	410	161 Kelli Shore Apt. 847\nLitzyhaven, AR 82889	Nemo accusamus ad aut ut sit magnam dolore.	t	5	2025-09-03 18:11:11	2025-09-03 18:11:11	\N
18	Other	Reta Lind	4168632733249	3	53	962 Schulist Stravenue\nWest Kristaburgh, MD 05375-0175	Deserunt eligendi est deserunt eum beatae est.	f	6	2025-09-03 18:11:11	2025-09-03 18:11:11	\N
19	Other	Pablo Weimann	6260540783737	10	141	4341 Janis Wells Suite 875\nAngelland, FL 98702-9544	Ipsum quis aliquid amet qui explicabo quas.	t	6	2025-09-03 18:11:11	2025-09-03 18:11:11	\N
20	Apartment	Vida Hilpert	0432712726769	29	551	98333 Conroy Plaza\nHoegerchester, UT 80819-2250	Et sed dolor molestias et unde odio.	t	7	2025-09-03 18:11:11	2025-09-03 18:11:11	\N
\.


--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.banners (id, image, is_active, target_url, created_at, updated_at, deleted_at) FROM stdin;
1	https://via.placeholder.com/640x480.png/00ddbb?text=modi	f	http://www.legros.net/delectus-ut-omnis-vitae-ea-adipisci	2025-05-10 03:38:46	2025-08-13 01:29:14	\N
2	https://via.placeholder.com/640x480.png/0011aa?text=amet	t	https://www.kling.com/distinctio-blanditiis-odit-aliquid-fugiat-asperiores-eos-nihil-aut	2025-03-17 18:53:08	2025-04-03 18:55:55	\N
3	https://via.placeholder.com/640x480.png/008899?text=et	f	https://www.berge.net/aut-fuga-autem-rerum-necessitatibus	2024-09-28 22:56:11	2024-10-22 18:06:39	\N
4	https://via.placeholder.com/640x480.png/002233?text=voluptas	t	http://satterfield.com/	2025-07-24 20:39:17	2025-08-27 05:04:36	\N
5	https://via.placeholder.com/640x480.png/008822?text=adipisci	t	http://marvin.com/recusandae-inventore-non-dicta-officiis-explicabo-ea	2024-09-22 08:57:54	2024-11-16 20:35:04	\N
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.cache (key, value, expiration) FROM stdin;
a17961fa74e9275d529f489537f179c05d50c2f3:timer	i:1756924343;	1756924343
a17961fa74e9275d529f489537f179c05d50c2f3	i:1;	1756924343
spatie.permission.cache	a:3:{s:5:"alias";a:4:{s:1:"a";s:2:"id";s:1:"b";s:4:"name";s:1:"c";s:10:"guard_name";s:1:"r";s:5:"roles";}s:11:"permissions";a:116:{i:0;a:4:{s:1:"a";i:1;s:1:"b";s:12:"manage users";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:3;}}i:1;a:4:{s:1:"a";i:2;s:1:"b";s:14:"view dashboard";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:3;i:2;i:4;}}i:2;a:4:{s:1:"a";i:3;s:1:"b";s:11:"view_banner";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:3;a:4:{s:1:"a";i:4;s:1:"b";s:15:"view_any_banner";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:4;a:4:{s:1:"a";i:5;s:1:"b";s:13:"create_banner";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:5;a:4:{s:1:"a";i:6;s:1:"b";s:13:"update_banner";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:6;a:4:{s:1:"a";i:7;s:1:"b";s:14:"restore_banner";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:7;a:4:{s:1:"a";i:8;s:1:"b";s:18:"restore_any_banner";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:8;a:4:{s:1:"a";i:9;s:1:"b";s:16:"replicate_banner";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:9;a:4:{s:1:"a";i:10;s:1:"b";s:14:"reorder_banner";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:10;a:4:{s:1:"a";i:11;s:1:"b";s:13:"delete_banner";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:11;a:4:{s:1:"a";i:12;s:1:"b";s:17:"delete_any_banner";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:12;a:4:{s:1:"a";i:13;s:1:"b";s:19:"force_delete_banner";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:13;a:4:{s:1:"a";i:14;s:1:"b";s:23:"force_delete_any_banner";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:14;a:4:{s:1:"a";i:15;s:1:"b";s:9:"view_cart";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:15;a:4:{s:1:"a";i:16;s:1:"b";s:13:"view_any_cart";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:16;a:4:{s:1:"a";i:17;s:1:"b";s:11:"create_cart";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:17;a:4:{s:1:"a";i:18;s:1:"b";s:11:"update_cart";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:18;a:4:{s:1:"a";i:19;s:1:"b";s:12:"restore_cart";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:19;a:4:{s:1:"a";i:20;s:1:"b";s:16:"restore_any_cart";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:20;a:4:{s:1:"a";i:21;s:1:"b";s:14:"replicate_cart";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:21;a:4:{s:1:"a";i:22;s:1:"b";s:12:"reorder_cart";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:22;a:4:{s:1:"a";i:23;s:1:"b";s:11:"delete_cart";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:23;a:4:{s:1:"a";i:24;s:1:"b";s:15:"delete_any_cart";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:24;a:4:{s:1:"a";i:25;s:1:"b";s:17:"force_delete_cart";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:25;a:4:{s:1:"a";i:26;s:1:"b";s:21:"force_delete_any_cart";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:26;a:4:{s:1:"a";i:27;s:1:"b";s:13:"view_category";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:27;a:4:{s:1:"a";i:28;s:1:"b";s:17:"view_any_category";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:28;a:4:{s:1:"a";i:29;s:1:"b";s:15:"create_category";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:29;a:4:{s:1:"a";i:30;s:1:"b";s:15:"update_category";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:30;a:4:{s:1:"a";i:31;s:1:"b";s:16:"restore_category";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:31;a:4:{s:1:"a";i:32;s:1:"b";s:20:"restore_any_category";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:32;a:4:{s:1:"a";i:33;s:1:"b";s:18:"replicate_category";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:33;a:4:{s:1:"a";i:34;s:1:"b";s:16:"reorder_category";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:34;a:4:{s:1:"a";i:35;s:1:"b";s:15:"delete_category";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:35;a:4:{s:1:"a";i:36;s:1:"b";s:19:"delete_any_category";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:36;a:4:{s:1:"a";i:37;s:1:"b";s:21:"force_delete_category";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:37;a:4:{s:1:"a";i:38;s:1:"b";s:25:"force_delete_any_category";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:38;a:4:{s:1:"a";i:39;s:1:"b";s:11:"view_coupon";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:39;a:4:{s:1:"a";i:40;s:1:"b";s:15:"view_any_coupon";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:40;a:4:{s:1:"a";i:41;s:1:"b";s:13:"create_coupon";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:41;a:4:{s:1:"a";i:42;s:1:"b";s:13:"update_coupon";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:42;a:4:{s:1:"a";i:43;s:1:"b";s:14:"restore_coupon";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:43;a:4:{s:1:"a";i:44;s:1:"b";s:18:"restore_any_coupon";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:44;a:4:{s:1:"a";i:45;s:1:"b";s:16:"replicate_coupon";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:45;a:4:{s:1:"a";i:46;s:1:"b";s:14:"reorder_coupon";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:46;a:4:{s:1:"a";i:47;s:1:"b";s:13:"delete_coupon";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:47;a:4:{s:1:"a";i:48;s:1:"b";s:17:"delete_any_coupon";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:48;a:4:{s:1:"a";i:49;s:1:"b";s:19:"force_delete_coupon";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:49;a:4:{s:1:"a";i:50;s:1:"b";s:23:"force_delete_any_coupon";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:50;a:4:{s:1:"a";i:51;s:1:"b";s:10:"view_order";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:51;a:4:{s:1:"a";i:52;s:1:"b";s:14:"view_any_order";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:52;a:4:{s:1:"a";i:53;s:1:"b";s:12:"create_order";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:53;a:4:{s:1:"a";i:54;s:1:"b";s:12:"update_order";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:54;a:4:{s:1:"a";i:55;s:1:"b";s:13:"restore_order";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:55;a:4:{s:1:"a";i:56;s:1:"b";s:17:"restore_any_order";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:56;a:4:{s:1:"a";i:57;s:1:"b";s:15:"replicate_order";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:57;a:4:{s:1:"a";i:58;s:1:"b";s:13:"reorder_order";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:58;a:4:{s:1:"a";i:59;s:1:"b";s:12:"delete_order";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:59;a:4:{s:1:"a";i:60;s:1:"b";s:16:"delete_any_order";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:60;a:4:{s:1:"a";i:61;s:1:"b";s:18:"force_delete_order";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:61;a:4:{s:1:"a";i:62;s:1:"b";s:22:"force_delete_any_order";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:62;a:4:{s:1:"a";i:63;s:1:"b";s:12:"view_product";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:63;a:4:{s:1:"a";i:64;s:1:"b";s:16:"view_any_product";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:64;a:4:{s:1:"a";i:65;s:1:"b";s:14:"create_product";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:65;a:4:{s:1:"a";i:66;s:1:"b";s:14:"update_product";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:66;a:4:{s:1:"a";i:67;s:1:"b";s:15:"restore_product";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:67;a:4:{s:1:"a";i:68;s:1:"b";s:19:"restore_any_product";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:68;a:4:{s:1:"a";i:69;s:1:"b";s:17:"replicate_product";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:69;a:4:{s:1:"a";i:70;s:1:"b";s:15:"reorder_product";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:70;a:4:{s:1:"a";i:71;s:1:"b";s:14:"delete_product";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:71;a:4:{s:1:"a";i:72;s:1:"b";s:18:"delete_any_product";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:72;a:4:{s:1:"a";i:73;s:1:"b";s:20:"force_delete_product";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:73;a:4:{s:1:"a";i:74;s:1:"b";s:24:"force_delete_any_product";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:74;a:4:{s:1:"a";i:75;s:1:"b";s:11:"view_review";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:75;a:4:{s:1:"a";i:76;s:1:"b";s:15:"view_any_review";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:76;a:4:{s:1:"a";i:77;s:1:"b";s:13:"create_review";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:77;a:4:{s:1:"a";i:78;s:1:"b";s:13:"update_review";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:78;a:4:{s:1:"a";i:79;s:1:"b";s:14:"restore_review";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:79;a:4:{s:1:"a";i:80;s:1:"b";s:18:"restore_any_review";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:80;a:4:{s:1:"a";i:81;s:1:"b";s:16:"replicate_review";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:81;a:4:{s:1:"a";i:82;s:1:"b";s:14:"reorder_review";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:82;a:4:{s:1:"a";i:83;s:1:"b";s:13:"delete_review";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:83;a:4:{s:1:"a";i:84;s:1:"b";s:17:"delete_any_review";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:84;a:4:{s:1:"a";i:85;s:1:"b";s:19:"force_delete_review";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:85;a:4:{s:1:"a";i:86;s:1:"b";s:23:"force_delete_any_review";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:86;a:4:{s:1:"a";i:87;s:1:"b";s:17:"view_shield::role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:87;a:4:{s:1:"a";i:88;s:1:"b";s:21:"view_any_shield::role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:88;a:4:{s:1:"a";i:89;s:1:"b";s:19:"create_shield::role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:89;a:4:{s:1:"a";i:90;s:1:"b";s:19:"update_shield::role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:90;a:4:{s:1:"a";i:91;s:1:"b";s:19:"delete_shield::role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:91;a:4:{s:1:"a";i:92;s:1:"b";s:23:"delete_any_shield::role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:92;a:4:{s:1:"a";i:93;s:1:"b";s:9:"view_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:93;a:4:{s:1:"a";i:94;s:1:"b";s:13:"view_any_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:94;a:4:{s:1:"a";i:95;s:1:"b";s:11:"create_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:95;a:4:{s:1:"a";i:96;s:1:"b";s:11:"update_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:96;a:4:{s:1:"a";i:97;s:1:"b";s:12:"restore_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:97;a:4:{s:1:"a";i:98;s:1:"b";s:16:"restore_any_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:98;a:4:{s:1:"a";i:99;s:1:"b";s:14:"replicate_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:99;a:4:{s:1:"a";i:100;s:1:"b";s:12:"reorder_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:100;a:4:{s:1:"a";i:101;s:1:"b";s:11:"delete_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:101;a:4:{s:1:"a";i:102;s:1:"b";s:15:"delete_any_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:102;a:4:{s:1:"a";i:103;s:1:"b";s:17:"force_delete_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:103;a:4:{s:1:"a";i:104;s:1:"b";s:21:"force_delete_any_user";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:104;a:4:{s:1:"a";i:105;s:1:"b";s:13:"view_wishlist";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:105;a:4:{s:1:"a";i:106;s:1:"b";s:17:"view_any_wishlist";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:106;a:4:{s:1:"a";i:107;s:1:"b";s:15:"create_wishlist";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:107;a:4:{s:1:"a";i:108;s:1:"b";s:15:"update_wishlist";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:108;a:4:{s:1:"a";i:109;s:1:"b";s:16:"restore_wishlist";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:109;a:4:{s:1:"a";i:110;s:1:"b";s:20:"restore_any_wishlist";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:110;a:4:{s:1:"a";i:111;s:1:"b";s:18:"replicate_wishlist";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:111;a:4:{s:1:"a";i:112;s:1:"b";s:16:"reorder_wishlist";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:112;a:4:{s:1:"a";i:113;s:1:"b";s:15:"delete_wishlist";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:113;a:4:{s:1:"a";i:114;s:1:"b";s:19:"delete_any_wishlist";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:114;a:4:{s:1:"a";i:115;s:1:"b";s:21:"force_delete_wishlist";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:115;a:4:{s:1:"a";i:116;s:1:"b";s:25:"force_delete_any_wishlist";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}}s:5:"roles";a:3:{i:0;a:3:{s:1:"a";i:1;s:1:"b";s:11:"super_admin";s:1:"c";s:3:"web";}i:1;a:3:{s:1:"a";i:3;s:1:"b";s:5:"admin";s:1:"c";s:3:"web";}i:2;a:3:{s:1:"a";i:4;s:1:"b";s:4:"user";s:1:"c";s:3:"web";}}}	1757010683
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.cart_items (id, quantity, cart_id, product_id, created_at, updated_at, deleted_at) FROM stdin;
1	6	4	4	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
2	8	6	17	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
3	7	6	13	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
4	8	2	15	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
5	5	10	11	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
6	3	1	1	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
7	2	3	3	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
8	10	6	7	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
9	2	6	5	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
10	2	1	4	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
11	9	2	11	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
12	5	4	15	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
13	4	2	10	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
14	6	4	5	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
15	2	4	6	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
16	4	7	9	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
17	10	9	18	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
18	5	6	2	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
19	8	7	10	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
20	8	3	3	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
21	10	2	9	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
22	8	5	18	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
23	10	4	5	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
24	5	7	14	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
25	5	6	5	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
26	3	5	16	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
27	3	8	8	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
28	6	2	10	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
29	4	7	1	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
30	7	8	13	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
31	10	9	2	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
32	5	2	13	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
33	5	10	3	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
34	5	3	2	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
35	1	10	18	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
36	8	2	7	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
37	2	3	6	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
38	3	1	4	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
39	8	1	4	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
40	2	5	20	2025-09-03 18:11:23	2025-09-03 18:11:23	\N
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.carts (id, user_id, created_at, updated_at, deleted_at) FROM stdin;
1	12	2025-09-03 18:11:19	2025-09-03 18:11:19	\N
2	13	2025-09-03 18:11:19	2025-09-03 18:11:19	\N
3	14	2025-09-03 18:11:19	2025-09-03 18:11:19	\N
4	15	2025-09-03 18:11:19	2025-09-03 18:11:19	\N
5	16	2025-09-03 18:11:19	2025-09-03 18:11:19	\N
6	17	2025-09-03 18:11:19	2025-09-03 18:11:19	\N
7	18	2025-09-03 18:11:19	2025-09-03 18:11:19	\N
8	19	2025-09-03 18:11:19	2025-09-03 18:11:19	\N
9	20	2025-09-03 18:11:19	2025-09-03 18:11:19	\N
10	21	2025-09-03 18:11:19	2025-09-03 18:11:19	\N
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.categories (id, name, slug, created_at, updated_at, deleted_at) FROM stdin;
1	Quasi ex omnis.	quasi-ex-omnis	2025-03-18 02:40:04	2025-04-02 11:00:12	\N
2	Cupiditate suscipit sapiente.	cupiditate-suscipit-sapiente	2024-10-27 13:30:25	2025-07-29 12:02:09	\N
3	Non sequi.	non-sequi	2024-11-05 20:55:54	2025-08-18 19:00:44	\N
4	Qui occaecati rerum.	qui-occaecati-rerum	2025-08-06 21:57:45	2025-08-07 15:45:38	\N
5	Officiis et quo.	officiis-et-quo	2025-08-15 09:10:45	2025-08-31 23:44:01	\N
6	Magnam perferendis aut.	magnam-perferendis-aut	2025-03-08 21:35:29	2025-04-20 15:41:29	\N
7	Maxime nihil dolorem.	maxime-nihil-dolorem	2024-12-24 03:42:26	2025-02-20 19:14:26	\N
8	Sit quidem.	sit-quidem	2024-12-11 07:35:02	2025-08-26 14:34:36	\N
9	Et est est.	et-est-est	2025-03-11 17:41:54	2025-07-21 02:16:18	\N
10	Voluptas amet.	voluptas-amet	2025-04-25 21:57:34	2025-07-09 19:04:31	\N
\.


--
-- Data for Name: category_products; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.category_products (id, category_id, product_id, created_at, updated_at) FROM stdin;
1	7	16	2025-09-03 18:11:15	2025-09-03 18:11:15
2	7	10	2025-09-03 18:11:15	2025-09-03 18:11:15
3	4	16	2025-09-03 18:11:15	2025-09-03 18:11:15
4	6	4	2025-09-03 18:11:15	2025-09-03 18:11:15
5	4	8	2025-09-03 18:11:15	2025-09-03 18:11:15
6	3	10	2025-09-03 18:11:15	2025-09-03 18:11:15
7	5	1	2025-09-03 18:11:15	2025-09-03 18:11:15
8	7	19	2025-09-03 18:11:15	2025-09-03 18:11:15
9	8	12	2025-09-03 18:11:15	2025-09-03 18:11:15
10	10	10	2025-09-03 18:11:15	2025-09-03 18:11:15
11	1	18	2025-09-03 18:11:15	2025-09-03 18:11:15
12	7	9	2025-09-03 18:11:15	2025-09-03 18:11:15
13	5	7	2025-09-03 18:11:15	2025-09-03 18:11:15
14	7	9	2025-09-03 18:11:15	2025-09-03 18:11:15
15	2	15	2025-09-03 18:11:15	2025-09-03 18:11:15
16	1	10	2025-09-03 18:11:15	2025-09-03 18:11:15
17	5	6	2025-09-03 18:11:15	2025-09-03 18:11:15
18	7	10	2025-09-03 18:11:15	2025-09-03 18:11:15
19	7	13	2025-09-03 18:11:15	2025-09-03 18:11:15
20	6	19	2025-09-03 18:11:15	2025-09-03 18:11:15
\.


--
-- Data for Name: coupon_products; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.coupon_products (id, product_id, coupon_id, created_at, updated_at, deleted_at) FROM stdin;
1	20	2	2025-09-03 18:12:01	2025-09-03 18:12:01	\N
2	19	2	2025-09-03 18:12:01	2025-09-03 18:12:01	\N
3	15	10	2025-09-03 18:12:01	2025-09-03 18:12:01	\N
4	9	6	2025-09-03 18:12:01	2025-09-03 18:12:01	\N
5	2	5	2025-09-03 18:12:01	2025-09-03 18:12:01	\N
6	1	9	2025-09-03 18:12:01	2025-09-03 18:12:01	\N
7	20	6	2025-09-03 18:12:01	2025-09-03 18:12:01	\N
8	16	8	2025-09-03 18:12:02	2025-09-03 18:12:02	\N
9	20	9	2025-09-03 18:12:02	2025-09-03 18:12:02	\N
10	14	3	2025-09-03 18:12:02	2025-09-03 18:12:02	\N
\.


--
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.coupons (id, code, discount, stock, expired_at, is_active, created_at, updated_at, deleted_at) FROM stdin;
1	architecto	27.39	91	2026-06-01 03:33:29	t	2025-09-03 18:11:59	2025-09-03 18:11:59	\N
2	velit	33.32	100	2026-04-06 17:11:07	t	2025-09-03 18:11:59	2025-09-03 18:11:59	\N
3	qui	74.80	22	2026-01-28 00:15:23	t	2025-09-03 18:11:59	2025-09-03 18:11:59	\N
4	quis	23.37	52	2026-09-02 14:19:13	t	2025-09-03 18:11:59	2025-09-03 18:11:59	\N
5	quo	85.73	79	2026-07-31 22:24:32	t	2025-09-03 18:11:59	2025-09-03 18:11:59	\N
6	sequi	62.01	60	2025-11-05 14:12:00	t	2025-09-03 18:11:59	2025-09-03 18:11:59	\N
7	doloribus	13.13	87	2026-01-30 01:07:01	t	2025-09-03 18:11:59	2025-09-03 18:11:59	\N
8	consequatur	67.48	17	2026-03-11 00:24:10	t	2025-09-03 18:11:59	2025-09-03 18:11:59	\N
9	quam	19.70	73	2026-05-26 06:24:04	t	2025-09-03 18:11:59	2025-09-03 18:11:59	\N
10	esse	61.40	28	2025-10-07 12:51:03	t	2025-09-03 18:11:59	2025-09-03 18:11:59	\N
\.


--
-- Data for Name: exports; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.exports (id, completed_at, file_disk, file_name, exporter, processed_rows, total_rows, successful_rows, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: failed_import_rows; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.failed_import_rows (id, data, import_id, validation_error, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: imports; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.imports (id, completed_at, file_name, file_path, importer, processed_rows, total_rows, successful_rows, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2024_09_29_021215_create_permission_tables	1
5	2024_09_29_134114_create_profiles_table	1
6	2024_09_29_135541_create_raja_ongkir_provinces_table	1
7	2024_09_29_140113_create_raja_ongkir_cities_table	1
8	2024_09_29_140928_create_addresses_table	1
9	2024_09_29_143633_create_categories_table	1
10	2024_09_29_144728_create_products_table	1
11	2024_09_29_144759_create_product_images_table	1
12	2024_09_29_144853_create_category_products_table	1
13	2024_09_30_022842_create_carts_table	1
14	2024_09_30_022847_create_cart_items_table	1
15	2024_09_30_023805_create_wishlists_table	1
16	2024_09_30_023810_create_wishlist_items_table	1
17	2024_09_30_025446_create_raja_ongkir_couriers_table	1
18	2024_09_30_030152_create_orders_table	1
19	2024_09_30_030154_create_order_items_table	1
20	2024_09_30_035143_create_reviews_table	1
21	2024_09_30_042342_create_coupons_table	1
22	2024_09_30_044216_create_coupon_products_table	1
23	2024_09_30_065507_create_banners_table	1
24	2024_10_05_081349_create_notifications_table	1
25	2024_10_05_081419_create_imports_table	1
26	2024_10_05_081420_create_exports_table	1
27	2024_10_05_081421_create_failed_import_rows_table	1
\.


--
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
1	App\\Models\\User	2
2	App\\Models\\User	2
1	App\\Models\\User	3
2	App\\Models\\User	4
2	App\\Models\\User	5
2	App\\Models\\User	6
1	App\\Models\\User	7
2	App\\Models\\User	7
2	App\\Models\\User	8
1	App\\Models\\User	9
2	App\\Models\\User	9
2	App\\Models\\User	10
1	App\\Models\\User	11
1	App\\Models\\User	12
2	App\\Models\\User	12
2	App\\Models\\User	13
1	App\\Models\\User	14
1	App\\Models\\User	15
2	App\\Models\\User	15
1	App\\Models\\User	16
2	App\\Models\\User	16
1	App\\Models\\User	17
1	App\\Models\\User	18
2	App\\Models\\User	18
1	App\\Models\\User	19
2	App\\Models\\User	19
1	App\\Models\\User	20
1	App\\Models\\User	21
2	App\\Models\\User	21
\.


--
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
2	App\\Models\\User	1
1	App\\Models\\User	1
2	App\\Models\\User	2
2	App\\Models\\User	3
2	App\\Models\\User	4
2	App\\Models\\User	5
2	App\\Models\\User	6
2	App\\Models\\User	7
2	App\\Models\\User	8
2	App\\Models\\User	9
2	App\\Models\\User	10
2	App\\Models\\User	11
1	App\\Models\\User	3
3	App\\Models\\User	4
1	App\\Models\\User	5
1	App\\Models\\User	6
4	App\\Models\\User	7
4	App\\Models\\User	8
4	App\\Models\\User	10
4	App\\Models\\User	11
2	App\\Models\\User	12
3	App\\Models\\User	12
2	App\\Models\\User	13
4	App\\Models\\User	13
2	App\\Models\\User	14
3	App\\Models\\User	14
2	App\\Models\\User	15
4	App\\Models\\User	15
2	App\\Models\\User	16
3	App\\Models\\User	16
2	App\\Models\\User	17
1	App\\Models\\User	17
2	App\\Models\\User	18
4	App\\Models\\User	18
2	App\\Models\\User	19
4	App\\Models\\User	19
2	App\\Models\\User	20
2	App\\Models\\User	21
3	App\\Models\\User	21
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.notifications (id, type, notifiable_type, notifiable_id, data, read_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.order_items (id, order_id, product_id, quantity, price, created_at, updated_at) FROM stdin;
1	145	15	1	93766.00	2025-09-03 18:11:54	2025-09-03 18:11:54
2	156	10	10	66808.00	2025-09-03 18:11:54	2025-09-03 18:11:54
3	477	8	3	12331.00	2025-09-03 18:11:54	2025-09-03 18:11:54
4	233	19	5	35389.00	2025-09-03 18:11:54	2025-09-03 18:11:54
5	348	12	2	27354.00	2025-09-03 18:11:54	2025-09-03 18:11:54
6	366	10	4	66808.00	2025-09-03 18:11:54	2025-09-03 18:11:54
7	401	18	6	46910.00	2025-09-03 18:11:54	2025-09-03 18:11:54
8	51	12	9	27354.00	2025-09-03 18:11:54	2025-09-03 18:11:54
9	464	7	8	85188.00	2025-09-03 18:11:54	2025-09-03 18:11:54
10	333	18	1	46910.00	2025-09-03 18:11:54	2025-09-03 18:11:54
11	334	19	3	35389.00	2025-09-03 18:11:54	2025-09-03 18:11:54
12	153	18	10	46910.00	2025-09-03 18:11:54	2025-09-03 18:11:54
13	207	9	2	13575.00	2025-09-03 18:11:54	2025-09-03 18:11:54
14	406	17	4	14786.00	2025-09-03 18:11:54	2025-09-03 18:11:54
15	216	10	9	66808.00	2025-09-03 18:11:54	2025-09-03 18:11:54
16	441	11	9	51345.00	2025-09-03 18:11:54	2025-09-03 18:11:54
17	386	14	5	64274.00	2025-09-03 18:11:54	2025-09-03 18:11:54
18	499	16	1	55476.00	2025-09-03 18:11:54	2025-09-03 18:11:54
19	55	20	7	37863.00	2025-09-03 18:11:54	2025-09-03 18:11:54
20	443	20	4	37863.00	2025-09-03 18:11:54	2025-09-03 18:11:54
21	200	20	5	37863.00	2025-09-03 18:11:54	2025-09-03 18:11:54
22	492	8	4	12331.00	2025-09-03 18:11:54	2025-09-03 18:11:54
23	89	10	1	66808.00	2025-09-03 18:11:54	2025-09-03 18:11:54
24	345	16	8	55476.00	2025-09-03 18:11:54	2025-09-03 18:11:54
25	365	10	2	66808.00	2025-09-03 18:11:54	2025-09-03 18:11:54
26	186	3	8	91206.00	2025-09-03 18:11:54	2025-09-03 18:11:54
27	450	15	2	93766.00	2025-09-03 18:11:55	2025-09-03 18:11:55
28	266	9	2	13575.00	2025-09-03 18:11:55	2025-09-03 18:11:55
29	198	10	8	66808.00	2025-09-03 18:11:55	2025-09-03 18:11:55
30	457	10	7	66808.00	2025-09-03 18:11:55	2025-09-03 18:11:55
31	126	12	9	27354.00	2025-09-03 18:11:55	2025-09-03 18:11:55
32	303	14	8	64274.00	2025-09-03 18:11:55	2025-09-03 18:11:55
33	24	13	1	94886.00	2025-09-03 18:11:55	2025-09-03 18:11:55
34	361	20	10	37863.00	2025-09-03 18:11:55	2025-09-03 18:11:55
35	416	13	6	94886.00	2025-09-03 18:11:55	2025-09-03 18:11:55
36	170	20	3	37863.00	2025-09-03 18:11:55	2025-09-03 18:11:55
37	252	7	5	85188.00	2025-09-03 18:11:55	2025-09-03 18:11:55
38	177	14	10	64274.00	2025-09-03 18:11:55	2025-09-03 18:11:55
39	34	7	5	85188.00	2025-09-03 18:11:55	2025-09-03 18:11:55
40	85	20	10	37863.00	2025-09-03 18:11:55	2025-09-03 18:11:55
41	394	3	10	91206.00	2025-09-03 18:11:55	2025-09-03 18:11:55
42	134	8	7	12331.00	2025-09-03 18:11:55	2025-09-03 18:11:55
43	350	16	10	55476.00	2025-09-03 18:11:55	2025-09-03 18:11:55
44	257	17	10	14786.00	2025-09-03 18:11:55	2025-09-03 18:11:55
45	477	12	4	27354.00	2025-09-03 18:11:55	2025-09-03 18:11:55
46	223	8	1	12331.00	2025-09-03 18:11:55	2025-09-03 18:11:55
47	153	1	4	73022.00	2025-09-03 18:11:55	2025-09-03 18:11:55
48	293	6	2	17411.00	2025-09-03 18:11:55	2025-09-03 18:11:55
49	44	6	1	17411.00	2025-09-03 18:11:55	2025-09-03 18:11:55
50	215	8	10	12331.00	2025-09-03 18:11:55	2025-09-03 18:11:55
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.orders (id, total_price, payment_status, payment_url, payment_booking_code, user_id, courier_id, created_at, updated_at, deleted_at) FROM stdin;
1	145271.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/306ff00f-14ac-32d0-aed5-44baf0af4baf	4-0S391	2	3	2025-04-09 19:19:32	2025-09-03 18:11:47	\N
2	524098.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/d5ec5b33-c23b-30bc-a66d-e66f5cdd5305	7-8F867	11	2	2025-07-28 18:27:06	2025-09-03 18:11:47	\N
3	802522.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/71a6880f-04c9-315f-aaa6-4c27b9d0de0a	4-7M077	4	2	2025-04-06 06:11:03	2025-09-03 18:11:47	\N
4	803867.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/7ffefd05-9996-3c58-ba07-d0fcdda0282c	1-7L122	17	2	2025-07-08 15:02:45	2025-09-03 18:11:47	\N
5	821119.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/2a1ecd6e-75e5-32c0-8456-787f15031a28	9-8W010	2	1	2025-03-29 02:33:52	2025-09-03 18:11:47	\N
6	543410.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/4e03da4e-9644-326d-9eca-808d93d7337e	8-3I238	1	1	2025-04-16 01:22:05	2025-09-03 18:11:47	\N
7	503658.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/2be26f6e-c8e3-3bac-8555-3cfe734caae7	7-9X147	14	2	2024-12-13 21:30:06	2025-09-03 18:11:47	\N
8	106667.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/0e12e3a5-4706-3177-929e-c350a53cf34a	1-0O187	9	1	2025-01-04 17:39:29	2025-09-03 18:11:47	\N
9	219055.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/15b0a051-16a8-34d6-9c3f-7b78c946f341	6-8F641	21	2	2025-04-16 06:20:57	2025-09-03 18:11:47	\N
10	398549.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/50426a89-d2dd-3ebf-add6-067687b662ec	0-3E535	20	1	2025-07-10 17:59:57	2025-09-03 18:11:47	\N
11	705273.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/cf1029bc-ba1a-33a8-9892-a5628ee548f2	3-4Q921	8	1	2025-04-15 17:06:23	2025-09-03 18:11:47	\N
12	544987.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/8c0ddb1f-d773-3e24-8207-07a4c3462291	4-3X084	5	2	2024-09-21 11:51:47	2025-09-03 18:11:47	\N
13	858833.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/54a23217-a967-3a3b-8715-c39d2da5df36	9-9P658	12	3	2025-02-02 14:10:51	2025-09-03 18:11:47	\N
14	618612.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/3378a580-d189-35e6-a5ad-0cfbcbe81491	6-7D285	21	3	2025-05-14 00:44:54	2025-09-03 18:11:47	\N
15	213642.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/c79bd3fa-50f7-35e6-99c2-b32dda7d5145	0-4R743	13	3	2025-04-13 11:13:29	2025-09-03 18:11:47	\N
16	945791.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/5d21ea28-47cc-3472-bf3a-b31b2e30d5ce	8-6B937	17	1	2025-04-05 18:57:51	2025-09-03 18:11:47	\N
17	713238.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/c05785a0-8cb7-3007-93b3-95247ea12862	0-0D434	17	2	2025-04-10 06:17:51	2025-09-03 18:11:47	\N
18	536909.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/b84a8c2b-604f-38a6-92f7-8aca935f3f42	0-7A445	20	2	2025-07-23 16:20:00	2025-09-03 18:11:47	\N
19	122775.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/fb50fbdb-aa84-35b5-99eb-eb37d5fa926c	4-3P309	3	2	2025-01-07 11:33:31	2025-09-03 18:11:47	\N
20	118750.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/5a6e331a-a71e-35b9-b8d8-746698c33e7a	3-0G802	14	2	2024-11-27 10:45:18	2025-09-03 18:11:47	\N
21	797846.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/0eddac65-43cf-3ef2-ab0f-77c5b80c367c	1-9R281	19	2	2025-04-11 06:34:16	2025-09-03 18:11:47	\N
22	830249.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/cb5c3368-c7fe-38f9-8a71-92104746d19b	9-2M100	12	3	2024-11-05 19:24:32	2025-09-03 18:11:47	\N
23	69977.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/18cadeb2-0a8b-3004-8547-4d1cdcfedc93	0-0M409	1	3	2024-12-14 08:54:38	2025-09-03 18:11:47	\N
24	491355.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/04409e16-07f7-3a89-8314-91dec44066a6	7-5T275	5	1	2025-07-07 02:24:42	2025-09-03 18:11:47	\N
25	60718.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/07a53e99-afb5-3bcf-af33-88c071e9197e	6-5N902	10	2	2025-03-20 22:16:29	2025-09-03 18:11:47	\N
26	352660.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/7c02587f-3e8d-3951-ae0f-c2c7b613edc7	5-1W386	20	3	2025-01-05 11:27:48	2025-09-03 18:11:47	\N
27	136784.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/76521e28-bec3-3764-b037-27074abf775d	0-0G352	2	1	2025-06-19 07:48:12	2025-09-03 18:11:47	\N
28	422439.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/0194fdf6-904b-32be-bacc-f445bcdba694	0-5D198	14	1	2025-03-08 03:22:37	2025-09-03 18:11:47	\N
29	240516.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/02927cc8-4cf4-3f7d-b5b2-21240f40bd4f	4-4B001	17	1	2024-12-30 13:19:05	2025-09-03 18:11:47	\N
30	395071.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/dc89c0d8-c9df-3371-9370-ac58e9790b23	5-8Z773	20	2	2025-08-10 10:24:56	2025-09-03 18:11:47	\N
31	833658.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/bc17adb6-07a1-3cb1-a2ba-02344cd242fe	0-3D517	4	1	2025-08-30 11:54:50	2025-09-03 18:11:47	\N
32	823171.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/235e0df9-b5ab-3743-b169-8fcd51638b8d	9-9M131	2	2	2024-12-16 07:52:20	2025-09-03 18:11:47	\N
33	521807.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/a738a078-2bf5-3f1d-8ad0-838e52f1201b	4-6A477	16	1	2024-11-18 21:56:47	2025-09-03 18:11:47	\N
34	582728.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/439c6267-129f-3a7b-8bbf-f7714f76250f	2-8X265	5	2	2025-05-16 01:19:48	2025-09-03 18:11:47	\N
35	635518.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/1980f17c-cd40-3e8a-a54f-82743d23d2a5	2-2E358	21	3	2025-08-08 16:50:14	2025-09-03 18:11:47	\N
36	647245.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/01f20f07-15a5-3271-9d9e-3e810afb11ee	1-7T831	2	2	2025-02-23 19:33:39	2025-09-03 18:11:47	\N
37	867171.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/83bb4051-2629-3811-bc69-b04c2bef48b8	1-1B620	21	1	2024-11-16 17:39:39	2025-09-03 18:11:47	\N
38	786573.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/670d936a-c063-3ec8-8703-c91d705819be	4-9W119	5	1	2025-02-02 04:13:35	2025-09-03 18:11:47	\N
39	413330.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/bed5615a-915b-3220-a0a7-69172d4a82a6	5-5U513	20	1	2025-07-18 04:44:52	2025-09-03 18:11:47	\N
40	563411.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/fd80008b-8e15-36b9-a2b2-79ddffb7198c	0-0D205	16	3	2024-09-14 10:01:30	2025-09-03 18:11:47	\N
41	942699.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/d3d1b677-aade-3ae5-a770-d2838eb27751	5-5U321	11	1	2025-06-09 03:54:46	2025-09-03 18:11:47	\N
42	507859.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/bff33f38-37ab-3727-84b2-e8ba268bfb5d	1-6J008	14	3	2025-05-28 07:08:27	2025-09-03 18:11:47	\N
43	80330.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/f53e99c8-5dba-3bbe-95f3-c81c5eb0648f	9-3W330	21	3	2024-09-15 18:13:35	2025-09-03 18:11:47	\N
44	541777.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/a4579946-9481-3a11-8ff5-b461e5bcf5e3	0-4Z609	1	3	2024-11-15 07:05:54	2025-09-03 18:11:47	\N
45	741725.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/f57d0146-798c-3686-8301-9a365f43fccf	1-1L973	11	3	2025-05-12 05:54:37	2025-09-03 18:11:47	\N
46	659270.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/3bd0a168-abda-3be8-a076-07574e9d8d1c	4-8M097	19	3	2025-04-13 21:30:51	2025-09-03 18:11:47	\N
47	623632.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/76526501-36ae-38de-9b66-86abd36e42e7	7-2M138	10	2	2025-01-30 10:04:09	2025-09-03 18:11:47	\N
48	623810.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/291a12f9-85b1-3c97-a65c-027f8ef6cdd2	7-1A130	5	3	2025-07-11 00:25:15	2025-09-03 18:11:47	\N
49	331914.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/8e6997f5-8305-3dc5-b63f-4c4ebf7736b2	5-0A311	8	1	2024-09-25 04:52:10	2025-09-03 18:11:47	\N
50	457758.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/aea805c2-4702-3eb5-adf4-563bbf1066ce	4-4V673	12	2	2025-03-17 17:51:04	2025-09-03 18:11:47	\N
51	250352.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/01e79a73-549a-3649-b540-63ec83f162fa	9-2N831	21	1	2025-04-15 01:25:11	2025-09-03 18:11:47	\N
52	982986.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/6fcaf024-f84f-38ce-98f7-db1e0f67b648	1-9G115	14	2	2024-12-14 21:07:54	2025-09-03 18:11:47	\N
53	865320.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/c4e677d4-a252-3cb5-9d9d-4334ce1ff8c2	5-3R409	6	3	2025-01-04 23:15:00	2025-09-03 18:11:47	\N
54	393171.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/02a04e5b-8de6-3144-8fec-c57a58797f17	7-7C322	3	1	2025-03-31 22:40:36	2025-09-03 18:11:47	\N
55	492841.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/6cc3cd29-ec1d-36c6-a2c5-5c30f8c2ce94	6-9A391	6	3	2025-09-02 23:24:33	2025-09-03 18:11:47	\N
56	428225.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/bb6bfab2-d8ac-3ef1-83de-45e74175b6b5	9-6Q611	14	3	2025-05-05 14:34:46	2025-09-03 18:11:47	\N
57	538252.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/9cd8afad-21a1-39f6-a959-f78bd9b62832	8-7E341	20	3	2024-09-16 15:50:04	2025-09-03 18:11:47	\N
58	197554.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/382f2f24-507a-307b-9d91-50b3c898b9de	5-2H222	10	3	2025-04-01 23:15:41	2025-09-03 18:11:47	\N
59	379150.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/9eb2b98b-2096-3b65-ac7a-58fc7abe48f2	6-7L118	7	1	2024-09-24 21:57:14	2025-09-03 18:11:47	\N
60	988889.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/70163c62-f3c1-35d8-87cc-fdc0393635ae	2-4C553	1	3	2024-12-04 21:20:03	2025-09-03 18:11:47	\N
61	738428.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/256fd66a-d3e8-39d9-a9b7-6b973d57c7fb	6-2M874	15	3	2024-11-26 10:56:40	2025-09-03 18:11:47	\N
62	710189.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/27a2ac42-a3ea-329d-94e1-202dec2d6a91	4-2S870	7	1	2025-07-24 10:39:40	2025-09-03 18:11:47	\N
63	177548.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/5cf866d9-04fd-3f46-9ec3-be23c872c853	6-6M129	19	2	2025-02-28 08:17:23	2025-09-03 18:11:47	\N
64	97156.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/eeb77d3a-c3f8-390a-b62c-bb9f00dd6935	7-1A466	21	2	2025-01-08 15:42:34	2025-09-03 18:11:47	\N
65	459972.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/9ef776a8-7110-318d-8213-ac233c036736	7-8G228	4	3	2024-11-06 10:14:03	2025-09-03 18:11:47	\N
66	336336.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/664707e5-670c-3771-8e68-085ecf0b7e9c	7-8G248	21	3	2025-08-16 03:08:36	2025-09-03 18:11:47	\N
67	927071.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/6cfdf6a1-0bde-383f-8abc-50c616860099	0-2H173	8	1	2025-04-22 09:38:15	2025-09-03 18:11:47	\N
68	13122.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/05d4fdeb-f787-30d1-b0fe-e003a99a0853	1-9Y972	1	2	2024-10-21 14:31:29	2025-09-03 18:11:47	\N
69	57409.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/8b2a9468-f065-3bd4-b1c4-8aa63f1696e5	7-3B455	7	1	2025-03-24 05:44:42	2025-09-03 18:11:47	\N
70	772351.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/b3d2a3c7-d07a-3718-9043-66387fc57603	4-8R091	13	3	2025-09-03 11:01:21	2025-09-03 18:11:47	\N
71	712349.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/fe356ff3-9cd1-36dc-9a31-7667127afcb9	8-2M572	19	1	2025-04-10 09:20:27	2025-09-03 18:11:47	\N
72	401582.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/b00c9831-bf55-3aa5-b1aa-0ffb8c71d130	7-1B057	10	2	2024-09-26 03:29:10	2025-09-03 18:11:47	\N
73	558668.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/f557ae6c-706f-3e2f-bc45-f5e6cc16d418	7-2V346	11	2	2024-12-18 22:38:49	2025-09-03 18:11:47	\N
74	589684.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/4efad5a0-be13-3e8a-b120-ea66a7ae225b	9-0Z210	1	1	2025-02-20 00:14:14	2025-09-03 18:11:47	\N
75	976325.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/272e79f5-cb89-32ba-825f-89af402d8ea5	4-6R341	21	2	2025-07-26 07:34:45	2025-09-03 18:11:47	\N
76	571658.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/4ff44ef7-16bb-3c2c-a1bf-86b99889418d	6-6I294	3	2	2025-04-18 17:13:07	2025-09-03 18:11:47	\N
77	262714.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/620ff350-0885-3610-97f2-8ad024aa9f78	7-3B003	8	3	2025-07-12 21:16:00	2025-09-03 18:11:47	\N
78	383098.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/bf759206-fa0f-3943-b9b2-a036a2d54cee	3-1W168	11	1	2025-02-27 00:41:15	2025-09-03 18:11:47	\N
79	348658.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/4c0beb49-0dfb-31e9-9a47-ee30b3be1317	2-1G751	17	3	2024-10-27 15:46:42	2025-09-03 18:11:47	\N
80	794472.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/665ce0c4-ea04-3b58-9107-487e76f43572	5-9P772	10	2	2025-04-13 11:48:53	2025-09-03 18:11:47	\N
81	432133.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/2d61cf39-2187-3ca3-bd4e-3070f7265099	3-5I250	5	3	2025-06-18 22:28:39	2025-09-03 18:11:47	\N
82	44860.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/fe97e9dd-3eaa-3c9b-bb55-0c52626c10b9	8-7O280	9	2	2024-10-03 07:22:15	2025-09-03 18:11:47	\N
83	175456.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/d50780d5-ce91-3963-96c4-3831179683bd	5-1V322	6	2	2025-01-31 22:22:11	2025-09-03 18:11:47	\N
84	451078.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/c3b2d56e-bed0-3d2a-b035-6fba5582dae3	2-1L203	17	1	2025-08-19 13:08:38	2025-09-03 18:11:48	\N
85	204296.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/3f297bf1-033a-3e2b-965f-bcc60fdc1839	8-6E424	21	2	2025-07-20 15:19:40	2025-09-03 18:11:48	\N
86	522446.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/ee1d6296-4d68-3d23-b7b6-9263b4798ef1	9-7W053	16	1	2024-11-27 05:57:58	2025-09-03 18:11:48	\N
87	500709.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/0ed95dd7-b295-3c65-82cd-d373befab5d3	1-7K250	5	2	2024-09-25 18:35:55	2025-09-03 18:11:48	\N
88	540193.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/27019648-96ea-3626-81af-b8e68f20b97e	6-4G044	3	2	2025-06-19 02:12:17	2025-09-03 18:11:48	\N
89	387769.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/280848c6-857c-378e-b6a3-6d76580a25da	0-2C982	1	3	2025-02-03 12:51:28	2025-09-03 18:11:48	\N
90	393012.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/1972feb4-f2c2-3999-9885-dedf597d7d8c	0-6H720	17	2	2025-01-06 10:26:01	2025-09-03 18:11:48	\N
91	876337.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/c91731c3-e31b-391b-a0e5-b6cf3898d297	3-3Q906	10	3	2025-05-05 01:29:48	2025-09-03 18:11:48	\N
92	601824.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/b9af869f-229c-311c-bda3-0f4ea6e66d30	7-7T253	4	3	2024-11-11 22:38:45	2025-09-03 18:11:48	\N
93	975114.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/40874fc6-0299-3c04-8c3a-45059d90da89	6-5N661	15	3	2024-11-30 07:05:32	2025-09-03 18:11:48	\N
94	514698.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/f55772ab-bc8e-3097-802f-a4d477fbc623	6-3R705	11	3	2025-04-14 17:44:41	2025-09-03 18:11:48	\N
95	239391.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/0e3e6218-0b63-3b00-88d3-69580ae2b13d	3-1U433	10	1	2025-04-29 03:58:03	2025-09-03 18:11:48	\N
96	495802.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/97112f8d-8776-3c65-a04d-00b067a25011	4-5H575	11	2	2025-02-06 10:03:46	2025-09-03 18:11:48	\N
97	668331.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/e550dcf2-28d9-32e8-84e2-b2c96b3f2e09	4-3D123	3	3	2025-05-12 07:13:13	2025-09-03 18:11:48	\N
98	645793.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/5e44b7a4-7ca9-31b9-99ab-bcccb325faff	2-3A795	4	2	2025-04-08 14:40:28	2025-09-03 18:11:48	\N
99	788956.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/b62f03db-6400-31de-a00c-768ba01f0874	9-5M088	16	1	2024-12-19 21:07:48	2025-09-03 18:11:48	\N
100	26238.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/de5f2283-d63e-3625-8001-6de1012fa4ce	9-3Q134	15	1	2024-11-14 17:19:37	2025-09-03 18:11:48	\N
101	179992.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/b57db01e-539e-38cd-8a4b-f01fac007c3b	8-5J552	7	3	2025-04-17 16:37:11	2025-09-03 18:11:48	\N
102	216605.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/4adb571f-5b9d-391d-bba6-bbe2dcbddd8f	2-2G554	18	2	2025-03-10 06:47:02	2025-09-03 18:11:48	\N
103	723297.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/734a6e8d-1d2a-3286-9ccb-44af90090e83	4-1H034	16	3	2024-11-27 22:20:25	2025-09-03 18:11:48	\N
104	371325.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/e53a99f6-c375-3e3b-9906-690146f69231	5-0N845	9	1	2024-09-11 17:24:17	2025-09-03 18:11:48	\N
105	610684.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/31a4a339-d6f0-3e07-bc22-db6fb0975430	7-0F632	16	3	2025-04-20 18:01:09	2025-09-03 18:11:48	\N
106	53249.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/81f025e6-cc0a-3d68-b786-d3636e2c71bd	6-4U771	16	2	2025-04-10 07:57:16	2025-09-03 18:11:48	\N
107	704687.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/70d7f522-7fb9-3ebc-9510-a03a4489c7f5	2-3V632	12	1	2024-09-05 12:37:48	2025-09-03 18:11:48	\N
108	90976.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/7a78f54b-56fa-36d8-9f0e-dd88d7708b08	3-0W396	14	3	2024-09-04 09:32:58	2025-09-03 18:11:48	\N
109	585633.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/f1c0b016-5240-3b94-9088-9fbb5585e729	6-0C324	12	3	2025-06-02 22:39:48	2025-09-03 18:11:48	\N
110	11279.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/ecafdcbf-0efd-3d83-832a-7ca935bed792	5-1P367	7	2	2025-08-27 12:44:54	2025-09-03 18:11:48	\N
111	968482.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/b8506417-fcf0-3671-81ae-bbf1fa97547f	7-0B772	17	1	2025-02-08 09:07:37	2025-09-03 18:11:48	\N
112	990829.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/76ea8926-f42b-3dce-ac80-965697e1b559	6-2L044	21	1	2025-02-19 22:15:21	2025-09-03 18:11:48	\N
113	600262.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/17be1bb0-d441-3e3c-8afe-fd077bdc56f9	7-3A950	7	3	2025-05-06 07:04:39	2025-09-03 18:11:48	\N
114	537052.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/c64b793b-1cb9-3756-9684-a57549c53bb9	1-2J401	4	2	2024-12-02 03:07:53	2025-09-03 18:11:48	\N
115	523170.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/5607f3bb-5d84-3fb5-be60-865814d3fce6	4-2E348	1	1	2025-04-04 00:35:01	2025-09-03 18:11:48	\N
116	544270.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/3521bbd4-2f86-3e02-9086-b241242e2488	9-8W387	11	2	2024-09-26 13:56:13	2025-09-03 18:11:48	\N
117	388802.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/94de5f00-15e4-36ca-abd8-57962a4ff6f1	9-6U828	10	2	2025-08-05 19:00:47	2025-09-03 18:11:48	\N
118	657837.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/a3372d8c-1e00-313a-9686-3ae8609723a9	5-6P884	5	1	2025-04-17 14:12:48	2025-09-03 18:11:48	\N
119	964998.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/033a3c19-91bb-317e-8b3d-7887bc6ef0c0	8-3J915	20	2	2025-08-28 22:06:17	2025-09-03 18:11:48	\N
120	665507.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/eac0fd2a-7e85-3ed3-96e9-5621c2e0105a	0-1K805	13	1	2025-01-31 23:57:57	2025-09-03 18:11:48	\N
121	54304.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/16b5b4ec-3f43-3e10-94dc-27dd38e4d3c1	6-8X811	15	1	2025-08-12 21:07:16	2025-09-03 18:11:48	\N
122	718733.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/9ce53c09-f16a-363f-847a-8662ef5beeac	5-8R456	7	2	2024-12-09 12:14:20	2025-09-03 18:11:48	\N
123	202550.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/73f75248-0376-3384-acd0-eb3e53e00b35	4-5J943	2	2	2024-12-14 13:30:11	2025-09-03 18:11:48	\N
124	137061.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/d7668dce-bc87-36b4-9939-8119d0081a7a	9-1S288	11	1	2025-01-31 09:19:36	2025-09-03 18:11:48	\N
125	477351.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/1961a50a-3aa6-35d5-960f-59df7315256e	9-6D687	9	3	2025-01-30 11:23:21	2025-09-03 18:11:48	\N
126	492231.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/c3ac9212-8957-3028-a857-032ed20b82e8	6-9R489	16	1	2024-09-05 11:12:28	2025-09-03 18:11:48	\N
127	444596.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/e486c383-c775-32f2-8225-11dd9339af1d	3-1V401	14	3	2025-06-12 08:07:05	2025-09-03 18:11:48	\N
128	376172.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/76f2eab1-80b4-3739-aa3b-d755ca620070	1-5G403	17	2	2025-05-18 17:59:52	2025-09-03 18:11:48	\N
129	384849.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/1b8f6765-082a-3318-9581-a9179df97e5e	6-0Y781	8	1	2024-10-24 16:14:37	2025-09-03 18:11:48	\N
130	453623.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/b63c9ac5-cb9e-3c1a-bb06-84f371b63338	0-6V231	2	1	2025-04-08 20:05:13	2025-09-03 18:11:48	\N
131	741097.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/ed4d03f1-fd6b-3290-9f2a-8cb6939151d9	9-4Y908	13	3	2025-06-22 01:58:04	2025-09-03 18:11:48	\N
132	905903.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/e2b556d8-1883-3d0a-9a5f-b1d016272ba1	7-5O619	16	3	2024-12-15 11:11:03	2025-09-03 18:11:48	\N
133	957327.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/e15a6c95-7464-3b0e-ae9b-d4ef8e9492fa	7-0K063	21	1	2025-01-28 05:23:33	2025-09-03 18:11:48	\N
134	841698.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/d6d9bf9b-9b63-3fd1-9eeb-68f3218cc309	1-4E289	4	3	2025-06-23 03:06:30	2025-09-03 18:11:48	\N
135	989392.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/c2a256fd-9d0b-3dcf-b65e-1fc48c0b5fbc	4-2S386	21	2	2025-08-30 00:21:45	2025-09-03 18:11:48	\N
136	906159.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/61849e06-8db5-3a3a-b86a-e179702a2be2	0-5J006	11	3	2025-08-26 04:52:43	2025-09-03 18:11:48	\N
137	781653.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/a2ddfacd-1497-363d-9964-c27a33a9c089	8-5N006	1	3	2025-06-24 05:41:31	2025-09-03 18:11:48	\N
138	816081.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/d2c04114-8717-396e-8b03-26e3379e812b	5-1V437	1	1	2025-02-07 04:25:18	2025-09-03 18:11:48	\N
139	373342.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/12b89924-2b25-3bad-9c44-9ed27611cb14	5-2D447	18	1	2024-10-02 03:33:42	2025-09-03 18:11:48	\N
140	919818.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/0edeb867-b544-31f2-a5ac-46085566d32e	5-7J825	20	1	2024-12-01 15:00:02	2025-09-03 18:11:48	\N
141	71172.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/f4213f22-11b3-3638-ae87-7c0c8e146120	6-4H160	5	1	2025-03-04 01:50:53	2025-09-03 18:11:48	\N
142	146496.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/460124c8-fe61-31e4-9d2a-ba1aaf8a06f6	3-2A724	12	3	2024-09-13 19:48:12	2025-09-03 18:11:48	\N
143	458036.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/c5b67357-c38e-338c-97b5-eafb381ea733	9-8M347	8	1	2025-04-30 22:20:25	2025-09-03 18:11:48	\N
144	814803.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/51dc20ec-85c6-3dbd-9047-29b2bd0afe45	1-4X717	12	3	2025-03-17 04:49:54	2025-09-03 18:11:48	\N
145	793439.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/38546619-1177-37c9-a433-b112203fa01b	6-7K586	2	1	2024-09-12 05:00:20	2025-09-03 18:11:48	\N
146	250900.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/50fbb6e6-c12d-3441-9802-3ce14a98da1c	4-9N948	12	1	2024-11-01 15:09:38	2025-09-03 18:11:48	\N
147	638408.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/2fc183d9-2113-39af-a405-90414adf1d9e	2-1B625	4	3	2024-10-17 00:31:45	2025-09-03 18:11:48	\N
148	732075.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/acb6e159-4321-3567-ae19-a562600bdd29	3-9W105	14	2	2024-12-31 17:11:43	2025-09-03 18:11:48	\N
149	685178.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/4d5df936-6fb1-3bc8-b217-ef9d59a40164	7-1I513	2	2	2024-09-22 06:14:55	2025-09-03 18:11:48	\N
150	729397.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/6b0aa235-6e92-3389-ade0-6d427cf22825	7-8U461	11	2	2025-01-05 10:16:01	2025-09-03 18:11:48	\N
151	72410.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/0ea5efbc-b9ed-348a-b8b7-838f77cc0099	7-0K515	4	3	2025-05-17 00:45:19	2025-09-03 18:11:48	\N
152	982604.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/3708a70a-33dc-3c28-8f19-58c404002097	8-7E398	21	3	2025-08-10 09:44:30	2025-09-03 18:11:48	\N
153	970338.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/57935c70-205c-3c1a-9731-0bd028c81275	1-0O706	11	3	2024-11-08 11:26:11	2025-09-03 18:11:48	\N
154	946149.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/6c0f5dbc-68d2-3be2-9b5f-60c8ccf8e3a9	3-1N116	7	2	2025-03-23 17:01:24	2025-09-03 18:11:48	\N
155	864370.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/1c5a9020-f8ae-3f6b-8edc-f6c39f933086	6-7L932	13	2	2024-10-06 16:45:15	2025-09-03 18:11:48	\N
156	144250.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/45cce35b-3b38-34d7-bcfb-99b8b6d9fe11	1-3L039	16	1	2025-04-08 12:10:12	2025-09-03 18:11:48	\N
157	705802.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/197183d6-7f80-358c-aa1d-230b98668055	5-6P495	9	1	2025-04-14 14:19:32	2025-09-03 18:11:48	\N
158	646183.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/0cac7fe2-b256-3d18-8f9c-843f699397a2	4-0K118	8	3	2025-07-02 08:20:52	2025-09-03 18:11:48	\N
159	401442.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/1a07216b-3fa1-34bb-8ae3-5f2fbb9cdd49	3-1P084	15	1	2025-06-06 22:26:30	2025-09-03 18:11:48	\N
160	699853.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/c0b67a53-65e9-3613-9f46-6b77f16ea913	9-7N058	4	2	2025-01-26 10:23:57	2025-09-03 18:11:48	\N
161	733266.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/ef19523e-03bb-300b-ace9-43306927b917	3-5Q738	2	2	2024-12-12 07:47:33	2025-09-03 18:11:48	\N
162	685410.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/aaf183d1-f47c-3de9-b0fc-5868353bdbcd	7-0L028	15	1	2024-12-09 11:19:49	2025-09-03 18:11:48	\N
163	729338.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/1bdcd05c-b005-3982-b2c5-95f56475c614	3-2E588	2	2	2025-01-17 00:07:15	2025-09-03 18:11:48	\N
164	235623.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/96ae59fc-7bf1-3c51-9e50-68ab84abb104	1-3S473	2	1	2025-07-22 17:21:00	2025-09-03 18:11:48	\N
165	448573.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/76a43bec-8053-34bf-8ce5-c159882399a9	7-8P037	8	2	2025-05-20 10:23:36	2025-09-03 18:11:48	\N
166	704680.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/2ac41066-dfe3-3350-becd-7708903cfc6d	4-3L946	10	3	2025-03-25 07:01:58	2025-09-03 18:11:48	\N
167	672745.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/3eb7745e-4f2d-3308-bbe9-418b59426737	9-4S020	11	2	2024-09-14 12:37:13	2025-09-03 18:11:48	\N
168	767200.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/eee50133-4983-36ec-b4ae-e74e033fec22	0-6X821	18	3	2025-05-08 22:49:09	2025-09-03 18:11:48	\N
169	827472.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/2358e032-7a20-3e9a-97f5-316894cc32ea	5-5D548	2	1	2025-01-26 19:05:51	2025-09-03 18:11:48	\N
170	833097.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/a5089952-d53a-342b-9762-13b657ec7f31	4-0W901	9	3	2025-08-14 12:52:05	2025-09-03 18:11:48	\N
171	469173.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/cdf8aaec-2d1c-3ec4-9ca7-2b2891fa2d3c	0-4D868	2	1	2024-09-13 18:32:21	2025-09-03 18:11:48	\N
172	164182.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/607e4f16-2d9f-3970-9d04-f93ea0dfb21e	8-5V502	6	1	2024-11-03 15:57:47	2025-09-03 18:11:48	\N
173	188645.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/354ea663-515a-324c-a6ee-e1500f9c0301	6-7F357	15	3	2025-01-15 16:42:50	2025-09-03 18:11:48	\N
174	110336.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/d2edd1cc-b008-3880-aa78-7c0cf7e99142	7-7C933	15	3	2025-03-03 17:58:53	2025-09-03 18:11:48	\N
175	443908.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/c03b1dee-75f3-3600-944c-a301ed4a4cd1	8-6J634	10	1	2024-11-10 14:59:09	2025-09-03 18:11:48	\N
176	128049.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/7765510c-0e30-3094-9c43-932a6821f468	1-6W473	5	2	2025-05-20 02:37:59	2025-09-03 18:11:48	\N
177	851017.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/85afbf55-831a-38eb-99f9-65e6f39cc6d9	3-0E375	3	3	2025-07-18 15:53:31	2025-09-03 18:11:48	\N
178	140255.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/20a8b909-a946-32c6-8732-7fc2fb1cb46c	7-6G020	17	1	2024-09-07 13:54:17	2025-09-03 18:11:48	\N
179	534583.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/f2bf5647-efca-3515-901e-e8f638b25966	1-8K030	2	2	2024-10-05 14:46:15	2025-09-03 18:11:48	\N
180	52870.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/fd139c3a-0f9a-3982-a4e0-5fed23a2fd45	3-9M076	19	2	2024-12-25 07:53:49	2025-09-03 18:11:48	\N
181	722973.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/20f891b6-987b-3814-8efe-320e1e9a79b1	2-4C326	16	2	2025-05-29 16:43:57	2025-09-03 18:11:48	\N
182	473601.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/f018ff87-a237-372b-b9c4-14de442a51d1	8-5Q044	20	3	2025-07-22 15:40:22	2025-09-03 18:11:48	\N
183	760636.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/260ec775-0623-35c3-91ec-5b4980ed8b8c	0-4L795	1	3	2025-07-17 14:35:58	2025-09-03 18:11:48	\N
184	191388.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/bcc2fc5d-19f6-342c-a3c9-99cb999ccd93	9-9U324	15	1	2025-04-10 07:47:12	2025-09-03 18:11:48	\N
185	196275.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/ee880189-fc11-35bd-9efa-65386fc885c7	9-7V478	7	1	2024-10-14 04:58:50	2025-09-03 18:11:48	\N
186	468878.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/5a63209b-459f-3995-adda-c7413dfd1023	3-8U391	19	2	2024-10-25 10:24:43	2025-09-03 18:11:48	\N
187	129133.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/03035137-2de1-3f1e-9c38-65148fc5584d	2-1Z352	19	3	2025-07-04 14:25:29	2025-09-03 18:11:48	\N
188	434398.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/a7169f2e-d5af-35bf-9b66-a48fdf23edda	3-3C694	11	2	2025-08-09 03:10:50	2025-09-03 18:11:48	\N
189	882954.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/6fd8d33a-d2c9-34e3-a20b-2da8b3e5e27c	3-6F976	19	1	2025-03-02 22:37:13	2025-09-03 18:11:48	\N
190	544035.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/72a1a786-0737-3720-9a35-efdda4200c39	6-4D729	4	3	2025-06-20 04:05:39	2025-09-03 18:11:49	\N
191	223650.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/b06e9990-adff-3cab-ae6d-8f4d62cbccd4	9-3F575	19	3	2025-05-24 19:10:37	2025-09-03 18:11:49	\N
192	839198.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/33750261-4059-30e6-9686-2c09551abbc9	8-8O147	19	1	2024-11-13 17:03:03	2025-09-03 18:11:49	\N
193	591605.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/129e0577-4b68-3dec-ae1a-70c0aa23deef	8-6X000	4	1	2025-08-15 07:52:59	2025-09-03 18:11:49	\N
194	721254.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/a2910cf8-e757-31dc-95ba-cdf09388b414	3-1I786	10	3	2024-12-04 20:40:31	2025-09-03 18:11:49	\N
195	451573.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/6e6fff65-7026-36e4-8d29-12aa82f13d69	3-2A005	18	1	2025-03-13 16:04:13	2025-09-03 18:11:49	\N
196	668091.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/d91e6147-065f-3125-86db-12db9cf88dd6	9-6P052	1	1	2024-10-17 04:01:56	2025-09-03 18:11:49	\N
197	800412.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/bc16f51f-115c-34aa-90ae-b5323e66d7b0	9-5Y762	19	3	2025-06-25 23:51:06	2025-09-03 18:11:49	\N
198	214848.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/1acf50d2-47df-3ef8-8d20-17d611b08e48	2-1U970	11	2	2024-09-12 17:28:05	2025-09-03 18:11:49	\N
199	866972.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/7681e591-5e36-3869-8c15-32935d316327	4-2Z335	3	1	2025-07-10 23:44:00	2025-09-03 18:11:49	\N
200	864525.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/1cf9a113-0271-351a-acc3-a93b105ae1f4	4-0G117	9	2	2025-04-15 19:31:59	2025-09-03 18:11:49	\N
201	676836.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/672e48eb-3907-3a9f-9299-696984646b52	4-2Y511	12	2	2025-08-08 02:57:01	2025-09-03 18:11:49	\N
202	906550.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/368488a0-379a-3c53-833c-1ff6aa84494d	0-1X874	16	3	2025-01-24 17:11:07	2025-09-03 18:11:49	\N
203	543994.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/52e0b959-5baa-3b97-947b-5d0067efbfc9	5-2L065	17	3	2025-01-17 05:37:37	2025-09-03 18:11:49	\N
204	274142.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/9ca7fee1-4705-38b9-a0ba-6f16ec2434ab	3-1P061	10	2	2024-12-08 01:23:36	2025-09-03 18:11:49	\N
205	906830.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/0e2e3135-3759-3411-9946-c05ae4aaf782	8-0E068	10	3	2025-01-12 00:13:20	2025-09-03 18:11:49	\N
206	181766.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/f0b7e564-22e6-35a9-864e-64a70fc1b25a	6-4J203	11	1	2024-10-15 11:13:54	2025-09-03 18:11:49	\N
207	959305.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/a2246f0e-dc03-3e4e-b0c8-6358387e309a	8-0B352	12	1	2024-10-29 11:20:40	2025-09-03 18:11:49	\N
208	157015.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/1f5b98cf-602c-30b8-b26b-0142f13e3c45	6-4O543	5	1	2025-02-25 21:40:52	2025-09-03 18:11:49	\N
209	520984.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/b83205a0-2d0a-3e81-9c3e-6ec27e647a1d	7-1M499	15	3	2025-07-16 05:54:14	2025-09-03 18:11:49	\N
210	382173.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/27a8d17a-3e40-3e50-84dd-c59b8f8dc864	4-2I123	8	1	2024-12-08 03:56:33	2025-09-03 18:11:49	\N
211	249452.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/bfee948d-a01e-32d3-881e-6d12d8c00452	3-2T638	20	3	2024-09-19 03:08:49	2025-09-03 18:11:49	\N
212	956253.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/48ca1610-d206-3d0c-8c60-791091eb8aee	2-3R814	5	3	2025-02-06 09:40:18	2025-09-03 18:11:49	\N
213	796660.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/9c83e64d-cd7f-360c-83ae-8c5802a55906	3-1L223	19	3	2024-09-04 12:31:53	2025-09-03 18:11:49	\N
214	574009.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/7d66cd49-d806-3c42-af41-fc7f3e0de772	2-3A903	13	3	2025-07-28 17:34:23	2025-09-03 18:11:49	\N
215	694226.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/1793fbab-8116-32e3-a16c-555db3e32fac	7-5C464	4	3	2024-10-13 14:39:23	2025-09-03 18:11:49	\N
216	571948.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/f2f1c1d0-7ed1-3123-956f-a780eff98274	3-9A582	14	1	2025-03-13 05:50:35	2025-09-03 18:11:49	\N
217	389577.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/d272d5a9-9d78-32e8-8dc6-c23e1742b184	3-8L249	9	3	2025-05-30 16:28:03	2025-09-03 18:11:49	\N
218	397464.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/45abc84b-21d6-3ace-9a28-13028dc4cf75	8-3S997	18	2	2025-05-02 01:04:08	2025-09-03 18:11:49	\N
219	703400.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/a881462b-b6de-3d32-882c-a8264c694d63	8-9X433	13	2	2025-05-01 20:09:05	2025-09-03 18:11:49	\N
220	921922.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/4808046a-187e-3cd0-bef9-1b30d1934abd	4-6M898	10	2	2025-05-28 20:43:32	2025-09-03 18:11:49	\N
221	985682.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/705b3128-0732-309b-bd00-df9b28ceaea8	0-7C222	14	1	2025-09-03 11:04:46	2025-09-03 18:11:49	\N
222	452100.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/727a9832-f84e-3a91-9f94-3efa37c3ea4a	9-0V309	3	3	2025-01-20 20:00:50	2025-09-03 18:11:49	\N
223	875794.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/fc612d27-255a-3567-9e39-263193097bbd	3-0D852	8	1	2025-02-02 08:40:54	2025-09-03 18:11:49	\N
224	94331.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/31051211-0ab5-3497-8fc8-b08d136deb48	5-8S912	18	2	2025-05-04 12:47:25	2025-09-03 18:11:49	\N
225	631162.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/cb798ef6-acc2-3509-9d1b-25b5b62df927	2-9N521	18	1	2025-07-09 04:12:46	2025-09-03 18:11:49	\N
226	888322.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/cd1bc205-81cc-3726-885e-5796ed05cb3f	9-1T313	10	1	2025-04-01 11:50:12	2025-09-03 18:11:49	\N
227	42598.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/ca4a60a8-1420-3822-ab46-6118e7a66eff	4-2K600	5	3	2025-06-20 04:19:01	2025-09-03 18:11:49	\N
228	600153.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/f30d97f2-881a-3301-a644-e1784cb3b6d8	6-4P342	9	2	2025-07-24 21:38:38	2025-09-03 18:11:49	\N
229	390390.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/9948bb9b-38b8-314c-8d64-01398af9d77b	8-2K641	8	3	2025-05-25 03:08:33	2025-09-03 18:11:49	\N
230	67023.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/2e29e0c2-6528-3e06-be7f-35b6ac368672	5-5I280	13	2	2024-11-12 16:13:41	2025-09-03 18:11:49	\N
231	580899.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/ef4297f8-cd96-397a-90cf-1a54791f3954	0-4F840	13	1	2025-06-17 07:10:39	2025-09-03 18:11:49	\N
232	521345.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/7e63929c-6c3e-3177-b153-52bcb49ddac1	8-0Y105	12	1	2025-08-05 05:45:31	2025-09-03 18:11:49	\N
233	466195.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/b02221ab-aeb9-34d5-81ef-0d74ea53c483	9-8O339	20	2	2025-04-20 06:23:15	2025-09-03 18:11:49	\N
234	630417.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/28224f7c-5631-31a6-bb79-50e01e0e8d48	8-4I507	3	1	2025-03-23 12:11:23	2025-09-03 18:11:49	\N
235	674148.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/80a7146c-7f06-3dc0-98cb-58523a560ba4	7-1M287	4	3	2025-05-15 18:54:51	2025-09-03 18:11:49	\N
236	441458.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/67b6d2ac-8037-3a09-a188-a79c94f2282f	2-4M564	3	1	2024-09-25 18:39:59	2025-09-03 18:11:49	\N
237	589638.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/f2a399dc-cfab-3d0e-8d15-bdc7921af3ff	9-3J814	2	2	2025-06-17 07:43:55	2025-09-03 18:11:49	\N
238	812653.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/fa9cadb2-4b3e-36e1-bfa7-7ffeba943639	5-8K121	16	1	2024-09-08 08:37:30	2025-09-03 18:11:49	\N
239	730712.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/8827b35a-25b3-33b8-83f5-765f9a10a058	6-6G401	7	3	2025-07-19 07:37:21	2025-09-03 18:11:49	\N
240	590126.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/112d825c-56c8-3bca-9ecc-d3be9b147a34	0-3X450	19	2	2025-06-23 11:21:43	2025-09-03 18:11:49	\N
241	774134.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/e8778612-0a4d-3e01-aee2-ae100122add0	1-4W161	16	3	2024-10-15 23:14:24	2025-09-03 18:11:49	\N
242	745794.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/af0c915c-8c53-32b6-8357-f4645d9ad0b9	0-9X713	17	1	2025-03-13 09:23:53	2025-09-03 18:11:49	\N
243	691598.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/e53ddc4b-f574-35c4-80b9-a12d15249a50	1-0Z981	19	2	2024-09-06 05:20:45	2025-09-03 18:11:49	\N
244	274548.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/c48753ef-47aa-319e-bd8f-0451799a08f9	2-2T561	17	2	2025-01-06 16:39:29	2025-09-03 18:11:49	\N
245	759214.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/f484e9e9-848d-3c0f-8cba-a9e739a471c6	5-5N293	13	2	2025-05-07 23:14:41	2025-09-03 18:11:49	\N
246	196603.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/2d132b01-b09c-3729-a9f8-c7a9e7aedf08	4-6V770	17	1	2024-10-05 16:16:04	2025-09-03 18:11:49	\N
247	233965.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/c75e7517-1015-3d94-bf18-f63801d47f4e	7-5N032	15	1	2025-05-18 09:33:03	2025-09-03 18:11:49	\N
248	454825.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/0329165f-eb44-3b17-82c0-6808d5da5ed0	9-5L037	21	2	2025-03-14 19:20:12	2025-09-03 18:11:49	\N
249	728900.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/5da5d40b-c430-308b-aa77-15d43c93f496	5-2W599	9	2	2025-03-03 16:32:38	2025-09-03 18:11:49	\N
250	157103.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/f18ccdc6-ee85-3b96-833a-e537a4ca81bf	7-0W168	12	3	2025-05-19 17:15:57	2025-09-03 18:11:49	\N
251	414666.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/871e4f85-6a45-3061-b695-1f188a343fa4	0-0L776	17	3	2024-11-21 22:04:32	2025-09-03 18:11:49	\N
252	607582.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/a456a4f2-57e8-3077-acb3-17bcd3164d4a	3-2M570	14	2	2024-12-03 14:43:52	2025-09-03 18:11:49	\N
253	339098.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/8ab77a47-d623-366c-aabe-edf78d6bc27a	9-5K955	4	3	2025-08-19 04:33:49	2025-09-03 18:11:49	\N
254	53526.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/827cd15f-93b8-36df-b2e4-f28538e110df	0-3L990	18	3	2024-11-15 07:58:00	2025-09-03 18:11:49	\N
255	51779.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/99af93a4-55c2-3dca-9158-eccc5a0de79e	1-9M036	7	2	2024-12-28 19:15:49	2025-09-03 18:11:49	\N
256	321146.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/efb106e2-1e44-3970-b6d1-a7d09eb63002	8-6D797	9	3	2025-04-04 02:20:31	2025-09-03 18:11:49	\N
257	642809.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/909b8588-34bc-318e-9255-8f2235d5138f	4-5B144	3	1	2025-06-20 16:56:53	2025-09-03 18:11:49	\N
258	959717.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/22f95af1-320f-30fd-a368-79e62f74fd92	6-3O855	16	2	2025-03-14 16:06:16	2025-09-03 18:11:49	\N
259	802508.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/af146771-a863-3208-80db-9d7593727893	2-9B807	21	1	2025-08-05 03:38:45	2025-09-03 18:11:49	\N
260	547789.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/f62571e7-f6d5-34d7-9af8-615e83bcba86	3-7X265	6	3	2024-11-01 04:04:32	2025-09-03 18:11:49	\N
261	395052.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/0808e0b1-09f1-32c8-8c09-8c299b98e8e4	9-6Y876	15	3	2024-10-30 05:59:20	2025-09-03 18:11:49	\N
262	883437.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/4a807722-11d9-3a9c-9b65-2f19b7337a8d	5-6S787	20	3	2025-04-16 07:45:12	2025-09-03 18:11:49	\N
263	624301.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/c009ba5d-7f07-3bd2-aa84-7da01ef90a47	6-2I636	15	3	2025-05-09 16:52:04	2025-09-03 18:11:49	\N
264	337530.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/e3632c2a-79a1-3f5a-9480-9e0c7c410549	0-5C025	15	2	2025-08-28 00:05:46	2025-09-03 18:11:49	\N
265	821000.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/3b62e9de-3550-344e-9e8b-4b0b31ca958a	2-3U744	15	3	2025-03-19 20:33:31	2025-09-03 18:11:49	\N
266	782784.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/75ee1eb7-ce94-3604-aaed-bfbdc2d11964	9-8M494	11	3	2024-09-09 00:05:07	2025-09-03 18:11:49	\N
267	679456.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/065c30fd-3655-3cb4-b8d6-ec89b8bc8332	5-1E286	17	2	2025-03-12 04:02:51	2025-09-03 18:11:49	\N
268	770038.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/2ff7c6ab-d045-316b-922c-d6d2abe6edc4	0-9C663	4	3	2024-09-26 14:41:39	2025-09-03 18:11:49	\N
269	605730.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/ee850bd5-b85a-3db0-84b9-bd334f9bae40	9-5U293	15	1	2025-01-03 00:23:51	2025-09-03 18:11:49	\N
270	123699.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/9b873cd5-ba47-35e9-9883-0df1d9530468	1-0V545	16	1	2025-01-19 07:25:43	2025-09-03 18:11:49	\N
271	694515.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/841ff922-0f2e-39ef-930b-021ac9eb23f3	2-4W360	6	2	2024-11-29 13:15:05	2025-09-03 18:11:49	\N
272	928046.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/322f77d0-1b45-33f8-8588-85416206bf0d	5-2W292	3	3	2025-04-27 03:02:48	2025-09-03 18:11:49	\N
273	957811.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/17931099-b808-396e-a726-b861ab049a8f	1-0P445	14	2	2024-09-10 00:01:25	2025-09-03 18:11:49	\N
274	576630.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/7bb9eadb-3733-3c92-a1ef-b5ca14f56011	8-8F776	14	3	2025-01-07 09:28:45	2025-09-03 18:11:49	\N
275	992645.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/afff08ac-3c50-3caa-8f0f-815715d5c645	6-0Q100	15	2	2024-11-18 11:14:02	2025-09-03 18:11:49	\N
276	65032.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/a5cf125e-5821-3915-b3cb-09f1aa2e2ec7	4-9I361	8	1	2024-09-28 14:46:58	2025-09-03 18:11:49	\N
277	408153.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/45c55e0b-7b9c-35c5-9619-b4a86f8ba7ae	8-2R691	2	2	2025-01-22 19:54:52	2025-09-03 18:11:49	\N
278	370543.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/714e3ccd-bf0b-39b6-b2fd-15e2dac250cc	5-9H531	19	1	2025-07-12 16:04:26	2025-09-03 18:11:49	\N
279	836656.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/7f9a4efb-d0bb-301a-a095-02613cafa9fd	4-7C496	6	2	2025-01-03 04:46:31	2025-09-03 18:11:49	\N
280	127446.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/8eae27c0-b400-31eb-8442-05bc6abf91b0	5-8H706	12	2	2024-09-26 06:51:47	2025-09-03 18:11:49	\N
281	976630.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/14772141-f210-3a06-89cd-57b3c4c34fe0	7-3G550	9	1	2025-02-05 09:26:51	2025-09-03 18:11:49	\N
282	899912.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/2c4791e6-486a-3a13-919b-8ef7190958ea	8-0U870	17	1	2024-09-11 20:10:45	2025-09-03 18:11:49	\N
283	750195.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/a357ebe9-7a41-344e-9d38-ed90bd8bdfa1	0-7K332	14	1	2024-11-18 13:39:32	2025-09-03 18:11:49	\N
284	38771.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/52b73c42-7483-3a9b-a592-001333b13c15	8-4N365	6	3	2024-09-27 02:27:58	2025-09-03 18:11:49	\N
285	970507.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/afeb2ec9-b9ec-359d-a335-db7240bcbcdd	1-3L124	8	2	2025-05-11 20:53:14	2025-09-03 18:11:49	\N
286	854058.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/0e4822bd-0a6b-31dc-9720-5a989d9c8491	9-7D547	12	2	2025-03-01 19:05:02	2025-09-03 18:11:49	\N
287	285926.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/62642ff9-e2a5-318a-93fb-b23be6e9972f	0-1M061	4	1	2025-08-25 02:26:46	2025-09-03 18:11:49	\N
288	322241.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/a9541a42-7ca4-3293-bea7-4290da54dcb1	2-1J018	1	3	2024-10-12 06:41:57	2025-09-03 18:11:49	\N
289	756641.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/d64d0905-54ad-36f3-8b33-9091ce80e237	2-8G291	3	3	2024-10-18 10:51:54	2025-09-03 18:11:49	\N
290	624750.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/15004adf-fabd-349e-92fa-dcce45937087	2-2H319	6	1	2025-09-03 15:51:31	2025-09-03 18:11:49	\N
291	643226.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/7e76dde0-83a1-3727-8677-4f37d949aa47	4-7Q273	8	1	2024-09-18 19:58:46	2025-09-03 18:11:49	\N
292	506429.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/0f07b668-53c3-361d-a47a-115611dc15c6	8-2Y967	11	2	2025-04-09 23:46:53	2025-09-03 18:11:49	\N
293	209168.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/c3e98c61-ab4d-39de-a651-d649bd6e04bf	6-8V202	3	2	2025-09-01 21:14:37	2025-09-03 18:11:49	\N
294	740091.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/5c61437a-c7ef-35c6-aa20-7cc880fc35da	3-5B160	17	1	2025-03-14 18:54:28	2025-09-03 18:11:49	\N
295	390485.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/d229c8d1-0ed9-359d-8b95-c0fc203b97c4	2-4N884	16	1	2025-04-06 23:44:50	2025-09-03 18:11:49	\N
296	560205.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/00642a4b-bf0d-35cf-8f3e-d3af0bbddf04	9-5V474	6	2	2025-05-31 14:57:37	2025-09-03 18:11:49	\N
297	129168.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/81f3d3ce-1a0c-3101-9668-a33b8e08351f	7-5L947	11	3	2025-01-16 11:08:02	2025-09-03 18:11:49	\N
298	531183.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/375eeded-8153-3539-9410-349a29f480e0	5-7Z284	2	1	2025-05-04 21:38:25	2025-09-03 18:11:49	\N
299	247664.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/964bdaa7-9c5f-365a-88a2-023ad0c16361	9-3N966	5	1	2025-05-02 09:23:03	2025-09-03 18:11:49	\N
300	749447.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/a0029e5b-2a1d-3daa-b8bd-b73bb99ddb3e	9-1B296	11	1	2024-11-05 23:57:58	2025-09-03 18:11:49	\N
301	527018.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/8d81886e-1528-3d9c-a25f-49b7e5b0cf3b	0-8Y399	14	1	2025-05-15 01:41:41	2025-09-03 18:11:50	\N
302	277781.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/608744fe-5f97-366a-9adf-29d0254b2b6a	6-8V458	19	2	2024-10-21 07:18:05	2025-09-03 18:11:50	\N
303	294951.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/02c03007-3a2b-34b3-b756-034c5b73c2d7	8-8E543	10	2	2025-07-05 17:37:20	2025-09-03 18:11:50	\N
304	875632.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/752f6538-3b70-3c74-a0c9-e2f24e9dd10f	6-3P736	17	2	2024-10-20 13:45:29	2025-09-03 18:11:50	\N
305	755292.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/1cd5e822-fdee-3951-8421-3f7422270973	4-5F244	19	2	2025-05-21 15:12:58	2025-09-03 18:11:50	\N
306	765826.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/ce40a0f4-90cc-377d-a79a-6626d8c071d8	7-2Q893	16	3	2024-11-28 12:09:40	2025-09-03 18:11:50	\N
307	303259.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/58801278-246a-3e1f-812e-f3e02113f6b3	5-1H996	15	3	2024-12-26 07:47:23	2025-09-03 18:11:50	\N
308	547951.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/1194e2f9-0ee1-3467-b258-a398d4cfced4	3-7R516	19	1	2025-04-14 02:07:54	2025-09-03 18:11:50	\N
309	245770.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/43c03e7f-60f9-355c-b801-297b5400614f	5-1Y207	18	2	2025-03-31 20:21:03	2025-09-03 18:11:50	\N
310	814862.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/2abf35ef-7ff4-3277-bcb2-c38106cce28a	4-9T265	20	2	2025-02-22 01:40:51	2025-09-03 18:11:50	\N
311	124211.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/8f7563a9-4c02-3f11-95a3-2967b2aa694b	5-8D569	6	2	2024-10-05 22:05:39	2025-09-03 18:11:50	\N
312	499617.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/abda0f24-e76b-3718-b943-530c7f9ce02e	8-6R711	15	1	2025-04-10 01:59:14	2025-09-03 18:11:50	\N
313	763309.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/08ddfe0d-a6ad-3591-ba83-9961bb8dc384	5-3K699	1	3	2024-10-16 20:18:38	2025-09-03 18:11:50	\N
314	590600.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/a295da8c-c3b5-3bc6-9f81-2b51f7f191ad	2-8G419	4	2	2025-07-02 04:50:20	2025-09-03 18:11:50	\N
315	546606.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/f53925cd-f1c1-30d3-a0e6-ca1843bc89f2	5-0G436	7	3	2025-03-14 03:15:59	2025-09-03 18:11:50	\N
316	713693.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/1ce59f30-d143-38aa-bf39-915fe9e62fde	9-0M895	15	3	2025-02-18 13:39:22	2025-09-03 18:11:50	\N
317	487560.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/4394df14-1790-35a9-b092-ec0bfec5540b	5-6V394	12	2	2025-06-10 10:31:00	2025-09-03 18:11:50	\N
318	831821.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/1a050fd1-fb8d-36f1-91f6-f5b4c4759dc5	5-0N754	10	1	2025-06-09 17:42:17	2025-09-03 18:11:50	\N
319	683822.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/bdd23351-0fd9-3a27-a4c1-ae8669e148ff	7-5W054	12	3	2024-12-09 05:38:49	2025-09-03 18:11:50	\N
320	535286.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/2718e71f-c314-31fa-8558-8a0f6a022695	5-5Q966	12	1	2025-05-15 19:10:59	2025-09-03 18:11:50	\N
321	549193.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/5d387e18-89b3-3a20-886b-dde96ddfda54	2-4Q256	17	3	2025-06-11 15:54:03	2025-09-03 18:11:50	\N
322	419309.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/f8dc534d-57ab-313e-9a9a-6b46e8a7848d	6-9J251	3	2	2025-04-17 04:52:33	2025-09-03 18:11:50	\N
323	558502.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/99614412-03fb-3ee6-b933-f1eab12d71fb	8-3U327	19	2	2025-07-21 04:09:23	2025-09-03 18:11:50	\N
324	83239.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/5fc68c61-498f-30ee-80aa-d840470acbc2	9-5O727	8	1	2025-04-30 06:54:22	2025-09-03 18:11:50	\N
325	524012.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/5cbabf15-4d02-366e-9a68-0db0ebbef33e	3-8C447	19	2	2024-11-04 05:40:30	2025-09-03 18:11:50	\N
326	282993.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/6a97790e-d6c7-31df-b2e4-7e5d1c3a09e1	1-5H583	6	1	2025-08-02 20:09:03	2025-09-03 18:11:50	\N
327	904017.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/72bf84cd-0ebb-3a9d-b89f-c9805bd4a7c1	1-5Z054	12	2	2025-06-20 18:19:11	2025-09-03 18:11:50	\N
328	183365.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/ce7912fb-e131-3599-af09-03368ce9a6e5	2-8E900	17	2	2025-05-18 06:52:43	2025-09-03 18:11:50	\N
329	565955.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/f8fa9284-8e91-3572-9ac4-1063febb23d4	0-2R511	6	1	2025-02-12 10:35:25	2025-09-03 18:11:50	\N
330	663206.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/b177ca5c-10dc-3dba-af27-78ec9dc1bf11	2-5X218	8	2	2025-05-03 05:57:31	2025-09-03 18:11:50	\N
331	473012.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/d60c171a-e542-398b-8358-929fd49f26d7	3-0Q735	1	2	2025-01-28 07:59:48	2025-09-03 18:11:50	\N
332	783852.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/d0450836-81af-3c71-b211-21c9b291291e	8-3D899	7	2	2024-10-06 21:02:01	2025-09-03 18:11:50	\N
333	335671.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/279fdd57-22c0-3359-8341-925800cb2106	1-4C082	7	2	2025-01-09 21:48:34	2025-09-03 18:11:50	\N
334	784958.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/b349eb48-5ea3-3e5f-b22d-f2dda866c72c	3-6J606	2	2	2024-09-27 09:58:36	2025-09-03 18:11:50	\N
335	607153.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/dfeedd9c-16a2-3321-b51c-9ab0d17a8402	3-9Q889	1	2	2025-01-28 15:50:11	2025-09-03 18:11:50	\N
336	921529.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/d21afb75-cf7e-3393-af94-836cde93f6dd	9-7X975	13	2	2025-03-26 19:34:19	2025-09-03 18:11:50	\N
337	566363.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/baa80e1e-916f-3e5f-ab2c-25f3c77fcf38	7-1K557	5	2	2025-08-26 13:35:28	2025-09-03 18:11:50	\N
338	883381.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/c97ebfe2-8f88-3b48-a262-47348b05fc6b	4-6I504	7	3	2025-02-22 01:40:43	2025-09-03 18:11:50	\N
339	780851.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/39004683-683e-34f3-8952-044c330b1e03	2-5R597	12	3	2025-07-26 08:09:00	2025-09-03 18:11:50	\N
340	175127.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/ecbcd215-de47-3a3f-a8bc-73720dbd0261	2-1H468	9	2	2024-12-09 20:49:34	2025-09-03 18:11:50	\N
341	390543.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/405edf97-2276-3b2a-a469-c9800d5920a7	3-7Q475	14	3	2024-12-28 19:40:13	2025-09-03 18:11:50	\N
342	922426.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/5bb87b1f-1f51-326e-acab-5cf5463af255	0-1U634	19	3	2025-02-25 04:21:51	2025-09-03 18:11:50	\N
343	443658.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/08d9588a-421c-3590-a67d-c144e687ba58	2-9J973	18	3	2024-11-02 06:02:47	2025-09-03 18:11:50	\N
344	347994.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/d3ebc488-9005-343a-957c-ba72e8f116f2	8-0A934	5	1	2025-04-05 20:52:43	2025-09-03 18:11:50	\N
345	251005.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/670e5007-9ab9-3463-81ca-08e7eea42c66	7-2T117	21	1	2025-01-08 10:05:02	2025-09-03 18:11:50	\N
346	56028.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/2257e9a9-1125-3559-9f1b-f094d1cd038e	7-8E638	16	2	2025-05-24 20:37:28	2025-09-03 18:11:50	\N
347	865906.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/1437d9a9-4bf1-3e1b-85d9-4ed47cee4e34	2-6B012	14	3	2025-07-15 23:30:26	2025-09-03 18:11:50	\N
348	899121.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/5577070d-4c17-34d2-8b89-b4512f93f972	8-8B034	11	3	2025-06-05 14:24:07	2025-09-03 18:11:50	\N
349	142083.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/b692b35f-b941-3402-81c0-e3da247ab936	2-1J522	9	1	2025-08-11 15:49:05	2025-09-03 18:11:50	\N
350	415559.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/c9fbee3b-8493-365f-8e17-99199637b5af	3-7B557	6	3	2024-11-07 07:02:21	2025-09-03 18:11:50	\N
351	87676.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/8e29a9d0-fbda-33dc-af44-77143b827479	8-7D792	20	1	2025-05-04 21:28:20	2025-09-03 18:11:50	\N
352	834380.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/f2d95a4f-c94a-32ca-a055-fc519eaa14cb	8-5E611	13	1	2025-05-29 06:34:00	2025-09-03 18:11:50	\N
353	625289.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/a8f7b027-37fd-3c2e-9c04-68bc0ec356d7	6-1V701	8	3	2024-10-19 15:52:35	2025-09-03 18:11:50	\N
354	823014.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/d4604890-782a-3b38-a180-08281c25cba2	6-1I257	4	2	2025-03-24 14:04:34	2025-09-03 18:11:50	\N
355	185564.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/db21166e-bd9d-3300-bba2-5c5f3574751a	4-9A384	4	1	2025-03-15 01:04:16	2025-09-03 18:11:50	\N
356	712342.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/d2c2a374-a5e8-36fc-85c5-ebcf8dd8337b	2-3K410	20	2	2025-08-18 17:35:06	2025-09-03 18:11:50	\N
357	700362.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/865512d6-ffcd-3bca-a38b-f1013f42d32b	3-0N233	14	1	2024-10-23 02:24:07	2025-09-03 18:11:50	\N
358	266809.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/58720cef-7a3f-3efe-911d-166e5c9cbaa7	8-5X376	14	1	2025-04-04 09:54:09	2025-09-03 18:11:50	\N
359	911061.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/2097b686-05d4-3e94-be11-f0ffc928ff3c	3-2G399	3	2	2025-02-07 12:25:21	2025-09-03 18:11:50	\N
360	209442.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/8caec371-5d69-3a47-89f9-9660e09d5926	1-9S543	14	3	2025-05-02 03:45:46	2025-09-03 18:11:50	\N
361	970850.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/b59789a4-75f2-37b3-94f2-a7f955f39bc0	4-9A508	19	1	2025-08-12 06:28:38	2025-09-03 18:11:50	\N
362	223927.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/80cfbbc7-df8f-3118-a97c-0316dca95b2b	6-2N790	20	3	2025-05-27 08:31:49	2025-09-03 18:11:50	\N
363	552288.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/31800379-a2a1-32c7-8983-45752926cb95	7-0Z763	1	1	2024-10-21 04:54:04	2025-09-03 18:11:50	\N
364	214929.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/671f9fb5-bffe-3752-a2ac-51859847a15b	1-8V441	12	1	2025-03-11 19:37:21	2025-09-03 18:11:50	\N
365	696427.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/a88217ae-5dc9-35f2-953d-d95e55cdc573	4-6Y409	21	3	2025-04-24 21:53:16	2025-09-03 18:11:50	\N
366	884877.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/5594c46c-5721-3584-ae8f-541fddd04dcb	1-9G658	18	1	2025-07-01 23:44:50	2025-09-03 18:11:50	\N
367	925494.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/12922998-cf1c-30fa-82af-2742e474c333	7-4B507	3	2	2025-02-16 02:19:08	2025-09-03 18:11:50	\N
368	802623.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/1fc83b39-0d4e-3421-83fb-87c96b271edb	5-7Z107	11	2	2025-08-24 07:04:26	2025-09-03 18:11:50	\N
369	798836.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/c923a386-6de3-3895-852d-5ab43e2ace46	7-7K173	6	1	2025-04-08 16:32:45	2025-09-03 18:11:50	\N
370	631486.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/b4463a89-d7b5-362e-946e-2384101186dd	3-5S193	9	3	2025-08-09 07:31:25	2025-09-03 18:11:50	\N
371	920773.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/a2b04556-8b94-31da-81e7-ba9681f86c6e	6-7T628	8	3	2025-07-19 14:38:34	2025-09-03 18:11:51	\N
372	68749.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/faf3b5d6-789a-31bb-b4f3-f399f3c714b2	8-8D070	7	1	2024-12-22 19:53:13	2025-09-03 18:11:51	\N
373	786663.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/a17a2651-6897-3b06-9e5f-d637fff415f5	1-0A314	9	1	2024-12-02 08:41:24	2025-09-03 18:11:51	\N
374	418945.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/e9cd4b2f-5b98-3595-bcb0-82055a89987d	0-9B330	20	3	2025-07-09 19:43:52	2025-09-03 18:11:51	\N
375	876513.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/95e002c8-fc31-39b9-9cb1-e72d105fc145	1-2B381	10	2	2025-01-30 21:48:34	2025-09-03 18:11:51	\N
376	448841.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/4dc4f85c-ac90-3c85-9d80-114fbc41a5cf	9-1A933	4	3	2025-08-31 08:48:53	2025-09-03 18:11:51	\N
377	877454.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/ae23f38a-f608-3a25-b1e0-e9876f76817a	6-1S525	4	3	2025-05-08 14:07:14	2025-09-03 18:11:51	\N
378	541265.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/68f7eb2e-abf5-3b5f-89d2-3ee8b14c5d65	3-3P661	21	1	2024-09-30 11:46:27	2025-09-03 18:11:51	\N
379	865296.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/21c1578b-6f9a-38dd-8f7f-96ff1f7d357e	2-2Q420	9	2	2024-12-07 20:34:26	2025-09-03 18:11:51	\N
380	215265.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/ca3b5bc8-fd09-3b7b-974b-79208de43c79	0-9M738	16	2	2024-12-09 02:13:13	2025-09-03 18:11:51	\N
381	836763.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/4855a57d-1542-3931-bdb7-4ef7126ba54b	4-9H841	4	1	2025-05-27 01:54:27	2025-09-03 18:11:51	\N
382	226391.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/fd07030d-e525-331b-8715-43f9f6b9fca9	7-1I558	13	1	2024-12-22 10:32:23	2025-09-03 18:11:51	\N
383	456013.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/0428045d-32f3-3c09-bb26-6028be611ec3	3-9H597	20	1	2025-08-06 14:02:54	2025-09-03 18:11:51	\N
384	453201.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/945e6e8e-5bb5-3f92-8d4b-f901ca4a375d	3-1C106	6	3	2024-11-30 12:20:27	2025-09-03 18:11:51	\N
385	807639.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/36620a92-3c91-3fd6-bf27-fa3c4afb4751	7-9C884	10	2	2024-09-18 23:18:46	2025-09-03 18:11:51	\N
386	814759.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/11549893-2e36-397a-9227-fb547b6cf689	6-9R482	18	1	2025-03-15 23:22:01	2025-09-03 18:11:51	\N
387	124586.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/ed8182c4-c271-3c0c-b029-d81db1c94c3b	6-7A816	16	2	2025-08-11 02:51:24	2025-09-03 18:11:51	\N
388	665463.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/65d626f3-de14-3446-b923-2ee00bae0831	6-3A296	15	3	2024-11-20 23:28:24	2025-09-03 18:11:51	\N
389	887506.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/f2cf3cab-7791-3fee-a99a-2040bc2baf52	2-4R000	2	2	2025-08-30 04:23:14	2025-09-03 18:11:51	\N
390	797914.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/c79fbd82-345d-3c8b-be82-6963c1151451	6-6F778	12	2	2025-08-22 10:04:48	2025-09-03 18:11:51	\N
391	739228.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/5b7860bd-c034-316f-b8de-4e59353d6ff2	6-4Q416	18	1	2025-02-16 22:50:21	2025-09-03 18:11:51	\N
392	468684.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/6f0ecaea-61ab-3e2e-b648-a19aa60d32f7	8-9R730	17	2	2024-12-06 23:11:08	2025-09-03 18:11:51	\N
393	778935.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/7d619ed9-6d6e-3eda-85c6-8b32826ac915	5-2J502	4	2	2025-02-13 21:04:08	2025-09-03 18:11:51	\N
394	109816.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/1b674d32-091a-382c-8b4c-84030865a5fd	3-0V935	15	2	2024-10-30 18:11:55	2025-09-03 18:11:51	\N
395	582684.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/7dab76e6-bb2b-394d-90e2-6da281cddc39	5-5F102	13	1	2025-09-03 11:10:39	2025-09-03 18:11:51	\N
396	557847.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/e18c96a5-b690-3149-9ef8-94ea979cad85	8-9Y859	20	1	2025-05-22 17:07:51	2025-09-03 18:11:51	\N
397	624567.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/120e142c-65dc-3943-b318-ad29c9ad2aad	7-5G548	1	2	2025-08-04 19:08:08	2025-09-03 18:11:51	\N
398	601298.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/55887f0b-6b08-31a1-baa6-3e50ce07f0bc	7-5H273	18	2	2025-03-31 23:15:44	2025-09-03 18:11:51	\N
399	383313.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/ec14392b-35ea-3777-ae4d-60c764681231	0-9K761	16	1	2025-06-26 13:05:48	2025-09-03 18:11:51	\N
400	882187.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/96f258fc-ad1c-3df8-98ea-b13946858fd7	8-3S764	20	3	2025-02-10 13:02:56	2025-09-03 18:11:51	\N
401	890256.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/c1812842-9bd8-39ed-844e-b605db87660c	2-4I827	13	3	2025-03-21 07:26:13	2025-09-03 18:11:51	\N
402	26836.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/7e3358e3-0370-3e46-8cd5-96f4441355e9	9-7Y412	4	3	2024-10-11 05:55:08	2025-09-03 18:11:51	\N
403	179435.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/363bf0f9-e334-3df9-90e4-37735d8cdee3	0-4O595	9	3	2025-01-16 10:04:20	2025-09-03 18:11:51	\N
404	880501.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/bcadcbce-d352-3c5a-b0eb-908bd32cdb90	6-9F341	20	3	2025-05-12 20:38:38	2025-09-03 18:11:51	\N
405	339275.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/7190b2de-ca7d-3957-98cb-c7e5af6f1b2b	0-0T617	21	3	2024-11-19 19:00:59	2025-09-03 18:11:51	\N
406	915302.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/d55d995c-2725-378e-a7d3-3aecf905d543	0-4G863	10	3	2025-02-16 11:07:29	2025-09-03 18:11:51	\N
407	855173.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/bb035142-1f49-39db-8022-4ed24ce639c4	9-5T091	17	2	2025-03-08 23:43:55	2025-09-03 18:11:51	\N
408	852152.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/34d837b2-b616-3108-9314-8e6dff63a61c	8-9V622	4	2	2025-06-11 02:41:32	2025-09-03 18:11:51	\N
409	365850.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/a56f04aa-8d62-3087-ba3e-641476872058	4-9Z910	2	3	2024-09-11 00:34:38	2025-09-03 18:11:51	\N
410	827178.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/bb613c86-2d25-3b9c-9df0-c5edcb882b6c	8-1Z336	20	2	2025-01-15 08:49:19	2025-09-03 18:11:51	\N
411	387383.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/c5862165-d085-36d1-a5a4-b9a700940799	3-3O793	3	2	2024-12-06 22:09:01	2025-09-03 18:11:51	\N
412	488676.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/9fa113fd-f3ca-3a7b-b7ac-b85021371e39	2-6K853	16	2	2025-03-14 06:00:26	2025-09-03 18:11:51	\N
413	233860.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/3908c1e5-268b-3be3-9909-62ceaf33d7d0	3-0M283	14	2	2025-05-12 11:03:09	2025-09-03 18:11:51	\N
414	313396.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/45b36ac2-a11c-31db-91a5-70a713d2e58d	9-8M323	20	1	2025-01-27 22:59:19	2025-09-03 18:11:51	\N
415	845750.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/8e477952-5ff0-3a77-b9d3-35fce7a247df	4-4O481	5	1	2024-09-06 14:00:27	2025-09-03 18:11:51	\N
416	388278.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/dc86902d-75dd-39fd-98c8-4ec2c3e1430d	2-2F203	8	3	2025-05-31 06:01:56	2025-09-03 18:11:51	\N
417	897614.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/ab1c7878-8701-3581-b17c-0b58b4b32f3c	4-2A616	17	2	2025-02-06 16:36:45	2025-09-03 18:11:51	\N
418	826366.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/e75db20b-42b9-3431-aff2-7853856e4fb6	7-8M595	9	3	2025-03-03 15:24:23	2025-09-03 18:11:51	\N
419	615974.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/79db0427-7aaa-3ab5-bcd3-f4b1a953eb38	1-9D182	14	1	2025-07-23 11:07:48	2025-09-03 18:11:51	\N
420	13426.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/c54c88af-5ccf-39c4-b27f-f72a517af26d	0-7F187	11	3	2025-01-21 20:58:07	2025-09-03 18:11:51	\N
421	41304.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/4f204be5-eb53-3263-b366-bdc1a7a6b0f9	7-1U565	5	1	2024-11-27 13:14:02	2025-09-03 18:11:51	\N
422	767953.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/4118d885-f839-38fa-a3e2-7f81aa48bbf9	7-6E888	1	2	2025-02-26 23:22:18	2025-09-03 18:11:51	\N
423	649878.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/edba8d96-81fb-32ab-8ccd-7a1319f07e70	3-1U915	19	3	2025-05-13 19:45:38	2025-09-03 18:11:51	\N
424	350106.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/1c4be864-9d88-398c-a91a-467380d1a90f	7-1Q938	6	1	2025-03-21 01:09:11	2025-09-03 18:11:51	\N
425	733730.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/a53d1162-3605-3f8d-b65c-84096b518759	6-4V315	18	2	2025-01-06 15:48:28	2025-09-03 18:11:51	\N
426	123629.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/657265d5-c8ab-3fe8-ae3d-519d27071bd7	8-2Q913	8	1	2025-05-14 14:20:25	2025-09-03 18:11:51	\N
427	910763.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/ecd866a8-b478-39a7-8613-cc44ef08b101	9-9Y736	20	2	2025-04-18 07:21:26	2025-09-03 18:11:51	\N
428	340992.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/9f3efbc8-cbd4-3a47-957e-2ec2deca603f	7-3W736	3	1	2025-06-13 12:09:36	2025-09-03 18:11:51	\N
429	919593.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/e7361f1c-42a4-3c23-ac5d-c9d49737a8cd	4-5J547	17	1	2025-05-19 13:41:15	2025-09-03 18:11:51	\N
430	536132.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/b711fee8-7fb1-395a-852d-7355ab4111c7	7-9D675	10	1	2025-05-17 14:02:55	2025-09-03 18:11:51	\N
431	614047.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/13798c37-2c79-37f1-a1af-9323e290a80e	7-4C639	11	2	2025-03-03 07:47:00	2025-09-03 18:11:51	\N
432	618504.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/f597ecf8-6992-37d8-81d6-f40c210e29bf	3-5P870	18	1	2024-10-22 21:16:43	2025-09-03 18:11:51	\N
433	459519.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/7e065ba1-8f60-3486-9fa4-5363b9c0cb1a	7-7G839	6	1	2025-05-09 04:00:49	2025-09-03 18:11:51	\N
434	299518.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/7d456a4b-694b-38a9-93a2-83c1a3abb9c5	0-8O246	1	3	2025-09-03 11:13:32	2025-09-03 18:11:51	\N
435	249495.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/161479b9-7269-374e-b6c7-eb2401786b3f	5-6D262	19	1	2025-04-03 22:31:53	2025-09-03 18:11:51	\N
436	71543.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/27c020d9-7640-3d9e-bf32-c70655f4d004	3-1S550	12	3	2025-08-06 20:58:47	2025-09-03 18:11:51	\N
437	570462.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/461ed54d-b122-3c02-bc8d-ccae47162dd2	6-4R135	15	2	2025-03-20 09:02:07	2025-09-03 18:11:51	\N
438	920406.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/e6d5430b-c0af-3e55-8599-03833be6437a	2-0P742	9	3	2024-12-24 20:08:07	2025-09-03 18:11:51	\N
439	652737.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/58db4913-cd32-3c15-ba4b-4a6f221e5a75	8-1B198	14	2	2025-04-14 01:32:16	2025-09-03 18:11:51	\N
440	51678.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/1f9110dd-4ef1-3d01-af5a-b6c7f12aec06	7-5F820	3	1	2025-01-04 17:55:59	2025-09-03 18:11:51	\N
441	31911.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/d46ecbc9-44d5-36ef-89aa-24fa87c8f4be	4-6F914	16	3	2025-05-31 14:21:44	2025-09-03 18:11:51	\N
442	130246.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/a95ebbf0-a059-3c26-a8c3-da787dba9be6	9-6W006	15	3	2025-08-08 12:58:35	2025-09-03 18:11:51	\N
443	356715.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/0a141ebf-e337-354b-b4fb-0cbedc78dd7a	4-6A024	2	1	2025-06-27 11:38:24	2025-09-03 18:11:51	\N
444	776509.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/853d8cef-3b6d-3956-b06b-2f15037e2cab	6-6C677	14	2	2024-10-12 13:35:54	2025-09-03 18:11:51	\N
445	745627.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/130b314b-25d1-3502-b923-06762688b6c2	5-9A732	19	2	2025-02-24 03:40:10	2025-09-03 18:11:51	\N
446	386561.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/b8163bbb-16de-3712-be25-5334bd4e767e	3-2N526	8	1	2024-09-18 06:12:46	2025-09-03 18:11:51	\N
447	502007.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/67d01950-73cf-3695-904e-d3111c4f37e0	7-8H125	11	1	2024-10-12 05:08:26	2025-09-03 18:11:51	\N
448	855204.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/ac5fec97-b6a8-3e7c-847b-d3f9105316e3	7-9M721	20	1	2025-07-18 05:12:36	2025-09-03 18:11:51	\N
449	996736.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/b4b38265-0230-34f6-ae15-59f01c64bb1e	2-5A127	4	2	2025-01-13 06:28:37	2025-09-03 18:11:51	\N
450	988109.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/702c19c7-e231-30b0-9fdc-453ed04cf2e8	6-4O365	1	3	2024-10-13 02:20:39	2025-09-03 18:11:51	\N
451	288211.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/cee0356c-47aa-38b4-8e56-a42635d461d6	9-2T385	1	3	2024-12-12 19:40:06	2025-09-03 18:11:51	\N
452	708022.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/5d4bde83-5e6e-361f-81fc-771841d29510	7-4W738	21	3	2025-01-14 15:16:18	2025-09-03 18:11:51	\N
453	296637.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/ebf5e61e-22a6-309f-9ba0-210334b2bfca	0-8W335	3	2	2025-01-14 18:56:48	2025-09-03 18:11:51	\N
454	829021.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/ec99dbe8-07e9-39d1-8130-ecf2fd82ff6a	2-1E625	21	1	2025-08-31 06:46:17	2025-09-03 18:11:51	\N
455	941323.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/9cb34247-b949-3206-b200-e9b8fd7c2e2a	1-2T416	16	1	2025-04-15 19:47:49	2025-09-03 18:11:51	\N
456	468688.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/fd19c83c-808e-3845-9527-bcebcc7de179	0-2O573	5	3	2025-05-27 16:17:30	2025-09-03 18:11:51	\N
457	377438.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/0a4fd4d6-f83e-3c51-86b6-06c213447bff	6-4T036	20	2	2024-11-07 09:44:45	2025-09-03 18:11:51	\N
458	203586.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/106d2e3b-674f-3166-aee0-abccaf79768f	2-6X684	17	2	2024-12-30 12:32:43	2025-09-03 18:11:51	\N
459	674722.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/74b69d05-27c1-3173-92cc-159421d44570	7-1L915	3	3	2024-10-02 03:25:26	2025-09-03 18:11:51	\N
460	537054.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/d056bdc1-f825-31e1-b3dc-7fdfe4d3e42d	1-0E326	16	1	2025-05-16 11:59:34	2025-09-03 18:11:51	\N
461	315006.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/a551d508-eb61-3a9f-a9e6-45bea154dfaa	5-2Q400	15	3	2025-01-24 23:54:38	2025-09-03 18:11:51	\N
462	35225.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/8a38f254-ddb8-38b2-8c90-f9eac2294bf7	5-3X435	1	1	2024-12-06 20:50:48	2025-09-03 18:11:51	\N
463	854343.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/a83b0ba3-7115-362e-ac56-19df1b23a5f8	6-7E888	15	2	2024-10-11 09:36:22	2025-09-03 18:11:51	\N
464	873850.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/fdb4131d-c662-3c59-a7c1-311a767bb1bf	8-2D197	21	3	2025-02-22 17:35:55	2025-09-03 18:11:51	\N
465	724160.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/486f10fa-08cf-3813-a93a-f7fa5f2fe0b1	0-0H776	5	2	2024-11-06 02:50:17	2025-09-03 18:11:51	\N
466	379247.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/34409cb6-01f2-3fd1-9a21-8c551ca68e10	4-5F087	17	2	2025-07-09 12:25:15	2025-09-03 18:11:52	\N
467	442322.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/5c370666-9990-3155-8718-cf473932f982	6-7N603	4	1	2025-01-25 02:14:49	2025-09-03 18:11:52	\N
468	520409.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/d0446be2-e823-3018-8870-f0b270b2f318	7-7B513	21	2	2025-03-20 20:06:01	2025-09-03 18:11:52	\N
469	728640.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/e6eef0b5-eef4-38ac-acfb-c4b1ad9739cf	2-3J229	11	2	2024-10-29 11:35:54	2025-09-03 18:11:52	\N
470	21971.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/7b685dde-f689-327e-ac0f-d32fb274fb5c	3-4Z301	11	1	2024-10-24 14:13:04	2025-09-03 18:11:52	\N
471	105278.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/086915f4-eec4-3767-957c-44e1e85a9878	9-0K259	4	2	2025-05-13 23:31:56	2025-09-03 18:11:52	\N
472	458872.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/b1d1dac2-9bc8-3a88-b214-a6be9e2c0965	3-3C836	19	2	2025-01-01 15:25:19	2025-09-03 18:11:52	\N
473	494794.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/f0320b1c-fcdf-3d83-9fe6-630ffd64b992	1-7Y898	9	3	2024-09-07 08:24:55	2025-09-03 18:11:52	\N
474	622377.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/b409ad4f-d0fc-3c53-95b6-97bc26487f60	5-3A901	12	3	2025-03-19 16:31:23	2025-09-03 18:11:52	\N
475	578183.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/0468721b-40a6-3e3d-b212-3cd2a052fe6a	6-3L077	13	2	2025-05-27 13:47:47	2025-09-03 18:11:52	\N
476	226986.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/5271c6aa-ab16-3347-b826-3c894d01c0ef	9-5Q167	6	2	2025-02-21 11:03:56	2025-09-03 18:11:52	\N
477	399110.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/c70cef14-520f-38b1-ae80-8278f94cb44e	0-1B292	8	3	2025-01-24 19:53:34	2025-09-03 18:11:52	\N
478	720365.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/d59feeaf-1a4a-3b3a-82e9-98d9af041f60	1-8A346	21	3	2025-05-22 09:21:34	2025-09-03 18:11:52	\N
479	305124.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/922a8020-dbc1-35c5-81a7-61e30227e8b2	8-4C239	15	2	2025-02-09 22:11:21	2025-09-03 18:11:52	\N
480	750418.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/72d3ed27-8371-3445-9759-8af975db5ccd	8-2Q433	2	3	2025-04-03 00:01:40	2025-09-03 18:11:52	\N
481	625871.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/38a6debe-1192-36c7-9336-dd13294d23c7	5-4K693	7	2	2025-06-21 17:15:44	2025-09-03 18:11:52	\N
482	567564.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/7e89704b-5b36-3787-afd6-369e3b44d41e	3-1M864	1	2	2025-01-21 17:42:06	2025-09-03 18:11:52	\N
483	369332.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/07657d71-f006-3fc3-a015-df38bd02709f	8-1P921	13	2	2024-11-20 00:30:36	2025-09-03 18:11:52	\N
484	144156.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/1491957b-1f0d-39f7-b82c-8f7a8ffcde83	8-9J012	2	2	2024-11-29 11:10:56	2025-09-03 18:11:52	\N
485	622948.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/55185527-8f61-3355-855a-f6afe0048b49	5-3M320	14	1	2025-03-10 00:58:07	2025-09-03 18:11:52	\N
486	523359.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/f1ac31d2-f5f5-38cb-ad8d-a8ddbd3b0255	3-3F955	3	1	2025-05-05 17:34:38	2025-09-03 18:11:52	\N
487	932460.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/f937ae39-7274-3a89-84a1-e62b24d7c481	2-9J555	5	3	2024-11-16 00:19:08	2025-09-03 18:11:52	\N
488	679267.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/dc1edfb3-c94c-39c4-9c20-e37192bde31a	8-1I752	12	3	2025-03-24 18:30:26	2025-09-03 18:11:52	\N
489	188639.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/b2bc7084-6b90-30ac-9a86-34fa0d76f8a8	8-0Z505	8	3	2025-06-25 07:44:32	2025-09-03 18:11:52	\N
490	17220.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/324081b5-b5cc-3d0c-9cc5-0288b8d5e74d	8-3I496	13	1	2025-03-04 15:30:08	2025-09-03 18:11:52	\N
491	255643.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/13b8dc93-c179-36e5-baf1-d2198334e077	5-2H502	2	1	2025-06-05 05:40:00	2025-09-03 18:11:52	\N
492	161428.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/01038f48-84e9-3c9d-b961-3e34461fa494	0-0O390	8	3	2025-07-27 15:38:51	2025-09-03 18:11:52	\N
493	35137.00	paid	https://app.sandbox.midtrans.com/snap/v4/redirection/cbf2d716-ba81-3671-a2a8-1cd38f3a060c	2-0K462	6	2	2025-02-02 10:04:23	2025-09-03 18:11:52	\N
494	956696.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/e4ef1ede-2a37-3d9f-ae2a-2dc554cd883e	4-1A379	19	1	2025-01-04 17:52:58	2025-09-03 18:11:52	\N
495	947569.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/41d4abc8-37e3-3b25-8d52-2006f28e108a	3-3O887	10	2	2024-10-01 02:26:44	2025-09-03 18:11:52	\N
496	12914.00	waiting	https://app.sandbox.midtrans.com/snap/v4/redirection/ea1d08d6-020c-3e60-a4a1-5c8864216142	0-7S538	11	3	2025-05-29 17:46:53	2025-09-03 18:11:52	\N
497	114969.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/000087b1-3728-3d20-8fea-6e04020fe412	9-0W669	4	3	2025-05-07 14:55:05	2025-09-03 18:11:52	\N
498	978040.00	failed	https://app.sandbox.midtrans.com/snap/v4/redirection/354a1ca4-27c4-3a8b-980a-d9314908d4a4	7-4K835	17	3	2024-12-08 11:19:35	2025-09-03 18:11:52	\N
499	652831.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/95ee071f-9d83-3120-a31a-8103e232bcb1	8-2W079	16	1	2025-05-21 16:50:50	2025-09-03 18:11:52	\N
500	382985.00	pending	https://app.sandbox.midtrans.com/snap/v4/redirection/d512f9c4-419d-33aa-8ff5-fcc72150cf8e	6-3D252	15	2	2025-02-28 20:38:06	2025-09-03 18:11:52	\N
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.permissions (id, name, guard_name, created_at, updated_at) FROM stdin;
1	manage users	web	2025-09-03 18:10:49	2025-09-03 18:10:49
2	view dashboard	web	2025-09-03 18:10:49	2025-09-03 18:10:49
3	view_banner	web	2025-09-03 18:30:32	2025-09-03 18:30:32
4	view_any_banner	web	2025-09-03 18:30:32	2025-09-03 18:30:32
5	create_banner	web	2025-09-03 18:30:32	2025-09-03 18:30:32
6	update_banner	web	2025-09-03 18:30:32	2025-09-03 18:30:32
7	restore_banner	web	2025-09-03 18:30:32	2025-09-03 18:30:32
8	restore_any_banner	web	2025-09-03 18:30:32	2025-09-03 18:30:32
9	replicate_banner	web	2025-09-03 18:30:32	2025-09-03 18:30:32
10	reorder_banner	web	2025-09-03 18:30:32	2025-09-03 18:30:32
11	delete_banner	web	2025-09-03 18:30:32	2025-09-03 18:30:32
12	delete_any_banner	web	2025-09-03 18:30:32	2025-09-03 18:30:32
13	force_delete_banner	web	2025-09-03 18:30:32	2025-09-03 18:30:32
14	force_delete_any_banner	web	2025-09-03 18:30:32	2025-09-03 18:30:32
15	view_cart	web	2025-09-03 18:30:32	2025-09-03 18:30:32
16	view_any_cart	web	2025-09-03 18:30:32	2025-09-03 18:30:32
17	create_cart	web	2025-09-03 18:30:32	2025-09-03 18:30:32
18	update_cart	web	2025-09-03 18:30:32	2025-09-03 18:30:32
19	restore_cart	web	2025-09-03 18:30:32	2025-09-03 18:30:32
20	restore_any_cart	web	2025-09-03 18:30:32	2025-09-03 18:30:32
21	replicate_cart	web	2025-09-03 18:30:33	2025-09-03 18:30:33
22	reorder_cart	web	2025-09-03 18:30:33	2025-09-03 18:30:33
23	delete_cart	web	2025-09-03 18:30:33	2025-09-03 18:30:33
24	delete_any_cart	web	2025-09-03 18:30:33	2025-09-03 18:30:33
25	force_delete_cart	web	2025-09-03 18:30:33	2025-09-03 18:30:33
26	force_delete_any_cart	web	2025-09-03 18:30:33	2025-09-03 18:30:33
27	view_category	web	2025-09-03 18:30:33	2025-09-03 18:30:33
28	view_any_category	web	2025-09-03 18:30:33	2025-09-03 18:30:33
29	create_category	web	2025-09-03 18:30:33	2025-09-03 18:30:33
30	update_category	web	2025-09-03 18:30:33	2025-09-03 18:30:33
31	restore_category	web	2025-09-03 18:30:33	2025-09-03 18:30:33
32	restore_any_category	web	2025-09-03 18:30:33	2025-09-03 18:30:33
33	replicate_category	web	2025-09-03 18:30:33	2025-09-03 18:30:33
34	reorder_category	web	2025-09-03 18:30:33	2025-09-03 18:30:33
35	delete_category	web	2025-09-03 18:30:33	2025-09-03 18:30:33
36	delete_any_category	web	2025-09-03 18:30:33	2025-09-03 18:30:33
37	force_delete_category	web	2025-09-03 18:30:33	2025-09-03 18:30:33
38	force_delete_any_category	web	2025-09-03 18:30:33	2025-09-03 18:30:33
39	view_coupon	web	2025-09-03 18:30:33	2025-09-03 18:30:33
40	view_any_coupon	web	2025-09-03 18:30:33	2025-09-03 18:30:33
41	create_coupon	web	2025-09-03 18:30:33	2025-09-03 18:30:33
42	update_coupon	web	2025-09-03 18:30:33	2025-09-03 18:30:33
43	restore_coupon	web	2025-09-03 18:30:33	2025-09-03 18:30:33
44	restore_any_coupon	web	2025-09-03 18:30:33	2025-09-03 18:30:33
45	replicate_coupon	web	2025-09-03 18:30:33	2025-09-03 18:30:33
46	reorder_coupon	web	2025-09-03 18:30:34	2025-09-03 18:30:34
47	delete_coupon	web	2025-09-03 18:30:34	2025-09-03 18:30:34
48	delete_any_coupon	web	2025-09-03 18:30:34	2025-09-03 18:30:34
49	force_delete_coupon	web	2025-09-03 18:30:34	2025-09-03 18:30:34
50	force_delete_any_coupon	web	2025-09-03 18:30:34	2025-09-03 18:30:34
51	view_order	web	2025-09-03 18:30:34	2025-09-03 18:30:34
52	view_any_order	web	2025-09-03 18:30:34	2025-09-03 18:30:34
53	create_order	web	2025-09-03 18:30:34	2025-09-03 18:30:34
54	update_order	web	2025-09-03 18:30:34	2025-09-03 18:30:34
55	restore_order	web	2025-09-03 18:30:34	2025-09-03 18:30:34
56	restore_any_order	web	2025-09-03 18:30:34	2025-09-03 18:30:34
57	replicate_order	web	2025-09-03 18:30:34	2025-09-03 18:30:34
58	reorder_order	web	2025-09-03 18:30:34	2025-09-03 18:30:34
59	delete_order	web	2025-09-03 18:30:34	2025-09-03 18:30:34
60	delete_any_order	web	2025-09-03 18:30:35	2025-09-03 18:30:35
61	force_delete_order	web	2025-09-03 18:30:35	2025-09-03 18:30:35
62	force_delete_any_order	web	2025-09-03 18:30:35	2025-09-03 18:30:35
63	view_product	web	2025-09-03 18:30:35	2025-09-03 18:30:35
64	view_any_product	web	2025-09-03 18:30:35	2025-09-03 18:30:35
65	create_product	web	2025-09-03 18:30:35	2025-09-03 18:30:35
66	update_product	web	2025-09-03 18:30:35	2025-09-03 18:30:35
67	restore_product	web	2025-09-03 18:30:35	2025-09-03 18:30:35
68	restore_any_product	web	2025-09-03 18:30:36	2025-09-03 18:30:36
69	replicate_product	web	2025-09-03 18:30:36	2025-09-03 18:30:36
70	reorder_product	web	2025-09-03 18:30:36	2025-09-03 18:30:36
71	delete_product	web	2025-09-03 18:30:36	2025-09-03 18:30:36
72	delete_any_product	web	2025-09-03 18:30:36	2025-09-03 18:30:36
73	force_delete_product	web	2025-09-03 18:30:36	2025-09-03 18:30:36
74	force_delete_any_product	web	2025-09-03 18:30:36	2025-09-03 18:30:36
75	view_review	web	2025-09-03 18:30:36	2025-09-03 18:30:36
76	view_any_review	web	2025-09-03 18:30:36	2025-09-03 18:30:36
77	create_review	web	2025-09-03 18:30:36	2025-09-03 18:30:36
78	update_review	web	2025-09-03 18:30:36	2025-09-03 18:30:36
79	restore_review	web	2025-09-03 18:30:36	2025-09-03 18:30:36
80	restore_any_review	web	2025-09-03 18:30:36	2025-09-03 18:30:36
81	replicate_review	web	2025-09-03 18:30:36	2025-09-03 18:30:36
82	reorder_review	web	2025-09-03 18:30:36	2025-09-03 18:30:36
83	delete_review	web	2025-09-03 18:30:36	2025-09-03 18:30:36
84	delete_any_review	web	2025-09-03 18:30:36	2025-09-03 18:30:36
85	force_delete_review	web	2025-09-03 18:30:36	2025-09-03 18:30:36
86	force_delete_any_review	web	2025-09-03 18:30:36	2025-09-03 18:30:36
87	view_shield::role	web	2025-09-03 18:30:36	2025-09-03 18:30:36
88	view_any_shield::role	web	2025-09-03 18:30:37	2025-09-03 18:30:37
89	create_shield::role	web	2025-09-03 18:30:37	2025-09-03 18:30:37
90	update_shield::role	web	2025-09-03 18:30:37	2025-09-03 18:30:37
91	delete_shield::role	web	2025-09-03 18:30:37	2025-09-03 18:30:37
92	delete_any_shield::role	web	2025-09-03 18:30:37	2025-09-03 18:30:37
93	view_user	web	2025-09-03 18:30:37	2025-09-03 18:30:37
94	view_any_user	web	2025-09-03 18:30:37	2025-09-03 18:30:37
95	create_user	web	2025-09-03 18:30:37	2025-09-03 18:30:37
96	update_user	web	2025-09-03 18:30:37	2025-09-03 18:30:37
97	restore_user	web	2025-09-03 18:30:37	2025-09-03 18:30:37
98	restore_any_user	web	2025-09-03 18:30:37	2025-09-03 18:30:37
99	replicate_user	web	2025-09-03 18:30:37	2025-09-03 18:30:37
100	reorder_user	web	2025-09-03 18:30:37	2025-09-03 18:30:37
101	delete_user	web	2025-09-03 18:30:37	2025-09-03 18:30:37
102	delete_any_user	web	2025-09-03 18:30:37	2025-09-03 18:30:37
103	force_delete_user	web	2025-09-03 18:30:37	2025-09-03 18:30:37
104	force_delete_any_user	web	2025-09-03 18:30:38	2025-09-03 18:30:38
105	view_wishlist	web	2025-09-03 18:30:38	2025-09-03 18:30:38
106	view_any_wishlist	web	2025-09-03 18:30:38	2025-09-03 18:30:38
107	create_wishlist	web	2025-09-03 18:30:38	2025-09-03 18:30:38
108	update_wishlist	web	2025-09-03 18:30:38	2025-09-03 18:30:38
109	restore_wishlist	web	2025-09-03 18:30:38	2025-09-03 18:30:38
110	restore_any_wishlist	web	2025-09-03 18:30:38	2025-09-03 18:30:38
111	replicate_wishlist	web	2025-09-03 18:30:38	2025-09-03 18:30:38
112	reorder_wishlist	web	2025-09-03 18:30:38	2025-09-03 18:30:38
113	delete_wishlist	web	2025-09-03 18:30:38	2025-09-03 18:30:38
114	delete_any_wishlist	web	2025-09-03 18:30:38	2025-09-03 18:30:38
115	force_delete_wishlist	web	2025-09-03 18:30:38	2025-09-03 18:30:38
116	force_delete_any_wishlist	web	2025-09-03 18:30:38	2025-09-03 18:30:38
\.


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.product_images (id, image, product_id, created_at, updated_at, deleted_at) FROM stdin;
1	https://picsum.photos/640/480?random=489	19	2025-09-03 18:11:13	2025-09-03 18:11:13	\N
2	https://picsum.photos/640/480?random=376	3	2025-09-03 18:11:13	2025-09-03 18:11:13	\N
3	https://picsum.photos/640/480?random=1793	3	2025-09-03 18:11:13	2025-09-03 18:11:13	\N
4	https://picsum.photos/640/480?random=1098	18	2025-09-03 18:11:13	2025-09-03 18:11:13	\N
5	https://picsum.photos/640/480?random=1334	19	2025-09-03 18:11:13	2025-09-03 18:11:13	\N
6	https://picsum.photos/640/480?random=1886	14	2025-09-03 18:11:13	2025-09-03 18:11:13	\N
7	https://picsum.photos/640/480?random=1802	6	2025-09-03 18:11:13	2025-09-03 18:11:13	\N
8	https://picsum.photos/640/480?random=1541	2	2025-09-03 18:11:13	2025-09-03 18:11:13	\N
9	https://picsum.photos/640/480?random=1844	13	2025-09-03 18:11:13	2025-09-03 18:11:13	\N
10	https://picsum.photos/640/480?random=1419	14	2025-09-03 18:11:13	2025-09-03 18:11:13	\N
11	https://picsum.photos/640/480?random=662	9	2025-09-03 18:11:13	2025-09-03 18:11:13	\N
12	https://picsum.photos/640/480?random=664	16	2025-09-03 18:11:13	2025-09-03 18:11:13	\N
13	https://picsum.photos/640/480?random=1443	10	2025-09-03 18:11:13	2025-09-03 18:11:13	\N
14	https://picsum.photos/640/480?random=1684	12	2025-09-03 18:11:14	2025-09-03 18:11:14	\N
15	https://picsum.photos/640/480?random=1660	14	2025-09-03 18:11:14	2025-09-03 18:11:14	\N
16	https://picsum.photos/640/480?random=59	12	2025-09-03 18:11:14	2025-09-03 18:11:14	\N
17	https://picsum.photos/640/480?random=315	12	2025-09-03 18:11:14	2025-09-03 18:11:14	\N
18	https://picsum.photos/640/480?random=1561	18	2025-09-03 18:11:14	2025-09-03 18:11:14	\N
19	https://picsum.photos/640/480?random=743	14	2025-09-03 18:11:14	2025-09-03 18:11:14	\N
20	https://picsum.photos/640/480?random=1073	3	2025-09-03 18:11:14	2025-09-03 18:11:14	\N
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.products (id, name, slug, description, price, stock, total_sold, is_published, created_at, updated_at, deleted_at) FROM stdin;
1	Est nesciunt est numquam est iusto repellat possimus.	est-nesciunt-est-numquam-est-iusto-repellat-possimus	Quia dignissimos expedita aut. Doloribus sed ab a amet eligendi. Dolorem omnis architecto ut ut omnis aperiam et. Ut fuga odio et perferendis.	73022.00	24	19	f	2025-06-09 23:15:30	2025-07-16 11:52:44	\N
2	In nihil in et sunt sit consectetur ea reiciendis.	in-nihil-in-et-sunt-sit-consectetur-ea-reiciendis	Consequatur consequatur aut sint quod cum aut. Molestiae accusamus in sint impedit et qui aut. Asperiores aliquid dolor maxime minus sint maxime. Expedita vero aspernatur ut debitis ea dignissimos.	11041.00	25	37	f	2025-05-26 15:37:27	2025-08-07 06:04:46	\N
3	Rem cupiditate eligendi qui illum aliquam hic dolores.	rem-cupiditate-eligendi-qui-illum-aliquam-hic-dolores	Harum facere hic nihil ut dolorem ipsum quibusdam deserunt. Enim aut corporis quae sit quaerat. Eum ducimus molestias velit fuga tempora. Error pariatur aut est quis quia esse.	91206.00	58	64	f	2025-03-06 01:25:06	2025-05-19 17:10:44	\N
4	Pariatur itaque nihil enim ipsum iste odio eos.	pariatur-itaque-nihil-enim-ipsum-iste-odio-eos	Dicta molestiae enim soluta amet facilis maiores voluptas. Reprehenderit est error nihil modi nostrum rerum ut. Optio vitae tempora porro aut illum vel.	80439.00	91	35	f	2025-01-26 00:04:23	2025-07-31 03:32:58	\N
5	Ea vel laudantium aut sed.	ea-vel-laudantium-aut-sed	Tenetur ut ipsam velit dolores ut. Quia tempore itaque animi quod sequi aspernatur enim. Laborum dolores esse optio magnam quo non.	70377.00	69	35	f	2025-06-01 18:01:28	2025-07-17 12:12:22	\N
6	Et dignissimos nobis omnis recusandae voluptatem.	et-dignissimos-nobis-omnis-recusandae-voluptatem	Architecto voluptates consectetur in et et doloribus quidem. Ratione ut provident sit. Cumque saepe accusamus esse numquam sunt. Et nesciunt voluptatem eius voluptate qui dicta quia.	17411.00	56	85	f	2024-09-20 15:51:45	2025-07-22 16:01:16	\N
7	Ducimus doloremque at dolore et.	ducimus-doloremque-at-dolore-et	Possimus fugiat possimus doloremque quia tempora omnis illum. Aut autem est officiis et laboriosam et aut eius. Quia ea cum ut fuga. Et debitis consequuntur voluptas similique quam eveniet quae pariatur.	85188.00	23	26	t	2025-06-19 02:38:19	2025-07-04 10:36:00	\N
8	Ipsum illo harum sunt sed et est.	ipsum-illo-harum-sunt-sed-et-est	Repellendus laudantium sequi placeat magnam. Fugiat ut cum eum nam. Quisquam quia aut placeat aut ipsa. Repudiandae omnis et nulla qui sed.	12331.00	16	16	f	2024-09-27 10:09:22	2025-06-30 23:33:27	\N
9	Reiciendis porro voluptatem atque voluptatem unde repellendus quis voluptates.	reiciendis-porro-voluptatem-atque-voluptatem-unde-repellendus-quis-voluptates	Reprehenderit ullam nam maxime accusantium repellat ea. Maiores aut ullam voluptatem velit earum laborum voluptatum. Enim consequatur non ex perspiciatis nulla. Error illo sed voluptatem velit ipsum.	13575.00	72	92	t	2025-08-26 00:38:02	2025-09-01 19:27:11	\N
10	Ducimus non eos omnis rerum est mollitia saepe.	ducimus-non-eos-omnis-rerum-est-mollitia-saepe	Similique nesciunt sed sapiente ab nisi facilis. Eos sit rerum tenetur quis tempora. Odio nesciunt rerum accusantium fuga aliquam rerum. Repellat earum dolorum temporibus repudiandae rerum fuga omnis fuga.	66808.00	92	28	f	2024-11-04 21:23:20	2025-01-09 02:04:41	\N
11	Ab cupiditate minus beatae et eligendi voluptate.	ab-cupiditate-minus-beatae-et-eligendi-voluptate	Qui qui quo corporis rerum repudiandae eligendi consequatur. Deserunt nulla voluptas facilis pariatur doloremque sint iusto. Est placeat vero omnis ut in. Labore amet sed ut cupiditate aut dolorem perferendis. Harum et id id velit optio id.	51345.00	92	54	t	2024-11-15 07:36:50	2025-05-22 12:26:52	\N
12	Et voluptas impedit et.	et-voluptas-impedit-et	Qui eveniet cum aut eos laudantium. Aspernatur ipsam dolorem provident et qui. Doloremque est suscipit dolorum molestias et veritatis rerum. Perspiciatis aliquam qui architecto beatae labore voluptatem dolor.	27354.00	25	91	f	2025-06-27 00:40:05	2025-08-18 09:41:45	\N
13	Numquam quaerat maiores qui porro facilis omnis.	numquam-quaerat-maiores-qui-porro-facilis-omnis	Quis nostrum nobis voluptas in. Explicabo numquam cupiditate autem consequuntur enim. Enim architecto delectus eum numquam.	94886.00	78	42	t	2025-01-25 22:10:04	2025-05-07 11:41:46	\N
14	Fuga nam porro velit sed quis.	fuga-nam-porro-velit-sed-quis	Eos soluta architecto eaque et fugit amet. Dolore laborum et voluptate iste earum rem quasi et. Accusantium ut occaecati doloribus beatae ut rerum doloremque dolorem.	64274.00	92	88	f	2025-06-15 09:22:30	2025-07-03 09:18:33	\N
15	Modi magnam neque perferendis quos voluptatem.	modi-magnam-neque-perferendis-quos-voluptatem	Ab alias ut minima consequatur eos est. Occaecati esse occaecati omnis qui quae sint. Praesentium atque aut quasi et vel in hic. Asperiores voluptates excepturi omnis possimus et.	93766.00	33	20	f	2024-12-30 08:38:24	2025-02-14 14:56:28	\N
16	Ut beatae accusamus reprehenderit placeat corrupti eligendi reprehenderit.	ut-beatae-accusamus-reprehenderit-placeat-corrupti-eligendi-reprehenderit	Eos quae et animi ab similique. Occaecati saepe consequatur omnis est corrupti magnam. Corporis molestiae fuga aliquid expedita.	55476.00	36	47	t	2025-03-29 19:59:42	2025-04-21 02:42:42	\N
17	Et ratione sunt velit praesentium et ducimus.	et-ratione-sunt-velit-praesentium-et-ducimus	Cupiditate totam laborum ea hic fugit rerum. In est officiis ipsa quo maiores provident. Pariatur aut tempore laborum et et. Quod odit enim deserunt quos.	14786.00	51	49	t	2025-05-28 04:32:57	2025-06-25 23:01:54	\N
18	Vel hic quo adipisci.	vel-hic-quo-adipisci	Modi voluptatem corporis ut explicabo ad ut molestias eos. Rerum quia dolore hic necessitatibus optio est. Tenetur qui consectetur quis doloremque.	46910.00	35	97	t	2024-11-07 14:05:46	2025-06-05 19:01:28	\N
19	Eum qui quibusdam adipisci nisi officiis illo iusto.	eum-qui-quibusdam-adipisci-nisi-officiis-illo-iusto	Dolorem est et qui amet voluptas quisquam laborum omnis. Id rerum voluptates odit quos voluptates. Fuga delectus molestias magni aperiam.	35389.00	37	14	t	2025-04-23 00:52:55	2025-07-03 05:45:41	\N
20	Qui nemo occaecati minima qui aliquid et ex.	qui-nemo-occaecati-minima-qui-aliquid-et-ex	Ut consequatur dolorem ipsa et iusto dolor ut. Nesciunt eligendi ea neque labore quo et. Dolorem sed et fuga quam. Ut in asperiores eligendi aut.	37863.00	12	80	f	2025-04-23 05:32:25	2025-06-07 01:46:23	\N
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.profiles (id, theme, gender, user_id, created_at, updated_at, deleted_at) FROM stdin;
1	dark	male	1	2025-09-03 18:10:58	2025-09-03 18:10:58	\N
2	light	male	7	2025-09-03 18:10:58	2025-09-03 18:10:58	\N
3	dark	male	1	2025-09-03 18:10:58	2025-09-03 18:10:58	\N
4	dark	female	11	2025-09-03 18:10:58	2025-09-03 18:10:58	\N
5	dark	female	6	2025-09-03 18:10:58	2025-09-03 18:10:58	\N
6	light	male	8	2025-09-03 18:10:58	2025-09-03 18:10:58	\N
7	light	female	1	2025-09-03 18:10:58	2025-09-03 18:10:58	\N
8	dark	male	6	2025-09-03 18:10:58	2025-09-03 18:10:58	\N
9	dark	female	6	2025-09-03 18:10:58	2025-09-03 18:10:58	\N
10	system	female	6	2025-09-03 18:10:58	2025-09-03 18:10:58	\N
\.


--
-- Data for Name: raja_ongkir_cities; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.raja_ongkir_cities (id, name, type, postal_code, province_id, created_at, updated_at, deleted_at) FROM stdin;
1	MATARAM	\N	\N	1	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
2	BIMA	\N	\N	1	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
3	DOMPU	\N	\N	1	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
4	LOMBOK TENGAH	\N	\N	1	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
5	LOMBOK TIMUR	\N	\N	1	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
7	SUMBAWA	\N	\N	1	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
8	LOMBOK BARAT	\N	\N	1	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
9	LOMBOK UTARA	\N	\N	1	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
10	SUMBAWA BARAT	\N	\N	1	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
11	AMBON	\N	\N	2	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
12	MALUKU TENGAH	\N	\N	2	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
14	MALUKU TENGGARA	\N	\N	2	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
15	TUAL	\N	\N	2	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
16	BURU	\N	\N	2	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
17	BURU SELATAN	\N	\N	2	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
19	KEPULAUAN ARU	\N	\N	2	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
21	SERAM BAGIAN BARAT	\N	\N	2	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
23	SERAM BAGIAN TIMUR	\N	\N	2	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
24	MALUKU BARAT DAYA	\N	\N	2	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
25	MALUKU TENGGARA BARAT	\N	\N	2	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
29	BANJARMASIN	\N	\N	3	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
30	HULU SUNGAI TENGAH	\N	\N	3	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
32	HULU SUNGAI SELATAN	\N	\N	3	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
34	KOTABARU	\N	\N	3	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
35	TABALONG	\N	\N	3	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
36	BANJARBARU	\N	\N	3	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
38	HULU SUNGAI UTARA	\N	\N	3	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
39	BARITO KUALA	\N	\N	3	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
40	BANJAR	\N	\N	3	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
42	TANAH LAUT	\N	\N	3	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
44	TAPIN	\N	\N	3	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
53	BALANGAN	\N	\N	3	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
54	TANAH BUMBU	\N	\N	3	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
46	BARITO UTARA	\N	\N	4	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
48	BARITO TIMUR	\N	\N	4	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
50	MURUNG RAYA	\N	\N	4	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
52	BARITO SELATAN	\N	\N	4	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
456	PALANGKA RAYA	\N	\N	4	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
458	KATINGAN	\N	\N	4	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
460	KAPUAS	\N	\N	4	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
462	GUNUNG MAS	\N	\N	4	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
464	SERUYAN	\N	\N	4	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
466	KOTAWARINGIN BARAT	\N	\N	4	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
468	KOTAWARINGIN TIMUR	\N	\N	4	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
470	LAMANDAU	\N	\N	4	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
471	PULANG PISAU	\N	\N	4	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
472	SUKAMARA	\N	\N	4	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
55	BANDUNG	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
56	CIMAHI	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
57	SUMEDANG	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
59	GARUT	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
60	BANDUNG BARAT	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
62	CIANJUR	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
63	BEKASI	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
77	BOGOR	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
129	CIREBON	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
131	INDRAMAYU	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
132	KUNINGAN	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
133	MAJALENGKA	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
199	DEPOK	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
329	KARAWANG	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
532	PURWAKARTA	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
533	SUBANG	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
538	SUKABUMI	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
632	TASIKMALAYA	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
633	BANJAR	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
634	CIAMIS	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
635	PANGANDARAN	\N	\N	5	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
64	BENGKULU	\N	\N	6	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
65	BENGKULU UTARA	\N	\N	6	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
66	BENGKULU TENGAH	\N	\N	6	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
67	REJANG LEBONG	\N	\N	6	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
68	BENGKULU SELATAN	\N	\N	6	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
69	KAUR	\N	\N	6	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
70	KEPAHIANG	\N	\N	6	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
71	LEBONG	\N	\N	6	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
73	MUKO MUKO	\N	\N	6	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
76	SELUMA	\N	\N	6	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
78	BALIKPAPAN	\N	\N	7	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
79	KUTAI KARTANEGARA	\N	\N	7	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
80	PASER	\N	\N	7	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
81	BERAU	\N	\N	7	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
83	PENAJAM PASER UTARA	\N	\N	7	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
84	BONTANG	\N	\N	7	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
86	KUTAI TIMUR	\N	\N	7	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
534	SAMARINDA	\N	\N	7	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
536	KUTAI BARAT	\N	\N	7	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
537	MAHAKAM ULU	\N	\N	7	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
90	BATAM	\N	\N	8	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
92	LINGGA	\N	\N	8	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
94	NATUNA	\N	\N	8	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
95	KEPULAUAN ANAMBAS	\N	\N	8	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
96	KARIMUN	\N	\N	8	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
619	TANJUNG PINANG	\N	\N	8	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
624	BINTAN	\N	\N	8	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
97	BANDA ACEH	\N	\N	9	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
98	LANGSA	\N	\N	9	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
100	LHOKSEUMAWE	\N	\N	9	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
101	ACEH BESAR	\N	\N	9	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
102	BIREUEN	\N	\N	9	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
104	ACEH TENGGARA	\N	\N	9	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
106	ACEH BARAT	\N	\N	9	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
107	PIDIE	\N	\N	9	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
109	ACEH TENGAH	\N	\N	9	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
110	ACEH SELATAN	\N	\N	9	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
111	SABANG	\N	\N	9	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
112	ACEH BARAT DAYA	\N	\N	9	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
113	ACEH JAYA	\N	\N	9	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
114	ACEH SINGKIL	\N	\N	9	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
116	ACEH TAMIANG	\N	\N	9	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
117	ACEH TIMUR	\N	\N	9	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
118	ACEH UTARA	\N	\N	9	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
120	BENER MERIAH	\N	\N	9	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
122	GAYO LUES	\N	\N	9	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
124	NAGAN RAYA	\N	\N	9	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
125	PIDIE JAYA	\N	\N	9	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
127	SIMEULUE	\N	\N	9	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
128	SUBULUSSALAM	\N	\N	9	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
135	JAKARTA BARAT	\N	\N	10	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
136	JAKARTA SELATAN	\N	\N	10	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
137	JAKARTA PUSAT	\N	\N	10	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
138	JAKARTA UTARA	\N	\N	10	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
139	JAKARTA TIMUR	\N	\N	10	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
141	KEPULAUAN SERIBU	\N	\N	10	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
143	CILEGON	\N	\N	11	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
144	PANDEGLANG	\N	\N	11	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
147	LEBAK	\N	\N	11	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
148	SERANG	\N	\N	11	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
592	TANGERANG	\N	\N	11	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
594	TANGERANG SELATAN	\N	\N	11	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
149	CILACAP	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
383	MAGELANG	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
384	KEBUMEN	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
385	WONOSOBO	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
386	PURWOREJO	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
387	TEMANGGUNG	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
539	SURAKARTA	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
540	BOYOLALI	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
541	KARANGANYAR	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
542	KLATEN	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
543	SRAGEN	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
544	SUKOHARJO	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
545	WONOGIRI	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
560	SEMARANG	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
561	JEPARA	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
562	KUDUS	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
563	PEKALONGAN	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
564	BATANG	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
565	BLORA	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
567	DEMAK	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
568	KENDAL	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
569	PATI	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
570	PEMALANG	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
571	GROBOGAN	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
572	REMBANG	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
573	SALATIGA	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
575	PURBALINGGA	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
576	BANJARNEGARA	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
588	TEGAL	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
589	BREBES	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
591	BANYUMAS	\N	\N	12	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
150	JAMBI	\N	\N	13	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
152	TANJUNG JABUNG BARAT	\N	\N	13	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
153	MERANGIN	\N	\N	13	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
154	BATANG HARI	\N	\N	13	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
156	BUNGO	\N	\N	13	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
157	SUNGAIPENUH	\N	\N	13	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
158	KERINCI	\N	\N	13	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
160	MUARO JAMBI	\N	\N	13	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
161	SAROLANGUN	\N	\N	13	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
163	TANJUNG JABUNG TIMUR	\N	\N	13	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
164	TEBO	\N	\N	13	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
165	JAYAPURA	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
166	BIAK NUMFOR	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
167	MERAUKE	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
168	NABIRE	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
169	DOGIYAI	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
171	KEPULAUAN YAPEN	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
172	JAYAWIJAYA	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
174	LANNY JAYA	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
175	YALIMO	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
176	NDUGA	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
177	MAMBERAMO TENGAH	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
178	ASMAT	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
180	BOVEN DIGOEL	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
181	KEEROM	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
183	MAPPI	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
184	INTAN JAYA	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
185	PANIAI	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
186	DEIYAI	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
187	PEGUNUNGAN BINTANG	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
188	PUNCAK JAYA	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
189	PUNCAK	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
190	SARMI	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
192	SUPIORI	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
193	TOLIKARA	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
195	WAROPEN	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
196	YAHUKIMO	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
198	MAMBERAMO RAYA	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
595	MIMIKA	\N	\N	14	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
201	DENPASAR	\N	\N	15	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
203	KARANGASEM	\N	\N	15	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
204	BANGLI	\N	\N	15	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
205	GIANYAR	\N	\N	15	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
206	JEMBRANA	\N	\N	15	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
208	KLUNGKUNG	\N	\N	15	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
210	BULELENG	\N	\N	15	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
211	TABANAN	\N	\N	15	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
212	BADUNG	\N	\N	15	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
218	TOBA SAMOSIR	\N	\N	16	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
219	GUNUNGSITOLI	\N	\N	16	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
220	NIAS	\N	\N	16	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
221	NIAS BARAT	\N	\N	16	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
222	NIAS SELATAN	\N	\N	16	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
223	NIAS UTARA	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
225	SIBOLGA	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
226	TAPANULI TENGAH	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
227	PADANG SIDEMPUAN	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
228	TAPANULI SELATAN	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
229	TAPANULI UTARA	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
231	PADANG LAWAS UTARA	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
239	HUMBANG HASUNDUTAN	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
240	MANDAILING NATAL	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
243	PADANG LAWAS	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
361	MEDAN	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
363	ASAHAN	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
364	DAIRI	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
365	DELI SERDANG	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
366	BINJAI	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
368	SIMALUNGUN	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
370	LABUHANBATU UTARA	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
371	LABUHANBATU	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
372	LABUHANBATU SELATAN	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
374	KARO	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
375	LANGKAT	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
376	SERDANG BEDAGAI	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
377	TEBING TINGGI	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
378	BATU BARA	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
379	PAKPAK BHARAT	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
380	SAMOSIR	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
381	TANJUNG BALAI	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
382	PEMATANG SIANTAR	\N	\N	16	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
251	GORONTALO	\N	\N	17	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
252	GORONTALO UTARA	\N	\N	17	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
253	BOALEMO	\N	\N	17	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
254	BONE BOLANGO	\N	\N	17	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
255	POHUWATO	\N	\N	17	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
256	JEMBER	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
257	BANYUWANGI	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
258	BONDOWOSO	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
289	KEDIRI	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
353	MADIUN	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
355	MAGETAN	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
357	NGAWI	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
359	PACITAN	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
360	PONOROGO	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
388	MOJOKERTO	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
389	JOMBANG	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
390	NGANJUK	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
391	MALANG	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
392	BLITAR	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
393	BATU	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
394	PROBOLINGGO	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
395	LUMAJANG	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
396	SITUBONDO	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
531	PASURUAN	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
566	BOJONEGORO	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
577	SURABAYA	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
578	GRESIK	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
579	LAMONGAN	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
580	BANGKALAN	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
581	PAMEKASAN	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
582	SAMPANG	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
583	SIDOARJO	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
584	SUMENEP	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
585	TUBAN	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
586	TULUNGAGUNG	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
587	TRENGGALEK	\N	\N	18	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
259	YOGYAKARTA	\N	\N	19	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
260	BANTUL	\N	\N	19	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
261	SLEMAN	\N	\N	19	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
262	KULON PROGO	\N	\N	19	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
263	GUNUNG KIDUL	\N	\N	19	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
264	KENDARI	\N	\N	20	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
267	BAU-BAU	\N	\N	20	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
268	KOLAKA	\N	\N	20	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
269	KOLAKA TIMUR	\N	\N	20	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
271	BUTON UTARA	\N	\N	20	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
272	MUNA	\N	\N	20	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
273	MUNA BARAT	\N	\N	20	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
276	KONAWE	\N	\N	20	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
277	KONAWE UTARA	\N	\N	20	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
280	BOMBANA	\N	\N	20	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
281	BUTON	\N	\N	20	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
282	BUTON SELATAN	\N	\N	20	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
283	BUTON TENGAH	\N	\N	20	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
285	KOLAKA UTARA	\N	\N	20	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
286	KONAWE SELATAN	\N	\N	20	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
287	WAKATOBI	\N	\N	20	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
288	KONAWE KEPULAUAN	\N	\N	20	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
290	KUPANG	\N	\N	21	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
292	SUMBA TENGAH	\N	\N	21	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
293	BELU	\N	\N	21	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
294	MALAKA	\N	\N	21	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
296	ALOR	\N	\N	21	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
297	TIMOR TENGAH UTARA	\N	\N	21	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
298	FLORES TIMUR	\N	\N	21	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
300	SIKKA	\N	\N	21	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
301	MANGGARAI	\N	\N	21	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
308	TIMOR TENGAH SELATAN	\N	\N	21	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
309	ENDE	\N	\N	21	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
310	NGADA	\N	\N	21	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
313	SUMBA TIMUR	\N	\N	21	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
314	SUMBA BARAT	\N	\N	21	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
318	MANGGARAI BARAT	\N	\N	21	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
319	MANGGARAI TIMUR	\N	\N	21	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
321	NAGEKEO	\N	\N	21	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
323	ROTE NDAO	\N	\N	21	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
325	SUMBA BARAT DAYA	\N	\N	21	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
326	LEMBATA	\N	\N	21	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
328	SABU RAIJUA	\N	\N	21	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
330	MANADO	\N	\N	22	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
331	KOTAMOBAGU	\N	\N	22	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
332	BOLAANG MONGONDOW UTARA	\N	\N	22	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
333	BOLAANG MONGONDOW	\N	\N	22	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
335	BOLAANG MONGONDOW SELATAN	\N	\N	22	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
336	BOLAANG MONGONDOW TIMUR	\N	\N	22	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
338	KEPULAUAN SANGIHE	\N	\N	22	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
339	KEPULAUAN SIAU TAGULANDANG BIARO (SITARO)	\N	\N	22	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
341	MINAHASA	\N	\N	22	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
342	BITUNG	\N	\N	22	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
347	KEPULAUAN TALAUD	\N	\N	22	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
348	MINAHASA UTARA	\N	\N	22	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
349	MINAHASA SELATAN	\N	\N	22	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
351	MINAHASA TENGGARA	\N	\N	22	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
352	TOMOHON	\N	\N	22	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
397	PADANG	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
399	TANAH DATAR	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
401	BUKITTINGGI	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
402	PASAMAN	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
404	PESISIR SELATAN	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
405	PARIAMAN	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
406	PADANG PARIAMAN	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
407	LIMA PULUH KOTA	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
408	PAYAKUMBUH	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
410	SAWAH LUNTO	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
411	SOLOK	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
412	PADANG PANJANG	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
413	DHARMASRAYA	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
416	KEPULAUAN MENTAWAI	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
419	PASAMAN BARAT	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
424	SOLOK SELATAN	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
426	SIJUNJUNG	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
427	AGAM	\N	\N	23	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
428	PANGKAL PINANG	\N	\N	24	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
429	BANGKA	\N	\N	24	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
430	BANGKA BARAT	\N	\N	24	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
431	BANGKA TENGAH	\N	\N	24	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
432	BANGKA SELATAN	\N	\N	24	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
596	BELITUNG	\N	\N	24	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
597	BELITUNG TIMUR	\N	\N	24	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
433	PEKANBARU	\N	\N	25	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
434	DUMAI	\N	\N	25	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
435	KAMPAR	\N	\N	25	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
436	BENGKALIS	\N	\N	25	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
438	INDRAGIRI HULU	\N	\N	25	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
439	INDRAGIRI HILIR	\N	\N	25	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
441	ROKAN HILIR	\N	\N	25	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
443	KUANTAN SINGINGI	\N	\N	25	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
444	PELALAWAN	\N	\N	25	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
447	ROKAN HULU	\N	\N	25	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
451	SIAK	\N	\N	25	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
454	KEPULAUAN MERANTI	\N	\N	25	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
473	PALEMBANG	\N	\N	26	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
475	MUSI RAWAS	\N	\N	26	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
476	MUSI RAWAS UTARA	\N	\N	26	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
479	OGAN KOMERING ULU	\N	\N	26	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
480	OGAN KOMERING ILIR	\N	\N	26	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
482	LAHAT	\N	\N	26	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
485	MUARA ENIM	\N	\N	26	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
486	PENUKAL ABAB LEMATANG ILIR	\N	\N	26	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
487	PAGAR ALAM	\N	\N	26	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
488	PRABUMULIH	\N	\N	26	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
489	MUSI BANYUASIN	\N	\N	26	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
491	BANYUASIN	\N	\N	26	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
492	EMPAT LAWANG	\N	\N	26	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
493	OGAN ILIR	\N	\N	26	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
494	OGAN KOMERING ULU TIMUR	\N	\N	26	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
495	OGAN KOMERING ULU SELATAN	\N	\N	26	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
496	LUBUK LINGGAU	\N	\N	26	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
497	PALU	\N	\N	27	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
498	BANGGAI	\N	\N	27	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
499	POSO	\N	\N	27	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
500	TOLI-TOLI	\N	\N	27	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
501	BANGGAI LAUT	\N	\N	27	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
502	BANGGAI KEPULAUAN	\N	\N	27	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
504	BUOL	\N	\N	27	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
505	DONGGALA	\N	\N	27	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
507	SIGI	\N	\N	27	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
509	MOROWALI	\N	\N	27	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
510	MOROWALI UTARA	\N	\N	27	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
511	PARIGI MOUTONG	\N	\N	27	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
512	TOJO UNA-UNA	\N	\N	27	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
513	PONTIANAK	\N	\N	28	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
514	KETAPANG	\N	\N	28	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
515	SANGGAU	\N	\N	28	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
516	SINGKAWANG	\N	\N	28	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
517	SINTANG	\N	\N	28	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
519	KAPUAS HULU	\N	\N	28	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
522	BENGKAYANG	\N	\N	28	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
523	LANDAK	\N	\N	28	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
524	MELAWI	\N	\N	28	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
526	MEMPAWAH	\N	\N	28	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
527	KUBU RAYA	\N	\N	28	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
528	SAMBAS	\N	\N	28	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
529	SEKADAU	\N	\N	28	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
530	KAYONG UTARA	\N	\N	28	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
546	SORONG	\N	\N	29	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
547	TAMBRAUW	\N	\N	29	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
548	FAKFAK	\N	\N	29	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
549	KAIMANA	\N	\N	29	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
551	RAJA AMPAT	\N	\N	29	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
552	SORONG SELATAN	\N	\N	29	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
553	MAYBRAT	\N	\N	29	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
554	TELUK BINTUNI	\N	\N	29	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
556	TELUK WONDAMA	\N	\N	29	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
557	MANOKWARI	\N	\N	29	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
558	PEGUNUNGAN ARFAK	\N	\N	29	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
559	MANOKWARI SELATAN	\N	\N	29	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
598	BANDAR LAMPUNG	\N	\N	30	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
599	LAMPUNG SELATAN	\N	\N	30	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
600	LAMPUNG UTARA	\N	\N	30	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
601	METRO	\N	\N	30	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
603	LAMPUNG BARAT	\N	\N	30	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
604	PESISIR BARAT	\N	\N	30	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
605	LAMPUNG TENGAH	\N	\N	30	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
607	LAMPUNG TIMUR	\N	\N	30	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
608	WAY KANAN	\N	\N	30	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
609	TULANG BAWANG	\N	\N	30	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
610	MESUJI	\N	\N	30	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
611	TULANG BAWANG BARAT	\N	\N	30	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
615	PRINGSEWU	\N	\N	30	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
616	TANGGAMUS	\N	\N	30	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
618	PESAWARAN	\N	\N	30	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
626	TARAKAN	\N	\N	31	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
627	BULUNGAN	\N	\N	31	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
628	MALINAU	\N	\N	31	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
629	NUNUKAN	\N	\N	31	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
631	TANA TIDUNG	\N	\N	31	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
636	TERNATE	\N	\N	32	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
637	HALMAHERA BARAT	\N	\N	32	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
639	HALMAHERA SELATAN	\N	\N	32	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
640	HALMAHERA TENGAH	\N	\N	32	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
641	HALMAHERA TIMUR	\N	\N	32	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
642	HALMAHERA UTARA	\N	\N	32	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
643	PULAU MOROTAI	\N	\N	32	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
644	KEPULAUAN SULA	\N	\N	32	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
646	PULAU TALIABU	\N	\N	32	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
647	TIDORE KEPULAUAN	\N	\N	32	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
648	MAKASSAR	\N	\N	33	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
649	BANTAENG	\N	\N	33	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
650	BARRU	\N	\N	33	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
651	BULUKUMBA	\N	\N	33	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
652	ENREKANG	\N	\N	33	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
653	JENEPONTO	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
654	TANA TORAJA	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
655	TORAJA UTARA	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
659	MAROS	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
663	PALOPO	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
664	PINRANG	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
667	SIDENRENG RAPPANG	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
670	WAJO	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
671	SINJAI	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
673	GOWA	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
674	TAKALAR	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
676	BONE	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
678	SOPPENG	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
679	KEPULAUAN SELAYAR	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
680	PANGKAJENE KEPULAUAN	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
683	PAREPARE	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
684	LUWU	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
685	LUWU TIMUR	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
686	LUWU UTARA	\N	\N	33	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
657	MAMUJU	\N	\N	34	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
658	MAMUJU TENGAH	\N	\N	34	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
662	MAJENE	\N	\N	34	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
665	POLEWALI MANDAR	\N	\N	34	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
687	MAMASA	\N	\N	34	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
688	MAMUJU UTARA	\N	\N	34	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
\.


--
-- Data for Name: raja_ongkir_couriers; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.raja_ongkir_couriers (id, code, created_at, updated_at, deleted_at) FROM stdin;
1	jne	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
2	pos	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
3	tiki	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
4	rpx	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
5	esl	2025-09-03 18:11:34	2025-09-03 18:11:34	\N
6	pcp	2025-09-03 18:11:34	2025-09-03 18:11:34	\N
7	pandu	2025-09-03 18:11:34	2025-09-03 18:11:34	\N
8	wahana	2025-09-03 18:11:34	2025-09-03 18:11:34	\N
9	sicepat	2025-09-03 18:11:34	2025-09-03 18:11:34	\N
10	jnt	2025-09-03 18:11:34	2025-09-03 18:11:34	\N
11	pahata	2025-09-03 18:11:34	2025-09-03 18:11:34	\N
12	cahaya	2025-09-03 18:11:34	2025-09-03 18:11:34	\N
13	sap	2025-09-03 18:11:34	2025-09-03 18:11:34	\N
14	jet	2025-09-03 18:11:35	2025-09-03 18:11:35	\N
15	indah	2025-09-03 18:11:35	2025-09-03 18:11:35	\N
16	dse	2025-09-03 18:11:36	2025-09-03 18:11:36	\N
17	slis	2025-09-03 18:11:36	2025-09-03 18:11:36	\N
18	first	2025-09-03 18:11:36	2025-09-03 18:11:36	\N
19	ncs	2025-09-03 18:11:36	2025-09-03 18:11:36	\N
20	star	2025-09-03 18:11:36	2025-09-03 18:11:36	\N
\.


--
-- Data for Name: raja_ongkir_provinces; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.raja_ongkir_provinces (id, name, created_at, updated_at, deleted_at) FROM stdin;
1	NUSA TENGGARA BARAT (NTB)	2025-09-03 18:11:03	2025-09-03 18:11:03	\N
2	MALUKU	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
3	KALIMANTAN SELATAN	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
4	KALIMANTAN TENGAH	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
5	JAWA BARAT	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
6	BENGKULU	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
7	KALIMANTAN TIMUR	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
8	KEPULAUAN RIAU	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
9	NANGGROE ACEH DARUSSALAM (NAD)	2025-09-03 18:11:04	2025-09-03 18:11:04	\N
10	DKI JAKARTA	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
11	BANTEN	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
12	JAWA TENGAH	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
13	JAMBI	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
14	PAPUA	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
15	BALI	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
16	SUMATERA UTARA	2025-09-03 18:11:05	2025-09-03 18:11:05	\N
17	GORONTALO	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
18	JAWA TIMUR	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
19	DI YOGYAKARTA	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
20	SULAWESI TENGGARA	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
21	NUSA TENGGARA TIMUR (NTT)	2025-09-03 18:11:06	2025-09-03 18:11:06	\N
22	SULAWESI UTARA	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
23	SUMATERA BARAT	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
24	BANGKA BELITUNG	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
25	RIAU	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
26	SUMATERA SELATAN	2025-09-03 18:11:07	2025-09-03 18:11:07	\N
27	SULAWESI TENGAH	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
28	KALIMANTAN BARAT	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
29	PAPUA BARAT	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
30	LAMPUNG	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
31	KALIMANTAN UTARA	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
32	MALUKU UTARA	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
33	SULAWESI SELATAN	2025-09-03 18:11:08	2025-09-03 18:11:08	\N
34	SULAWESI BARAT	2025-09-03 18:11:09	2025-09-03 18:11:09	\N
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.reviews (id, star, message, is_published, order_item_id, product_id, user_id, created_at, updated_at, deleted_at) FROM stdin;
1	5	Incidunt voluptatem mollitia voluptas sint enim explicabo consequuntur. Saepe facere nostrum voluptatum officia vitae porro quis amet.	t	10	14	1	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
2	5	Voluptatem nemo delectus quisquam ipsum sed. Maiores sed ducimus labore et vitae.	f	39	1	16	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
3	4	Perferendis dolores quod voluptatem cumque optio tenetur. Cupiditate dolorem labore aperiam earum quis.	t	12	5	1	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
4	2	Sed delectus illo inventore sunt corporis et. Voluptatem fugit dolorem illo voluptas et pariatur dolorum architecto.	t	22	6	13	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
5	2	Repellendus quaerat sit neque.	t	32	3	5	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
6	5	Facere et consequatur eligendi perspiciatis. Omnis voluptatem possimus sunt consequatur.	t	1	2	12	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
7	4	Est numquam consectetur voluptatem ad.	f	5	14	18	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
8	2	Et quis necessitatibus eos aperiam.	t	42	9	21	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
9	5	Similique suscipit et nesciunt cum neque.	f	11	16	16	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
10	3	Quam debitis laboriosam omnis ut suscipit mollitia. Dignissimos qui harum voluptatibus velit repellat repudiandae corporis.	t	1	3	4	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
11	3	Laborum sint assumenda praesentium voluptatem. Maxime dolore quia aut doloribus quasi.	t	12	8	11	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
12	4	Non ducimus ea adipisci dolorem voluptatem velit.	t	42	7	15	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
13	4	Et est consequatur et in natus recusandae aut. Sit dolores ratione dicta voluptatum optio ab omnis.	t	47	5	5	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
14	5	Omnis facere ut blanditiis non labore aut voluptatem.	t	29	12	14	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
15	3	Ducimus cupiditate et voluptatem consequatur.	t	5	3	11	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
16	1	Nemo laudantium qui et eligendi.	t	20	5	11	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
17	3	Voluptatum aut asperiores cupiditate molestiae ut. Ea vel quasi totam ipsum qui doloribus.	t	31	20	12	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
18	4	Exercitationem qui incidunt velit provident. Aspernatur repellat dolore et nisi autem.	f	13	7	7	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
19	4	Sed animi adipisci quidem eius. Et ab sequi provident rerum dolores.	f	19	3	16	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
20	5	Dolorem amet quasi iusto sapiente placeat explicabo. Id vero voluptatum sed vel in.	t	40	13	10	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
21	1	Voluptates totam quia numquam illum fugit. Enim error saepe natus perferendis.	t	3	11	17	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
22	2	Velit necessitatibus magni voluptate incidunt praesentium. Voluptas perferendis omnis quas sit consequuntur sunt aperiam.	f	25	4	15	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
23	3	Magnam fugiat doloribus optio impedit odit. Amet consequuntur accusamus minima voluptas ut quis perspiciatis.	t	15	4	20	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
24	5	Qui modi beatae architecto minima eveniet sunt. Sed aperiam quibusdam aut inventore reprehenderit inventore numquam ullam.	t	40	14	9	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
25	5	Omnis quod et id est magni accusamus.	t	16	14	13	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
26	4	Rerum sapiente doloremque totam repellat nesciunt.	f	30	3	16	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
27	1	Totam natus inventore nostrum nisi. Perferendis laudantium explicabo numquam quae nobis recusandae.	t	7	14	17	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
28	1	In repellat laborum dolorem dolorem soluta quis dolores voluptatem. Quasi rem aspernatur reprehenderit nam.	t	12	14	11	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
29	2	Et id iste voluptas dicta quibusdam ut. Totam commodi qui sit in aut.	t	31	19	14	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
30	4	Repudiandae veniam perferendis quae ut aliquid est distinctio.	t	12	12	2	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
31	4	Officia inventore illo et.	f	18	3	12	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
32	5	Quia provident corrupti aut saepe. Magni dolores accusantium inventore beatae eum nam velit.	t	12	13	19	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
33	4	Sed velit minus consequatur earum maiores quam. Cumque est est velit molestias impedit quasi.	t	28	17	6	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
34	4	Eligendi laboriosam labore velit eius. Laboriosam ut fugit rerum iusto et omnis.	t	16	5	10	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
35	2	Iste illo incidunt at minima neque. Illo tenetur natus sed iusto aut eaque vitae.	t	35	17	21	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
36	5	Architecto perspiciatis magnam aut non ipsa. Consequuntur voluptates et sed eum qui repellat.	t	11	1	3	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
37	2	Nihil animi perspiciatis fuga vel impedit tempore.	t	38	16	18	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
38	2	Nobis asperiores et quod.	f	50	12	20	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
39	4	Consequuntur laboriosam quia accusamus maxime. Fugiat et aliquam vitae nam reiciendis dolore blanditiis harum.	t	30	5	1	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
40	2	Voluptatibus quia consequatur totam laudantium repudiandae. Vitae esse ad impedit qui error hic sint.	t	34	2	9	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
41	3	Distinctio tempore et laborum voluptas sit assumenda quod hic. Aut a non repellendus.	t	3	6	14	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
42	5	Itaque saepe quia architecto incidunt totam.	f	5	14	1	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
43	3	Veritatis qui labore nam dicta voluptatem natus eius est.	t	44	17	15	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
44	3	Odit iusto dicta labore sed animi. Aut in incidunt tempora rerum culpa mollitia et.	t	33	12	21	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
45	4	Vero laboriosam recusandae saepe. Earum officiis ad quia fugit sequi ea quo.	t	33	3	4	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
46	4	Nesciunt earum at voluptatem molestiae.	t	23	3	2	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
47	5	Magni aperiam illo et sit velit quaerat.	t	38	20	20	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
48	3	Rerum ex totam quia laborum consequatur.	t	36	5	3	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
49	1	Voluptate aut sunt consequatur et consequatur molestias nemo.	t	46	12	17	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
50	3	Mollitia eius expedita amet maxime dolor ut cumque.	f	38	6	20	2025-09-03 18:11:58	2025-09-03 18:11:58	\N
\.


--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
3	1
4	1
5	1
1	1
2	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
52	1
53	1
54	1
55	1
56	1
57	1
58	1
59	1
60	1
61	1
62	1
1	3
2	3
2	4
63	1
64	1
65	1
66	1
67	1
68	1
69	1
70	1
71	1
72	1
73	1
74	1
75	1
76	1
77	1
78	1
79	1
80	1
81	1
82	1
83	1
84	1
85	1
86	1
87	1
88	1
89	1
90	1
91	1
92	1
93	1
94	1
95	1
96	1
97	1
98	1
99	1
100	1
101	1
102	1
103	1
104	1
105	1
106	1
107	1
108	1
109	1
110	1
111	1
112	1
113	1
114	1
115	1
116	1
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
1	super_admin	web	2025-09-03 18:10:48	2025-09-03 18:10:48
2	panel_user	web	2025-09-03 18:10:48	2025-09-03 18:10:48
3	admin	web	2025-09-03 18:10:48	2025-09-03 18:10:48
4	user	web	2025-09-03 18:10:49	2025-09-03 18:10:49
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
TEVyxeFzm6Kt7m8lx5xaYxgzL2oKi9NSs1aJF0K7	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSlFKbmlOSkphemlIV0JWWDJHdGtNSUpNamp4TDRxeldPT3hvMjJLaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vZnJlc2hiaXRlLWR1bW15LmludGVybmFsL2FkbWluL29yZGVycyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRzZkR4YWdSLlpEcDdRT0hyNGt6MEVPRndKbjJxdU1kVzJKM3NWODNVQ2trZFg5bjZ4ZkMxQyI7fQ==	1756924392
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.users (id, name, avatar, email, email_verified_at, password, remember_token, created_at, updated_at, deleted_at) FROM stdin;
1	Admin	https://i.pravatar.cc/200?img=17	admin@freshbite.com	2025-09-03 18:10:55	$2y$12$sfDxagR.ZDp7QOHr4kz0EOFwJn2quMdW2J3sV83UCkkdX9n6xfC1C	\N	2025-09-03 18:10:56	2025-09-03 18:10:56	\N
2	Destini Marquardt	https://i.pravatar.cc/200?img=45	shanon.murray@example.net	2025-09-03 18:10:56	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	KMBMjku8aY	2025-01-08 15:54:24	2025-03-28 23:54:03	\N
3	Janessa Kohler	https://i.pravatar.cc/200?img=41	olebsack@example.com	2025-09-03 18:10:57	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	RapNxx8yMl	2024-11-18 11:34:34	2025-07-26 13:58:41	\N
4	Miss Maye Hills	https://i.pravatar.cc/200?img=33	moore.jacinthe@example.com	2025-09-03 18:10:57	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	rZKXrFHkeb	2025-08-14 04:13:21	2025-08-25 02:10:06	\N
5	Jacinto Marvin III	https://i.pravatar.cc/200?img=23	langworth.peggie@example.net	2025-09-03 18:10:57	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	KbdZZObV6q	2025-05-13 04:55:53	2025-08-07 16:50:59	\N
6	Ms. Haylie Heller	https://i.pravatar.cc/200?img=8	pdickinson@example.com	2025-09-03 18:10:57	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	stglqinYEt	2025-09-02 15:45:48	2025-09-03 11:42:05	\N
7	Prof. Elwin Fisher I	https://i.pravatar.cc/200?img=65	lexi.schneider@example.net	2025-09-03 18:10:57	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	tMMW7F9n8s	2025-01-04 11:12:33	2025-08-16 15:56:57	\N
8	Joy Christiansen	https://i.pravatar.cc/200?img=30	cicero24@example.net	2025-09-03 18:10:57	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	QQdizFvgrf	2025-06-14 18:48:49	2025-06-16 23:26:27	\N
9	Miss Aimee Huels	https://i.pravatar.cc/200?img=12	frice@example.net	2025-09-03 18:10:57	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	rFEv6Dttso	2025-02-13 02:02:36	2025-02-18 03:42:37	\N
10	Prof. Sandra Mitchell DVM	https://i.pravatar.cc/200?img=25	jazmin79@example.org	2025-09-03 18:10:57	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	GE9Q4jc0Bs	2025-07-09 20:16:18	2025-07-30 22:36:04	\N
11	Scot Ondricka	https://i.pravatar.cc/200?img=65	emmerich.willard@example.net	2025-09-03 18:10:57	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	tzJtkmJd9R	2024-11-03 22:55:17	2025-06-07 14:18:52	\N
12	Calista Franecki	https://i.pravatar.cc/200?img=54	gonzalo.smitham@example.net	2025-09-03 18:11:16	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	bAcHWkyjU2	2025-01-18 11:40:07	2025-02-18 01:22:07	\N
13	Cyril Ondricka	https://i.pravatar.cc/200?img=59	verner62@example.org	2025-09-03 18:11:17	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	21Gaz2S98T	2025-05-06 02:01:50	2025-09-02 12:14:11	\N
14	Emerson Yundt	https://i.pravatar.cc/200?img=40	bryon85@example.org	2025-09-03 18:11:18	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	SUtj3nfjIc	2024-09-11 13:16:45	2025-02-26 02:11:46	\N
15	Rozella Ritchie	https://i.pravatar.cc/200?img=29	tom.shields@example.net	2025-09-03 18:11:18	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	ABgCAL1EmN	2024-09-04 15:38:54	2025-06-10 09:20:52	\N
16	Lorena Koch	https://i.pravatar.cc/200?img=62	alba02@example.org	2025-09-03 18:11:18	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	CJhmBe5GRN	2025-04-15 05:52:58	2025-09-03 01:17:55	\N
17	Mackenzie Fisher	https://i.pravatar.cc/200?img=44	psenger@example.org	2025-09-03 18:11:18	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	a6WfN0GqeD	2025-04-07 03:14:27	2025-04-23 13:57:13	\N
18	Geo Kemmer	https://i.pravatar.cc/200?img=60	loren90@example.com	2025-09-03 18:11:18	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	zv0fs5TYQR	2025-01-31 22:36:23	2025-08-18 09:29:20	\N
19	Tania Friesen	https://i.pravatar.cc/200?img=68	littel.frankie@example.net	2025-09-03 18:11:18	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	1Uk9duedXx	2024-11-20 07:11:08	2025-05-22 09:14:04	\N
20	Einar Tillman III	https://i.pravatar.cc/200?img=11	nathanael.reichel@example.net	2025-09-03 18:11:19	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	CkeixiWuZs	2025-07-02 00:05:39	2025-07-31 10:57:57	\N
21	Kirk Glover V	https://i.pravatar.cc/200?img=31	edoyle@example.com	2025-09-03 18:11:19	$2y$12$G0X9MmX5XV8t3CDzUB2Z.uxKtPgtemHu4cpOM9HDqM4UXzFD7a2AG	pdGr07qp8T	2025-03-02 07:26:19	2025-08-21 14:19:23	\N
\.


--
-- Data for Name: wishlist_items; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.wishlist_items (id, wishlist_id, product_id, created_at, updated_at, deleted_at) FROM stdin;
1	11	12	2025-09-03 18:11:31	2025-09-03 18:11:31	\N
2	26	3	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
3	4	13	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
4	1	18	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
5	28	16	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
6	29	5	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
7	25	14	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
8	17	16	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
9	3	11	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
10	14	15	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
11	10	12	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
12	7	10	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
13	4	10	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
14	6	15	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
15	12	4	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
16	24	10	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
17	30	11	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
18	4	5	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
19	21	6	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
20	4	14	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
21	16	5	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
22	3	7	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
23	22	6	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
24	3	5	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
25	4	15	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
26	13	17	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
27	7	3	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
28	3	17	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
29	17	18	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
30	2	16	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
31	22	7	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
32	27	18	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
33	5	20	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
34	14	4	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
35	24	20	2025-09-03 18:11:32	2025-09-03 18:11:32	\N
36	17	3	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
37	3	3	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
38	29	9	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
39	10	18	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
40	3	20	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
41	10	11	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
42	2	4	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
43	1	7	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
44	6	11	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
45	10	16	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
46	17	20	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
47	28	6	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
48	13	10	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
49	12	10	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
50	15	16	2025-09-03 18:11:33	2025-09-03 18:11:33	\N
\.


--
-- Data for Name: wishlists; Type: TABLE DATA; Schema: public; Owner: user_freshbite_dummy
--

COPY public.wishlists (id, name, user_id, created_at, updated_at, deleted_at) FROM stdin;
1	Odit.	5	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
2	Mollitia.	19	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
3	Minus.	7	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
4	Unde.	19	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
5	Natus.	10	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
6	Consequuntur ut.	12	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
7	Qui error.	19	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
8	Ut.	6	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
9	Est praesentium.	9	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
10	Blanditiis.	21	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
11	Voluptatem.	21	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
12	Odit et.	18	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
13	Error rerum.	10	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
14	Quas.	20	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
15	Nesciunt.	14	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
16	Quibusdam.	11	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
17	Non ratione.	20	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
18	Ab.	16	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
19	Deserunt voluptas.	3	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
20	Nobis iure.	19	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
21	A.	11	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
22	Aut eum.	19	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
23	Sit.	17	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
24	Veritatis.	1	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
25	Error.	12	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
26	Recusandae.	10	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
27	Est.	3	2025-09-03 18:11:26	2025-09-03 18:11:26	\N
28	Labore provident.	8	2025-09-03 18:11:27	2025-09-03 18:11:27	\N
29	Error consequuntur.	9	2025-09-03 18:11:27	2025-09-03 18:11:27	\N
30	Ex et.	9	2025-09-03 18:11:27	2025-09-03 18:11:27	\N
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.addresses_id_seq', 20, true);


--
-- Name: banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.banners_id_seq', 5, true);


--
-- Name: cart_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.cart_items_id_seq', 40, true);


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.carts_id_seq', 10, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.categories_id_seq', 10, true);


--
-- Name: category_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.category_products_id_seq', 20, true);


--
-- Name: coupon_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.coupon_products_id_seq', 10, true);


--
-- Name: coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.coupons_id_seq', 10, true);


--
-- Name: exports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.exports_id_seq', 1, false);


--
-- Name: failed_import_rows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.failed_import_rows_id_seq', 1, false);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.imports_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.migrations_id_seq', 27, true);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.order_items_id_seq', 50, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.orders_id_seq', 500, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.permissions_id_seq', 116, true);


--
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.product_images_id_seq', 20, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.products_id_seq', 20, true);


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.profiles_id_seq', 10, true);


--
-- Name: raja_ongkir_cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.raja_ongkir_cities_id_seq', 1, false);


--
-- Name: raja_ongkir_couriers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.raja_ongkir_couriers_id_seq', 20, true);


--
-- Name: raja_ongkir_provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.raja_ongkir_provinces_id_seq', 1, false);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.reviews_id_seq', 50, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.users_id_seq', 21, true);


--
-- Name: wishlist_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.wishlist_items_id_seq', 50, true);


--
-- Name: wishlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user_freshbite_dummy
--

SELECT pg_catalog.setval('public.wishlists_id_seq', 30, true);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: category_products category_products_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.category_products
    ADD CONSTRAINT category_products_pkey PRIMARY KEY (id);


--
-- Name: coupon_products coupon_products_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.coupon_products
    ADD CONSTRAINT coupon_products_pkey PRIMARY KEY (id);


--
-- Name: coupons coupons_code_unique; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_code_unique UNIQUE (code);


--
-- Name: coupons coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- Name: exports exports_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.exports
    ADD CONSTRAINT exports_pkey PRIMARY KEY (id);


--
-- Name: failed_import_rows failed_import_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.failed_import_rows
    ADD CONSTRAINT failed_import_rows_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: imports imports_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT imports_pkey PRIMARY KEY (id);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: raja_ongkir_cities raja_ongkir_cities_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.raja_ongkir_cities
    ADD CONSTRAINT raja_ongkir_cities_pkey PRIMARY KEY (id);


--
-- Name: raja_ongkir_couriers raja_ongkir_couriers_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.raja_ongkir_couriers
    ADD CONSTRAINT raja_ongkir_couriers_pkey PRIMARY KEY (id);


--
-- Name: raja_ongkir_provinces raja_ongkir_provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.raja_ongkir_provinces
    ADD CONSTRAINT raja_ongkir_provinces_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wishlist_items wishlist_items_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.wishlist_items
    ADD CONSTRAINT wishlist_items_pkey PRIMARY KEY (id);


--
-- Name: wishlists wishlists_pkey; Type: CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT wishlists_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: user_freshbite_dummy
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: user_freshbite_dummy
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: user_freshbite_dummy
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- Name: notifications_notifiable_type_notifiable_id_index; Type: INDEX; Schema: public; Owner: user_freshbite_dummy
--

CREATE INDEX notifications_notifiable_type_notifiable_id_index ON public.notifications USING btree (notifiable_type, notifiable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: user_freshbite_dummy
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: user_freshbite_dummy
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: addresses addresses_city_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_city_id_foreign FOREIGN KEY (city_id) REFERENCES public.raja_ongkir_cities(id) ON DELETE CASCADE;


--
-- Name: addresses addresses_province_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_province_id_foreign FOREIGN KEY (province_id) REFERENCES public.raja_ongkir_provinces(id) ON DELETE CASCADE;


--
-- Name: addresses addresses_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: cart_items cart_items_cart_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_cart_id_foreign FOREIGN KEY (cart_id) REFERENCES public.carts(id) ON DELETE CASCADE;


--
-- Name: cart_items cart_items_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: carts carts_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: category_products category_products_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.category_products
    ADD CONSTRAINT category_products_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: category_products category_products_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.category_products
    ADD CONSTRAINT category_products_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: coupon_products coupon_products_coupon_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.coupon_products
    ADD CONSTRAINT coupon_products_coupon_id_foreign FOREIGN KEY (coupon_id) REFERENCES public.coupons(id) ON DELETE CASCADE;


--
-- Name: coupon_products coupon_products_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.coupon_products
    ADD CONSTRAINT coupon_products_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: exports exports_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.exports
    ADD CONSTRAINT exports_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: failed_import_rows failed_import_rows_import_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.failed_import_rows
    ADD CONSTRAINT failed_import_rows_import_id_foreign FOREIGN KEY (import_id) REFERENCES public.imports(id) ON DELETE CASCADE;


--
-- Name: imports imports_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT imports_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: order_items order_items_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_foreign FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: order_items order_items_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: orders orders_courier_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_courier_id_foreign FOREIGN KEY (courier_id) REFERENCES public.raja_ongkir_couriers(id) ON DELETE CASCADE;


--
-- Name: orders orders_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: product_images product_images_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: profiles profiles_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: raja_ongkir_cities raja_ongkir_cities_province_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.raja_ongkir_cities
    ADD CONSTRAINT raja_ongkir_cities_province_id_foreign FOREIGN KEY (province_id) REFERENCES public.raja_ongkir_provinces(id) ON DELETE CASCADE;


--
-- Name: reviews reviews_order_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_order_item_id_foreign FOREIGN KEY (order_item_id) REFERENCES public.order_items(id) ON DELETE CASCADE;


--
-- Name: reviews reviews_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: reviews reviews_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: wishlist_items wishlist_items_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.wishlist_items
    ADD CONSTRAINT wishlist_items_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: wishlist_items wishlist_items_wishlist_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.wishlist_items
    ADD CONSTRAINT wishlist_items_wishlist_id_foreign FOREIGN KEY (wishlist_id) REFERENCES public.wishlists(id) ON DELETE CASCADE;


--
-- Name: wishlists wishlists_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: user_freshbite_dummy
--

ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT wishlists_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict LlX242FPEkVXe7Srj0fcybYELwOWvCXNF61bwvkZlD8iZtB8UfLf1bzP8Ie0QGB

