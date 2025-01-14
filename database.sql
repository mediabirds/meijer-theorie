--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6 (Debian 16.6-1.pgdg110+1)
-- Dumped by pg_dump version 16.6 (Ubuntu 16.6-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: block_button; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.block_button (
    id uuid NOT NULL,
    sort integer,
    type character varying(255) DEFAULT NULL::character varying,
    page uuid,
    post uuid,
    label character varying(255) DEFAULT NULL::character varying,
    variant character varying(255) DEFAULT 'solid'::character varying,
    button_group uuid,
    url character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.block_button OWNER TO directus;

--
-- Name: block_button_group; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.block_button_group (
    id uuid NOT NULL,
    sort integer
);


ALTER TABLE public.block_button_group OWNER TO directus;

--
-- Name: block_form; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.block_form (
    id uuid NOT NULL,
    form uuid,
    headline text,
    tagline character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.block_form OWNER TO directus;

--
-- Name: block_gallery; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.block_gallery (
    headline text,
    id uuid NOT NULL,
    tagline character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.block_gallery OWNER TO directus;

--
-- Name: block_gallery_items; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.block_gallery_items (
    id uuid NOT NULL,
    block_gallery uuid,
    directus_file uuid,
    sort integer
);


ALTER TABLE public.block_gallery_items OWNER TO directus;

--
-- Name: block_hero; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.block_hero (
    headline text,
    id uuid NOT NULL,
    image uuid,
    button_group uuid,
    description text,
    alignment character varying(255) DEFAULT NULL::character varying,
    tagline character varying(255) DEFAULT NULL::character varying,
    layout character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.block_hero OWNER TO directus;

--
-- Name: block_posts; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.block_posts (
    id uuid NOT NULL,
    headline text,
    collection character varying(255) DEFAULT 'posts'::character varying,
    tagline character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.block_posts OWNER TO directus;

--
-- Name: block_pricing; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.block_pricing (
    id uuid NOT NULL,
    headline text,
    tagline character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.block_pricing OWNER TO directus;

--
-- Name: block_pricing_cards; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.block_pricing_cards (
    id uuid NOT NULL,
    title character varying(255) DEFAULT NULL::character varying,
    description text,
    price character varying(255) DEFAULT NULL::character varying,
    badge character varying(255) DEFAULT NULL::character varying,
    features json,
    button uuid,
    pricing uuid,
    is_highlighted boolean DEFAULT false,
    sort integer
);


ALTER TABLE public.block_pricing_cards OWNER TO directus;

--
-- Name: block_richtext; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.block_richtext (
    content text,
    headline character varying(255) DEFAULT NULL::character varying,
    id uuid NOT NULL,
    alignment character varying(255) DEFAULT 'center'::character varying,
    tagline character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.block_richtext OWNER TO directus;

--
-- Name: directus_access; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_access (
    id uuid NOT NULL,
    role uuid,
    "user" uuid,
    policy uuid NOT NULL,
    sort integer
);


ALTER TABLE public.directus_access OWNER TO directus;

--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent text,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO directus;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_activity_id_seq OWNER TO directus;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(64),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO directus;

--
-- Name: directus_comments; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_comments (
    id uuid NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


ALTER TABLE public.directus_comments OWNER TO directus;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO directus;

--
-- Name: directus_extensions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);


ALTER TABLE public.directus_extensions OWNER TO directus;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


ALTER TABLE public.directus_fields OWNER TO directus;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_fields_id_seq OWNER TO directus;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    created_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer,
    tus_id character varying(64),
    tus_data json,
    uploaded_on timestamp with time zone
);


ALTER TABLE public.directus_files OWNER TO directus;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO directus;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO directus;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO directus;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO directus;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_notifications_id_seq OWNER TO directus;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO directus;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(64) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO directus;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    policy uuid NOT NULL
);


ALTER TABLE public.directus_permissions OWNER TO directus;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_permissions_id_seq OWNER TO directus;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_policies; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_policies (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'badge'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_policies OWNER TO directus;

--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(64) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO directus;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_presets_id_seq OWNER TO directus;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO directus;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_relations_id_seq OWNER TO directus;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);


ALTER TABLE public.directus_revisions OWNER TO directus;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_revisions_id_seq OWNER TO directus;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    parent uuid
);


ALTER TABLE public.directus_roles OWNER TO directus;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent text,
    share uuid,
    origin character varying(255),
    next_token character varying(64)
);


ALTER TABLE public.directus_sessions OWNER TO directus;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json,
    report_error_url character varying(255),
    report_bug_url character varying(255),
    report_feature_url character varying(255),
    public_registration boolean DEFAULT false NOT NULL,
    public_registration_verify_email boolean DEFAULT true NOT NULL,
    public_registration_role uuid,
    public_registration_email_filter json,
    command_palette_settings json DEFAULT '{}'::json
);


ALTER TABLE public.directus_settings OWNER TO directus;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_settings_id_seq OWNER TO directus;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO directus;

--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.directus_translations OWNER TO directus;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json,
    subscription integer
);


ALTER TABLE public.directus_users OWNER TO directus;

--
-- Name: directus_versions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid,
    delta json
);


ALTER TABLE public.directus_versions OWNER TO directus;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json,
    was_active_before_deprecation boolean DEFAULT false NOT NULL,
    migrated_flow uuid
);


ALTER TABLE public.directus_webhooks OWNER TO directus;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_webhooks_id_seq OWNER TO directus;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: form_fields; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.form_fields (
    id uuid NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    type character varying(255) DEFAULT NULL::character varying,
    label character varying(255) DEFAULT NULL::character varying,
    placeholder character varying(255) DEFAULT NULL::character varying,
    help character varying(255) DEFAULT NULL::character varying,
    validation character varying(255) DEFAULT NULL::character varying,
    width character varying(255) DEFAULT NULL::character varying,
    choices json,
    form uuid,
    sort integer,
    required boolean DEFAULT false
);


ALTER TABLE public.form_fields OWNER TO directus;

--
-- Name: form_submission_values; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.form_submission_values (
    id uuid NOT NULL,
    form_submission uuid,
    field uuid,
    value text,
    sort integer,
    file uuid
);


ALTER TABLE public.form_submission_values OWNER TO directus;

--
-- Name: form_submissions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.form_submissions (
    id uuid NOT NULL,
    "timestamp" timestamp with time zone,
    form uuid
);


ALTER TABLE public.form_submissions OWNER TO directus;

--
-- Name: forms; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.forms (
    id uuid NOT NULL,
    on_success character varying(255) DEFAULT NULL::character varying,
    sort integer,
    submit_label character varying(255) DEFAULT NULL::character varying,
    success_message text,
    title character varying(255) DEFAULT NULL::character varying,
    success_redirect_url character varying(255) DEFAULT NULL::character varying,
    is_active boolean DEFAULT true,
    emails json
);


ALTER TABLE public.forms OWNER TO directus;

--
-- Name: globals; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.globals (
    description text,
    id uuid NOT NULL,
    social_links json DEFAULT '[]'::json,
    tagline character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying,
    url character varying(255) DEFAULT NULL::character varying,
    favicon uuid,
    logo uuid,
    openai_api_key character varying(255) DEFAULT NULL::character varying,
    directus_url character varying(255) DEFAULT NULL::character varying,
    primary_color character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.globals OWNER TO directus;

--
-- Name: navigation; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.navigation (
    id character varying(255) DEFAULT NULL::character varying NOT NULL,
    title character varying(255) DEFAULT NULL::character varying,
    is_active boolean DEFAULT true
);


ALTER TABLE public.navigation OWNER TO directus;

--
-- Name: navigation_items; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.navigation_items (
    id uuid NOT NULL,
    navigation character varying(255) DEFAULT NULL::character varying,
    page uuid,
    parent uuid,
    sort integer,
    title character varying(255) DEFAULT NULL::character varying,
    type character varying(255) DEFAULT NULL::character varying,
    url character varying(255) DEFAULT NULL::character varying,
    post uuid
);


ALTER TABLE public.navigation_items OWNER TO directus;

--
-- Name: page_blocks; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.page_blocks (
    id uuid NOT NULL,
    sort integer,
    page uuid,
    item character varying(255) DEFAULT NULL::character varying,
    collection character varying(255) DEFAULT NULL::character varying,
    hide_block boolean DEFAULT false,
    background character varying(255) DEFAULT 'light'::character varying
);


ALTER TABLE public.page_blocks OWNER TO directus;

--
-- Name: pages; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.pages (
    id uuid NOT NULL,
    sort integer,
    title character varying(255) DEFAULT NULL::character varying,
    permalink character varying(255) DEFAULT NULL::character varying,
    description text,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    published_at timestamp with time zone
);


ALTER TABLE public.pages OWNER TO directus;

--
-- Name: posts; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.posts (
    content text,
    id uuid NOT NULL,
    image uuid,
    slug character varying(255) DEFAULT NULL::character varying,
    sort integer,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    title character varying(255) DEFAULT NULL::character varying,
    description text,
    author uuid,
    published_at timestamp with time zone
);


ALTER TABLE public.posts OWNER TO directus;

--
-- Name: subscription_tiers; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.subscription_tiers (
    id uuid NOT NULL,
    icon uuid NOT NULL,
    title character varying(255) DEFAULT NULL::character varying NOT NULL,
    slug character varying(255),
    "featureList" json NOT NULL,
    price real NOT NULL,
    "discountPrice" real,
    "daysOfAccess" integer DEFAULT 1 NOT NULL,
    "maxPracticeExams" integer DEFAULT 3
);


ALTER TABLE public.subscription_tiers OWNER TO directus;

--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "expiresAt" timestamp without time zone NOT NULL,
    type character varying(255) DEFAULT 'car'::character varying NOT NULL,
    tier uuid
);


ALTER TABLE public.subscriptions OWNER TO directus;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subscriptions_id_seq OWNER TO directus;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: video_courses; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.video_courses (
    id integer NOT NULL,
    title character varying(255) DEFAULT NULL::character varying NOT NULL,
    slug character varying(255) DEFAULT NULL::character varying,
    tagline character varying(255) DEFAULT NULL::character varying NOT NULL,
    "estimatedDurationInMinutes" integer DEFAULT 1 NOT NULL,
    thumbnail uuid NOT NULL,
    "subscriptionTier" uuid
);


ALTER TABLE public.video_courses OWNER TO directus;

--
-- Name: video_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.video_courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.video_courses_id_seq OWNER TO directus;

--
-- Name: video_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.video_courses_id_seq OWNED BY public.video_courses.id;


--
-- Name: video_courses_lessons; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.video_courses_lessons (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    video uuid NOT NULL,
    description text,
    "videoCourse" integer
);


ALTER TABLE public.video_courses_lessons OWNER TO directus;

--
-- Name: video_courses_lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.video_courses_lessons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.video_courses_lessons_id_seq OWNER TO directus;

--
-- Name: video_courses_lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.video_courses_lessons_id_seq OWNED BY public.video_courses_lessons.id;


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: video_courses id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.video_courses ALTER COLUMN id SET DEFAULT nextval('public.video_courses_id_seq'::regclass);


--
-- Name: video_courses_lessons id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.video_courses_lessons ALTER COLUMN id SET DEFAULT nextval('public.video_courses_lessons_id_seq'::regclass);


--
-- Data for Name: block_button; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.block_button (id, sort, type, page, post, label, variant, button_group, url) FROM stdin;
3d583c03-4909-4001-aad2-cd7af6ec53af	1	pages	\N	\N	Start Your Project	solid	0b1512d8-3bec-4dbc-919c-4514bbe37dc1	\N
5f902715-6e50-491b-b29c-b947a11a10f1	1	page	9821199f-4b05-49fb-8407-fbfe9b866ef0	\N	Get A Demo	default	4cd6d4ca-82ea-4daf-ae79-a4c4265bfb27	\N
47ddfe4e-721a-483f-a09b-4c10fe0cec1a	\N	pages	\N	\N	Learn More	solid	aed01afb-490d-42d3-bbf4-cf64081494b9	\N
b74af9dd-cc34-451c-88cf-c3e14c39cf4f	\N	pages	\N	\N	Start Your Project	outline	aed01afb-490d-42d3-bbf4-cf64081494b9	\N
dda7d91c-b449-4ab3-9d9d-84d4e8c09caf	\N	url	\N	\N	Get Started	solid	\N	/your-stripe-checkout-link
efb97ae9-d95e-4f9d-bf00-9df9966c65ec	\N	url	\N	\N	Talk to Sales	solid	\N	/get-a-demo
\.


--
-- Data for Name: block_button_group; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.block_button_group (id, sort) FROM stdin;
0b1512d8-3bec-4dbc-919c-4514bbe37dc1	\N
4cd6d4ca-82ea-4daf-ae79-a4c4265bfb27	\N
aed01afb-490d-42d3-bbf4-cf64081494b9	\N
\.


--
-- Data for Name: block_form; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.block_form (id, form, headline, tagline) FROM stdin;
1419faec-e263-431c-bd5f-a57f394c39f6	5da3d356-d818-434f-b225-db35c418bbb6	Get all the goodness, right in your inbox	Newsletter
185eca12-4af1-4a1c-bfd7-4bc2fab52097	36493b64-2bad-4c58-9d70-785ccb12ee26	Let's talk about your project	Contact
3e262b2d-48fc-4816-b5e8-c991817d56fc	5da3d356-d818-434f-b225-db35c418bbb6	Subscribe to get updates	Newsletter
\.


--
-- Data for Name: block_gallery; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.block_gallery (headline, id, tagline) FROM stdin;
Check out some of our latest templates	34fdcf0e-cc5d-4c40-b61f-4f0a5e167306	Template Gallery
<p>This is an <em>amazing</em> gallery</p>	61a1866b-5bff-473a-a6e3-106cd6b37412	\N
Get started even faster	7b5e5649-40be-4f54-a2fb-b021a520645d	Directus Templates
\.


--
-- Data for Name: block_gallery_items; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.block_gallery_items (id, block_gallery, directus_file, sort) FROM stdin;
02bb1bbf-c10d-462e-be09-c4556b3ea087	34fdcf0e-cc5d-4c40-b61f-4f0a5e167306	a051ea01-07a5-45cb-bcc6-411af9560be5	10
1dbac868-e2cc-4930-9f21-5e0dd1b40e52	34fdcf0e-cc5d-4c40-b61f-4f0a5e167306	03a7d1c7-81e2-432f-9561-9df2691189c8	7
1f520e55-4054-47f9-896a-baf2787ec007	34fdcf0e-cc5d-4c40-b61f-4f0a5e167306	dc258f02-d1a3-47f4-9f3e-2a71a0010c56	12
297914c3-b1dd-4683-b6bf-5b8cad3bf743	7b5e5649-40be-4f54-a2fb-b021a520645d	03a7d1c7-81e2-432f-9561-9df2691189c8	5
2a0369dc-1b43-4d5a-9832-d180a0aa0295	34fdcf0e-cc5d-4c40-b61f-4f0a5e167306	c2a301bd-74ed-4a50-9b85-3cb1f40f8dee	8
46f226f4-6d13-4783-878f-3ae0eafcfd5d	34fdcf0e-cc5d-4c40-b61f-4f0a5e167306	6964d750-1c00-4b9c-81e4-0c81cfa82bbb	9
553ea498-554a-478c-89d5-99f33e56642d	7b5e5649-40be-4f54-a2fb-b021a520645d	a051ea01-07a5-45cb-bcc6-411af9560be5	1
62ab01e9-27f7-44e5-90bb-d3f6258dd0cf	7b5e5649-40be-4f54-a2fb-b021a520645d	50570a31-a990-453c-bdfc-0ad7175dd8bf	2
9527868b-136a-48a9-917d-44e0abc835e2	7b5e5649-40be-4f54-a2fb-b021a520645d	c2a301bd-74ed-4a50-9b85-3cb1f40f8dee	4
d3481aae-7dc4-446f-8b68-50e77aab58da	34fdcf0e-cc5d-4c40-b61f-4f0a5e167306	50570a31-a990-453c-bdfc-0ad7175dd8bf	11
f6ce1b83-5020-4a5a-9c71-0d69d3b216ff	7b5e5649-40be-4f54-a2fb-b021a520645d	6964d750-1c00-4b9c-81e4-0c81cfa82bbb	3
\.


--
-- Data for Name: block_hero; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.block_hero (headline, id, image, button_group, description, alignment, tagline, layout) FROM stdin;
<p>Get to <em>MVP</em> faster</p>	6aa654f5-b55f-4436-a35c-1f989f26268a	df0745c2-b6e3-4b37-b64d-55a4eb0033ab	aed01afb-490d-42d3-bbf4-cf64081494b9	\N	\N	\N	\N
<p>Custom <em>web development and design</em> services</p>	8ece685c-e903-443b-b29d-b36491709743	df0745c2-b6e3-4b37-b64d-55a4eb0033ab	0b1512d8-3bec-4dbc-919c-4514bbe37dc1	\N	\N	\N	\N
\N	93693278-93bc-4a70-a54c-bbbf1e0037d7	\N	\N	\N	\N	\N	\N
Headless but not brainless	d81ab264-b2be-4077-84e7-b1406e74d9c3	df0745c2-b6e3-4b37-b64d-55a4eb0033ab	4cd6d4ca-82ea-4daf-ae79-a4c4265bfb27	Directus gives you a backend that is perfect for Headless CMS use cases but also everything beyond. Authentication, user permissions.	left	Backend + CMS	image_right
\.


--
-- Data for Name: block_posts; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.block_posts (id, headline, collection, tagline) FROM stdin;
060b632d-d70d-4db1-8b95-4fbab7a52ae8	All rabbits, all the time	posts	Blog
\.


--
-- Data for Name: block_pricing; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.block_pricing (id, headline, tagline) FROM stdin;
48cf2543-15e0-454f-9b31-cbf3c2406712	Plans to fit every budget	Pricing
\.


--
-- Data for Name: block_pricing_cards; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.block_pricing_cards (id, title, description, price, badge, features, button, pricing, is_highlighted, sort) FROM stdin;
388404db-1703-4b10-b12b-e5d4385f1530	Starter Plan	Perfect for your small busines	$199 /month	Most Popular	["One seat","Unlimited","Lifetime access"]	dda7d91c-b449-4ab3-9d9d-84d4e8c09caf	48cf2543-15e0-454f-9b31-cbf3c2406712	f	\N
83972d2a-742e-4a6c-8698-563d01dde54d	Enterprise Plan	The best plan with all the best features	$599 /month	\N	["All of them","Yes all of them"]	efb97ae9-d95e-4f9d-bf00-9df9966c65ec	48cf2543-15e0-454f-9b31-cbf3c2406712	t	\N
\.


--
-- Data for Name: block_richtext; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.block_richtext (content, headline, id, alignment, tagline) FROM stdin;
<p>Welcome to our website solution - where simplicity meets power. While we've made content management beautifully simple, there's a lot more under the hood when you need it.</p>\n<p>Built on Directus, our platform starts as an intuitive CMS that anyone can use. Update your website, manage blog posts, handle forms, and organize media files with ease - no coding required. It's perfect for content creators, marketing teams, and business owners who want to focus on their message, not technical details.</p>\n<p>But here's the exciting part: when your needs grow, so can your platform. Directus isn't just a CMS - it's a full-featured backend that can power everything from mobile apps to complex digital experiences. Think of it as future-proofing your digital presence while keeping things simple today.</p>\n<p><strong>What you'll love:</strong></p>\n<ul>\n<li>A friendly interface that just makes sense</li>\n<li>Easy visual page building</li>\n<li>Hassle-free media management</li>\n<li>Smart form handling with email notifications</li>\n<li>Flexible blog management with drafts</li>\n<li>Custom navigation menus</li>\n<li>Team collaboration tools</li>\n<li>Mobile-ready interface for updates anywhere</li>\n</ul>\n<p><strong>And when you're ready for more than just CMS:</strong></p>\n<ul>\n<li>API access for custom applications</li>\n<li>Advanced data relationships</li>\n<li>Custom workflows</li>\n<li>Automated tasks</li>\n<li>Enterprise-grade security</li>\n</ul>\n<p>Start simple, grow seamlessly. That's our promise to you. Ready to make your website work better for you?</p>	Our promise to you	1134799b-3fd1-47ea-963f-13d8ac1b9e3a	center	About Us
<p>We were tired of solutions that were super friendly for content editors but were challenging for developers to work with. Conversely, what good is DX if the content editors don't enjoy using the CMS?</p>	Make your entire team happy	129625db-433f-4104-9922-3b803ba4599d	center	Why Us?
<p>At our digital agency, we believe that standing out in the crowded digital landscape requires a unique approach. <a href="/team" target="_self">That's why we take a holistic approach</a> to digital marketing, focusing on building a strong brand identity and developing strategies that are tailored to our clients' specific needs.</p>\n<p><a class="btn btn-primary btn-md" href="/contact-us" target="_self">Test Button</a></p>\n<h1>H1</h1>\n<blockquote>\n<p>Our team of experts brings a diverse range of skills and experiences to the table, including web design, content creation, SEO, social media marketing, and more. We're not just interested in getting quick results; we're invested in helping our clients build sustainable, long-term success.</p>\n</blockquote>\n<ol>\n<li>Number 1</li>\n<li>Number 2 (Who does number 2 work for)</li>\n<li>Number 3</li>\n</ol>\n<ul>\n<li>Item 1</li>\n<li>Item 2</li>\n<li>Item 3</li>\n</ul>\n<h2>H2</h2>\n<p>Some text</p>\n<hr>\n<h3>H3</h3>\n<p>Some text</p>\n<p>From the initial consultation to ongoing support, we're dedicated to providing personalized attention and exceptional service. At our digital agency, we're not just different from the rest - we're better.</p>	We're different than all the rest.	1619b2fe-ce09-4a78-8c47-1428995c7c1c	center	\N
<p>Hi {{ contact.first_name }},</p>\n<p>Thanks for meeting with me the other day. It was nice to have the time to dig in and have a more focused conversation. I have outlined three options of increasing complexity for the project. The options are incremental, meaning that each includes and builds upon the previous options. This will allow you to pick a level that suits the urgency and budget.</p>\n<p>Please note that this is not an estimate, it is a quote. The price you agree to is exactly how much you&rsquo;ll pay. If I have underestimated how long it will take me to do the work, that&rsquo;s my problem, not yours.</p>\n<p>Because of this, I&rsquo;m strict about what&rsquo;s included and what&rsquo;s not. Please do not assume anything. If there is anything you want included that you don&rsquo;t see explicitly listed, we&rsquo;ll need to talk about it and I&rsquo;ll send a revised quote. When you get a chance, please review and let me know if you have any questions or comments. I&rsquo;ll touch base with you on DATE THAT IS THREE TO FOUR BUSINESS DAYS IN THE FUTURE if I haven&rsquo;t heard back by then.</p>\n<p>- Bryant Gillespie</p>	Let's work together	1a273da2-8d00-4ccc-9109-0da0d0d88dcb	center	\N
<p><strong>Here's a few sentences.</strong></p>	Rich Text Block	2387edcd-e6ab-451c-befa-30ab247b2290	center	\N
<p>Given your current setup, we propose an innovative solution leveraging Directus, an open-source headless content management system, to streamline your web development process. This approach involves integrating Directus with your existing system, offering a more efficient and flexible way to manage your web content and applications.</p>\n<p>Benefits:</p>\n<ol>\n<li><strong>Enhanced Flexibility:</strong> Directus provides a more adaptable and customizable content management framework compared to traditional systems.</li>\n<li><strong>Improved Content Control:</strong> With Directus, you gain more control over how your content is structured and delivered across different platforms.</li>\n<li><strong>Cost-Effective Solution:</strong> Utilizing Directus significantly reduces the need for extensive custom development, thereby lowering overall project costs.</li>\n</ol>\n<p>Drawbacks:</p>\n<ol>\n<li><strong>Dependency on Directus Framework:</strong> Your system will rely on the Directus framework, which might require additional learning for your team.</li>\n<li><strong>Limited Third-Party Integrations:</strong> While Directus is versatile, it may not have as many out-of-the-box integrations as some other platforms.</li>\n</ol>\n<p>Timeline and Deliverables:</p>\n<ol>\n<li><strong>Planning and System Assessment (2 days):</strong> Evaluating your current system and planning the Directus integration.</li>\n<li><strong>Directus Setup and Configuration (3 days):</strong> Installing and configuring Directus to fit your specific needs.</li>\n<li><strong>Data Migration and Integration (4 days):</strong> Migrating existing data and ensuring seamless integration with your systems.</li>\n<li><strong>Custom Development (if required) (3 days):</strong> Additional customization to meet specific requirements.</li>\n<li><strong>Testing and Quality Assurance (3 days):</strong> Ensuring the integration works flawlessly across all platforms.</li>\n<li><strong>Training and Documentation (2 days):</strong> Providing training sessions for your team and comprehensive documentation.</li>\n<li><strong>Launch and Post-Launch Support (2 days):</strong> Going live and providing immediate support to address any issues.</li>\n</ol>\n<p>Cost:</p>\n<ul>\n<li><strong>Initial Setup and Integration:</strong> $6,500 one time.</li>\n<li><strong>Annual Maintenance and Support:</strong> $1,200, covering updates and ongoing support.</li>\n</ul>\n<p>This solution offers a robust, flexible approach to managing your web content and applications, aligning with modern web development practices while ensuring cost-effectiveness and scalability.</p>	How We Can Do This	62517520-a3e0-4655-bd92-2d45293eb0c6	left	\N
<p>Rabbits are a great source of environmental benefit. They help to keep grasslands and other ecosystems in check. Rabbits are herbivores, meaning they eat only plants, which helps to keep vegetation in balance. Additionally, rabbits are crucial to the food chain, providing sustenance for predators in their environment.</p>\n<p>Rabbits also help to improve the quality of soil by digging burrows and depositing their waste in them. This helps to aerate the soil, improving its quality and allowing for better plant growth. Additionally, the waste from rabbits is a rich source of nutrients for plants and other animals in the area. This helps to keep the soil healthy and support the overall ecosystem.</p>	The Benefits of Rabbits	6c5df396-be52-4b1c-a144-d55b229e5a34	center	\N
<p><strong>Last updated: [Date]</strong></p>\n<p>Welcome to [Your Website Name] ("we", "us", "our"). We are committed to protecting your personal information and your right to privacy. If you have any questions or concerns about our policy, or our practices with regards to your personal information, please contact us at [Contact Information].</p>\n<p>By using our website, [Your Website URL], you consent to the collection and use of your personal information as described in this privacy policy.</p>\n<h2>Information We Collect</h2>\n<p>We collect personal information that you voluntarily provide to us when registering at the website, expressing an interest in obtaining information about us or our products and services, when participating in activities on the website, or otherwise contacting us.</p>\n<p>The personal information that we collect depends on the context of your interactions with us and the website, the choices you make, and the products and features you use. The personal information we collect can include the following:</p>\n<ul>\n<li>Name and Contact Data: We collect your first and last name, email address, postal address, phone number, and other similar contact data.</li>\n<li>Credentials: We collect passwords, password hints, and similar security information used for authentication and account access.</li>\n<li>Payment Data: We collect data necessary to process your payment if you make purchases, such as your payment instrument number (such as a credit card number), and the security code associated with your payment instrument.</li>\n</ul>\n<h2>How We Use Your Information</h2>\n<p>We use personal information collected via our website for a variety of business purposes described below:</p>\n<ul>\n<li>To provide and manage our services.</li>\n<li>To process your transactions.</li>\n<li>To send you administrative information.</li>\n<li>To respond to your inquiries and provide customer service.</li>\n<li>To send you marketing and promotional communications.</li>\n<li>To enforce our terms, conditions, and policies.</li>\n</ul>\n<h2>Sharing Your Information</h2>\n<p>We may share or disclose your personal information in the following situations:</p>\n<ul>\n<li>With Service Providers: We may share your personal information with third-party service providers to monitor and analyze the use of our service, to contact you.</li>\n<li>For Business Transfers: We may share or transfer your personal information in connection with, or during negotiations of, any merger, sale of company assets, financing, or acquisition of all or a portion of our business to another company.</li>\n<li>With Affiliates: We may share your information with our affiliates, in which case we will require those affiliates to honor this privacy policy.</li>\n</ul>\n<h2>Retention of Your Information</h2>\n<p>We will retain your personal information only for as long as is necessary for the purposes set out in this privacy policy, and to the extent necessary to comply with our legal obligations, resolve disputes, and enforce our legal agreements and policies.</p>\n<h2>Security of Your Information</h2>\n<p>We use administrative, technical, and physical security measures to help protect your personal information. While we have taken reasonable steps to secure the personal information you provide to us, please be aware that despite our efforts, no security measures are perfect or impenetrable, and no method of data transmission can be guaranteed against any interception or other type of misuse.</p>\n<h2>Your Privacy Rights</h2>\n<p>Depending on your location, you may have certain rights under applicable data protection laws. These may include the right (i) to request access and obtain a copy of your personal information, (ii) to request rectification or erasure; (iii) to restrict the processing of your personal information; and (iv) if applicable, to data portability.</p>\n<h2>Updates to Our Privacy Policy</h2>\n<p>We may update our privacy policy from time to time. The updated version will be indicated by an updated "Revised" date and the updated version will be effective as soon as it is accessible. We encourage you to review this privacy policy frequently to be informed of how we are protecting your information.</p>	We take privacy very seriously	a6275645-16b7-4994-8100-8c43ca07ab06	center	\N
<p>Our website, "Bunny Lovers," is dedicated to all things rabbit! Our goal is to provide comprehensive information and resources for rabbit owners and enthusiasts alike. We believe that rabbits make wonderful pets and we want to help people give their furry friends the best life possible.</p>\n<p>The team behind Bunny Lovers is made up of rabbit owners and experts who have years of experience caring for these cute and cuddly creatures. We share a passion for rabbits and their well-being, and we have combined our knowledge to create a one-stop shop for everything rabbit-related. From breed information to health advice, we aim to provide you with the most up-to-date and accurate information available.</p>\n<p>In addition to our informative articles, we also offer a lively and supportive community where rabbit owners can connect and share their experiences. Whether you are a seasoned rabbit owner or just starting out, you are sure to find the information and support you need on our site. So, come join us and let's celebrate these amazing animals together!</p>	About Us	8f714990-cb45-4c6c-afa6-a49615768a4f	center	\N
<p>Thank you for considering our privacy policy at XYZ Development Agency. We take your privacy very seriously and want you to know exactly how we collect, use, share, and protect your information when you visit our website or use our services.</p>\n<h2>Information We Collect</h2>\n<p>We collect personal information such as your name, email address, phone number, and company name when you fill out a contact form or sign up for our newsletter. We also collect non-personal information such as your IP address, browser type, and operating system when you visit our website.</p>\n<h2>How We Use Your Information</h2>\n<p>We use your personal information to respond to your inquiries, send you newsletters, and provide you with our services. We use non-personal information to analyze website traffic and improve our website's performance.</p>\n<h2>Information Sharing</h2>\n<p>We do not sell or rent your personal information to third parties. However, we may share your personal information with trusted third-party service providers who assist us in providing our services to you. We may also share your information when required by law or to protect our rights and property.</p>\n<h2>Security</h2>\n<p>We take appropriate measures to protect your personal information from unauthorized access, disclosure, or misuse. We use secure servers and encryption technologies to ensure the confidentiality and integrity of your information.</p>\n<h2>Cookies and Tracking Technologies</h2>\n<p>We use cookies and other tracking technologies to collect non-personal information about your website usage. You can disable cookies through your browser settings, but this may limit your access to certain features of our website.</p>\n<h2>Links to Third-Party Websites</h2>\n<p>Our website may contain links to third-party websites. We are not responsible for the privacy practices or content of those websites. We encourage you to review the privacy policies of those websites before providing any personal information.</p>\n<h2>Changes to Our Privacy Policy</h2>\n<p>We may update our privacy policy from time to time. We will notify you of any changes by posting the new policy on our website. Your continued use of our website or services after any changes to our privacy policy means that you agree to the updated policy.</p>\n<h2>Contact Us</h2>\n<p>If you have any questions or concerns about our privacy policy, please contact us at privacy@xyzdevelopment.com.</p>\n<p>Thank you for trusting XYZ Development Agency with your personal information.</p>	We <em>protect our clients</em> like our own families	9d65df9c-307f-4049-bc21-0c3a77178d91	center	\N
<p class="project-block__block-element">Upon agreement on the proposal details, we'll commence with the project kick-off. This phase will involve an in-depth discussion of your specific needs, followed by the development of a detailed project plan. We believe in maintaining transparency and open communication throughout the project to ensure all your expectations are met.</p>\n<p class="project-block__block-element">We look forward to an opportunity to work together and deliver a software solution that aligns with your vision and drives your business growth. Thank you for considering our proposal.</p>	Next Steps	b0c8cec2-acc5-46ad-9044-8a6602000c3e	center	\N
\.


--
-- Data for Name: directus_access; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_access (id, role, "user", policy, sort) FROM stdin;
e0dc5e51-5e8a-45d5-ab27-4aac5594736a	\N	\N	abf8a154-5b1c-4a46-ac9c-7300570f4f17	1
92dfc16a-2929-4122-9dc2-5d585f7663bd	c36d4878-9546-4449-857c-bd86f5e50eeb	\N	c907eeb4-7df6-42f8-a2bf-2328ba1533b5	\N
bc851ef2-5b0d-4ebc-adb2-b717f30167f0	8ba4ed6f-d330-4675-ae46-119c533a0928	\N	8ba4ed6f-d330-4675-ae46-119c533a0928	1
188a6dce-ddf2-4d7d-98b7-02accab9803b	\N	88a6e8cf-f0f8-41db-a3a2-8a9741c086cc	abf8a154-5b1c-4a46-ac9c-7300570f4f17	1
6de77eee-b06c-4665-97a9-2e54467483f9	c36d4878-9546-4449-857c-bd86f5e50eeb	\N	ef049c8b-546b-4bbc-9cd7-b05d77e58b66	1
248a8203-02f3-47a7-9b82-b295e9202967	\N	\N	307380fe-195e-44cc-9cc0-6993aeee9428	2
ce033dd3-b78d-4a56-9bf0-fc6f742389b5	8ba4ed6f-d330-4675-ae46-119c533a0928	\N	52598a64-071d-4071-96fa-4b620d6189b5	2
6f680545-4a81-4422-bef4-ba2553b51418	\N	88a6e8cf-f0f8-41db-a3a2-8a9741c086cc	ee1055a2-7c03-4b0b-9b65-ca68491b6329	2
2bd7d120-c70d-4469-8851-e14b11cdc823	\N	88a6e8cf-f0f8-41db-a3a2-8a9741c086cc	307380fe-195e-44cc-9cc0-6993aeee9428	3
8a4f1d01-b692-427c-90ad-adbd9c479449	\N	\N	ee1055a2-7c03-4b0b-9b65-ca68491b6329	3
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, origin) FROM stdin;
1	login	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:36:27.871+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	60f562f9-84b6-4914-bf63-a7193567fcdf	http://127.0.0.1:8055
2	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:38:46.703+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	60f562f9-84b6-4914-bf63-a7193567fcdf	http://127.0.0.1:8055
3	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.509+00	172.21.0.1	node	directus_fields	1	\N
4	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.514+00	172.21.0.1	node	directus_fields	2	\N
5	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.517+00	172.21.0.1	node	directus_fields	3	\N
6	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.52+00	172.21.0.1	node	directus_fields	4	\N
7	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.525+00	172.21.0.1	node	directus_fields	5	\N
8	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.529+00	172.21.0.1	node	directus_fields	6	\N
9	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.533+00	172.21.0.1	node	directus_fields	7	\N
10	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.535+00	172.21.0.1	node	directus_fields	8	\N
11	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.538+00	172.21.0.1	node	directus_fields	9	\N
12	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.54+00	172.21.0.1	node	directus_collections	block_button	\N
13	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.589+00	172.21.0.1	node	directus_fields	10	\N
14	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.592+00	172.21.0.1	node	directus_fields	11	\N
15	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.594+00	172.21.0.1	node	directus_fields	12	\N
16	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.597+00	172.21.0.1	node	directus_collections	block_button_group	\N
17	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.693+00	172.21.0.1	node	directus_fields	13	\N
18	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.695+00	172.21.0.1	node	directus_fields	14	\N
19	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.697+00	172.21.0.1	node	directus_fields	15	\N
20	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.699+00	172.21.0.1	node	directus_fields	16	\N
21	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.701+00	172.21.0.1	node	directus_collections	block_form	\N
22	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.795+00	172.21.0.1	node	directus_fields	17	\N
23	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.797+00	172.21.0.1	node	directus_fields	18	\N
24	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.799+00	172.21.0.1	node	directus_fields	19	\N
25	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.801+00	172.21.0.1	node	directus_fields	20	\N
26	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.803+00	172.21.0.1	node	directus_collections	block_gallery	\N
27	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.896+00	172.21.0.1	node	directus_fields	21	\N
28	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.898+00	172.21.0.1	node	directus_fields	22	\N
29	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.901+00	172.21.0.1	node	directus_fields	23	\N
30	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.905+00	172.21.0.1	node	directus_fields	24	\N
31	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.911+00	172.21.0.1	node	directus_collections	block_gallery_items	\N
32	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.995+00	172.21.0.1	node	directus_fields	25	\N
33	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:42:59.999+00	172.21.0.1	node	directus_fields	26	\N
34	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.003+00	172.21.0.1	node	directus_fields	27	\N
35	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.01+00	172.21.0.1	node	directus_fields	28	\N
36	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.015+00	172.21.0.1	node	directus_fields	29	\N
37	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.019+00	172.21.0.1	node	directus_fields	30	\N
38	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.032+00	172.21.0.1	node	directus_fields	31	\N
39	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.035+00	172.21.0.1	node	directus_fields	32	\N
40	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.036+00	172.21.0.1	node	directus_fields	33	\N
41	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.038+00	172.21.0.1	node	directus_collections	block_hero	\N
42	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.092+00	172.21.0.1	node	directus_fields	34	\N
43	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.095+00	172.21.0.1	node	directus_fields	35	\N
44	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.097+00	172.21.0.1	node	directus_fields	36	\N
45	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.099+00	172.21.0.1	node	directus_fields	37	\N
46	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.1+00	172.21.0.1	node	directus_fields	38	\N
47	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.102+00	172.21.0.1	node	directus_collections	block_posts	\N
48	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.219+00	172.21.0.1	node	directus_fields	39	\N
49	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.222+00	172.21.0.1	node	directus_fields	40	\N
50	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.225+00	172.21.0.1	node	directus_fields	41	\N
51	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.227+00	172.21.0.1	node	directus_fields	42	\N
52	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.23+00	172.21.0.1	node	directus_collections	block_pricing	\N
53	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.323+00	172.21.0.1	node	directus_fields	43	\N
54	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.326+00	172.21.0.1	node	directus_fields	44	\N
55	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.327+00	172.21.0.1	node	directus_fields	45	\N
56	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.328+00	172.21.0.1	node	directus_fields	46	\N
57	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.33+00	172.21.0.1	node	directus_fields	47	\N
58	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.332+00	172.21.0.1	node	directus_fields	48	\N
59	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.335+00	172.21.0.1	node	directus_fields	49	\N
60	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.336+00	172.21.0.1	node	directus_fields	50	\N
61	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.337+00	172.21.0.1	node	directus_fields	51	\N
62	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.339+00	172.21.0.1	node	directus_fields	52	\N
63	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.342+00	172.21.0.1	node	directus_collections	block_pricing_cards	\N
64	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.438+00	172.21.0.1	node	directus_fields	53	\N
65	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.441+00	172.21.0.1	node	directus_fields	54	\N
66	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.444+00	172.21.0.1	node	directus_fields	55	\N
67	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.446+00	172.21.0.1	node	directus_fields	56	\N
68	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.447+00	172.21.0.1	node	directus_fields	57	\N
69	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.45+00	172.21.0.1	node	directus_collections	block_richtext	\N
70	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.493+00	172.21.0.1	node	directus_collections	blocks	\N
71	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.605+00	172.21.0.1	node	directus_fields	58	\N
72	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.609+00	172.21.0.1	node	directus_fields	59	\N
73	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.612+00	172.21.0.1	node	directus_fields	60	\N
74	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.614+00	172.21.0.1	node	directus_fields	61	\N
75	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.616+00	172.21.0.1	node	directus_fields	62	\N
76	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.619+00	172.21.0.1	node	directus_fields	63	\N
77	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.621+00	172.21.0.1	node	directus_fields	64	\N
78	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.623+00	172.21.0.1	node	directus_fields	65	\N
79	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.626+00	172.21.0.1	node	directus_fields	66	\N
80	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.627+00	172.21.0.1	node	directus_fields	67	\N
81	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.629+00	172.21.0.1	node	directus_fields	68	\N
82	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.632+00	172.21.0.1	node	directus_fields	69	\N
83	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.635+00	172.21.0.1	node	directus_collections	form_fields	\N
84	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.714+00	172.21.0.1	node	directus_fields	70	\N
85	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.717+00	172.21.0.1	node	directus_fields	71	\N
86	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.72+00	172.21.0.1	node	directus_fields	72	\N
87	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.723+00	172.21.0.1	node	directus_fields	73	\N
88	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.724+00	172.21.0.1	node	directus_fields	74	\N
89	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.726+00	172.21.0.1	node	directus_fields	75	\N
90	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.727+00	172.21.0.1	node	directus_fields	76	\N
91	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.729+00	172.21.0.1	node	directus_fields	77	\N
92	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.732+00	172.21.0.1	node	directus_fields	78	\N
93	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.733+00	172.21.0.1	node	directus_fields	79	\N
94	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.734+00	172.21.0.1	node	directus_fields	80	\N
95	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.736+00	172.21.0.1	node	directus_fields	81	\N
96	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.739+00	172.21.0.1	node	directus_fields	82	\N
97	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.744+00	172.21.0.1	node	directus_fields	83	\N
98	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.746+00	172.21.0.1	node	directus_fields	84	\N
99	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.749+00	172.21.0.1	node	directus_fields	85	\N
100	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.751+00	172.21.0.1	node	directus_fields	86	\N
101	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.753+00	172.21.0.1	node	directus_fields	87	\N
102	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.756+00	172.21.0.1	node	directus_collections	forms	\N
103	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.797+00	172.21.0.1	node	directus_fields	88	\N
104	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.799+00	172.21.0.1	node	directus_fields	89	\N
105	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.8+00	172.21.0.1	node	directus_fields	90	\N
106	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.802+00	172.21.0.1	node	directus_fields	91	\N
107	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.803+00	172.21.0.1	node	directus_fields	92	\N
108	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.804+00	172.21.0.1	node	directus_collections	form_submissions	\N
109	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.898+00	172.21.0.1	node	directus_fields	93	\N
110	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.9+00	172.21.0.1	node	directus_fields	94	\N
111	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.901+00	172.21.0.1	node	directus_fields	95	\N
112	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.902+00	172.21.0.1	node	directus_fields	96	\N
113	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.904+00	172.21.0.1	node	directus_fields	97	\N
114	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.905+00	172.21.0.1	node	directus_fields	98	\N
115	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:00.909+00	172.21.0.1	node	directus_collections	form_submission_values	\N
116	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.009+00	172.21.0.1	node	directus_fields	99	\N
117	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.011+00	172.21.0.1	node	directus_fields	100	\N
118	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.015+00	172.21.0.1	node	directus_fields	101	\N
119	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.018+00	172.21.0.1	node	directus_fields	102	\N
120	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.02+00	172.21.0.1	node	directus_fields	103	\N
121	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.023+00	172.21.0.1	node	directus_fields	104	\N
122	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.025+00	172.21.0.1	node	directus_fields	105	\N
123	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.027+00	172.21.0.1	node	directus_fields	106	\N
124	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.029+00	172.21.0.1	node	directus_fields	107	\N
125	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.031+00	172.21.0.1	node	directus_fields	108	\N
126	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.032+00	172.21.0.1	node	directus_fields	109	\N
127	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.034+00	172.21.0.1	node	directus_fields	110	\N
128	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.036+00	172.21.0.1	node	directus_fields	111	\N
129	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.038+00	172.21.0.1	node	directus_fields	112	\N
130	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.039+00	172.21.0.1	node	directus_fields	113	\N
131	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.04+00	172.21.0.1	node	directus_fields	114	\N
132	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.041+00	172.21.0.1	node	directus_collections	globals	\N
133	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.101+00	172.21.0.1	node	directus_fields	115	\N
134	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.104+00	172.21.0.1	node	directus_fields	116	\N
135	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.106+00	172.21.0.1	node	directus_fields	117	\N
136	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.108+00	172.21.0.1	node	directus_fields	118	\N
137	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.109+00	172.21.0.1	node	directus_fields	119	\N
138	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.111+00	172.21.0.1	node	directus_collections	navigation	\N
139	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.199+00	172.21.0.1	node	directus_fields	120	\N
140	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.201+00	172.21.0.1	node	directus_fields	121	\N
141	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.202+00	172.21.0.1	node	directus_fields	122	\N
142	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.205+00	172.21.0.1	node	directus_fields	123	\N
143	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.207+00	172.21.0.1	node	directus_fields	124	\N
144	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.209+00	172.21.0.1	node	directus_fields	125	\N
145	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.211+00	172.21.0.1	node	directus_fields	126	\N
146	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.214+00	172.21.0.1	node	directus_fields	127	\N
147	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.217+00	172.21.0.1	node	directus_fields	128	\N
148	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.225+00	172.21.0.1	node	directus_fields	129	\N
149	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.227+00	172.21.0.1	node	directus_collections	navigation_items	\N
150	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.297+00	172.21.0.1	node	directus_fields	130	\N
151	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.298+00	172.21.0.1	node	directus_fields	131	\N
152	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.299+00	172.21.0.1	node	directus_fields	132	\N
153	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.301+00	172.21.0.1	node	directus_fields	133	\N
154	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.303+00	172.21.0.1	node	directus_fields	134	\N
155	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.303+00	172.21.0.1	node	directus_fields	135	\N
156	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.306+00	172.21.0.1	node	directus_fields	136	\N
157	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.307+00	172.21.0.1	node	directus_collections	page_blocks	\N
158	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.4+00	172.21.0.1	node	directus_fields	137	\N
159	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.401+00	172.21.0.1	node	directus_fields	138	\N
160	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.402+00	172.21.0.1	node	directus_fields	139	\N
161	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.403+00	172.21.0.1	node	directus_fields	140	\N
162	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.404+00	172.21.0.1	node	directus_fields	141	\N
163	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.406+00	172.21.0.1	node	directus_fields	142	\N
164	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.407+00	172.21.0.1	node	directus_fields	143	\N
165	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.409+00	172.21.0.1	node	directus_fields	144	\N
166	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.419+00	172.21.0.1	node	directus_fields	145	\N
167	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.423+00	172.21.0.1	node	directus_fields	146	\N
168	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.426+00	172.21.0.1	node	directus_fields	147	\N
169	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.429+00	172.21.0.1	node	directus_fields	148	\N
170	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.432+00	172.21.0.1	node	directus_collections	pages	\N
171	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.501+00	172.21.0.1	node	directus_fields	149	\N
172	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.502+00	172.21.0.1	node	directus_fields	150	\N
173	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.504+00	172.21.0.1	node	directus_fields	151	\N
174	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.505+00	172.21.0.1	node	directus_fields	152	\N
175	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.507+00	172.21.0.1	node	directus_fields	153	\N
176	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.508+00	172.21.0.1	node	directus_fields	154	\N
177	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.509+00	172.21.0.1	node	directus_fields	155	\N
178	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.51+00	172.21.0.1	node	directus_fields	156	\N
179	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.512+00	172.21.0.1	node	directus_fields	157	\N
180	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.514+00	172.21.0.1	node	directus_fields	158	\N
181	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.516+00	172.21.0.1	node	directus_fields	159	\N
182	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.518+00	172.21.0.1	node	directus_fields	160	\N
183	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.52+00	172.21.0.1	node	directus_fields	161	\N
184	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.524+00	172.21.0.1	node	directus_collections	posts	\N
185	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.593+00	172.21.0.1	node	directus_collections	website	\N
186	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.695+00	172.21.0.1	node	directus_collections	block_button	\N
187	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.798+00	172.21.0.1	node	directus_collections	block_button_group	\N
188	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.892+00	172.21.0.1	node	directus_collections	block_form	\N
189	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:01.992+00	172.21.0.1	node	directus_collections	block_gallery	\N
190	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:02.095+00	172.21.0.1	node	directus_collections	block_gallery_items	\N
191	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:02.194+00	172.21.0.1	node	directus_collections	block_hero	\N
192	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:02.292+00	172.21.0.1	node	directus_collections	block_posts	\N
193	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:02.398+00	172.21.0.1	node	directus_collections	block_pricing	\N
194	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:02.494+00	172.21.0.1	node	directus_collections	block_pricing_cards	\N
195	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:02.596+00	172.21.0.1	node	directus_collections	block_richtext	\N
196	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:02.692+00	172.21.0.1	node	directus_collections	form_fields	\N
197	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:02.797+00	172.21.0.1	node	directus_collections	forms	\N
198	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:02.895+00	172.21.0.1	node	directus_collections	form_submissions	\N
199	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:02.992+00	172.21.0.1	node	directus_collections	form_submission_values	\N
200	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:03.09+00	172.21.0.1	node	directus_collections	globals	\N
201	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:03.191+00	172.21.0.1	node	directus_collections	navigation	\N
202	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:03.291+00	172.21.0.1	node	directus_collections	navigation_items	\N
203	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:03.389+00	172.21.0.1	node	directus_collections	page_blocks	\N
204	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:03.499+00	172.21.0.1	node	directus_collections	pages	\N
205	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:03.591+00	172.21.0.1	node	directus_collections	posts	\N
206	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:03.802+00	172.21.0.1	node	directus_fields	162	\N
207	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:03.893+00	172.21.0.1	node	directus_fields	163	\N
208	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:06.792+00	172.21.0.1	node	directus_roles	8ba4ed6f-d330-4675-ae46-119c533a0928	\N
209	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:06.996+00	172.21.0.1	node	directus_policies	307380fe-195e-44cc-9cc0-6993aeee9428	\N
210	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.09+00	172.21.0.1	node	directus_policies	52598a64-071d-4071-96fa-4b620d6189b5	\N
211	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.19+00	172.21.0.1	node	directus_policies	8ba4ed6f-d330-4675-ae46-119c533a0928	\N
212	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.29+00	172.21.0.1	node	directus_policies	ee1055a2-7c03-4b0b-9b65-ca68491b6329	\N
213	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.389+00	172.21.0.1	node	directus_policies	ef049c8b-546b-4bbc-9cd7-b05d77e58b66	\N
214	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.594+00	172.21.0.1	node	directus_permissions	1	\N
215	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.596+00	172.21.0.1	node	directus_permissions	2	\N
216	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.598+00	172.21.0.1	node	directus_permissions	3	\N
217	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.6+00	172.21.0.1	node	directus_permissions	4	\N
218	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.601+00	172.21.0.1	node	directus_permissions	5	\N
219	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.604+00	172.21.0.1	node	directus_permissions	6	\N
220	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.608+00	172.21.0.1	node	directus_permissions	7	\N
221	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.613+00	172.21.0.1	node	directus_permissions	8	\N
222	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.615+00	172.21.0.1	node	directus_permissions	9	\N
223	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.617+00	172.21.0.1	node	directus_permissions	10	\N
224	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.618+00	172.21.0.1	node	directus_permissions	11	\N
225	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.62+00	172.21.0.1	node	directus_permissions	12	\N
226	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.621+00	172.21.0.1	node	directus_permissions	13	\N
227	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.623+00	172.21.0.1	node	directus_permissions	14	\N
228	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.624+00	172.21.0.1	node	directus_permissions	15	\N
229	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.626+00	172.21.0.1	node	directus_permissions	16	\N
230	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.627+00	172.21.0.1	node	directus_permissions	17	\N
231	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.628+00	172.21.0.1	node	directus_permissions	18	\N
232	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.629+00	172.21.0.1	node	directus_permissions	19	\N
233	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.63+00	172.21.0.1	node	directus_permissions	20	\N
234	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.631+00	172.21.0.1	node	directus_permissions	21	\N
235	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.632+00	172.21.0.1	node	directus_permissions	22	\N
236	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.633+00	172.21.0.1	node	directus_permissions	23	\N
237	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.633+00	172.21.0.1	node	directus_permissions	24	\N
238	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.634+00	172.21.0.1	node	directus_permissions	25	\N
239	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.635+00	172.21.0.1	node	directus_permissions	26	\N
240	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.636+00	172.21.0.1	node	directus_permissions	27	\N
241	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.639+00	172.21.0.1	node	directus_permissions	28	\N
242	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.64+00	172.21.0.1	node	directus_permissions	29	\N
243	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.644+00	172.21.0.1	node	directus_permissions	30	\N
244	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.646+00	172.21.0.1	node	directus_permissions	31	\N
245	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.647+00	172.21.0.1	node	directus_permissions	32	\N
246	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.649+00	172.21.0.1	node	directus_permissions	33	\N
247	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.65+00	172.21.0.1	node	directus_permissions	34	\N
248	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.651+00	172.21.0.1	node	directus_permissions	35	\N
249	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.652+00	172.21.0.1	node	directus_permissions	36	\N
250	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.653+00	172.21.0.1	node	directus_permissions	37	\N
251	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.654+00	172.21.0.1	node	directus_permissions	38	\N
252	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.655+00	172.21.0.1	node	directus_permissions	39	\N
253	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.656+00	172.21.0.1	node	directus_permissions	40	\N
254	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.658+00	172.21.0.1	node	directus_permissions	41	\N
255	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.66+00	172.21.0.1	node	directus_permissions	42	\N
256	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.661+00	172.21.0.1	node	directus_permissions	43	\N
257	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.663+00	172.21.0.1	node	directus_permissions	44	\N
258	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.665+00	172.21.0.1	node	directus_permissions	45	\N
259	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.667+00	172.21.0.1	node	directus_permissions	46	\N
260	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.668+00	172.21.0.1	node	directus_permissions	47	\N
261	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.669+00	172.21.0.1	node	directus_permissions	48	\N
262	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.67+00	172.21.0.1	node	directus_permissions	49	\N
263	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.671+00	172.21.0.1	node	directus_permissions	50	\N
264	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.673+00	172.21.0.1	node	directus_permissions	51	\N
265	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.675+00	172.21.0.1	node	directus_permissions	52	\N
266	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.676+00	172.21.0.1	node	directus_permissions	53	\N
267	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.677+00	172.21.0.1	node	directus_permissions	54	\N
268	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.679+00	172.21.0.1	node	directus_permissions	55	\N
269	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.68+00	172.21.0.1	node	directus_permissions	56	\N
270	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.681+00	172.21.0.1	node	directus_permissions	57	\N
271	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.682+00	172.21.0.1	node	directus_permissions	58	\N
272	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.683+00	172.21.0.1	node	directus_permissions	59	\N
273	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.684+00	172.21.0.1	node	directus_permissions	60	\N
274	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.685+00	172.21.0.1	node	directus_permissions	61	\N
275	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.686+00	172.21.0.1	node	directus_permissions	62	\N
276	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.687+00	172.21.0.1	node	directus_permissions	63	\N
277	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.687+00	172.21.0.1	node	directus_permissions	64	\N
278	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.689+00	172.21.0.1	node	directus_permissions	65	\N
279	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.69+00	172.21.0.1	node	directus_permissions	66	\N
280	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.692+00	172.21.0.1	node	directus_permissions	67	\N
281	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.693+00	172.21.0.1	node	directus_permissions	68	\N
282	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.694+00	172.21.0.1	node	directus_permissions	69	\N
283	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.695+00	172.21.0.1	node	directus_permissions	70	\N
284	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.696+00	172.21.0.1	node	directus_permissions	71	\N
285	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.697+00	172.21.0.1	node	directus_permissions	72	\N
286	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.698+00	172.21.0.1	node	directus_permissions	73	\N
287	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.701+00	172.21.0.1	node	directus_permissions	74	\N
288	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.704+00	172.21.0.1	node	directus_permissions	75	\N
289	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.706+00	172.21.0.1	node	directus_permissions	76	\N
290	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.708+00	172.21.0.1	node	directus_permissions	77	\N
291	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.71+00	172.21.0.1	node	directus_permissions	78	\N
292	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.712+00	172.21.0.1	node	directus_permissions	79	\N
293	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.714+00	172.21.0.1	node	directus_permissions	80	\N
294	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.716+00	172.21.0.1	node	directus_permissions	81	\N
295	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.717+00	172.21.0.1	node	directus_permissions	82	\N
296	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.719+00	172.21.0.1	node	directus_permissions	83	\N
297	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.72+00	172.21.0.1	node	directus_permissions	84	\N
298	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.721+00	172.21.0.1	node	directus_permissions	85	\N
299	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.722+00	172.21.0.1	node	directus_permissions	86	\N
300	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.724+00	172.21.0.1	node	directus_permissions	87	\N
301	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.725+00	172.21.0.1	node	directus_permissions	88	\N
302	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.726+00	172.21.0.1	node	directus_permissions	89	\N
303	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.728+00	172.21.0.1	node	directus_permissions	90	\N
304	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.729+00	172.21.0.1	node	directus_permissions	91	\N
305	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.731+00	172.21.0.1	node	directus_permissions	92	\N
306	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.732+00	172.21.0.1	node	directus_permissions	93	\N
307	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.733+00	172.21.0.1	node	directus_permissions	94	\N
308	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.735+00	172.21.0.1	node	directus_permissions	95	\N
309	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.737+00	172.21.0.1	node	directus_permissions	96	\N
310	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.738+00	172.21.0.1	node	directus_permissions	97	\N
311	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.739+00	172.21.0.1	node	directus_permissions	98	\N
312	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.741+00	172.21.0.1	node	directus_permissions	99	\N
313	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.742+00	172.21.0.1	node	directus_permissions	100	\N
314	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.743+00	172.21.0.1	node	directus_permissions	101	\N
315	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.744+00	172.21.0.1	node	directus_permissions	102	\N
316	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.745+00	172.21.0.1	node	directus_permissions	103	\N
317	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.746+00	172.21.0.1	node	directus_permissions	104	\N
318	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.747+00	172.21.0.1	node	directus_permissions	105	\N
319	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.748+00	172.21.0.1	node	directus_permissions	106	\N
320	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.749+00	172.21.0.1	node	directus_permissions	107	\N
321	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.75+00	172.21.0.1	node	directus_permissions	108	\N
322	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.751+00	172.21.0.1	node	directus_permissions	109	\N
323	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.753+00	172.21.0.1	node	directus_permissions	110	\N
324	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.755+00	172.21.0.1	node	directus_permissions	111	\N
325	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.756+00	172.21.0.1	node	directus_permissions	112	\N
326	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.757+00	172.21.0.1	node	directus_permissions	113	\N
327	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.758+00	172.21.0.1	node	directus_permissions	114	\N
328	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.759+00	172.21.0.1	node	directus_permissions	115	\N
329	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.76+00	172.21.0.1	node	directus_permissions	116	\N
330	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.762+00	172.21.0.1	node	directus_permissions	117	\N
331	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.765+00	172.21.0.1	node	directus_permissions	118	\N
332	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.766+00	172.21.0.1	node	directus_permissions	119	\N
333	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.768+00	172.21.0.1	node	directus_permissions	120	\N
334	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.769+00	172.21.0.1	node	directus_permissions	121	\N
335	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.769+00	172.21.0.1	node	directus_permissions	122	\N
336	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.77+00	172.21.0.1	node	directus_permissions	123	\N
337	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.771+00	172.21.0.1	node	directus_permissions	124	\N
338	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.772+00	172.21.0.1	node	directus_permissions	125	\N
339	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.773+00	172.21.0.1	node	directus_permissions	126	\N
340	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.774+00	172.21.0.1	node	directus_permissions	127	\N
341	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.775+00	172.21.0.1	node	directus_permissions	128	\N
342	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.776+00	172.21.0.1	node	directus_permissions	129	\N
343	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.777+00	172.21.0.1	node	directus_permissions	130	\N
344	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.779+00	172.21.0.1	node	directus_permissions	131	\N
345	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:07.78+00	172.21.0.1	node	directus_permissions	132	\N
346	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:08+00	172.21.0.1	node	directus_users	88a6e8cf-f0f8-41db-a3a2-8a9741c086cc	\N
347	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:08.103+00	172.21.0.1	node	directus_users	d56956bf-6ed0-465e-bb4a-ec9bde65c5f0	\N
348	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:08.4+00	172.21.0.1	node	directus_access	bc851ef2-5b0d-4ebc-adb2-b717f30167f0	\N
349	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:08.509+00	172.21.0.1	node	directus_access	188a6dce-ddf2-4d7d-98b7-02accab9803b	\N
350	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:08.612+00	172.21.0.1	node	directus_access	6de77eee-b06c-4665-97a9-2e54467483f9	\N
351	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:08.712+00	172.21.0.1	node	directus_access	248a8203-02f3-47a7-9b82-b295e9202967	\N
352	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:08.817+00	172.21.0.1	node	directus_access	ce033dd3-b78d-4a56-9bf0-fc6f742389b5	\N
353	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:08.912+00	172.21.0.1	node	directus_access	6f680545-4a81-4422-bef4-ba2553b51418	\N
354	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:09.014+00	172.21.0.1	node	directus_access	2bd7d120-c70d-4469-8851-e14b11cdc823	\N
355	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:09.11+00	172.21.0.1	node	directus_access	8a4f1d01-b692-427c-90ad-adbd9c479449	\N
356	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:09.305+00	172.21.0.1	node	directus_folders	d0f67ad6-abbb-45d6-8d3e-b499a4c74d80	\N
357	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:09.307+00	172.21.0.1	node	directus_folders	e6308546-92fb-4b10-b586-eefaf1d97f7f	\N
358	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:09.308+00	172.21.0.1	node	directus_folders	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	\N
359	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:09.404+00	172.21.0.1	node	directus_folders	d0f67ad6-abbb-45d6-8d3e-b499a4c74d80	\N
360	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:09.503+00	172.21.0.1	node	directus_folders	e6308546-92fb-4b10-b586-eefaf1d97f7f	\N
361	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:09.597+00	172.21.0.1	node	directus_folders	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	\N
362	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:09.812+00	172.21.0.1	node	directus_files	03a7d1c7-81e2-432f-9561-9df2691189c8	\N
363	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:09.902+00	172.21.0.1	node	directus_files	12e02b82-b4a4-4aaf-8ca4-e73c20a41c26	\N
364	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.005+00	172.21.0.1	node	directus_files	1d3d2bd3-ff59-4626-bef5-9d5eef6510b3	\N
365	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.099+00	172.21.0.1	node	directus_files	2b4a0ba0-52c7-4e10-b191-c803d8da6a36	\N
366	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.204+00	172.21.0.1	node	directus_files	35a67f1b-d401-4300-a503-b8e583186f2a	\N
367	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.298+00	172.21.0.1	node	directus_files	3eff7dc2-445a-47c5-9503-3f600ecdb5c6	\N
368	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.403+00	172.21.0.1	node	directus_files	43ddd7b8-9b2f-4aa1-b63c-933b4ae81ca2	\N
369	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.502+00	172.21.0.1	node	directus_files	440df429-4715-42a0-afcd-569f5cdfb145	\N
370	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.6+00	172.21.0.1	node	directus_files	44a4e780-d59b-4fa5-9b26-1c4b447474d2	\N
371	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.698+00	172.21.0.1	node	directus_files	50570a31-a990-453c-bdfc-0ad7175dd8bf	\N
372	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.799+00	172.21.0.1	node	directus_files	535f1284-dbc4-4e4e-9e50-b44a1df130bd	\N
373	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.9+00	172.21.0.1	node	directus_files	6464e61f-455a-4b47-b623-bb12e5251dfe	\N
374	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.998+00	172.21.0.1	node	directus_files	68103296-6634-4d66-918a-04b09afe6621	\N
375	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.098+00	172.21.0.1	node	directus_files	6964d750-1c00-4b9c-81e4-0c81cfa82bbb	\N
376	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.206+00	172.21.0.1	node	directus_files	7775c53a-6c2c-453d-8c22-8b5445121d10	\N
377	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.3+00	172.21.0.1	node	directus_files	8f748634-d77b-4985-b27e-7e1f3559881a	\N
378	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.399+00	172.21.0.1	node	directus_files	9a52e835-e131-4290-81bb-5a512599f93e	\N
379	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.501+00	172.21.0.1	node	directus_files	a051ea01-07a5-45cb-bcc6-411af9560be5	\N
380	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.597+00	172.21.0.1	node	directus_files	ac905071-0643-4337-8f53-48ed45b1ccf2	\N
381	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.704+00	172.21.0.1	node	directus_files	b9db00d9-535f-4e24-8a46-5f7e5fc65bf2	\N
382	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.799+00	172.21.0.1	node	directus_files	c2a301bd-74ed-4a50-9b85-3cb1f40f8dee	\N
383	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.901+00	172.21.0.1	node	directus_files	d4fd6edc-4cc5-48c1-8bc7-e646924bbdca	\N
384	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.998+00	172.21.0.1	node	directus_files	dc258f02-d1a3-47f4-9f3e-2a71a0010c56	\N
385	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:12.1+00	172.21.0.1	node	directus_files	dea64c65-de50-4d86-abea-6dee3d5256b2	\N
386	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:12.2+00	172.21.0.1	node	directus_files	df0745c2-b6e3-4b37-b64d-55a4eb0033ab	\N
387	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:12.306+00	172.21.0.1	node	directus_files	fd6440c2-dd48-4792-9d08-3124cd99b40f	\N
388	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.299+00	172.21.0.1	node	block_button	3d583c03-4909-4001-aad2-cd7af6ec53af	\N
389	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.301+00	172.21.0.1	node	block_button	5f902715-6e50-491b-b29c-b947a11a10f1	\N
390	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.302+00	172.21.0.1	node	block_button	47ddfe4e-721a-483f-a09b-4c10fe0cec1a	\N
391	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.303+00	172.21.0.1	node	block_button	b74af9dd-cc34-451c-88cf-c3e14c39cf4f	\N
392	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.305+00	172.21.0.1	node	block_button	dda7d91c-b449-4ab3-9d9d-84d4e8c09caf	\N
393	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.306+00	172.21.0.1	node	block_button	efb97ae9-d95e-4f9d-bf00-9df9966c65ec	\N
394	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.401+00	172.21.0.1	node	block_button_group	0b1512d8-3bec-4dbc-919c-4514bbe37dc1	\N
395	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.404+00	172.21.0.1	node	block_button_group	4cd6d4ca-82ea-4daf-ae79-a4c4265bfb27	\N
396	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.405+00	172.21.0.1	node	block_button_group	aed01afb-490d-42d3-bbf4-cf64081494b9	\N
397	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.5+00	172.21.0.1	node	block_form	1419faec-e263-431c-bd5f-a57f394c39f6	\N
398	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.501+00	172.21.0.1	node	block_form	185eca12-4af1-4a1c-bfd7-4bc2fab52097	\N
399	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.503+00	172.21.0.1	node	block_form	3e262b2d-48fc-4816-b5e8-c991817d56fc	\N
400	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.598+00	172.21.0.1	node	block_gallery	34fdcf0e-cc5d-4c40-b61f-4f0a5e167306	\N
401	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.599+00	172.21.0.1	node	block_gallery	61a1866b-5bff-473a-a6e3-106cd6b37412	\N
402	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.6+00	172.21.0.1	node	block_gallery	7b5e5649-40be-4f54-a2fb-b021a520645d	\N
403	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.699+00	172.21.0.1	node	block_gallery_items	02bb1bbf-c10d-462e-be09-c4556b3ea087	\N
404	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.7+00	172.21.0.1	node	block_gallery_items	1dbac868-e2cc-4930-9f21-5e0dd1b40e52	\N
405	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.701+00	172.21.0.1	node	block_gallery_items	1f520e55-4054-47f9-896a-baf2787ec007	\N
406	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.702+00	172.21.0.1	node	block_gallery_items	297914c3-b1dd-4683-b6bf-5b8cad3bf743	\N
407	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.705+00	172.21.0.1	node	block_gallery_items	2a0369dc-1b43-4d5a-9832-d180a0aa0295	\N
408	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.71+00	172.21.0.1	node	block_gallery_items	46f226f4-6d13-4783-878f-3ae0eafcfd5d	\N
409	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.711+00	172.21.0.1	node	block_gallery_items	553ea498-554a-478c-89d5-99f33e56642d	\N
410	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.716+00	172.21.0.1	node	block_gallery_items	62ab01e9-27f7-44e5-90bb-d3f6258dd0cf	\N
411	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.717+00	172.21.0.1	node	block_gallery_items	9527868b-136a-48a9-917d-44e0abc835e2	\N
412	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.718+00	172.21.0.1	node	block_gallery_items	d3481aae-7dc4-446f-8b68-50e77aab58da	\N
413	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.719+00	172.21.0.1	node	block_gallery_items	f6ce1b83-5020-4a5a-9c71-0d69d3b216ff	\N
414	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.799+00	172.21.0.1	node	block_hero	6aa654f5-b55f-4436-a35c-1f989f26268a	\N
415	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.8+00	172.21.0.1	node	block_hero	8ece685c-e903-443b-b29d-b36491709743	\N
416	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.801+00	172.21.0.1	node	block_hero	93693278-93bc-4a70-a54c-bbbf1e0037d7	\N
417	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.802+00	172.21.0.1	node	block_hero	d81ab264-b2be-4077-84e7-b1406e74d9c3	\N
418	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.896+00	172.21.0.1	node	block_posts	060b632d-d70d-4db1-8b95-4fbab7a52ae8	\N
419	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:14.999+00	172.21.0.1	node	block_pricing	48cf2543-15e0-454f-9b31-cbf3c2406712	\N
420	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.098+00	172.21.0.1	node	block_pricing_cards	388404db-1703-4b10-b12b-e5d4385f1530	\N
421	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.1+00	172.21.0.1	node	block_pricing_cards	83972d2a-742e-4a6c-8698-563d01dde54d	\N
422	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.198+00	172.21.0.1	node	block_richtext	1134799b-3fd1-47ea-963f-13d8ac1b9e3a	\N
423	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.199+00	172.21.0.1	node	block_richtext	129625db-433f-4104-9922-3b803ba4599d	\N
424	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.2+00	172.21.0.1	node	block_richtext	1619b2fe-ce09-4a78-8c47-1428995c7c1c	\N
425	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.203+00	172.21.0.1	node	block_richtext	1a273da2-8d00-4ccc-9109-0da0d0d88dcb	\N
426	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.204+00	172.21.0.1	node	block_richtext	2387edcd-e6ab-451c-befa-30ab247b2290	\N
427	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.205+00	172.21.0.1	node	block_richtext	62517520-a3e0-4655-bd92-2d45293eb0c6	\N
428	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.206+00	172.21.0.1	node	block_richtext	6c5df396-be52-4b1c-a144-d55b229e5a34	\N
429	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.207+00	172.21.0.1	node	block_richtext	8f714990-cb45-4c6c-afa6-a49615768a4f	\N
430	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.208+00	172.21.0.1	node	block_richtext	9d65df9c-307f-4049-bc21-0c3a77178d91	\N
431	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.21+00	172.21.0.1	node	block_richtext	a6275645-16b7-4994-8100-8c43ca07ab06	\N
432	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.211+00	172.21.0.1	node	block_richtext	b0c8cec2-acc5-46ad-9044-8a6602000c3e	\N
433	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.298+00	172.21.0.1	node	form_fields	0f3deba1-9d6b-44a0-aa87-a9b38e834beb	\N
434	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.299+00	172.21.0.1	node	form_fields	56c64efd-520f-4578-acca-e0565e247681	\N
435	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.299+00	172.21.0.1	node	form_fields	a3d87bc0-f143-44ca-bea0-9eaf56b67783	\N
436	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.3+00	172.21.0.1	node	form_fields	a5222af8-f9a2-4d1a-9713-7ce0e2d5edc5	\N
437	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.3+00	172.21.0.1	node	form_fields	bbc7b1c6-304e-4ee1-9afa-c5cffda6af27	\N
438	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.301+00	172.21.0.1	node	form_fields	d37bc00f-bfb5-4496-85c3-70190b21b707	\N
439	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.302+00	172.21.0.1	node	form_fields	eef0eb77-ecab-4fba-9903-c46d6ad6d85b	\N
440	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.401+00	172.21.0.1	node	forms	36493b64-2bad-4c58-9d70-785ccb12ee26	\N
441	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.402+00	172.21.0.1	node	forms	5da3d356-d818-434f-b225-db35c418bbb6	\N
442	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.497+00	172.21.0.1	node	form_submissions	133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0	\N
443	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.498+00	172.21.0.1	node	form_submissions	3805e2c0-ebba-4070-a1b3-b39ba1b4932b	\N
444	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.598+00	172.21.0.1	node	form_submission_values	28f8820f-def4-4b3b-b35d-b79fc7f731a1	\N
445	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.599+00	172.21.0.1	node	form_submission_values	54e554ef-82e7-463e-8542-624352cdb5ca	\N
446	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.599+00	172.21.0.1	node	form_submission_values	63df3a8a-75dd-4ea5-94d6-cad8c0820ef4	\N
447	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.6+00	172.21.0.1	node	form_submission_values	6883038b-15bf-4635-8216-a362e62e7ca2	\N
448	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.699+00	172.21.0.1	node	navigation	footer	\N
449	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.7+00	172.21.0.1	node	navigation	main	\N
450	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.799+00	172.21.0.1	node	navigation_items	0ca39155-c212-4b6e-8156-5a4322731c07	\N
451	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.799+00	172.21.0.1	node	navigation_items	192a490a-bbb9-4794-b82f-619a01463723	\N
452	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.8+00	172.21.0.1	node	navigation_items	28fde01b-647b-4151-96e5-6d876d3f3329	\N
453	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.801+00	172.21.0.1	node	navigation_items	717b30fd-1bf6-46eb-a0cd-81923c17fcf6	\N
454	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.801+00	172.21.0.1	node	navigation_items	c732b100-1f5a-4ce1-8fde-b0072d09623f	\N
455	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.802+00	172.21.0.1	node	navigation_items	dc0870f8-e316-48b0-b34d-ca5c4394344c	\N
456	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.802+00	172.21.0.1	node	navigation_items	e096f25c-a549-4fe5-a284-17b0a347037a	\N
457	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.897+00	172.21.0.1	node	page_blocks	1f774f44-3e33-4b0f-93f4-fdd6df898438	\N
458	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.898+00	172.21.0.1	node	page_blocks	b4d48d5a-0450-4e8c-8c5b-198e7063a10f	\N
459	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.899+00	172.21.0.1	node	page_blocks	bc826e30-4988-4035-98bd-5ffc4799e5fc	\N
460	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.899+00	172.21.0.1	node	page_blocks	090e286c-3dfe-4638-89d9-09b2e0caf2ea	\N
461	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.9+00	172.21.0.1	node	page_blocks	45227f61-5ff1-431c-8dee-1a50d369325f	\N
462	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.901+00	172.21.0.1	node	page_blocks	2b017efb-ce7c-4b90-9f59-a39236ffe571	\N
463	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.901+00	172.21.0.1	node	page_blocks	0ff1d6c4-ff77-46c6-ad02-f9ae31484505	\N
464	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.902+00	172.21.0.1	node	page_blocks	2d9abe8f-a7ad-480d-8fc7-603c712e2f40	\N
465	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.903+00	172.21.0.1	node	page_blocks	529e6408-7372-4195-b82d-e444c06ac492	\N
466	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.903+00	172.21.0.1	node	page_blocks	ed613af3-b584-47e7-9584-7d6d4d87eaf5	\N
467	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.904+00	172.21.0.1	node	page_blocks	39d02b18-18d2-4c29-9268-038f72ea05fe	\N
468	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.904+00	172.21.0.1	node	page_blocks	7e1ce212-3f8a-43b4-aff7-131bf4241e30	\N
469	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.997+00	172.21.0.1	node	pages	636dc283-e634-4d5d-aada-e6743db46036	\N
470	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.998+00	172.21.0.1	node	pages	1ce02298-817a-46bc-ac92-6a6c10c20f88	\N
471	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.999+00	172.21.0.1	node	pages	9821199f-4b05-49fb-8407-fbfe9b866ef0	\N
472	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:15.999+00	172.21.0.1	node	pages	2a62887e-2384-4bd2-a919-7665d85fed07	\N
473	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.002+00	172.21.0.1	node	pages	93023385-f574-4040-9ead-42b717db2015	\N
474	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.097+00	172.21.0.1	node	posts	c96b64b4-9567-46f6-8eb5-ac2f37c4918d	\N
475	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.098+00	172.21.0.1	node	posts	ba559a1e-5b0c-4932-ab97-b1ab4ca69955	\N
476	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.099+00	172.21.0.1	node	posts	ddf1003f-6b9a-460c-83fd-d985d6defbd6	\N
477	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.099+00	172.21.0.1	node	posts	f7845a69-edcb-4163-a2a9-fb82b64475c5	\N
478	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.1+00	172.21.0.1	node	posts	a5068543-fdd1-4773-b6c3-43b4c222d377	\N
479	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.1+00	172.21.0.1	node	posts	399a9a1b-bad5-4b5b-86e4-291ad1676e91	\N
480	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.2+00	172.21.0.1	node	block_button	3d583c03-4909-4001-aad2-cd7af6ec53af	\N
481	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.202+00	172.21.0.1	node	block_button	5f902715-6e50-491b-b29c-b947a11a10f1	\N
482	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.203+00	172.21.0.1	node	block_button	47ddfe4e-721a-483f-a09b-4c10fe0cec1a	\N
483	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.204+00	172.21.0.1	node	block_button	b74af9dd-cc34-451c-88cf-c3e14c39cf4f	\N
484	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.205+00	172.21.0.1	node	block_button	dda7d91c-b449-4ab3-9d9d-84d4e8c09caf	\N
485	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.208+00	172.21.0.1	node	block_button	efb97ae9-d95e-4f9d-bf00-9df9966c65ec	\N
486	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.298+00	172.21.0.1	node	block_button_group	0b1512d8-3bec-4dbc-919c-4514bbe37dc1	\N
487	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.301+00	172.21.0.1	node	block_button_group	4cd6d4ca-82ea-4daf-ae79-a4c4265bfb27	\N
488	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.306+00	172.21.0.1	node	block_button_group	aed01afb-490d-42d3-bbf4-cf64081494b9	\N
489	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.397+00	172.21.0.1	node	block_form	1419faec-e263-431c-bd5f-a57f394c39f6	\N
490	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.4+00	172.21.0.1	node	block_form	185eca12-4af1-4a1c-bfd7-4bc2fab52097	\N
491	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.401+00	172.21.0.1	node	block_form	3e262b2d-48fc-4816-b5e8-c991817d56fc	\N
492	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.5+00	172.21.0.1	node	block_gallery_items	1dbac868-e2cc-4930-9f21-5e0dd1b40e52	\N
493	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.502+00	172.21.0.1	node	block_gallery_items	2a0369dc-1b43-4d5a-9832-d180a0aa0295	\N
494	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.503+00	172.21.0.1	node	block_gallery_items	46f226f4-6d13-4783-878f-3ae0eafcfd5d	\N
495	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.505+00	172.21.0.1	node	block_gallery_items	02bb1bbf-c10d-462e-be09-c4556b3ea087	\N
496	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.506+00	172.21.0.1	node	block_gallery_items	d3481aae-7dc4-446f-8b68-50e77aab58da	\N
497	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.511+00	172.21.0.1	node	block_gallery_items	1f520e55-4054-47f9-896a-baf2787ec007	\N
498	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.513+00	172.21.0.1	node	block_gallery	34fdcf0e-cc5d-4c40-b61f-4f0a5e167306	\N
499	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.516+00	172.21.0.1	node	block_gallery	61a1866b-5bff-473a-a6e3-106cd6b37412	\N
500	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.518+00	172.21.0.1	node	block_gallery_items	553ea498-554a-478c-89d5-99f33e56642d	\N
501	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.519+00	172.21.0.1	node	block_gallery_items	62ab01e9-27f7-44e5-90bb-d3f6258dd0cf	\N
502	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.521+00	172.21.0.1	node	block_gallery_items	f6ce1b83-5020-4a5a-9c71-0d69d3b216ff	\N
503	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.522+00	172.21.0.1	node	block_gallery_items	9527868b-136a-48a9-917d-44e0abc835e2	\N
504	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.523+00	172.21.0.1	node	block_gallery_items	297914c3-b1dd-4683-b6bf-5b8cad3bf743	\N
505	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.526+00	172.21.0.1	node	block_gallery	7b5e5649-40be-4f54-a2fb-b021a520645d	\N
506	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.6+00	172.21.0.1	node	block_gallery_items	02bb1bbf-c10d-462e-be09-c4556b3ea087	\N
507	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.602+00	172.21.0.1	node	block_gallery_items	1dbac868-e2cc-4930-9f21-5e0dd1b40e52	\N
508	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.603+00	172.21.0.1	node	block_gallery_items	1f520e55-4054-47f9-896a-baf2787ec007	\N
509	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.605+00	172.21.0.1	node	block_gallery_items	297914c3-b1dd-4683-b6bf-5b8cad3bf743	\N
510	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.606+00	172.21.0.1	node	block_gallery_items	2a0369dc-1b43-4d5a-9832-d180a0aa0295	\N
511	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.607+00	172.21.0.1	node	block_gallery_items	46f226f4-6d13-4783-878f-3ae0eafcfd5d	\N
512	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.607+00	172.21.0.1	node	block_gallery_items	553ea498-554a-478c-89d5-99f33e56642d	\N
513	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.609+00	172.21.0.1	node	block_gallery_items	62ab01e9-27f7-44e5-90bb-d3f6258dd0cf	\N
514	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.61+00	172.21.0.1	node	block_gallery_items	9527868b-136a-48a9-917d-44e0abc835e2	\N
515	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.611+00	172.21.0.1	node	block_gallery_items	d3481aae-7dc4-446f-8b68-50e77aab58da	\N
516	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.612+00	172.21.0.1	node	block_gallery_items	f6ce1b83-5020-4a5a-9c71-0d69d3b216ff	\N
517	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.697+00	172.21.0.1	node	block_hero	6aa654f5-b55f-4436-a35c-1f989f26268a	\N
518	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.699+00	172.21.0.1	node	block_hero	8ece685c-e903-443b-b29d-b36491709743	\N
519	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.701+00	172.21.0.1	node	block_hero	93693278-93bc-4a70-a54c-bbbf1e0037d7	\N
520	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.703+00	172.21.0.1	node	block_hero	d81ab264-b2be-4077-84e7-b1406e74d9c3	\N
521	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.802+00	172.21.0.1	node	block_posts	060b632d-d70d-4db1-8b95-4fbab7a52ae8	\N
522	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.898+00	172.21.0.1	node	block_pricing_cards	83972d2a-742e-4a6c-8698-563d01dde54d	\N
523	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.9+00	172.21.0.1	node	block_pricing_cards	388404db-1703-4b10-b12b-e5d4385f1530	\N
524	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:16.902+00	172.21.0.1	node	block_pricing	48cf2543-15e0-454f-9b31-cbf3c2406712	\N
525	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.003+00	172.21.0.1	node	block_pricing_cards	388404db-1703-4b10-b12b-e5d4385f1530	\N
526	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.007+00	172.21.0.1	node	block_pricing_cards	83972d2a-742e-4a6c-8698-563d01dde54d	\N
527	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.098+00	172.21.0.1	node	block_richtext	1134799b-3fd1-47ea-963f-13d8ac1b9e3a	\N
528	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.1+00	172.21.0.1	node	block_richtext	129625db-433f-4104-9922-3b803ba4599d	\N
529	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.101+00	172.21.0.1	node	block_richtext	1619b2fe-ce09-4a78-8c47-1428995c7c1c	\N
530	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.103+00	172.21.0.1	node	block_richtext	1a273da2-8d00-4ccc-9109-0da0d0d88dcb	\N
531	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.104+00	172.21.0.1	node	block_richtext	2387edcd-e6ab-451c-befa-30ab247b2290	\N
532	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.106+00	172.21.0.1	node	block_richtext	62517520-a3e0-4655-bd92-2d45293eb0c6	\N
533	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.109+00	172.21.0.1	node	block_richtext	6c5df396-be52-4b1c-a144-d55b229e5a34	\N
534	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.112+00	172.21.0.1	node	block_richtext	8f714990-cb45-4c6c-afa6-a49615768a4f	\N
535	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.115+00	172.21.0.1	node	block_richtext	9d65df9c-307f-4049-bc21-0c3a77178d91	\N
536	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.117+00	172.21.0.1	node	block_richtext	a6275645-16b7-4994-8100-8c43ca07ab06	\N
537	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.119+00	172.21.0.1	node	block_richtext	b0c8cec2-acc5-46ad-9044-8a6602000c3e	\N
538	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.201+00	172.21.0.1	node	form_fields	0f3deba1-9d6b-44a0-aa87-a9b38e834beb	\N
539	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.202+00	172.21.0.1	node	form_fields	56c64efd-520f-4578-acca-e0565e247681	\N
540	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.204+00	172.21.0.1	node	form_fields	a3d87bc0-f143-44ca-bea0-9eaf56b67783	\N
541	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.206+00	172.21.0.1	node	form_fields	a5222af8-f9a2-4d1a-9713-7ce0e2d5edc5	\N
542	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.21+00	172.21.0.1	node	form_fields	bbc7b1c6-304e-4ee1-9afa-c5cffda6af27	\N
543	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.213+00	172.21.0.1	node	form_fields	d37bc00f-bfb5-4496-85c3-70190b21b707	\N
544	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.215+00	172.21.0.1	node	form_fields	eef0eb77-ecab-4fba-9903-c46d6ad6d85b	\N
545	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.305+00	172.21.0.1	node	forms	36493b64-2bad-4c58-9d70-785ccb12ee26	\N
546	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.308+00	172.21.0.1	node	form_submissions	133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0	\N
547	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.31+00	172.21.0.1	node	form_submissions	3805e2c0-ebba-4070-a1b3-b39ba1b4932b	\N
548	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.313+00	172.21.0.1	node	forms	5da3d356-d818-434f-b225-db35c418bbb6	\N
549	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.399+00	172.21.0.1	node	form_submission_values	6883038b-15bf-4635-8216-a362e62e7ca2	\N
550	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.401+00	172.21.0.1	node	form_submission_values	63df3a8a-75dd-4ea5-94d6-cad8c0820ef4	\N
551	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.403+00	172.21.0.1	node	form_submissions	133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0	\N
552	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.408+00	172.21.0.1	node	form_submission_values	28f8820f-def4-4b3b-b35d-b79fc7f731a1	\N
553	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.411+00	172.21.0.1	node	form_submission_values	54e554ef-82e7-463e-8542-624352cdb5ca	\N
554	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.414+00	172.21.0.1	node	form_submissions	3805e2c0-ebba-4070-a1b3-b39ba1b4932b	\N
555	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.506+00	172.21.0.1	node	form_submission_values	28f8820f-def4-4b3b-b35d-b79fc7f731a1	\N
556	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.511+00	172.21.0.1	node	form_submission_values	54e554ef-82e7-463e-8542-624352cdb5ca	\N
557	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.513+00	172.21.0.1	node	form_submission_values	63df3a8a-75dd-4ea5-94d6-cad8c0820ef4	\N
558	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.514+00	172.21.0.1	node	form_submission_values	6883038b-15bf-4635-8216-a362e62e7ca2	\N
559	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.6+00	172.21.0.1	node	navigation_items	dc0870f8-e316-48b0-b34d-ca5c4394344c	\N
560	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.603+00	172.21.0.1	node	navigation_items	e096f25c-a549-4fe5-a284-17b0a347037a	\N
561	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.605+00	172.21.0.1	node	navigation_items	c732b100-1f5a-4ce1-8fde-b0072d09623f	\N
562	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.607+00	172.21.0.1	node	navigation	footer	\N
563	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.612+00	172.21.0.1	node	navigation_items	192a490a-bbb9-4794-b82f-619a01463723	\N
564	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.614+00	172.21.0.1	node	navigation_items	0ca39155-c212-4b6e-8156-5a4322731c07	\N
565	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.616+00	172.21.0.1	node	navigation	main	\N
566	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.7+00	172.21.0.1	node	navigation_items	28fde01b-647b-4151-96e5-6d876d3f3329	\N
567	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.703+00	172.21.0.1	node	navigation_items	717b30fd-1bf6-46eb-a0cd-81923c17fcf6	\N
568	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.704+00	172.21.0.1	node	navigation_items	0ca39155-c212-4b6e-8156-5a4322731c07	\N
569	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.709+00	172.21.0.1	node	navigation_items	192a490a-bbb9-4794-b82f-619a01463723	\N
570	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.712+00	172.21.0.1	node	navigation_items	28fde01b-647b-4151-96e5-6d876d3f3329	\N
571	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.714+00	172.21.0.1	node	navigation_items	717b30fd-1bf6-46eb-a0cd-81923c17fcf6	\N
572	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.716+00	172.21.0.1	node	navigation_items	c732b100-1f5a-4ce1-8fde-b0072d09623f	\N
573	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.719+00	172.21.0.1	node	navigation_items	dc0870f8-e316-48b0-b34d-ca5c4394344c	\N
574	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.725+00	172.21.0.1	node	navigation_items	e096f25c-a549-4fe5-a284-17b0a347037a	\N
575	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.797+00	172.21.0.1	node	page_blocks	1f774f44-3e33-4b0f-93f4-fdd6df898438	\N
576	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.799+00	172.21.0.1	node	page_blocks	b4d48d5a-0450-4e8c-8c5b-198e7063a10f	\N
577	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.801+00	172.21.0.1	node	page_blocks	bc826e30-4988-4035-98bd-5ffc4799e5fc	\N
578	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.802+00	172.21.0.1	node	page_blocks	090e286c-3dfe-4638-89d9-09b2e0caf2ea	\N
579	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.803+00	172.21.0.1	node	page_blocks	45227f61-5ff1-431c-8dee-1a50d369325f	\N
580	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.804+00	172.21.0.1	node	page_blocks	2b017efb-ce7c-4b90-9f59-a39236ffe571	\N
581	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.806+00	172.21.0.1	node	page_blocks	0ff1d6c4-ff77-46c6-ad02-f9ae31484505	\N
582	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.807+00	172.21.0.1	node	page_blocks	2d9abe8f-a7ad-480d-8fc7-603c712e2f40	\N
583	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.808+00	172.21.0.1	node	page_blocks	529e6408-7372-4195-b82d-e444c06ac492	\N
584	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.811+00	172.21.0.1	node	page_blocks	ed613af3-b584-47e7-9584-7d6d4d87eaf5	\N
585	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.813+00	172.21.0.1	node	page_blocks	39d02b18-18d2-4c29-9268-038f72ea05fe	\N
586	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.814+00	172.21.0.1	node	page_blocks	7e1ce212-3f8a-43b4-aff7-131bf4241e30	\N
587	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.902+00	172.21.0.1	node	pages	636dc283-e634-4d5d-aada-e6743db46036	\N
588	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.905+00	172.21.0.1	node	pages	1ce02298-817a-46bc-ac92-6a6c10c20f88	\N
589	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.907+00	172.21.0.1	node	pages	9821199f-4b05-49fb-8407-fbfe9b866ef0	\N
590	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.909+00	172.21.0.1	node	pages	2a62887e-2384-4bd2-a919-7665d85fed07	\N
591	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.915+00	172.21.0.1	node	pages	93023385-f574-4040-9ead-42b717db2015	\N
592	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:17.999+00	172.21.0.1	node	posts	c96b64b4-9567-46f6-8eb5-ac2f37c4918d	\N
593	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:18.001+00	172.21.0.1	node	posts	ba559a1e-5b0c-4932-ab97-b1ab4ca69955	\N
594	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:18.003+00	172.21.0.1	node	posts	ddf1003f-6b9a-460c-83fd-d985d6defbd6	\N
595	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:18.005+00	172.21.0.1	node	posts	f7845a69-edcb-4163-a2a9-fb82b64475c5	\N
596	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:18.007+00	172.21.0.1	node	posts	a5068543-fdd1-4773-b6c3-43b4c222d377	\N
597	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:18.01+00	172.21.0.1	node	posts	399a9a1b-bad5-4b5b-86e4-291ad1676e91	\N
598	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:18.098+00	172.21.0.1	node	globals	ab89c489-faea-4310-8b59-7ddb3caf279a	\N
599	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:18.218+00	172.21.0.1	node	directus_fields	1	\N
600	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:18.308+00	172.21.0.1	node	directus_fields	10	\N
601	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:18.411+00	172.21.0.1	node	directus_fields	13	\N
602	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:18.509+00	172.21.0.1	node	directus_fields	18	\N
603	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:18.615+00	172.21.0.1	node	directus_fields	21	\N
604	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:18.703+00	172.21.0.1	node	directus_fields	26	\N
605	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:18.804+00	172.21.0.1	node	directus_fields	34	\N
606	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:18.915+00	172.21.0.1	node	directus_fields	36	\N
607	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:19.007+00	172.21.0.1	node	directus_fields	39	\N
608	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:19.104+00	172.21.0.1	node	directus_fields	43	\N
609	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:19.203+00	172.21.0.1	node	directus_fields	55	\N
610	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:19.303+00	172.21.0.1	node	directus_fields	58	\N
611	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:19.41+00	172.21.0.1	node	directus_fields	93	\N
612	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:19.503+00	172.21.0.1	node	directus_fields	88	\N
613	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:19.612+00	172.21.0.1	node	directus_fields	70	\N
614	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:19.709+00	172.21.0.1	node	directus_fields	100	\N
615	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:19.816+00	172.21.0.1	node	directus_fields	115	\N
616	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:19.913+00	172.21.0.1	node	directus_fields	120	\N
617	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:20.003+00	172.21.0.1	node	directus_fields	125	\N
618	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:20.108+00	172.21.0.1	node	directus_fields	130	\N
619	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:20.205+00	172.21.0.1	node	directus_fields	137	\N
620	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:20.313+00	172.21.0.1	node	directus_fields	139	\N
621	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:20.403+00	172.21.0.1	node	directus_fields	140	\N
622	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:20.508+00	172.21.0.1	node	directus_fields	142	\N
623	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:20.61+00	172.21.0.1	node	directus_fields	150	\N
624	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:20.711+00	172.21.0.1	node	directus_fields	154	\N
625	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:20.804+00	172.21.0.1	node	directus_fields	155	\N
626	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:20.998+00	172.21.0.1	node	directus_dashboards	5a5b8448-16f4-46b1-abe8-19730cadc3a5	\N
627	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:21.199+00	172.21.0.1	node	directus_panels	01914ef3-5512-4c89-9709-904f9b47ddeb	\N
628	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:21.298+00	172.21.0.1	node	directus_panels	19b3d901-aa7c-4a04-bc9a-800e43510e69	\N
629	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:21.399+00	172.21.0.1	node	directus_panels	3861ceb1-11ff-4e9d-a985-60d862d90aa3	\N
630	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:21.499+00	172.21.0.1	node	directus_panels	53575d2f-e3a0-4532-a176-d047cbbc11a7	\N
631	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:21.599+00	172.21.0.1	node	directus_panels	8cb3b63c-d8e3-4078-9160-096e32b9fcb0	\N
632	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:21.698+00	172.21.0.1	node	directus_panels	b770ea7e-1b49-441f-ba6f-2d4b90e08070	\N
633	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:21.8+00	172.21.0.1	node	directus_panels	dc01026c-1728-4e71-ab45-7cea9fc4751c	\N
634	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.001+00	172.21.0.1	node	directus_flows	5429ccb0-7e97-4ef5-9d65-2bbcf964f9a6	\N
635	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.098+00	172.21.0.1	node	directus_flows	5915dd55-fff8-4d47-b48c-a0e42e5033c1	\N
636	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.198+00	172.21.0.1	node	directus_flows	61757ab0-b139-4079-b5eb-4e05bb8142ac	\N
637	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.304+00	172.21.0.1	node	directus_flows	69e87d0b-df14-4779-bdc8-abc05f2f1e97	\N
638	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.397+00	172.21.0.1	node	directus_flows	7c8732cd-9d9e-44be-a3f6-89c0d42c7687	\N
639	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.499+00	172.21.0.1	node	directus_flows	d4bbac48-a444-49e0-aedb-9af5273b88df	\N
640	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.603+00	172.21.0.1	node	directus_operations	0beeeb1a-2338-4ab4-95f5-0757bf3e43be	\N
641	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.608+00	172.21.0.1	node	directus_operations	0cf30253-f9ed-413f-ac27-7a0ecffa9ee4	\N
642	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.613+00	172.21.0.1	node	directus_operations	2adf33da-7fd7-42f7-a6fe-48409463d51b	\N
643	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.617+00	172.21.0.1	node	directus_operations	3b7d004a-1dba-43c4-b902-a44fd71602ae	\N
644	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.623+00	172.21.0.1	node	directus_operations	599b80e4-7c74-4496-b243-da198c8613d9	\N
645	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.631+00	172.21.0.1	node	directus_operations	5d667ac5-2594-4f16-a863-3847d8917caa	\N
646	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.635+00	172.21.0.1	node	directus_operations	5df25cf8-b407-4fef-9d3b-c328f89f1561	\N
647	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.64+00	172.21.0.1	node	directus_operations	6efe1572-6cdd-4c80-a063-eb71b7f1e519	\N
648	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.644+00	172.21.0.1	node	directus_operations	8673740a-f7f8-44dd-9abd-5a714e0d6c74	\N
649	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.649+00	172.21.0.1	node	directus_operations	89125be2-8205-4ad0-a77f-bd3e984202b3	\N
650	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.653+00	172.21.0.1	node	directus_operations	bb1b1e3f-032e-48b7-b260-1cf3af4a116c	\N
651	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.656+00	172.21.0.1	node	directus_operations	bc71ca4e-d979-4ef9-a449-af100a7e1b3b	\N
652	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.659+00	172.21.0.1	node	directus_operations	c846f644-e7c1-43c9-8bb7-81181de0cd60	\N
653	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.663+00	172.21.0.1	node	directus_operations	d6f73e98-19ef-47d6-8d1f-99d77137d36b	\N
654	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.666+00	172.21.0.1	node	directus_operations	dff1a702-bcc0-4528-905e-309feb880111	\N
655	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.671+00	172.21.0.1	node	directus_operations	e12b95db-a408-4e7e-b30b-264f7fa8baa3	\N
656	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.675+00	172.21.0.1	node	directus_operations	e6c50f84-e229-4f15-8119-c7708256e825	\N
657	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.678+00	172.21.0.1	node	directus_operations	edc5e1ae-a3ed-45af-ae77-10409a66cd03	\N
658	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.681+00	172.21.0.1	node	directus_operations	fbf696ea-c6af-4230-8f62-c663beebd6d9	\N
659	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.685+00	172.21.0.1	node	directus_operations	fd271542-fac2-42d8-aa10-a02520c3753f	\N
660	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.701+00	172.21.0.1	node	directus_operations	0beeeb1a-2338-4ab4-95f5-0757bf3e43be	\N
661	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.801+00	172.21.0.1	node	directus_operations	0cf30253-f9ed-413f-ac27-7a0ecffa9ee4	\N
662	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:22.905+00	172.21.0.1	node	directus_operations	2adf33da-7fd7-42f7-a6fe-48409463d51b	\N
663	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:23.004+00	172.21.0.1	node	directus_operations	3b7d004a-1dba-43c4-b902-a44fd71602ae	\N
664	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:23.105+00	172.21.0.1	node	directus_operations	599b80e4-7c74-4496-b243-da198c8613d9	\N
665	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:23.203+00	172.21.0.1	node	directus_operations	5d667ac5-2594-4f16-a863-3847d8917caa	\N
666	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:23.301+00	172.21.0.1	node	directus_operations	5df25cf8-b407-4fef-9d3b-c328f89f1561	\N
667	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:23.406+00	172.21.0.1	node	directus_operations	6efe1572-6cdd-4c80-a063-eb71b7f1e519	\N
668	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:23.501+00	172.21.0.1	node	directus_operations	8673740a-f7f8-44dd-9abd-5a714e0d6c74	\N
669	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:23.601+00	172.21.0.1	node	directus_operations	89125be2-8205-4ad0-a77f-bd3e984202b3	\N
670	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:23.706+00	172.21.0.1	node	directus_operations	bb1b1e3f-032e-48b7-b260-1cf3af4a116c	\N
671	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:23.804+00	172.21.0.1	node	directus_operations	bc71ca4e-d979-4ef9-a449-af100a7e1b3b	\N
672	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:23.904+00	172.21.0.1	node	directus_operations	c846f644-e7c1-43c9-8bb7-81181de0cd60	\N
673	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:24.002+00	172.21.0.1	node	directus_operations	d6f73e98-19ef-47d6-8d1f-99d77137d36b	\N
675	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:24.205+00	172.21.0.1	node	directus_operations	e12b95db-a408-4e7e-b30b-264f7fa8baa3	\N
677	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:24.4+00	172.21.0.1	node	directus_operations	edc5e1ae-a3ed-45af-ae77-10409a66cd03	\N
679	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:24.606+00	172.21.0.1	node	directus_operations	fd271542-fac2-42d8-aa10-a02520c3753f	\N
684	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:26.374+00	172.21.0.1	node	directus_extensions	8a827d6a-f820-4814-8803-9bcf398282d4	\N
685	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:26.381+00	172.21.0.1	node	directus_extensions	8c20b301-38aa-48a7-99c4-3142338da1b2	\N
674	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:24.1+00	172.21.0.1	node	directus_operations	dff1a702-bcc0-4528-905e-309feb880111	\N
676	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:24.305+00	172.21.0.1	node	directus_operations	e6c50f84-e229-4f15-8119-c7708256e825	\N
678	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:24.505+00	172.21.0.1	node	directus_operations	fbf696ea-c6af-4230-8f62-c663beebd6d9	\N
680	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:24.807+00	172.21.0.1	node	directus_settings	1	\N
681	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:26.011+00	172.21.0.1	node	directus_extensions	1c09c3a4-2750-4a01-94fd-c0d91fe35870	\N
682	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:26.077+00	172.21.0.1	node	directus_extensions	2d64a791-0274-441b-88d3-70675fb29335	\N
683	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:26.372+00	172.21.0.1	node	directus_extensions	a2587ead-a73a-4718-88e2-02de0c78d57a	\N
686	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:26.385+00	172.21.0.1	node	directus_extensions	c53d1496-ab3b-4a23-9b0c-9fb8ce85800f	\N
687	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:26.45+00	172.21.0.1	node	directus_extensions	bfa185ec-f15c-4d3e-8e0e-06925ba6cdfe	\N
688	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:26.468+00	172.21.0.1	node	directus_extensions	dab2c341-5ce5-42da-872f-40e596c4db16	\N
689	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:46:19.698+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	globals	ab89c489-faea-4310-8b59-7ddb3caf279a	http://127.0.0.1:8055
690	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:46:31.699+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	globals	ab89c489-faea-4310-8b59-7ddb3caf279a	http://127.0.0.1:8055
691	login	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 11:14:12.739+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	60f562f9-84b6-4914-bf63-a7193567fcdf	http://127.0.0.1:8055
692	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 11:17:02.247+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_extensions	2e7698db-cfb1-471f-bed1-5e975a4071bb	http://127.0.0.1:8055
693	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 11:17:09.04+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_extensions	2e7698db-cfb1-471f-bed1-5e975a4071bb	http://127.0.0.1:8055
694	login	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 11:25:12.722+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	60f562f9-84b6-4914-bf63-a7193567fcdf	http://127.0.0.1:8055
695	login	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 11:26:43.389+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	60f562f9-84b6-4914-bf63-a7193567fcdf	http://127.0.0.1:8055
696	login	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 11:29:28.635+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	60f562f9-84b6-4914-bf63-a7193567fcdf	http://127.0.0.1:8055
697	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 11:29:48.815+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_extensions	b392a0ff-61c3-4d8e-a6db-631135986a15	http://127.0.0.1:8055
698	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 11:30:01.653+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_settings	1	http://127.0.0.1:8055
699	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:29:10.212+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	164	http://127.0.0.1:8055
700	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:29:10.226+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	165	http://127.0.0.1:8055
701	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:29:10.234+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	166	http://127.0.0.1:8055
702	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:29:10.24+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	167	http://127.0.0.1:8055
703	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:29:10.25+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	subscriptions	http://127.0.0.1:8055
704	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:31:30.233+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	168	http://127.0.0.1:8055
705	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:32:01.384+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	168	http://127.0.0.1:8055
706	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:32:13.28+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	166	http://127.0.0.1:8055
707	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:33:19.88+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	166	http://127.0.0.1:8055
708	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:35:06.59+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	169	http://127.0.0.1:8055
709	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:35:16.686+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	169	http://127.0.0.1:8055
710	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:37:54.25+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	170	http://127.0.0.1:8055
711	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:37:54.256+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	subscription_tiers	http://127.0.0.1:8055
712	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:41:40.994+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	171	http://127.0.0.1:8055
713	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:41:53.711+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	172	http://127.0.0.1:8055
714	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:41:59.733+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	172	http://127.0.0.1:8055
715	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:45:12.154+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_extensions	ba006417-d6d5-4eed-a8a8-d51d89073a9c	http://127.0.0.1:8055
716	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:46:03.036+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	173	http://127.0.0.1:8055
717	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:46:35.819+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	173	http://127.0.0.1:8055
718	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:46:56.456+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	subscription_tiers	http://127.0.0.1:8055
719	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:46:56.501+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	website	http://127.0.0.1:8055
720	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:46:56.507+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	blocks	http://127.0.0.1:8055
721	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:46:56.511+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	subscriptions	http://127.0.0.1:8055
722	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:47:05.291+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	170	http://127.0.0.1:8055
723	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:47:05.301+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	171	http://127.0.0.1:8055
724	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:47:05.309+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	173	http://127.0.0.1:8055
725	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:47:05.316+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	172	http://127.0.0.1:8055
726	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:47:07.159+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	170	http://127.0.0.1:8055
727	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:47:07.166+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	173	http://127.0.0.1:8055
728	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:47:07.17+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	172	http://127.0.0.1:8055
729	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:47:07.176+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	171	http://127.0.0.1:8055
730	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:50:33.422+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	174	http://127.0.0.1:8055
731	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:52:25.844+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	175	http://127.0.0.1:8055
732	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:56:35.015+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	176	http://127.0.0.1:8055
733	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:56:48.659+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	177	http://127.0.0.1:8055
734	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:56:51.519+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	176	http://127.0.0.1:8055
735	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 13:56:54.217+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	177	http://127.0.0.1:8055
736	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:00:51.737+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_extensions	2dc2e66e-5625-4c84-bf4d-0e76174739f9	http://127.0.0.1:8055
737	delete	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:01:03.683+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_extensions	2e7698db-cfb1-471f-bed1-5e975a4071bb	http://127.0.0.1:8055
738	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:02:14.108+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	178	http://127.0.0.1:8055
739	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:04:37.38+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	179	http://127.0.0.1:8055
740	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:06:19.652+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	2af31103-959f-45a6-98b6-14c05a27412d	http://127.0.0.1:8055
741	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:07:04.085+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	subscription_tiers	8e173084-fb18-45db-8d7a-bc78819b26ca	http://127.0.0.1:8055
742	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:07:40.473+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	f28f2e8f-dfe4-4021-a029-583f6c8a6da4	http://127.0.0.1:8055
743	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:08:04.699+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	subscription_tiers	ab307bd9-1850-4117-886b-bb61bf4fc8cc	http://127.0.0.1:8055
744	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:08:14.115+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	788cae90-bd68-400c-a262-ff6c02b4555b	http://127.0.0.1:8055
745	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:08:43.999+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	subscription_tiers	bdbafc2e-eeef-4c21-aed1-e9d806ed7612	http://127.0.0.1:8055
746	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:09:29.227+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	bcc1e125-9bed-4ea6-a28f-c619127a9423	http://127.0.0.1:8055
747	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:09:38.722+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	subscription_tiers	0bebcf60-2913-49c8-b028-f3ce091ac4ab	http://127.0.0.1:8055
748	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:10:28.284+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	subscriptions	1	http://127.0.0.1:8055
749	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:10:28.287+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	60f562f9-84b6-4914-bf63-a7193567fcdf	http://127.0.0.1:8055
750	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:18:22.841+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	133	http://127.0.0.1:8055
751	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:18:22.848+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	134	http://127.0.0.1:8055
752	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:18:22.851+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://127.0.0.1:8055
753	delete	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:18:49.581+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	134	http://127.0.0.1:8055
754	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:18:49.582+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://127.0.0.1:8055
755	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:23:28.467+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	180	http://127.0.0.1:8055
756	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:23:28.471+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	video_courses	http://127.0.0.1:8055
757	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:27:53.459+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	181	http://127.0.0.1:8055
758	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:27:53.462+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	video_course_chapters	http://127.0.0.1:8055
759	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:28:02.281+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	182	http://127.0.0.1:8055
760	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:28:28.17+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	183	http://127.0.0.1:8055
761	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:28:32.604+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	183	http://127.0.0.1:8055
762	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:28:34.11+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	182	http://127.0.0.1:8055
763	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:28:49.097+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	184	http://127.0.0.1:8055
764	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:29:45.094+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	185	http://127.0.0.1:8055
765	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:29:48.134+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	181	http://127.0.0.1:8055
766	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:29:48.141+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	182	http://127.0.0.1:8055
767	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:29:48.149+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	183	http://127.0.0.1:8055
768	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:29:48.159+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	185	http://127.0.0.1:8055
769	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:29:48.167+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	184	http://127.0.0.1:8055
770	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:31:30.888+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	186	http://127.0.0.1:8055
771	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:31:33.081+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	181	http://127.0.0.1:8055
772	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:31:33.092+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	182	http://127.0.0.1:8055
773	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:31:33.098+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	183	http://127.0.0.1:8055
774	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:31:33.104+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	185	http://127.0.0.1:8055
775	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:31:33.113+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	186	http://127.0.0.1:8055
776	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:31:33.121+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	184	http://127.0.0.1:8055
777	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:32:05.311+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	website	http://127.0.0.1:8055
778	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:32:05.314+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	blocks	http://127.0.0.1:8055
779	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:32:05.319+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	subscriptions	http://127.0.0.1:8055
780	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:32:05.322+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	video_courses	http://127.0.0.1:8055
781	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:32:05.325+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	video_course_chapters	http://127.0.0.1:8055
782	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:32:07.038+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	video_course_chapters	http://127.0.0.1:8055
783	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:32:07.039+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	website	http://127.0.0.1:8055
784	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:32:07.046+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	blocks	http://127.0.0.1:8055
785	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:32:07.05+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	subscriptions	http://127.0.0.1:8055
786	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:32:07.059+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	video_courses	http://127.0.0.1:8055
787	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:33:05.13+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	187	http://127.0.0.1:8055
788	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:33:05.213+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	188	http://127.0.0.1:8055
789	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:34:14.873+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	189	http://127.0.0.1:8055
790	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:34:17.828+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	180	http://127.0.0.1:8055
791	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:34:17.837+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	189	http://127.0.0.1:8055
792	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:34:17.846+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	187	http://127.0.0.1:8055
793	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:34:19.68+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	189	http://127.0.0.1:8055
794	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:34:38.821+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	190	http://127.0.0.1:8055
795	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:34:43.209+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	190	http://127.0.0.1:8055
796	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:34:44.695+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	180	http://127.0.0.1:8055
797	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:34:44.704+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	189	http://127.0.0.1:8055
798	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:34:44.709+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	190	http://127.0.0.1:8055
799	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:34:44.715+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	187	http://127.0.0.1:8055
800	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:35:33.37+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	website	http://127.0.0.1:8055
801	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:35:33.38+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	blocks	http://127.0.0.1:8055
802	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:35:33.383+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	subscriptions	http://127.0.0.1:8055
803	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:35:33.386+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	video_course_chapters	http://127.0.0.1:8055
804	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:35:33.389+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	video_courses	http://127.0.0.1:8055
805	delete	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:35:36.737+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	video_courses	http://127.0.0.1:8055
806	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:35:49.016+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	191	http://127.0.0.1:8055
807	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:35:49.019+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	video_courses	http://127.0.0.1:8055
808	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:36:01.611+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	192	http://127.0.0.1:8055
809	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:36:09.006+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	193	http://127.0.0.1:8055
810	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:36:16.68+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	194	http://127.0.0.1:8055
811	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:36:24.069+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	195	http://127.0.0.1:8055
812	delete	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:36:46.162+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	video_course_chapters	http://127.0.0.1:8055
813	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:37:00.554+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	196	http://127.0.0.1:8055
814	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:38:59.162+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	197	http://127.0.0.1:8055
815	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:39:04.851+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	197	http://127.0.0.1:8055
816	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:39:09.602+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	170	http://127.0.0.1:8055
817	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:39:09.611+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	173	http://127.0.0.1:8055
818	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:39:09.617+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	172	http://127.0.0.1:8055
819	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:39:09.622+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	171	http://127.0.0.1:8055
820	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:39:09.626+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	197	http://127.0.0.1:8055
821	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:39:09.638+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	175	http://127.0.0.1:8055
822	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:39:09.649+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	176	http://127.0.0.1:8055
823	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:39:09.654+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	177	http://127.0.0.1:8055
824	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:39:19.05+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	subscription_tiers	0bebcf60-2913-49c8-b028-f3ce091ac4ab	http://127.0.0.1:8055
825	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:39:23.731+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	subscription_tiers	8e173084-fb18-45db-8d7a-bc78819b26ca	http://127.0.0.1:8055
826	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:39:27.453+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	subscription_tiers	bdbafc2e-eeef-4c21-aed1-e9d806ed7612	http://127.0.0.1:8055
827	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:39:30.882+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	subscription_tiers	ab307bd9-1850-4117-886b-bb61bf4fc8cc	http://127.0.0.1:8055
828	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:41:58.978+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	198	http://127.0.0.1:8055
829	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:42:01.933+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	170	http://127.0.0.1:8055
830	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:42:01.938+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	173	http://127.0.0.1:8055
831	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:42:01.944+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	172	http://127.0.0.1:8055
832	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:42:01.95+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	171	http://127.0.0.1:8055
833	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:42:01.958+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	197	http://127.0.0.1:8055
834	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:42:01.963+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	198	http://127.0.0.1:8055
835	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:42:01.968+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	175	http://127.0.0.1:8055
836	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:42:01.972+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	176	http://127.0.0.1:8055
837	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:42:01.979+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	177	http://127.0.0.1:8055
838	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:42:23.11+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	subscription_tiers	8e173084-fb18-45db-8d7a-bc78819b26ca	http://127.0.0.1:8055
839	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:42:27.418+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	subscription_tiers	0bebcf60-2913-49c8-b028-f3ce091ac4ab	http://127.0.0.1:8055
840	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:42:32.663+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	subscription_tiers	ab307bd9-1850-4117-886b-bb61bf4fc8cc	http://127.0.0.1:8055
841	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:43:30.043+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	199	http://127.0.0.1:8055
842	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:43:30.048+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	video_courses_lessons	http://127.0.0.1:8055
843	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:44:24.616+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	200	http://127.0.0.1:8055
844	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:45:19.391+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	201	http://127.0.0.1:8055
845	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:46:04.551+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	202	http://127.0.0.1:8055
846	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:46:05.732+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	199	http://127.0.0.1:8055
847	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:46:05.738+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	200	http://127.0.0.1:8055
848	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:46:05.748+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	202	http://127.0.0.1:8055
849	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:46:05.757+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	201	http://127.0.0.1:8055
850	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:46:10.022+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	video_courses_lessons	http://127.0.0.1:8055
851	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:46:10.059+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	website	http://127.0.0.1:8055
852	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:46:10.063+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	blocks	http://127.0.0.1:8055
853	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:46:10.068+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	subscriptions	http://127.0.0.1:8055
854	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:46:10.071+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	video_courses	http://127.0.0.1:8055
855	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:46:51.549+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	203	http://127.0.0.1:8055
856	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:46:51.631+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	204	http://127.0.0.1:8055
857	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:48:13.107+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	6fdbc31c-c2b2-46d0-b473-10dc08d9bc98	http://127.0.0.1:8055
858	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:53:13.848+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	82616dcf-a772-49b5-a4c3-f1d159b3d10a	http://127.0.0.1:8055
859	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:55:24.733+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	0b592bdc-d961-42aa-b8b8-4f609cbe1804	http://127.0.0.1:8055
860	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:55:26.475+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	video_courses_lessons	1	http://127.0.0.1:8055
861	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:55:26.477+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	video_courses_lessons	2	http://127.0.0.1:8055
862	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:55:26.479+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	video_courses	1	http://127.0.0.1:8055
863	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:14.756+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	205	http://127.0.0.1:8055
864	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:14.871+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	206	http://127.0.0.1:8055
865	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:20.426+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	170	http://127.0.0.1:8055
866	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:20.432+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	173	http://127.0.0.1:8055
867	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:20.441+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	172	http://127.0.0.1:8055
868	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:20.446+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	176	http://127.0.0.1:8055
869	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:20.453+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	171	http://127.0.0.1:8055
870	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:20.459+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	197	http://127.0.0.1:8055
871	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:20.464+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	198	http://127.0.0.1:8055
872	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:20.469+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	175	http://127.0.0.1:8055
873	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:20.485+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	177	http://127.0.0.1:8055
874	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:20.494+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	205	http://127.0.0.1:8055
875	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:22.266+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	170	http://127.0.0.1:8055
876	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:22.274+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	173	http://127.0.0.1:8055
877	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:22.277+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	172	http://127.0.0.1:8055
878	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:22.281+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	176	http://127.0.0.1:8055
879	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:22.284+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	177	http://127.0.0.1:8055
880	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:22.288+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	171	http://127.0.0.1:8055
881	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:22.293+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	197	http://127.0.0.1:8055
882	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:22.296+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	198	http://127.0.0.1:8055
883	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:22.299+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	175	http://127.0.0.1:8055
884	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:22.302+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	205	http://127.0.0.1:8055
885	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:59.193+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	video_courses	1	http://127.0.0.1:8055
886	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:59.196+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	subscription_tiers	0bebcf60-2913-49c8-b028-f3ce091ac4ab	http://127.0.0.1:8055
887	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:59:16.89+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	video_courses	1	http://127.0.0.1:8055
888	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:59:16.896+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	subscription_tiers	8e173084-fb18-45db-8d7a-bc78819b26ca	http://127.0.0.1:8055
889	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:59:55.124+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	135	http://127.0.0.1:8055
890	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:59:55.147+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	136	http://127.0.0.1:8055
891	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:59:55.151+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://127.0.0.1:8055
892	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 15:00:20.611+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	206	http://127.0.0.1:8055
893	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 15:09:09.407+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	c3b1434f-d9db-4b78-8cca-17fef70984a9	http://127.0.0.1:8055
894	create	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 15:09:46.161+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	cd1f8e25-d49f-46c8-ba43-55155b255f06	http://127.0.0.1:8055
895	update	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 15:09:51.914+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	globals	ab89c489-faea-4310-8b59-7ddb3caf279a	http://127.0.0.1:8055
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
block_button	\N	\N	{{label}} - {{type}}	t	f	[{"language":"en-US","translation":"Button","singular":"Button","plural":"Buttons"}]	\N	t	archived	draft	sort	all	\N	\N	1	block_button_group	open	\N	f
block_button_group	smart_button	\N	{{buttons.label}}	t	f	[{"language":"en-US","translation":"Button Group","singular":"Button Group","plural":"Button Groups"}]	\N	t	archived	draft	\N	all	#18222F	\N	8	blocks	open	\N	f
block_form	format_shapes	\N	{{form.title}}	t	f	[{"language":"en-US","translation":"Form"}]	\N	t	\N	\N	\N	all	\N	\N	3	blocks	open	\N	f
block_gallery	grid_view	\N	{{headline}}	t	f	[{"language":"en-US","translation":"Gallery","singular":"Gallery","plural":"Gallery"}]	\N	t	\N	\N	\N	all	#1A212C	\N	5	blocks	open	\N	f
block_gallery_items	\N	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	block_gallery	open	\N	f
block_hero	aspect_ratio	\N	{{headline}}	t	f	[{"language":"en-US","translation":"Hero","singular":"Hero","plural":"Hero"}]	\N	t	\N	\N	\N	all	#1A212C	\N	1	blocks	open	\N	f
block_posts	signpost	\N	{{headline}}	t	f	[{"language":"en-US","translation":"Posts"}]	\N	t	\N	\N	\N	all	\N	\N	4	blocks	open	\N	f
block_pricing	attach_money	\N	{{headline}}	t	f	[{"language":"en-US","translation":"Pricing"}]	\N	t	\N	\N	\N	all	\N	\N	7	blocks	open	\N	f
block_pricing_cards	\N	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	block_pricing	open	\N	f
block_richtext	format_color_text	\N	{{headline}}	t	f	[{"language":"en-US","translation":"Rich Text","singular":"Rich Text","plural":"Rich Text"}]	\N	t	\N	\N	\N	all	#1A212C	\N	2	blocks	open	\N	f
form_fields	\N	Individual fields for each form	{{name}} • {{type}}	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	forms	open	\N	f
forms	text_format	Dynamic forms	{{title}}	f	f	\N	is_active	t	false	true	sort	all	\N	["title","submit_label","on_success","success_message","success_redirect_url","status","fields"]	3	website	open	\N	f
form_submissions	inbox	Data for all form responses	{{timestamp}} • {{form}}	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	4	website	open	\N	f
form_submission_values	list	Individual responses to each form field within a form submission	\N	t	f	[{"language":"en-US","translation":"Submission Values"}]	\N	t	\N	\N	\N	all	\N	\N	1	form_submissions	open	\N	f
globals	south_america	Site-wide settings	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	6	website	open	\N	f
navigation	menu_open	Dynamic menus for your site	\N	f	f	\N	is_active	t	false	true	\N	all	\N	["title","status","items.title","items.type","items.page","items.post","items.url","items.children","items.parent"]	5	website	open	\N	f
navigation_items	navigate_next	Individual menu items	{{title}}	t	f	\N	\N	t	\N	\N	\N	all	#18222F	["children","has_children","image","label","navigation","open_in_new_tab","page","title","type","url","post"]	1	navigation	open	\N	f
page_blocks	code_blocks	\N	\N	t	f	\N	\N	f	\N	\N	sort	all	#18222F	[]	3	pages	open	\N	f
pages	web_asset	Dynamic page builder	{{title}}	f	f	\N	\N	t	archived	draft	sort	all	\N	\N	1	website	open	http://localhost:3000/posts/{{slug}}?preview=true	f
posts	article	Individual blog posts	{{title}}	f	f	\N	status	t	archived	draft	sort	all	\N	["title","slug","author","status","image","description","content"]	2	website	open	http://localhost:3000/posts/{{slug}}?preview=true	f
subscription_tiers	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	subscriptions	open	\N	f
video_courses_lessons	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	video_courses	open	\N	f
website	folder_special	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	\N	open	\N	f
blocks	content_copy	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	#1A212C	\N	2	\N	closed	\N	f
subscriptions	\N	\N	\N	f	f	\N	\N	t	archived	draft	\N	all	\N	\N	3	\N	open	\N	f
video_courses	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	4	\N	open	\N	f
\.


--
-- Data for Name: directus_comments; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_comments (id, collection, item, comment, date_created, date_updated, user_created, user_updated) FROM stdin;
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
5a5b8448-16f4-46b1-abe8-19730cadc3a5	Form Submissions	forms_apps_script	Quick dashboard to tracking performance of your forms	2025-01-14 10:43:20.997+00	60f562f9-84b6-4914-bf63-a7193567fcdf	\N
\.


--
-- Data for Name: directus_extensions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
t	42bcde45-4a0d-4fe5-8fcc-400ad86dabbb	directus-extension-computed-interface	module	\N
t	6ee6d822-7e6e-4cad-bd10-57e30dc986db	directus-extension-group-tabs-interface	module	\N
t	5037db9c-f538-442d-aac3-bc7371af623c	directus-extension-schema-sync	module	\N
t	3f0a2f5c-3449-4ae9-a206-02a5dabcc82a	9108c453-4ebf-4827-a42c-b90740888480	registry	\N
t	6dc0d869-0a80-45d4-bec8-34feee933155	9621987d-012d-475a-bd7f-e293cac7b077	registry	\N
t	1c09c3a4-2750-4a01-94fd-c0d91fe35870	467d87ba-5246-41b7-be33-2bd0aa9c6c5e	registry	\N
t	2d64a791-0274-441b-88d3-70675fb29335	09bdf221-3b49-44ff-a514-6258a67ff587	registry	\N
t	a2587ead-a73a-4718-88e2-02de0c78d57a	64489dc4-ae84-472d-a9f8-fad653d43ba5	registry	\N
t	8a827d6a-f820-4814-8803-9bcf398282d4	9bde3cf6-c3bd-4bbf-befe-e65294d4b632	registry	\N
t	8c20b301-38aa-48a7-99c4-3142338da1b2	b9534a05-19a0-4f19-912b-729086969eef	registry	\N
t	c53d1496-ab3b-4a23-9b0c-9fb8ce85800f	e77fd62a-c9f5-4937-b153-cf10d8d13264	registry	\N
t	bfa185ec-f15c-4d3e-8e0e-06925ba6cdfe	3b80b125-4f65-4a6f-96c6-4ede2ed9f506	registry	\N
t	dab2c341-5ce5-42da-872f-40e596c4db16	9621987d-012d-475a-bd7f-e293cac7b077	registry	\N
t	b392a0ff-61c3-4d8e-a6db-631135986a15	25990187-d028-4099-ae46-70232d998d9f	registry	\N
t	ba006417-d6d5-4eed-a8a8-d51d89073a9c	9108c453-4ebf-4827-a42c-b90740888480	registry	\N
t	2dc2e66e-5625-4c84-bf4d-0e76174739f9	91e6a795-a123-4426-b113-0288970f61e4	registry	\N
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
2	block_button	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
3	block_button	type	\N	select-dropdown	{"choices":[{"text":"Page","value":"page","icon":"web_asset"},{"text":"Post","value":"post","icon":"article"},{"text":"URL","value":"url","icon":"link"}]}	labels	{"format":true,"choices":[{"text":"Page","value":"page","icon":"web_asset"},{"text":"Post","value":"post","icon":"article"},{"text":"URL","value":"url","icon":"link"}]}	f	f	4	half	\N	What type of link is this? Page and Post allow you to link to internal content. URL is for external content. Group can contain other menu items.	\N	f	\N	\N	\N
4	block_button	page	m2o	select-dropdown-m2o	{"template":"{{title}} - {{permalink}}"}	related-values	\N	f	t	5	half	\N	The internal page to link to.	[{"name":"IF type = pages","rule":{"_and":[{"type":{"_eq":"page"}}]},"hidden":false,"options":{"enableCreate":true,"enableSelect":true}}]	f	\N	\N	\N
5	block_button	post	m2o	select-dropdown-m2o	{"template":"{{title}} - {{slug}}"}	related-values	\N	f	t	6	half	\N	The internal post to link to.	[{"name":"IF type = post","rule":{"_and":[{"type":{"_eq":"post"}}]},"hidden":false,"options":{"enableCreate":true,"enableSelect":true}}]	f	\N	\N	\N
6	block_button	label	\N	input	\N	\N	\N	f	f	9	half	\N	Text to include on the button.	\N	f	\N	\N	\N
7	block_button	variant	\N	select-dropdown	{"choices":[{"text":"Default","value":"default"},{"text":"Outline","value":"outline"},{"text":"Soft","value":"soft"},{"text":"Ghost","value":"ghost"},{"text":"Link","value":"link"}]}	formatted-value	{"format":true}	f	f	10	half	\N	What type of button	\N	f	\N	\N	\N
8	block_button	button_group	\N	select-dropdown-m2o	\N	\N	\N	f	t	2	full	\N	The id of the Button Group this button belongs to.	\N	f	\N	\N	\N
9	block_button	url	\N	input	{"iconLeft":"link","trim":true}	formatted-value	{"format":true}	f	t	7	half	\N	The URL to link to. Could be relative (ie `/my-page`) or a full external URL (ie `https://docs.directus.io`)	[{"name":"If type = external","rule":{"_and":[{"type":{"_eq":"url"}}]},"hidden":false,"options":{"font":"sans-serif","trim":false,"masked":false,"clear":false,"slug":false}}]	f	\N	\N	\N
11	block_button_group	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
12	block_button_group	buttons	o2m	list-o2m	{"enableLink":true,"template":"{{label}} - {{type}}"}	related-values	{"template":"{{label}} - {{type}}"}	f	f	9	full	\N	Add individual buttons to the button group.	\N	f	\N	\N	\N
14	block_form	form	m2o	select-dropdown-m2o	\N	\N	\N	f	f	5	full	\N	Form to show within block	\N	f	\N	\N	\N
15	block_form	headline	\N	input	{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"}	\N	\N	f	f	4	full	\N	Larger main headline for this page section.	\N	f	\N	\N	\N
16	block_form	tagline	\N	input	\N	\N	\N	f	f	2	full	\N	Smaller copy shown above the headline to label a section or add extra context.	\N	f	\N	\N	\N
17	block_gallery	headline	\N	input	{"toolbar":["italic","removeformat"]}	\N	\N	f	f	4	full	\N	Larger main headline for this page section.	\N	f	\N	\N	\N
19	block_gallery	tagline	\N	input	\N	\N	\N	f	f	2	full	\N	Smaller copy shown above the headline to label a section or add extra context.	\N	f	\N	\N	\N
20	block_gallery	items	files	files	{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"}	\N	\N	f	f	5	full	\N	Images to include in the image gallery.	\N	f	\N	\N	\N
22	block_gallery_items	block_gallery	\N	\N	\N	\N	\N	f	t	2	full	\N	The id of the gallery block this item belongs to.	\N	f	\N	\N	\N
23	block_gallery_items	directus_file	\N	\N	\N	\N	\N	f	t	3	full	\N	The id of the file included in the gallery.	\N	f	\N	\N	\N
24	block_gallery_items	sort	\N	\N	\N	\N	\N	f	t	4	full	\N	\N	\N	f	\N	\N	\N
25	block_hero	headline	\N	input	{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"}	\N	\N	f	f	3	full	\N	Larger main headline for this page section.	\N	f	\N	\N	\N
27	block_hero	image	file	file-image	{"crop":false,"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"}	\N	\N	f	f	7	half	\N	Featured image in the hero.	\N	f	\N	\N	\N
28	block_hero	button_group	m2o	select-dropdown-m2o	{"template":"{{buttons.label}}","createRelatedItem":"always","enableLink":true,"enableSelect":false}	related-values	\N	f	f	5	full	\N	Action buttons that show below headline and description.	\N	f	\N	\N	\N
29	block_hero	description	\N	input-multiline	{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"}	\N	\N	f	f	4	full	\N	Supporting copy that shows below the headline.	\N	f	\N	\N	\N
30	block_hero	alignment	\N	select-radio	{"choices":[{"text":"Left","value":"left"},{"text":"Center","value":"center"},{"text":"Right","value":"right"}]}	formatted-value	{"format":true}	f	t	9	full	\N	Where is the image placed?	\N	f	\N	\N	\N
31	block_hero	tagline	\N	input	\N	\N	\N	f	f	2	full	\N	Smaller copy shown above the headline to label a section or add extra context.	\N	f	\N	\N	\N
32	block_hero	layout	\N	select-dropdown	{"choices":[{"text":"Image Left","value":"image_left","icon":"format_image_left"},{"text":"Image Center","value":"image_center","icon":"image"},{"text":"Image Right","value":"image_right","icon":"format_image_right"}]}	labels	{"format":true,"choices":[{"text":"Image Left","value":"image_left","icon":"format_image_left"},{"text":"Image Center","value":"image_center","icon":"image"},{"text":"Image Right","value":"image_right","icon":"format_image_right"}]}	f	f	8	half	\N	The layout for the component. You can set the image to display left, right, or in the center of page..	\N	f	\N	\N	\N
33	block_hero	divider-1zdl4a	alias,no-data	presentation-divider	{"inlineTitle":true,"icon":"image","color":"#A2B5CD"}	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
35	block_posts	headline	\N	input	{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"}	\N	\N	f	f	4	full	\N	Larger main headline for this page section.	\N	f	\N	\N	\N
37	block_posts	tagline	\N	input	\N	\N	\N	f	f	3	full	\N	Smaller copy shown above the headline to label a section or add extra context.	\N	f	\N	\N	\N
38	block_posts	notice-hc-3x7	alias,no-data	presentation-notice	{"text":"Add this block to show a collection of your blog posts on any page. It automatically retrieves and lists all published blog posts."}	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
40	block_pricing	headline	\N	input	{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"}	\N	\N	f	f	4	full	\N	Larger main headline for this page section.	\N	f	\N	\N	\N
103	globals	title	\N	input	\N	\N	\N	f	f	3	half	\N	Main site title	\N	f	\N	\N	\N
10	block_button_group	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
13	block_form	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
18	block_gallery	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
21	block_gallery_items	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
26	block_hero	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
34	block_posts	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
39	block_pricing	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
41	block_pricing	tagline	\N	input	\N	\N	\N	f	f	2	full	\N	Smaller copy shown above the headline to label a section or add extra context.	\N	f	\N	\N	\N
42	block_pricing	pricing_cards	o2m	list-o2m	{"template":"{{title}} • {{price}}"}	\N	\N	f	f	5	full	\N	The individual pricing cards to display.	\N	f	\N	\N	\N
44	block_pricing_cards	title	\N	input	{"placeholder":"Starter Plan"}	\N	\N	f	f	2	half	\N	Name of the pricing plan. Shown at the top of the card.	\N	f	\N	\N	\N
45	block_pricing_cards	description	\N	input-multiline	{"placeholder":"For small businesses and indie hackers"}	\N	\N	f	f	6	half	\N	Short, one sentence description of the pricing plan and who it is for.	\N	f	\N	\N	\N
46	block_pricing_cards	price	\N	input	{"placeholder":"$199 /month"}	\N	\N	f	f	4	half	\N	Price and term for the pricing plan. (ie `$199/mo`)	\N	f	\N	\N	\N
47	block_pricing_cards	badge	\N	input	{"placeholder":"Most popular"}	\N	\N	f	f	3	half	\N	Badge that displays at the top of the pricing plan card to add helpful context.	\N	f	\N	\N	\N
48	block_pricing_cards	features	cast-json	simple-list	{"limit":10}	\N	\N	f	f	7	half	\N	Short list of features included in this plan. Press `Enter` to add another item to the list.	\N	f	\N	\N	\N
49	block_pricing_cards	button	m2o	select-dropdown-m2o	{"createRelatedItem":"always","template":"{{label}} • {{type}}","enableSelect":false,"enableLink":true}	related-values	{"template":"{{label}} • {{type}}"}	f	f	8	full	\N	The action button / link shown at the bottom of the pricing card.	\N	f	\N	\N	\N
50	block_pricing_cards	pricing	\N	select-dropdown-m2o	{"enableSelect":false,"enableLink":true}	related-values	\N	f	t	9	full	\N	The id of the pricing block this card belongs to.	\N	f	\N	\N	\N
51	block_pricing_cards	is_highlighted	cast-boolean	boolean	{"label":"Highlighted"}	\N	\N	f	f	5	half	\N	Add highlighted border around the pricing plan to make it stand out.	\N	f	\N	\N	\N
52	block_pricing_cards	sort	\N	\N	\N	\N	\N	f	t	10	full	\N	\N	\N	f	\N	\N	\N
53	block_richtext	content	\N	input-rich-text-html	{"customFormats":null,"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"}	\N	\N	f	f	5	full	\N	Rich text content for this block.	\N	f	\N	\N	\N
54	block_richtext	headline	\N	input	\N	\N	\N	f	f	4	full	\N	Larger main headline for this page section.	\N	f	\N	\N	\N
56	block_richtext	alignment	\N	select-radio	{"choices":[{"text":"Left","value":"left"},{"text":"Center","value":"center"}]}	formatted-value	\N	f	f	6	full	\N	Controls how the content block is positioned on the page. Choose "Left" to align the block against the left margin or "Center" to position the block in the middle of the page. This setting affects the entire content block's placement, not the text alignment within it.	\N	f	\N	\N	\N
57	block_richtext	tagline	\N	input	\N	\N	\N	f	f	2	full	\N	Smaller copy shown above the headline to label a section or add extra context.	\N	f	\N	\N	\N
59	form_fields	name	\N	input	{"slug":true,"trim":true,"iconLeft":"key","placeholder":"full-name"}	formatted-value	{"format":true}	f	f	4	half	\N	Unique field identifier, not shown to users (lowercase, hyphenated)	\N	f	\N	\N	\N
60	form_fields	type	\N	select-dropdown	{"choices":[{"text":"Text","value":"text","icon":"format_color_text"},{"text":"Textarea","value":"textarea","icon":"display_external_input"},{"text":"Checkbox","value":"checkbox","icon":"check_box_outline_blank"},{"text":"Checkbox Group","value":"checkbox_group","icon":"library_add_check"},{"text":"Radio","value":"radio","icon":"radio_button_unchecked"},{"text":"File","value":"file","icon":"attach_file"},{"text":"Select","value":"select","icon":"text_select_move_down"},{"text":"Hidden","value":"hidden","icon":"hide_source"}]}	labels	{"choices":[{"text":"Text","value":"text","icon":"format_color_text"},{"text":"Textarea","value":"textarea","icon":"display_external_input"},{"text":"Checkbox","value":"checkbox","icon":"check_box_outline_blank"},{"text":"Checkbox Group","value":"checkbox_group","icon":"library_add_check"},{"text":"Radio","value":"radio","icon":"radio_button_unchecked"},{"text":"File","value":"file","icon":"attach_file"},{"text":"Select","value":"select","icon":"text_select_move_down"},{"text":"Hidden","value":"hidden","icon":"hide_source"}]}	f	f	5	half	\N	Input type for the field	\N	f	\N	\N	\N
61	form_fields	label	\N	input	{"placeholder":"Your Full Name"}	\N	\N	f	f	6	half	\N	Text label shown to form users.	\N	f	\N	\N	\N
62	form_fields	placeholder	\N	input	{"placeholder":"John Doe"}	\N	\N	f	f	7	half	\N	Default text shown in empty input.	\N	f	\N	\N	\N
63	form_fields	help	\N	input	{"placeholder":"Use first and last name"}	\N	\N	f	f	8	half	\N	Additional instructions shown below the input	\N	f	\N	\N	\N
64	form_fields	validation	\N	input	{"placeholder":"max:255","trim":true}	\N	\N	f	f	9	half	\N	Validation rules (e.g. `email|max:255`)	\N	f	\N	\N	\N
65	form_fields	width	\N	select-radio	{"choices":[{"text":"100%","value":"100"},{"text":"67%","value":"67"},{"text":"50%","value":"50"},{"text":"33%","value":"33"}]}	formatted-value	{"format":true,"suffix":"%"}	f	f	11	half	\N	Field width on the form	\N	f	\N	\N	\N
66	form_fields	choices	cast-json	list	{"fields":[{"field":"text","name":"text","type":"string","meta":{"field":"text","width":"half","type":"string","interface":"input","note":"Displayed label to user","required":true,"options":{"placeholder":"Sales Team"}}},{"field":"value","name":"value","type":"string","meta":{"field":"value","width":"half","type":"string","interface":"input","note":"Stored value","required":true,"options":{"placeholder":"sales"}}}],"template":"{{ text }}"}	formatted-json-value	{"format":"{{ label }}"}	f	t	12	full	\N	Options for radio or select inputs	[{"name":"Show Choices","rule":{"_and":[{"_or":[{"type":{"_eq":"select"}},{"type":{"_eq":"checkbox_group"}},{"type":{"_eq":"radio"}}]}]},"hidden":false,"options":{}}]	f	\N	\N	\N
67	form_fields	form	m2o	select-dropdown-m2o	{"template":"{{title}}"}	related-values	\N	f	t	3	full	\N	Parent form this field belongs to.	\N	f	\N	\N	\N
68	form_fields	sort	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
69	form_fields	required	cast-boolean	boolean	{"label":"Required"}	\N	\N	f	f	10	half	\N	Make this field mandatory to complete.	\N	f	\N	\N	\N
71	forms	sort	\N	input	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
72	forms	title	\N	input	\N	\N	\N	f	f	3	half	\N	Form name (for internal reference).	\N	f	\N	\N	\N
73	forms	is_active	cast-boolean	boolean	{"label":"Active"}	boolean	{"labelOn":"Active","labelOff":"Inactive"}	f	f	4	half	[{"language":"en-US","translation":"Active"}]	Show or hide this form from the site.	\N	f	\N	\N	\N
74	forms	meta_tabs	alias,no-data,group	group-tabs	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
75	forms	on_success	\N	select-dropdown	{"choices":[{"text":"Redirect to URL","value":"redirect","icon":"arrow_outward"},{"text":"Show Message","value":"message","icon":"chat"}]}	labels	{"choices":[{"text":"Redirect to URL","value":"redirect"},{"text":"Show Message","value":"message"}]}	f	f	4	half	\N	Action after successful submission.	\N	f	meta_fields	\N	\N
104	globals	url	\N	input	\N	\N	\N	f	f	4	half	\N	Public URL for the website	\N	f	\N	\N	\N
55	block_richtext	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
58	form_fields	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
70	forms	id	uuid	input	{"iconLeft":"vpn_key"}	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
76	forms	submit_label	\N	input	{"placeholder":"Sign Up Now","iconLeft":"smart_button"}	raw	\N	f	f	3	half	\N	Text shown on submit button.	\N	f	meta_fields	\N	\N
77	forms	success_message	\N	input-multiline	{"placeholder":"Thanks for reaching out! We'll be in touch soon."}	\N	\N	f	t	5	full	\N	Message shown after successful submission.	[{"name":"If Message","readonly":false,"hidden":false,"options":{"toolbar":["bold","italic","underline","h1","h2","h3","numlist","bullist","removeformat","blockquote","customLink","customImage","customMedia","hr","code","fullscreen"],"font":"sans-serif"},"rule":{"_and":[{"on_success":{"_eq":"message"}}]}}]	f	meta_fields	\N	\N
78	forms	success_redirect_url	\N	input	{"iconLeft":"link"}	raw	\N	f	t	6	full	\N	Destination URL after successful submission.	[{"name":"If Redirect","options":{"font":"sans-serif","trim":false,"masked":false,"clear":false,"slug":false},"hidden":false,"rule":{"_and":[{"on_success":{"_eq":"redirect"}}]}}]	f	meta_fields	\N	\N
79	forms	fields	o2m	list-o2m	{"template":"{{name}} • {{type}}","enableSelect":false,"sort":"sort"}	related-values	{"template":"{{name}} • {{type}}"}	f	f	2	full	\N	Form structure and input fields	\N	f	meta_fields	\N	\N
80	forms	notice-e1nc86	alias,no-data	presentation-notice	{"text":" Create custom forms by adding and configuring your desired input fields below. No coding required."}	\N	\N	f	f	1	full	\N	\N	\N	f	meta_fields	\N	\N
81	forms	emails	cast-json	list	{"fields":[{"field":"to","name":"to","type":"json","meta":{"field":"to","width":"full","type":"json","required":true,"note":"Add an email address and press enter. To use a form field as the email address use merge tags `{# #}` (e.g. `{# email #}.","interface":"tags","options":{"choices":null},"display":"labels","display_options":{"format":false}}},{"field":"subject","name":"subject","type":"string","meta":{"field":"subject","width":"full","type":"string","required":true,"note":"Email subject line. You can use merge tags like this `Hi {# first-name #}`.","interface":"input","display":"formatted-value","display_options":{}}},{"field":"message","name":"message","type":"text","meta":{"field":"message","width":"full","type":"text","required":true,"note":"Include a message for the email body. To merge form responses use merge tags with the field name like `{# first-name #}`.","interface":"input-rich-text-html","options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","toolbar":["undo","redo","bold","italic","underline","h1","h2","h3","numlist","bullist","removeformat","blockquote","customLink","customImage","table","hr","code","fullscreen"]}}}],"addLabel":"Add New Email","template":"To: {{ to }} • Subject: {{ subject }}"}	formatted-json-value	{"format":"To: {{ to }} • Subject: {{ subject }}"}	f	f	2	full	\N	Setup email notifications when forms are submitted.	\N	f	meta_emails	\N	\N
82	forms	notice-38swil	alias,no-data	presentation-notice	{"text":"Set up automatic emails to notify your team members when forms are submitted, or send confirmation receipts to people who complete your forms."}	\N	\N	f	f	1	full	\N	\N	\N	f	meta_emails	\N	\N
83	forms	submissions	o2m	list-o2m	{"layout":"table","fields":["timestamp","values.value","values.field.name"],"sort":"timestamp","enableCreate":false,"enableSelect":false,"limit":25,"enableSearchFilter":true,"enableLink":true}	related-values	{"template":"{{values.value}}"}	t	f	2	fill	\N	Received form responses.	\N	f	meta_submissions	\N	\N
84	forms	notice-wcutfr	alias,no-data	presentation-notice	{"text":"This table displays all responses submitted through this form. Each entry includes the submission timestamp and the values for each form field."}	\N	\N	f	f	1	full	\N	\N	\N	f	meta_submissions	\N	\N
85	forms	meta_fields	alias,no-data,group	group-raw	\N	\N	\N	f	f	1	full	[{"language":"en-US","translation":"Fields"}]	\N	\N	f	meta_tabs	\N	\N
86	forms	meta_emails	alias,no-data,group	group-raw	\N	\N	\N	f	f	3	full	[{"language":"en-US","translation":"Emails"}]	\N	\N	f	meta_tabs	\N	\N
87	forms	meta_submissions	alias,no-data,group	group-raw	\N	\N	\N	f	f	2	full	[{"language":"en-US","translation":"Submissions"}]	\N	\N	f	meta_tabs	\N	\N
89	form_submissions	timestamp	date-created	datetime	\N	datetime	{"relative":true}	t	f	2	half	\N	Form submission date and time.	\N	f	\N	\N	\N
90	form_submissions	form	m2o	select-dropdown-m2o	{"template":"{{title}}"}	related-values	{"template":"{{title}}"}	t	f	3	full	\N	Associated form for this submission.	\N	f	\N	\N	\N
91	form_submissions	values	o2m	list-o2m	{"fields":["field.label","value","field.type","file"],"enableSearchFilter":true,"sort":"sort","template":"{{value}} • {{field}}","filter":{"_and":[{"field":{"form":{"_eq":"{{form}}"}}}]},"layout":"table","enableSelect":false,"enableCreate":false,"limit":25}	related-values	{"template":"{{value}} • {{field}}"}	t	f	4	full	\N	Submitted field responses	\N	f	\N	\N	\N
92	form_submissions	notice-fxfrgx	alias,no-data	presentation-notice	{"text":"Form submissions are configured to be read-only for data integrity reasons. But they are a great candidate for use in [Flows](/admin/settings/flows). Directus Flows is a drag and drop, low-code automation builder to simplify tasks like automatic notifications or sending incoming requests to third party services. <a href=\\"https://directus.io/tv/quick-connect?ref=simple_website_cms\\" target=\\"_blank\\">Learn more about Flows.</a>"}	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
94	form_submission_values	form_submission	\N	select-dropdown-m2o	\N	\N	\N	f	t	2	full	\N	Parent form submission for this value.	\N	f	\N	\N	\N
95	form_submission_values	field	m2o	select-dropdown-m2o	{"template":"{{name}} • {{type}}"}	related-values	{"template":"{{name}} • {{type}}"}	f	f	5	half	\N	\N	\N	f	\N	\N	\N
96	form_submission_values	value	\N	input	\N	\N	\N	f	f	4	half	\N	The data entered by the user for this specific field in the form submission.	\N	f	\N	\N	\N
97	form_submission_values	sort	\N	\N	\N	\N	\N	f	t	6	full	\N	\N	\N	f	\N	\N	\N
98	form_submission_values	file	file	file	{"folder":"e6308546-92fb-4b10-b586-eefaf1d97f7f"}	file	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
99	globals	description	\N	input-multiline	{"softLength":160}	\N	\N	f	f	10	full	\N	Site summary for search results.	\N	f	\N	\N	\N
101	globals	social_links	cast-json	list	{"fields":[{"field":"service","name":"service","type":"string","meta":{"field":"service","width":"half","type":"string","interface":"select-dropdown","options":{"choices":[{"text":"Facebook","value":"facebook"},{"text":"Instagram","value":"instagram"},{"text":"LinkedIn","value":"linkedin"},{"text":"Twitter","value":"twitter"},{"text":"Vimeo","value":"vimeo"},{"text":"YouTube","value":"youtube"},{"text":"GitHub","value":"github"},{"text":"Discord","value":"discord"},{"text":"Docker","value":"docker"}],"allowOther":true},"note":"Social media platform name"}},{"field":"url","name":"url","type":"string","meta":{"field":"url","width":"half","type":"string","interface":"input","options":{"trim":true,"placeholder":"https://www.linkedin.com/in/fullprofile"},"note":"Full profile URL (not just username)"}}],"template":"{{ service }}","addLabel":"Add New Link"}	labels	{}	f	f	12	full	\N	Social media profile URLs	\N	f	\N	\N	\N
102	globals	tagline	\N	input	\N	\N	\N	f	f	9	full	\N	Short phrase describing the site.	\N	f	\N	\N	\N
100	globals	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
105	globals	favicon	file	file-image	{"crop":false}	\N	\N	f	f	7	half	\N	Small icon for browser tabs. 1:1 ratio. No larger than 512px × 512px.	\N	f	\N	\N	\N
106	globals	logo	file	file-image	{"crop":false}	\N	\N	f	f	6	half	\N	Main logo shown on the site.	\N	f	\N	\N	\N
107	globals	primary_color	\N	select-color	\N	\N	\N	f	f	8	full	\N	Primary color for the website.	\N	f	\N	\N	\N
108	globals	divider_logo	alias,no-data	presentation-divider	{"color":"#A2B5CD","icon":"imagesmode","inlineTitle":true}	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
109	globals	meta_credentials	alias,no-data,group	group-detail	{"headerIcon":"warning","start":"closed"}	\N	\N	f	f	13	full	[{"language":"en-US","translation":"Credentials"}]	\N	\N	f	\N	\N	\N
110	globals	divider_social	alias,no-data	presentation-divider	{"inlineTitle":true,"icon":"link","title":null,"color":"#A2B5CD"}	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N
111	globals	notice-7-fv9g	alias,no-data	presentation-notice	{"text":"Globals are settings that are applied across your entire site. Globals use what we call a `singleton` collection type. <a href=\\"https://directus.io/features/global-settings\\" target=\\"_blank\\">Learn more about globals and singletons.</a>"}	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
112	globals	openai_api_key	\N	input	{"trim":true,"iconLeft":"vpn_key_alert","masked":true}	formatted-value	{"masked":true}	f	f	2	half	\N	Secret OpenAI API key. Don't share with anyone outside your team.	\N	f	meta_credentials	\N	\N
113	globals	directus_url	\N	input	\N	\N	\N	f	f	3	half	\N	The public URL for this Directus instance. Used in Flows.	\N	f	meta_credentials	\N	\N
114	globals	notice-lxmfvi	alias,no-data	presentation-notice	{"color":"warning","icon":"warning","text":"Be careful about changing the access policies and permissions for the `globals` collection so that you don't expose your private API keys."}	\N	\N	f	f	1	full	\N	\N	\N	f	meta_credentials	\N	\N
116	navigation	title	\N	input	\N	\N	\N	f	f	2	half	\N	What is the name of this menu? Only used internally.	\N	f	\N	\N	\N
117	navigation	is_active	cast-boolean	boolean	{"label":"Active"}	boolean	{"labelOn":"Active","labelOff":"Inactive"}	f	f	1	full	[{"language":"en-US","translation":"Active"}]	Show or hide this menu from the site.	\N	f	\N	\N	\N
118	navigation	notice-7491js	alias,no-data	presentation-notice	{"text":"Create and manage navigation menus for your website. Each menu can contain multiple links organized into a hierarchy."}	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
119	navigation	items	o2m	list-o2m	{"enableLink":true,"filter":{"_and":[{"_and":[{"navigation":{"_null":true}},{"parent":{"navigation":{"_null":true}}}]}]},"template":"{{title}} • {{type}}"}	related-values	{"template":"{{title}} • {{type}}"}	f	f	5	full	\N	Links within the menu.	\N	f	\N	\N	\N
121	navigation_items	navigation	\N	select-dropdown-m2o	\N	\N	\N	f	t	3	full	\N	Navigation menu that the individual links belong to.	\N	f	\N	\N	\N
122	navigation_items	page	m2o	select-dropdown-m2o	{"template":"{{title}}"}	related-values	{"template":"{{title}}"}	f	t	6	full	\N	The internal page to link to.	[{"name":"IF page","rule":{"_and":[{"type":{"_eq":"page"}}]},"options":{"enableCreate":true,"enableSelect":true},"hidden":false},{"name":"Hide If Has Children","rule":{"_and":[{"has_children":{"_eq":true}}]},"hidden":true,"options":{"enableCreate":true,"enableSelect":true}}]	f	\N	\N	\N
123	navigation_items	parent	\N	select-dropdown-m2o	{"template":"{{title}}"}	related-values	{"template":"{{title}}"}	f	t	10	full	\N	The parent navigation item.	\N	f	\N	\N	\N
124	navigation_items	sort	\N	input	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
126	navigation_items	type	\N	select-dropdown	{"choices":[{"text":"Page","value":"page","icon":"web_asset"},{"text":"Post","value":"post","icon":"article"},{"text":"URL","value":"url","icon":"link"},{"text":"Group","value":"group","icon":"tab_group"}]}	labels	{"choices":[{"text":"Page","value":"page","icon":"web_asset"},{"text":"Post","value":"post","icon":"article"},{"text":"URL","value":"url","icon":"link"},{"text":"Group","value":"group","icon":"tab_group"}]}	f	f	5	half	\N	What type of link is this? Page and Post allow you to link to internal content. URL is for external content. Group can contain other menu items.	[{"name":"Hide if Children","rule":{"_and":[{"has_children":{"_eq":true}}]},"hidden":true,"options":{"iconOn":"radio_button_checked","iconOff":"radio_button_unchecked","allowOther":false}}]	f	\N	\N	\N
127	navigation_items	url	\N	input	\N	raw	\N	f	t	8	full	\N	The URL to link to. Could be relative (ie `/my-page`) or a full external URL (ie `https://docs.directus.io`)	[{"name":"IF url","rule":{"_and":[{"type":{"_eq":"url"}}]},"options":{"font":"sans-serif","trim":false,"masked":false,"clear":false,"slug":false},"hidden":false},{"name":"Hide If Had Children","rule":{"_and":[{"has_children":{"_eq":true}}]},"hidden":true,"options":{"font":"sans-serif","trim":false,"masked":false,"clear":false,"slug":false}}]	f	\N	\N	\N
128	navigation_items	post	m2o	select-dropdown-m2o	{"template":"{{title}}"}	\N	\N	f	t	7	full	\N	The internal post to link to.	[{"name":"Show If Type = Post","rule":{"_and":[{"type":{"_eq":"post"}}]},"hidden":false,"options":{"enableCreate":true,"enableSelect":true}}]	f	\N	\N	\N
129	navigation_items	children	o2m	list-o2m	{"template":"{{title}} • {{type}}","filter":{"_and":[{"_and":[{"navigation":{"_null":true}},{"parent":{"navigation":{"_null":true}}}]}]}}	related-values	{"template":"{{title}} • {{type}}"}	f	t	9	full	\N	Add child menu items within the group.	[{"name":"Show If Group","rule":{"_and":[{"type":{"_eq":"group"}}]},"hidden":false,"options":{"layout":"list","enableCreate":true,"enableSelect":true,"limit":15,"sortDirection":"+","enableSearchFilter":false,"enableLink":false}}]	f	\N	\N	\N
131	page_blocks	sort	\N	input	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
132	page_blocks	page	\N	\N	\N	\N	\N	f	t	7	full	\N	The id of the page that this block belongs to.	\N	f	\N	\N	\N
133	page_blocks	item	\N	\N	\N	\N	\N	f	t	8	full	\N	The data for the block.	\N	f	\N	\N	\N
134	page_blocks	collection	\N	\N	\N	\N	\N	f	t	9	full	\N	The collection (type of block).	\N	f	\N	\N	\N
135	page_blocks	hide_block	cast-boolean	boolean	\N	\N	\N	f	f	10	half	\N	Temporarily hide this block on the website without having to remove it from your page.	\N	f	\N	\N	\N
136	page_blocks	background	\N	select-dropdown	{"choices":[{"text":"Light","value":"light","icon":"light_mode"},{"text":"Dark","value":"dark","icon":"dark_mode"}]}	\N	\N	f	f	11	half	\N	Background color for the block to create contrast. Does not control dark or light mode for the entire site.	\N	f	\N	\N	\N
138	pages	sort	\N	input	\N	\N	\N	f	t	2	half	\N	\N	\N	f	\N	\N	\N
115	navigation	id	\N	input	{"iconLeft":"vpn_key"}	\N	\N	f	f	3	half	\N	Unique identifier for this menu. Can't be edited after creation.	\N	f	\N	\N	\N
120	navigation_items	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
125	navigation_items	title	\N	input	\N	raw	\N	f	f	4	half	\N	Label shown to the user for the menu item.	\N	t	\N	\N	\N
130	page_blocks	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
137	pages	id	uuid	input	\N	\N	\N	t	t	1	half	\N	\N	\N	f	\N	\N	\N
139	pages	title	\N	input	{"placeholder":"About Us"}	\N	\N	f	f	3	half	\N	Page title (visible to visitors and used in SEO).	\N	t	\N	\N	\N
141	pages	description	\N	input-multiline	{"placeholder":"Learn about XYZ Company's mission, values, and 20-year history of innovation in sustainable technology. Meet our diverse team of experts."}	\N	\N	f	f	12	full	\N	Short summary of what's on the page. Also used for SEO meta description.	\N	f	\N	\N	\N
143	pages	published_at	\N	datetime	{"use24":false}	datetime	{"format":"short"}	f	f	7	half	\N	Publish now or schedule for later.	[{"name":"Show If Status = Published","rule":{"_and":[{"status":{"_eq":"published"}}]},"hidden":false,"options":{"includeSeconds":false,"use24":true}}]	f	\N	\N	\N
144	pages	divider-hgvf0u	alias,no-data	presentation-divider	{"icon":"calendar_today","inlineTitle":true,"color":"#A2B5CD"}	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
145	pages	divider-mhnc6m	alias,no-data	presentation-divider	{"icon":"format_paragraph","color":"#A2B5CD","inlineTitle":true}	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
146	pages	meta_m2a_button	alias,no-data	directus-labs-experimental-m2a-interface	{"target":"above"}	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N
147	pages	blocks	m2a	list-m2a	{"enableSelect":false}	related-values	{"template":"{{collection}}"}	f	f	10	full	\N	Create and arrange different content blocks (like text, images, or videos) to build your page.	\N	f	\N	\N	\N
148	pages	notice-fzxnav	alias,no-data	presentation-notice	{"text":"Build dynamic pages quickly using ready-made blocks. <a href=\\"https://docs.directus.io/guides/headless-cms/reusable-components.html#create-re-usable-page-components\\" target=\\"_blank\\">See our documentation to learn more about the Page Builder</a>."}	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
149	posts	content	\N	input-rich-text-html	{"toolbar":["blockquote","bold","bullist","code","customImage","customLink","customMedia","fullscreen","h1","h2","h3","hr","italic","numlist","redo","removeformat","underline","undo"],"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"}	formatted-value	{"format":true}	f	f	13	full	\N	Rich text content of your blog post.	\N	f	\N	\N	\N
151	posts	image	file	file-image	{"crop":false,"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"}	image	\N	f	f	11	full	\N	Featured image for this post. Used in cards linking to the post and in the post detail page.	\N	f	\N	\N	\N
152	posts	slug	\N	extension-wpslug	{"font":"monospace","template":"{{title}}","placeholder":null}	formatted-value	{"font":"monospace"}	f	f	4	full	\N	Unique URL for this post (e.g., `yoursite.com/posts/{{your-slug}}`)	\N	f	\N	\N	\N
153	posts	sort	\N	input	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
156	posts	description	\N	input-multiline	{"placeholder":"Discover key strategies for navigating the home buying process, from budgeting to closing. Learn how to avoid common pitfalls and make informed decisions."}	\N	\N	f	f	8	half	\N	Short summary of the blog post to entice readers.	\N	f	\N	\N	\N
157	posts	author	m2o	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	{"circle":true}	f	f	9	half	\N	Select the team member who wrote this post	\N	f	\N	\N	\N
158	posts	published_at	\N	datetime	{"use24":false}	datetime	{"format":"short"}	f	f	7	half	\N	Publish now or schedule for later.	[{"name":"Show If Status = Published","rule":{"_and":[{"status":{"_eq":"published"}}]},"hidden":false,"options":{"includeSeconds":false,"use24":true}}]	f	\N	\N	\N
159	posts	divider-ygmf1b	alias,no-data	presentation-divider	{"icon":"format_paragraph","color":"#A2B5CD","inlineTitle":true}	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
160	posts	divider-cwxsuc	alias,no-data	presentation-divider	{"icon":"calendar_month","color":"#A2B5CD","inlineTitle":true}	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
161	posts	notice-g8jmnj	alias,no-data	presentation-notice	{"color":"info","icon":"help","text":"Need inspiration? Open the right sidebar to use Flows like AI Ghostwriter to help draft your content or AI Image Generator to create custom images that match your style."}	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N
162	directus_settings	command_palette_settings	cast-json	input-code	\N	raw	\N	f	f	1	full	\N	Settings for the Command Palette Module.	\N	f	\N	\N	\N
163	directus_users	posts	o2m	list-o2m	{"template":"{{title}}"}	related-values	\N	f	f	1	full	\N	Blog posts this user has authored.	\N	f	\N	\N	\N
1	block_button	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
36	block_posts	collection	\N	select-radio	{"choices":[{"text":"Posts","value":"posts"}]}	\N	\N	f	f	5	full	\N	The collection of content to fetch and display on the page within this block.	\N	t	\N	\N	\N
43	block_pricing_cards	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
93	form_submission_values	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
88	form_submissions	id	uuid	input	{"iconLeft":"vpn_key"}	\N	\N	t	f	1	half	\N	Unique ID for this specific form submission	\N	f	\N	\N	\N
140	pages	permalink	\N	input	{"font":"monospace","trim":true,"placeholder":"/about-us"}	formatted-value	{"font":"monospace"}	f	f	4	half	\N	Unique URL for this page (start with `/`, can have multiple segments `/about/me`)).	\N	t	\N	{"_and":[{"permalink":{"_regex":"^/(?:[a-z0-9]+(?:-[a-z0-9]+)*)?(?:/[a-z0-9]+(?:-[a-z0-9]+)*)*$"}}]}	Please use lowercase letters, numbers, and hyphens in your permalink, starting with a slash (/) and without a trailing slash
150	posts	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
154	posts	status	\N	select-dropdown	{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":"#E2E8F0"},{"text":"In Review","value":"in_review","icon":"rate_review","color":"#FFA439"},{"text":"$t:published","value":"published","icon":"check","color":"#2ECDA7"}]}	labels	{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":null,"background":"#E2E8F0","foreground":"#18222F"},{"text":"In Review","value":"in_review","icon":"rate_review","color":null,"background":"#FFA439","foreground":"#FFFFFF"},{"text":"$t:published","value":"published","icon":"check","color":null,"background":"#2ECDA7","foreground":"#FFFFFF"}]}	f	f	6	half	\N	Is this post published?	\N	f	\N	\N	\N
155	posts	title	\N	input	{"placeholder":"Essential tips for first-time home buyers"}	\N	\N	f	f	3	full	\N	Title of the blog post (used in page title and meta tags)	\N	t	\N	\N	\N
142	pages	status	\N	select-dropdown	{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":"#E2E8F0"},{"text":"In Review","value":"in_review","icon":"rate_review","color":"#FFA439"},{"text":"$t:published","value":"published","icon":"check","color":"#2ECDA7"}]}	labels	{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":null,"background":"#E2E8F0","foreground":"#18222F"},{"text":"In Review","value":"in_review","icon":"rate_review","color":null,"background":"#FFA439","foreground":"#FFFFFF"},{"text":"$t:published","value":"published","icon":"check","color":null,"background":"#2ECDA7","foreground":"#FFFFFF"}]}	f	f	6	half	\N	Is this page published?	\N	f	\N	\N	\N
164	subscriptions	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
168	subscriptions	expiresAt	\N	datetime	{}	\N	\N	f	f	5	half	\N	\N	\N	t	\N	\N	\N
172	subscription_tiers	title	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	t	\N	\N	\N
166	subscriptions	createdAt	date-created	datetime	\N	datetime	{"relative":true}	t	f	3	half	\N	\N	\N	f	\N	\N	\N
169	subscriptions	type	\N	select-dropdown	{"choices":[{"text":"Car","value":"car","icon":"directions_car"},{"text":"Scooter","value":"scooter","icon":"bike_scooter"},{"text":"Motor","value":"motor","icon":"motorcycle"}]}	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
176	subscription_tiers	price	\N	input	{"min":0,"max":10000}	\N	\N	f	f	4	half	\N	\N	\N	t	\N	\N	\N
177	subscription_tiers	discountPrice	\N	input	\N	\N	\N	f	f	5	half	\N	\N	\N	f	\N	\N	\N
171	subscription_tiers	icon	file	file-image	{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"}	\N	\N	f	f	6	full	\N	Recommended size is 100x100 pixels	\N	t	\N	\N	\N
197	subscription_tiers	daysOfAccess	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N
198	subscription_tiers	maxPracticeExams	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
175	subscription_tiers	featureList	cast-json	list	{"fields":[{"field":"description","name":"description","type":"string","meta":{"field":"description","type":"string","required":true,"interface":"input"}}]}	\N	\N	f	f	9	full	\N	\N	\N	t	\N	\N	\N
205	subscription_tiers	videoCourses	o2m	list-o2m	\N	\N	\N	f	f	10	full	\N	\N	\N	t	\N	\N	\N
206	video_courses	subscriptionTier	\N	select-dropdown-m2o	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
178	subscriptions	tier	m2o	select-dropdown-m2o	{"template":"{{title}}"}	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N
179	directus_users	subscription	m2o	select-dropdown-m2o	{"template":"{{type}}{{tier.title}}"}	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
199	video_courses_lessons	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
200	video_courses_lessons	title	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
202	video_courses_lessons	description	\N	input-multiline	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
201	video_courses_lessons	video	file	file	{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"}	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
203	video_courses	lessons	o2m	list-o2m	{"template":"{{title}}"}	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N
204	video_courses_lessons	videoCourse	\N	select-dropdown-m2o	\N	\N	\N	f	t	5	full	\N	\N	\N	f	\N	\N	\N
191	video_courses	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
192	video_courses	title	\N	input	\N	\N	\N	f	f	2	half	\N	\N	\N	t	\N	\N	\N
193	video_courses	slug	\N	extension-wpslug	{"template":"{{title}}"}	\N	\N	f	f	3	half	\N	\N	\N	t	\N	\N	\N
194	video_courses	tagline	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
195	video_courses	estimatedDurationInMinutes	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	t	\N	\N	\N
196	video_courses	thumbnail	file	file-image	\N	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
170	subscription_tiers	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
173	subscription_tiers	slug	\N	extension-wpslug	{"template":"{{title}}","prefix":null}	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
03a7d1c7-81e2-432f-9561-9df2691189c8	local	03a7d1c7-81e2-432f-9561-9df2691189c8.png	03a7d1c7-81e2-432f-9561-9df2691189c8.png	169   L 09 Oct 08.55 4	image/png	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:09.811+00	\N	2025-01-14 10:43:09.853+00	\N	659420	2560	1440	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:09.852+00
12e02b82-b4a4-4aaf-8ca4-e73c20a41c26	local	12e02b82-b4a4-4aaf-8ca4-e73c20a41c26.jpeg	12e02b82-b4a4-4aaf-8ca4-e73c20a41c26.jpeg	12e02b82 B4a4 4aaf 8ca4 E73c20a41c26	image/jpeg	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:09.901+00	\N	2025-01-14 10:43:09.909+00	\N	214070	1920	1280	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:09.908+00
1d3d2bd3-ff59-4626-bef5-9d5eef6510b3	local	1d3d2bd3-ff59-4626-bef5-9d5eef6510b3.png	1d3d2bd3-ff59-4626-bef5-9d5eef6510b3.png	1024px Visual Studio Code 1.35 Icon.svg.png	image/png	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.004+00	\N	2025-01-14 10:43:10.012+00	\N	57617	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:10.011+00
2b4a0ba0-52c7-4e10-b191-c803d8da6a36	local	2b4a0ba0-52c7-4e10-b191-c803d8da6a36.png	2b4a0ba0-52c7-4e10-b191-c803d8da6a36.png	Directus Logo	image/png	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.098+00	\N	2025-01-14 10:43:10.103+00	\N	43613	512	512	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:10.103+00
35a67f1b-d401-4300-a503-b8e583186f2a	local	35a67f1b-d401-4300-a503-b8e583186f2a.svg	35a67f1b-d401-4300-a503-b8e583186f2a.svg	Directus Logo	image/svg+xml	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.203+00	\N	2025-01-14 10:43:10.208+00	\N	11267	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-14 10:43:10.207+00
3eff7dc2-445a-47c5-9503-3f600ecdb5c6	local	3eff7dc2-445a-47c5-9503-3f600ecdb5c6.jpeg	3eff7dc2-445a-47c5-9503-3f600ecdb5c6.jpeg	3eff7dc2 445a 47c5 9503 3f600ecdb5c6	image/jpeg	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.298+00	\N	2025-01-14 10:43:10.303+00	\N	51166	512	512	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:10.303+00
43ddd7b8-9b2f-4aa1-b63c-933b4ae81ca2	local	43ddd7b8-9b2f-4aa1-b63c-933b4ae81ca2.svg	43ddd7b8-9b2f-4aa1-b63c-933b4ae81ca2.svg	Directus Logo Dark	image/svg+xml	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.402+00	\N	2025-01-14 10:43:10.408+00	\N	11267	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-14 10:43:10.407+00
440df429-4715-42a0-afcd-569f5cdfb145	local	440df429-4715-42a0-afcd-569f5cdfb145.svg	440df429-4715-42a0-afcd-569f5cdfb145.svg	Bunny Bot	image/svg+xml	\N	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.502+00	\N	2025-01-14 10:43:10.505+00	\N	33753	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-14 10:43:10.505+00
44a4e780-d59b-4fa5-9b26-1c4b447474d2	local	44a4e780-d59b-4fa5-9b26-1c4b447474d2.jpg	44a4e780-d59b-4fa5-9b26-1c4b447474d2.jpg	Multicolored Can Wall Decor	image/jpeg	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.599+00	\N	2025-01-14 10:43:10.612+00	\N	1221311	1917	1918	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:10.612+00
50570a31-a990-453c-bdfc-0ad7175dd8bf	local	50570a31-a990-453c-bdfc-0ad7175dd8bf.png	50570a31-a990-453c-bdfc-0ad7175dd8bf.png	169   L 09 Oct 09.09	image/png	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.698+00	\N	2025-01-14 10:43:10.704+00	\N	409799	2560	1440	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:10.704+00
535f1284-dbc4-4e4e-9e50-b44a1df130bd	local	535f1284-dbc4-4e4e-9e50-b44a1df130bd.webp	535f1284-dbc4-4e4e-9e50-b44a1df130bd.webp	Content Manager	image/webp	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.798+00	\N	2025-01-14 10:43:10.805+00	\N	93276	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:10.805+00
6464e61f-455a-4b47-b623-bb12e5251dfe	local	6464e61f-455a-4b47-b623-bb12e5251dfe.jpeg	6464e61f-455a-4b47-b623-bb12e5251dfe.jpeg	6464e61f 455a 4b47 B623 Bb12e5251dfe	image/jpeg	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.899+00	\N	2025-01-14 10:43:10.907+00	\N	537459	2048	3072	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:10.907+00
68103296-6634-4d66-918a-04b09afe6621	local	68103296-6634-4d66-918a-04b09afe6621.jpeg	68103296-6634-4d66-918a-04b09afe6621.jpeg	68103296 6634 4d66 918a 04b09afe6621	image/jpeg	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:10.997+00	\N	2025-01-14 10:43:11.004+00	\N	421019	3072	2048	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:11.004+00
6964d750-1c00-4b9c-81e4-0c81cfa82bbb	local	6964d750-1c00-4b9c-81e4-0c81cfa82bbb.png	6964d750-1c00-4b9c-81e4-0c81cfa82bbb.png	169   L 09 Oct 08.53	image/png	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.097+00	\N	2025-01-14 10:43:11.104+00	\N	665029	2560	1440	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:11.104+00
7775c53a-6c2c-453d-8c22-8b5445121d10	local	7775c53a-6c2c-453d-8c22-8b5445121d10.jpeg	7775c53a-6c2c-453d-8c22-8b5445121d10.jpeg	7775c53a 6c2c 453d 8c22 8b5445121d10	image/jpeg	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.204+00	\N	2025-01-14 10:43:11.212+00	\N	358326	2048	3072	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:11.212+00
8f748634-d77b-4985-b27e-7e1f3559881a	local	8f748634-d77b-4985-b27e-7e1f3559881a.jpeg	8f748634-d77b-4985-b27e-7e1f3559881a.jpeg	8f748634 D77b 4985 B27e 7e1f3559881a	image/jpeg	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.299+00	\N	2025-01-14 10:43:11.305+00	\N	98432	512	512	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:11.304+00
9a52e835-e131-4290-81bb-5a512599f93e	local	9a52e835-e131-4290-81bb-5a512599f93e.png	9a52e835-e131-4290-81bb-5a512599f93e.png	Img Lxo Xol Uwrdu Q Cswq Xmmk6utm.png	image/png	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.399+00	\N	2025-01-14 10:43:11.411+00	\N	3083504	1792	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:11.411+00
a051ea01-07a5-45cb-bcc6-411af9560be5	local	a051ea01-07a5-45cb-bcc6-411af9560be5.png	a051ea01-07a5-45cb-bcc6-411af9560be5.png	169   L 09 Oct 09.09 2	image/png	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.501+00	\N	2025-01-14 10:43:11.508+00	\N	297608	2560	1440	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:11.507+00
ac905071-0643-4337-8f53-48ed45b1ccf2	local	ac905071-0643-4337-8f53-48ed45b1ccf2.jpg	ac905071-0643-4337-8f53-48ed45b1ccf2.jpg	Silhouette Tree Sunset	image/jpeg	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.597+00	\N	2025-01-14 10:43:11.602+00	\N	300062	1920	1280	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:11.602+00
b9db00d9-535f-4e24-8a46-5f7e5fc65bf2	local	b9db00d9-535f-4e24-8a46-5f7e5fc65bf2.jpg	b9db00d9-535f-4e24-8a46-5f7e5fc65bf2.jpg	Yellow Click Pen	image/jpeg	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.703+00	\N	2025-01-14 10:43:11.709+00	\N	129160	1920	1280	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:11.709+00
c2a301bd-74ed-4a50-9b85-3cb1f40f8dee	local	c2a301bd-74ed-4a50-9b85-3cb1f40f8dee.png	c2a301bd-74ed-4a50-9b85-3cb1f40f8dee.png	169   L 09 Oct 08.55 2	image/png	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.798+00	\N	2025-01-14 10:43:11.808+00	\N	630837	2560	1440	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:11.808+00
d4fd6edc-4cc5-48c1-8bc7-e646924bbdca	local	d4fd6edc-4cc5-48c1-8bc7-e646924bbdca.jpeg	d4fd6edc-4cc5-48c1-8bc7-e646924bbdca.jpeg	D4fd6edc 4cc5 48c1 8bc7 E646924bbdca	image/jpeg	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.9+00	\N	2025-01-14 10:43:11.91+00	\N	395249	2048	3072	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:11.909+00
dc258f02-d1a3-47f4-9f3e-2a71a0010c56	local	dc258f02-d1a3-47f4-9f3e-2a71a0010c56.png	dc258f02-d1a3-47f4-9f3e-2a71a0010c56.png	169   L 09 Oct 09.33 1	image/png	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:11.997+00	\N	2025-01-14 10:43:12.004+00	\N	559420	2560	1440	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:12.004+00
dea64c65-de50-4d86-abea-6dee3d5256b2	local	dea64c65-de50-4d86-abea-6dee3d5256b2.webp	dea64c65-de50-4d86-abea-6dee3d5256b2.webp	Webmaster	image/webp	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:12.099+00	\N	2025-01-14 10:43:12.104+00	\N	70668	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:12.104+00
df0745c2-b6e3-4b37-b64d-55a4eb0033ab	local	df0745c2-b6e3-4b37-b64d-55a4eb0033ab.avif	df0745c2-b6e3-4b37-b64d-55a4eb0033ab.avif	C02ae5db 9f53 4c29 Aadf C59b54056845	image/avif	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:12.199+00	\N	2025-01-14 10:43:12.207+00	\N	17700	1184	666	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:12.206+00
fd6440c2-dd48-4792-9d08-3124cd99b40f	local	fd6440c2-dd48-4792-9d08-3124cd99b40f.png	fd6440c2-dd48-4792-9d08-3124cd99b40f.png	Img Edz5 Tmm L7 a Mn Fg5 Ijc Uvkd20.png	image/png	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 10:43:12.305+00	\N	2025-01-14 10:43:12.323+00	\N	3200060	1792	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 10:43:12.323+00
2af31103-959f-45a6-98b6-14c05a27412d	local	2af31103-959f-45a6-98b6-14c05a27412d.png	🚀.png	🚀	image/png	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:06:19.648+00	\N	2025-01-14 14:06:19.729+00	\N	14162	100	100	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 14:06:19.729+00
f28f2e8f-dfe4-4021-a029-583f6c8a6da4	local	f28f2e8f-dfe4-4021-a029-583f6c8a6da4.png	Wie-mag-hier-als-eerst-rijden-11.png	Wie Mag Hier Als Eerst Rijden 11	image/png	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:07:40.471+00	\N	2025-01-14 14:07:40.513+00	\N	343090	1080	1080	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 14:07:40.512+00
788cae90-bd68-400c-a262-ff6c02b4555b	local	788cae90-bd68-400c-a262-ff6c02b4555b.png	Wie-mag-hier-als-eerst-rijden-16.png	Wie Mag Hier Als Eerst Rijden 16	image/png	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:08:14.113+00	\N	2025-01-14 14:08:14.155+00	\N	231646	1080	1080	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 14:08:14.154+00
bcc1e125-9bed-4ea6-a28f-c619127a9423	local	bcc1e125-9bed-4ea6-a28f-c619127a9423.png	Wie-mag-hier-als-eerst-rijden-17.png	Wie Mag Hier Als Eerst Rijden 17	image/png	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:09:29.225+00	\N	2025-01-14 14:09:29.239+00	\N	265973	1080	1080	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 14:09:29.237+00
6fdbc31c-c2b2-46d0-b473-10dc08d9bc98	local	6fdbc31c-c2b2-46d0-b473-10dc08d9bc98.png	335d19aa122ffaedd315fc9064882a30.png	335d19aa122ffaedd315fc9064882a30	image/png	\N	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:48:13.106+00	\N	2025-01-14 14:48:13.165+00	\N	559511	1200	800	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 14:48:13.164+00
82616dcf-a772-49b5-a4c3-f1d159b3d10a	local	82616dcf-a772-49b5-a4c3-f1d159b3d10a.mp4	meijer-theorie-1.1.mp4	Meijer Theorie 1.1	video/mp4	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:53:13.846+00	\N	2025-01-14 14:53:13.893+00	\N	7880812	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-14 14:53:13.892+00
0b592bdc-d961-42aa-b8b8-4f609cbe1804	local	0b592bdc-d961-42aa-b8b8-4f609cbe1804.mp4	meijer-theorie-1.2.mp4	Meijer Theorie 1.2	video/mp4	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:55:24.729+00	\N	2025-01-14 14:55:24.744+00	\N	130378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-14 14:55:24.742+00
c3b1434f-d9db-4b78-8cca-17fef70984a9	local	c3b1434f-d9db-4b78-8cca-17fef70984a9.svg	logo-meijer.svg	Logo Meijer	image/svg+xml	\N	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 15:09:09.406+00	\N	2025-01-14 15:09:09.416+00	\N	27406	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-14 15:09:09.414+00
cd1f8e25-d49f-46c8-ba43-55155b255f06	local	cd1f8e25-d49f-46c8-ba43-55155b255f06.png	Schermafbeelding-2024-09-06-114723-1-300x300.png	Schermafbeelding 2024 09 06 114723 1 300x300	image/png	\N	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 15:09:46.16+00	\N	2025-01-14 15:09:46.182+00	\N	40105	300	300	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 15:09:46.182+00
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
5429ccb0-7e97-4ef5-9d65-2bbcf964f9a6	Utils -> Render Template	picture_in_picture	\N	Utility flow to render a Liquid JS template	active	operation	all	{"return":"$last"}	c846f644-e7c1-43c9-8bb7-81181de0cd60	2025-01-14 10:43:21.999+00	60f562f9-84b6-4914-bf63-a7193567fcdf
5915dd55-fff8-4d47-b48c-a0e42e5033c1	AI Ghostwriter	magic_button	\N	Flow to automatically write blog posts and articles for you using AI.	active	manual	all	{"collections":["posts"],"requireConfirmation":true,"confirmationDescription":"AI Ghostwriter","fields":[{"field":"prompt","type":"text","name":"Prompt","meta":{"interface":"input-multiline","note":"Describe the post you'd like AI to write for you.","width":"full"}},{"field":"voice","type":"json","name":"Tone Of Voice","meta":{"interface":"tags","note":"What tone of voice would you like AI to write with?","options":{"presets":["friendly","professional","casual","pirate"]}}}],"location":"item"}	5d667ac5-2594-4f16-a863-3847d8917caa	2025-01-14 10:43:22.097+00	60f562f9-84b6-4914-bf63-a7193567fcdf
61757ab0-b139-4079-b5eb-4e05bb8142ac	Form Submissions -> Email Notifications	attach_email	\N	Automatically sends any emails configured for a form whenever a new submission is created.	active	event	all	{"type":"action","scope":["items.create"],"collections":["form_submissions"]}	599b80e4-7c74-4496-b243-da198c8613d9	2025-01-14 10:43:22.196+00	60f562f9-84b6-4914-bf63-a7193567fcdf
69e87d0b-df14-4779-bdc8-abc05f2f1e97	Utils -> Get Globals	globe_uk	\N	This is a utility flow to use in other flows when you need data from the Globals collection.	active	operation	activity	{"return":"$last"}	bb1b1e3f-032e-48b7-b260-1cf3af4a116c	2025-01-14 10:43:22.302+00	60f562f9-84b6-4914-bf63-a7193567fcdf
7c8732cd-9d9e-44be-a3f6-89c0d42c7687	Utils -> Send Email	send	\N	Utility flow to send a single email. Used in other flows.	active	operation	all	{"return":"$last"}	6efe1572-6cdd-4c80-a063-eb71b7f1e519	2025-01-14 10:43:22.396+00	60f562f9-84b6-4914-bf63-a7193567fcdf
d4bbac48-a444-49e0-aedb-9af5273b88df	AI Image Generator	image_search	\N	Generate AI images for your blog posts.	active	manual	all	{"collections":["posts"],"requireConfirmation":true,"confirmationDescription":"AI Image Generator","fields":[{"field":"prompt","type":"text","name":"Prompt","meta":{"interface":"input-rich-text-md","note":"Describe the image you want to generate. The more descriptive - the better the results (usually 😉).","options":{"placeholder":"Create a hand-drawn marker style illustration to be used as a featured image for blog posts targeting developers. The illustration should have a whimsical theme, using bold, uneven marker-style lines to create an engaging and eye-catching design. The background should always be white. ","toolbar":["heading","bold","italic","strikethrough","blockquote","bullist","numlist","table","code","empty"]}}},{"field":"colors","type":"json","name":"Colors","meta":{"interface":"list","options":{"fields":[{"field":"color","name":"color","type":"string","meta":{"field":"color","width":"half","type":"string","interface":"select-color"}},{"field":"name","name":"name","type":"string","meta":{"field":"name","width":"half","type":"string","note":"What is the name of the color? AI seems to do better when supplying color names along with the hex codes.","interface":"input"}},{"field":"type","name":"type","type":"string","meta":{"field":"type","width":"full","type":"string","interface":"select-radio","options":{"choices":[{"text":"Primary","value":"primary"},{"text":"Secondary","value":"secondary"},{"text":"Background","value":"background"}]}}}]}}},{"field":"aspect_ratio","type":"string","name":"Aspect Ratio","meta":{"interface":"select-radio","options":{"choices":[{"text":"1:1","value":"1:1"},{"text":"16:9","value":"16:9"},{"text":"9:16","value":"9:16"}]}}}],"location":"item"}	0cf30253-f9ed-413f-ac27-7a0ecffa9ee4	2025-01-14 10:43:22.498+00	60f562f9-84b6-4914-bf63-a7193567fcdf
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_folders (id, name, parent) FROM stdin;
d0f67ad6-abbb-45d6-8d3e-b499a4c74d80	2. Private	\N
e6308546-92fb-4b10-b586-eefaf1d97f7f	3. Uploads	\N
ece7bab9-5433-4a63-b9f7-bde8b517d6d9	1. Public	\N
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2025-01-14 10:36:21.12712+00
20201029A	Remove System Relations	2025-01-14 10:36:21.136626+00
20201029B	Remove System Collections	2025-01-14 10:36:21.149767+00
20201029C	Remove System Fields	2025-01-14 10:36:21.160884+00
20201105A	Add Cascade System Relations	2025-01-14 10:36:21.198625+00
20201105B	Change Webhook URL Type	2025-01-14 10:36:21.204826+00
20210225A	Add Relations Sort Field	2025-01-14 10:36:21.20985+00
20210304A	Remove Locked Fields	2025-01-14 10:36:21.214517+00
20210312A	Webhooks Collections Text	2025-01-14 10:36:21.220614+00
20210331A	Add Refresh Interval	2025-01-14 10:36:21.223632+00
20210415A	Make Filesize Nullable	2025-01-14 10:36:21.231394+00
20210416A	Add Collections Accountability	2025-01-14 10:36:21.235688+00
20210422A	Remove Files Interface	2025-01-14 10:36:21.238647+00
20210506A	Rename Interfaces	2025-01-14 10:36:21.252235+00
20210510A	Restructure Relations	2025-01-14 10:36:21.270724+00
20210518A	Add Foreign Key Constraints	2025-01-14 10:36:21.276317+00
20210519A	Add System Fk Triggers	2025-01-14 10:36:21.297491+00
20210521A	Add Collections Icon Color	2025-01-14 10:36:21.3009+00
20210525A	Add Insights	2025-01-14 10:36:21.321022+00
20210608A	Add Deep Clone Config	2025-01-14 10:36:21.324145+00
20210626A	Change Filesize Bigint	2025-01-14 10:36:21.337292+00
20210716A	Add Conditions to Fields	2025-01-14 10:36:21.340161+00
20210721A	Add Default Folder	2025-01-14 10:36:21.345133+00
20210802A	Replace Groups	2025-01-14 10:36:21.349338+00
20210803A	Add Required to Fields	2025-01-14 10:36:21.353004+00
20210805A	Update Groups	2025-01-14 10:36:21.356201+00
20210805B	Change Image Metadata Structure	2025-01-14 10:36:21.359429+00
20210811A	Add Geometry Config	2025-01-14 10:36:21.362513+00
20210831A	Remove Limit Column	2025-01-14 10:36:21.366296+00
20210903A	Add Auth Provider	2025-01-14 10:36:21.383202+00
20210907A	Webhooks Collections Not Null	2025-01-14 10:36:21.389895+00
20210910A	Move Module Setup	2025-01-14 10:36:21.393453+00
20210920A	Webhooks URL Not Null	2025-01-14 10:36:21.400607+00
20210924A	Add Collection Organization	2025-01-14 10:36:21.405442+00
20210927A	Replace Fields Group	2025-01-14 10:36:21.4115+00
20210927B	Replace M2M Interface	2025-01-14 10:36:21.414288+00
20210929A	Rename Login Action	2025-01-14 10:36:21.416572+00
20211007A	Update Presets	2025-01-14 10:36:21.421696+00
20211009A	Add Auth Data	2025-01-14 10:36:21.424561+00
20211016A	Add Webhook Headers	2025-01-14 10:36:21.427144+00
20211103A	Set Unique to User Token	2025-01-14 10:36:21.432259+00
20211103B	Update Special Geometry	2025-01-14 10:36:21.434626+00
20211104A	Remove Collections Listing	2025-01-14 10:36:21.437858+00
20211118A	Add Notifications	2025-01-14 10:36:21.451595+00
20211211A	Add Shares	2025-01-14 10:36:21.468953+00
20211230A	Add Project Descriptor	2025-01-14 10:36:21.471543+00
20220303A	Remove Default Project Color	2025-01-14 10:36:21.47862+00
20220308A	Add Bookmark Icon and Color	2025-01-14 10:36:21.482623+00
20220314A	Add Translation Strings	2025-01-14 10:36:21.485844+00
20220322A	Rename Field Typecast Flags	2025-01-14 10:36:21.489519+00
20220323A	Add Field Validation	2025-01-14 10:36:21.492549+00
20220325A	Fix Typecast Flags	2025-01-14 10:36:21.495622+00
20220325B	Add Default Language	2025-01-14 10:36:21.503521+00
20220402A	Remove Default Value Panel Icon	2025-01-14 10:36:21.509825+00
20220429A	Add Flows	2025-01-14 10:36:21.544026+00
20220429B	Add Color to Insights Icon	2025-01-14 10:36:21.547578+00
20220429C	Drop Non Null From IP of Activity	2025-01-14 10:36:21.550612+00
20220429D	Drop Non Null From Sender of Notifications	2025-01-14 10:36:21.55492+00
20220614A	Rename Hook Trigger to Event	2025-01-14 10:36:21.556975+00
20220801A	Update Notifications Timestamp Column	2025-01-14 10:36:21.563972+00
20220802A	Add Custom Aspect Ratios	2025-01-14 10:36:21.568106+00
20220826A	Add Origin to Accountability	2025-01-14 10:36:21.571565+00
20230401A	Update Material Icons	2025-01-14 10:36:21.577987+00
20230525A	Add Preview Settings	2025-01-14 10:36:21.581514+00
20230526A	Migrate Translation Strings	2025-01-14 10:36:21.593069+00
20230721A	Require Shares Fields	2025-01-14 10:36:21.598355+00
20230823A	Add Content Versioning	2025-01-14 10:36:21.614146+00
20230927A	Themes	2025-01-14 10:36:21.627074+00
20231009A	Update CSV Fields to Text	2025-01-14 10:36:21.630775+00
20231009B	Update Panel Options	2025-01-14 10:36:21.633377+00
20231010A	Add Extensions	2025-01-14 10:36:21.638738+00
20231215A	Add Focalpoints	2025-01-14 10:36:21.641472+00
20240122A	Add Report URL Fields	2025-01-14 10:36:21.643949+00
20240204A	Marketplace	2025-01-14 10:36:21.665558+00
20240305A	Change Useragent Type	2025-01-14 10:36:21.675569+00
20240311A	Deprecate Webhooks	2025-01-14 10:36:21.682746+00
20240422A	Public Registration	2025-01-14 10:36:21.687707+00
20240515A	Add Session Window	2025-01-14 10:36:21.690518+00
20240701A	Add Tus Data	2025-01-14 10:36:21.693814+00
20240716A	Update Files Date Fields	2025-01-14 10:36:21.699571+00
20240806A	Permissions Policies	2025-01-14 10:36:21.736002+00
20240817A	Update Icon Fields Length	2025-01-14 10:36:21.761056+00
20240909A	Separate Comments	2025-01-14 10:36:21.77252+00
20240909B	Consolidate Content Versioning	2025-01-14 10:36:21.775551+00
20240924A	Migrate Legacy Comments	2025-01-14 10:36:21.779635+00
20240924B	Populate Versioning Deltas	2025-01-14 10:36:21.783821+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
0beeeb1a-2338-4ab4-95f5-0757bf3e43be	Log Error	log_error	log	37	17	{"message":"Trigger did NOT include a `to` address. "}	\N	\N	7c8732cd-9d9e-44be-a3f6-89c0d42c7687	2025-01-14 10:43:22.602+00	60f562f9-84b6-4914-bf63-a7193567fcdf
0cf30253-f9ed-413f-ac27-7a0ecffa9ee4	Globals	globals	trigger	19	1	{"flow":"69e87d0b-df14-4779-bdc8-abc05f2f1e97"}	5df25cf8-b407-4fef-9d3b-c328f89f1561	\N	d4bbac48-a444-49e0-aedb-9af5273b88df	2025-01-14 10:43:22.607+00	60f562f9-84b6-4914-bf63-a7193567fcdf
2adf33da-7fd7-42f7-a6fe-48409463d51b	Update	update	item-update	92	1	{"collection":"posts","payload":{"image":"{{import.data.data.id}}"},"key":"{{$trigger.body.keys}}","permissions":"$full"}	\N	\N	d4bbac48-a444-49e0-aedb-9af5273b88df	2025-01-14 10:43:22.612+00	60f562f9-84b6-4914-bf63-a7193567fcdf
3b7d004a-1dba-43c4-b902-a44fd71602ae	Format	format	exec	55	1	{"code":"module.exports = function(data) {\\n    const aiResponse = JSON.parse(data.write)\\n\\tconst payload = {}\\n    payload.title = aiResponse.title\\n    payload.description = aiResponse.description\\n    payload.content = aiResponse.content\\n    payload.slug = aiResponse.slug\\n    return payload\\n}"}	e6c50f84-e229-4f15-8119-c7708256e825	\N	5915dd55-fff8-4d47-b48c-a0e42e5033c1	2025-01-14 10:43:22.616+00	60f562f9-84b6-4914-bf63-a7193567fcdf
599b80e4-7c74-4496-b243-da198c8613d9	Form	form	item-read	19	1	{"collection":"forms","key":["{{$trigger.payload.form}}"],"query":{"fields":["*","fields.*"]},"permissions":"$full"}	dff1a702-bcc0-4528-905e-309feb880111	\N	61757ab0-b139-4079-b5eb-4e05bb8142ac	2025-01-14 10:43:22.622+00	60f562f9-84b6-4914-bf63-a7193567fcdf
5d667ac5-2594-4f16-a863-3847d8917caa	Globals	globals	trigger	19	1	{"flow":"69e87d0b-df14-4779-bdc8-abc05f2f1e97"}	89125be2-8205-4ad0-a77f-bd3e984202b3	\N	5915dd55-fff8-4d47-b48c-a0e42e5033c1	2025-01-14 10:43:22.629+00	60f562f9-84b6-4914-bf63-a7193567fcdf
5df25cf8-b407-4fef-9d3b-c328f89f1561	Prompt	prompt	directus-labs-ai-writer-operation	37	1	{"apiKey":"{{globals.openai_api_key}}","promptKey":"custom","system":"You are an expert in writing prompts for generating images through Dall•E 3. \\n\\n## Rules\\nReturn only the prompt text","text":"Use the following information and context to write a prompt to generate an image for a blog post.\\n\\nImage Style:\\n{{ $trigger.body.prompt }}\\n\\nAspect Ratio: \\n{{ $trigger.body.aspect_ratio }}\\n\\nColor Palette:\\n{{ $trigger.body.colors }}","model":"gpt-4o-mini","aiProvider":"openai","apiKeyOpenAi":"{{globals.openai_api_key}}"}	d6f73e98-19ef-47d6-8d1f-99d77137d36b	\N	d4bbac48-a444-49e0-aedb-9af5273b88df	2025-01-14 10:43:22.634+00	60f562f9-84b6-4914-bf63-a7193567fcdf
6efe1572-6cdd-4c80-a063-eb71b7f1e519	Verify To	verify_to	condition	19	1	{"filter":{"$trigger":{"to":{"_nnull":true}}}}	8673740a-f7f8-44dd-9abd-5a714e0d6c74	0beeeb1a-2338-4ab4-95f5-0757bf3e43be	7c8732cd-9d9e-44be-a3f6-89c0d42c7687	2025-01-14 10:43:22.638+00	60f562f9-84b6-4914-bf63-a7193567fcdf
8673740a-f7f8-44dd-9abd-5a714e0d6c74	Send Email	send_email	mail	37	1	{"to":"{{$trigger.to}}","subject":"{{$trigger.subject}}","type":"wysiwyg","body":"<p>{{$trigger.body}}</p>"}	\N	\N	7c8732cd-9d9e-44be-a3f6-89c0d42c7687	2025-01-14 10:43:22.643+00	60f562f9-84b6-4914-bf63-a7193567fcdf
bb1b1e3f-032e-48b7-b260-1cf3af4a116c	Read Globals	read_globals	item-read	19	1	{"permissions":"$full","collection":"globals"}	fd271542-fac2-42d8-aa10-a02520c3753f	\N	69e87d0b-df14-4779-bdc8-abc05f2f1e97	2025-01-14 10:43:22.652+00	60f562f9-84b6-4914-bf63-a7193567fcdf
bc71ca4e-d979-4ef9-a449-af100a7e1b3b	Import	import	request	74	1	{"method":"POST","url":"{{globals.directus_url}}/files/import","body":"{\\n  \\"url\\": \\"{{image}}\\"\\n}","headers":[{"header":"Authorization","value":"Bearer fT6_R5in_QUpUSXlLqGIhYtbRlBnopFe"}]}	2adf33da-7fd7-42f7-a6fe-48409463d51b	\N	d4bbac48-a444-49e0-aedb-9af5273b88df	2025-01-14 10:43:22.655+00	60f562f9-84b6-4914-bf63-a7193567fcdf
c846f644-e7c1-43c9-8bb7-81181de0cd60	Render Template	render	liquidjs-operation	19	1	{"publicUrl":"http://localhost:8001/","mode":"custom","operationMode":"single","template":"{{ $trigger.template }}","data":"{{ $trigger.data }}"}	edc5e1ae-a3ed-45af-ae77-10409a66cd03	\N	5429ccb0-7e97-4ef5-9d65-2bbcf964f9a6	2025-01-14 10:43:22.659+00	60f562f9-84b6-4914-bf63-a7193567fcdf
d6f73e98-19ef-47d6-8d1f-99d77137d36b	Image	image	directus-labs-ai-image-generation	56	1	{"apiKey":"{{globals.openai_api_key}}","quality":"hd","size":"landscape","prompt":"{{prompt}}"}	bc71ca4e-d979-4ef9-a449-af100a7e1b3b	\N	d4bbac48-a444-49e0-aedb-9af5273b88df	2025-01-14 10:43:22.662+00	60f562f9-84b6-4914-bf63-a7193567fcdf
dff1a702-bcc0-4528-905e-309feb880111	Format	format	exec	19	18	{"code":"/**\\n * Prepares email template data by matching trigger values with form fields\\n * @param {Object} trigger - The trigger object containing payload values\\n * @param {Object} form - The form object containing fields and email templates\\n * @returns {Array} Array of prepared email template objects\\n * @throws {Error} If required data is missing or invalid\\n */\\nfunction prepareEmailTemplateData(trigger, form) {\\n  // Validate input parameters\\n  if (!trigger?.payload?.values || !Array.isArray(trigger.payload.values)) {\\n    throw new Error('Invalid trigger payload values');\\n  }\\n  \\n  if (!form?.fields || !Array.isArray(form.fields)) {\\n    throw new Error('Invalid form fields');\\n  }\\n  \\n  if (!form?.emails || !Array.isArray(form.emails)) {\\n    throw new Error('Invalid form emails');\\n  }\\n\\n  // Create an object to store the field name-value pairs\\n  const data = {};\\n  \\n  // Iterate through the trigger values and match them with form fields\\n  trigger.payload.values.forEach(item => {\\n    if (!item || typeof item !== 'object') {\\n      throw new Error('Invalid trigger value item');\\n    }\\n\\n    // Ensure required properties exist\\n    if (!item.field && !item.field_name) {\\n      throw new Error('Missing field identifier in trigger value');\\n    }\\n    \\n    if (item.value === undefined) {\\n      throw new Error('Missing value in trigger value');\\n    }\\n\\n    // Find the corresponding field in the form\\n    const formField = form.fields.find(field => field.id === item.field);\\n    \\n    // If a matching field is found, use its name as the key\\n    if (formField && formField.name) {\\n      data[formField.name] = item.value;\\n    } else {\\n      // Fallback to using the field_name from the trigger if no match is found\\n      data[item.field_name || item.field] = item.value;\\n    }\\n  });\\n\\n  // Process and validate all email templates\\n  const emailTemplates = form.emails.map(email => {\\n    // Validate required email template properties\\n    if (!email.subject) {\\n      throw new Error('Missing email subject');\\n    }\\n    \\n    if (!email.message) {\\n      throw new Error('Missing email message template');\\n    }\\n    \\n    if (!email.to) {\\n      throw new Error('Missing email recipient');\\n    }\\n\\n    // Normalize 'to' field to always be an array\\n    const toField = Array.isArray(email.to) ? email.to : [email.to];\\n    \\n    // Validate each email address\\n    toField.forEach(recipient => {\\n      if (typeof recipient !== 'string' || !recipient.trim()) {\\n        throw new Error('Invalid email recipient');\\n      }\\n    });\\n\\n    return {\\n      to: toField,\\n      subject: email.subject,\\n      template: email.message,\\n      data: data\\n    };\\n  });\\n\\n  return emailTemplates;\\n}\\n\\nmodule.exports = function(data) {\\n  if (!data?.$trigger || !data?.form) {\\n    throw new Error('Missing required data');\\n  }\\n  \\n  return prepareEmailTemplateData(data.$trigger, data.form);\\n};"}	fbf696ea-c6af-4230-8f62-c663beebd6d9	\N	61757ab0-b139-4079-b5eb-4e05bb8142ac	2025-01-14 10:43:22.665+00	60f562f9-84b6-4914-bf63-a7193567fcdf
e12b95db-a408-4e7e-b30b-264f7fa8baa3	Send	send	trigger	59	1	{"flow":"7c8732cd-9d9e-44be-a3f6-89c0d42c7687","payload":"{{ render }}"}	\N	\N	61757ab0-b139-4079-b5eb-4e05bb8142ac	2025-01-14 10:43:22.669+00	60f562f9-84b6-4914-bf63-a7193567fcdf
e6c50f84-e229-4f15-8119-c7708256e825	Update	update	item-update	73	1	{"collection":"posts","permissions":"$full","key":["{{$trigger.body.keys}}"],"payload":"{{format}}"}	\N	\N	5915dd55-fff8-4d47-b48c-a0e42e5033c1	2025-01-14 10:43:22.674+00	60f562f9-84b6-4914-bf63-a7193567fcdf
edc5e1ae-a3ed-45af-ae77-10409a66cd03	Format	format	exec	37	1	{"code":"module.exports = function(data) {\\n\\treturn {\\n        ...data.$trigger,\\n        body: data.render.template\\n    }\\n}"}	\N	\N	5429ccb0-7e97-4ef5-9d65-2bbcf964f9a6	2025-01-14 10:43:22.677+00	60f562f9-84b6-4914-bf63-a7193567fcdf
fbf696ea-c6af-4230-8f62-c663beebd6d9	Render	render	trigger	41	1	{"flow":"5429ccb0-7e97-4ef5-9d65-2bbcf964f9a6","payload":"{{ format }}"}	e12b95db-a408-4e7e-b30b-264f7fa8baa3	\N	61757ab0-b139-4079-b5eb-4e05bb8142ac	2025-01-14 10:43:22.681+00	60f562f9-84b6-4914-bf63-a7193567fcdf
fd271542-fac2-42d8-aa10-a02520c3753f	Format	format	exec	37	1	{"code":"module.exports = async function(data) {\\n    return data.read_globals[0]\\n}"}	\N	\N	69e87d0b-df14-4779-bdc8-abc05f2f1e97	2025-01-14 10:43:22.684+00	60f562f9-84b6-4914-bf63-a7193567fcdf
89125be2-8205-4ad0-a77f-bd3e984202b3	Write	write	directus-labs-ai-writer-operation	37	1	{"apiKey":"{{globals.openai_api_key}}","model":"gpt-4o-mini","promptKey":"custom","system":"You are an expert in writing blog posts that are valuable for readers.\\n\\n## Rules\\n- You are a human content writer. Avoid AI words like \\"empower\\". Avoid using prolix. Sound human.\\n- ALWAYS output a JSON object that matches the sample below.\\n{\\n\\"title\\": \\"Article Title\\",\\n\\"slug\\": \\"formatted-slug\\",\\n\\"description\\": \\"Short summary of the article to entice readers\\",\\n\\"content\\": \\"Article content goes here. This needs to be properly encoded HTML string with proper line breaks, etc.\\"\\n}","json_mode":true,"text":"Write an article based on this prompt.\\n{{$trigger.body.prompt}}\\n\\n\\n## Voice\\nMatch this style and tone of voice when writing.\\n{{ $trigger.body.voice }}","aiProvider":"openai","apiKeyOpenAi":"{{globals.openai_api_key}}","maxToken":8192}	3b7d004a-1dba-43c4-b902-a44fd71602ae	\N	5915dd55-fff8-4d47-b48c-a0e42e5033c1	2025-01-14 10:43:22.648+00	60f562f9-84b6-4914-bf63-a7193567fcdf
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
01914ef3-5512-4c89-9709-904f9b47ddeb	5a5b8448-16f4-46b1-abe8-19730cadc3a5	Submissions Over Time	\N	\N	t	\N	time-series	1	20	36	12	{"collection":"form_submissions","precision":"day","function":"count","range":"auto","filter":{"_and":[{"_and":[{"timestamp":{"_between":["{{dateFrom}}","{{dateTo}}"]}}]}]},"dateField":"timestamp","valueField":"id"}	2025-01-14 10:43:21.198+00	60f562f9-84b6-4914-bf63-a7193567fcdf
19b3d901-aa7c-4a04-bc9a-800e43510e69	5a5b8448-16f4-46b1-abe8-19730cadc3a5	Submissions	\N	\N	t	\N	list	1	35	36	30	{"collection":"form_submissions","limit":100,"sortField":"id","linkToItem":true,"displayTemplate":"{{timestamp}} • {{values}} • {{form}}"}	2025-01-14 10:43:21.297+00	60f562f9-84b6-4914-bf63-a7193567fcdf
3861ceb1-11ff-4e9d-a985-60d862d90aa3	5a5b8448-16f4-46b1-abe8-19730cadc3a5	From	date_range	\N	t	\N	variable	1	6	18	6	{"field":"dateFrom","type":"timestamp","inter":"datetime","defaultValue":"2024-01-01T12:00:00-05:00","options":{"use24":false}}	2025-01-14 10:43:21.398+00	60f562f9-84b6-4914-bf63-a7193567fcdf
53575d2f-e3a0-4532-a176-d047cbbc11a7	5a5b8448-16f4-46b1-abe8-19730cadc3a5	Submissions - Last 30 Days	\N	\N	t	\N	metric	1	12	18	8	{"collection":"form_submissions","field":"id","function":"count","sortField":null,"conditionalFormatting":null,"filter":{"_and":[{"timestamp":{"_gt":"$NOW(-30d)"}}]}}	2025-01-14 10:43:21.498+00	60f562f9-84b6-4914-bf63-a7193567fcdf
8cb3b63c-d8e3-4078-9160-096e32b9fcb0	5a5b8448-16f4-46b1-abe8-19730cadc3a5	Submissions - Total	\N	\N	t	\N	metric	19	12	18	8	{"collection":"form_submissions","field":"id","function":"count","sortField":null}	2025-01-14 10:43:21.598+00	60f562f9-84b6-4914-bf63-a7193567fcdf
b770ea7e-1b49-441f-ba6f-2d4b90e08070	5a5b8448-16f4-46b1-abe8-19730cadc3a5	\N	\N	\N	f	\N	label	1	3	36	3	{"text":"Form Dashboard"}	2025-01-14 10:43:21.697+00	60f562f9-84b6-4914-bf63-a7193567fcdf
dc01026c-1728-4e71-ab45-7cea9fc4751c	5a5b8448-16f4-46b1-abe8-19730cadc3a5	To	date_range	\N	t	\N	variable	19	6	18	6	{"field":"dateTo","type":"timestamp","inter":"datetime","defaultValue":"2025-01-01T12:00:00-05:00","options":{"use24":false}}	2025-01-14 10:43:21.799+00	60f562f9-84b6-4914-bf63-a7193567fcdf
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_permissions (id, collection, action, permissions, validation, presets, fields, policy) FROM stdin;
1	pages	read	{"_and":[{"status":{"_eq":"published"}},{"published_at":{"_lte":"$NOW"}}]}	{}	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
2	posts	read	{"_and":[{"status":{"_eq":"published"}},{"published_at":{"_lte":"$NOW"}}]}	{}	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
3	block_hero	read	{}	{}	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
4	block_richtext	read	{}	{}	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
5	globals	read	{}	{}	\N	id,seo,url,title,tagline,description,social,og_image,twitter_image,social_links,contact,street_address,address_locality,address_region,postal_code,address_country,email,phone,routes,logo_on_dark_bg,logo_on_light_bg,theme,logo,favicon	abf8a154-5b1c-4a46-ac9c-7300570f4f17
6	page_blocks	read	{"_and":[{"page":{"status":{"_eq":"published"}}}]}	{}	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
7	forms	read	{"_and":[{"is_active":{"_eq":true}}]}	{}	\N	id,sort,title,is_active,meta_tabs,meta_fields,fields,submit_label,on_success,success_message,success_redirect_url	abf8a154-5b1c-4a46-ac9c-7300570f4f17
8	navigation	read	{"_and":[{"is_active":{"_eq":true}}]}	{}	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
9	navigation_items	read	{"_and":[{"_or":[{"navigation":{"is_active":{"_eq":true}}},{"parent":{"navigation":{"is_active":{"_eq":true}}}}]}]}	{}	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
10	block_gallery	read	{}	{}	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
11	blog_settings	read	{}	{}	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
12	chat_config	read	{}	{}	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
13	block_button_group	read	{}	{}	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
14	block_button	read	{}	{}	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
15	block_button	update	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
16	block_button	delete	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
17	block_button	create	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
18	block_button	read	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
19	block_button_group	create	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
20	block_button_group	read	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
21	block_button_group	update	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
22	block_button_group	delete	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
23	block_gallery	create	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
24	block_gallery	read	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
25	block_gallery	update	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
26	block_gallery	delete	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
27	block_hero	delete	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
28	block_hero	update	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
29	block_hero	read	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
30	block_hero	create	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
31	block_richtext	create	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
32	block_richtext	read	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
33	block_richtext	update	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
34	block_richtext	delete	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
35	blog_settings	delete	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
36	blog_settings	create	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
37	blog_settings	update	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
38	blog_settings	read	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
39	forms	update	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
40	forms	read	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
41	forms	create	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
42	forms	delete	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
43	globals	create	{}	{}	\N	id,title,url,divider_logo,logo,favicon,tagline,description,divider_social,social_links	8ba4ed6f-d330-4675-ae46-119c533a0928
44	globals	read	{}	{}	\N	id,title,url,divider_logo,logo,favicon,tagline,description,divider_social,social_links	8ba4ed6f-d330-4675-ae46-119c533a0928
45	globals	update	{}	{}	\N	id,title,url,divider_logo,logo,favicon,tagline,description,divider_social,social_links	8ba4ed6f-d330-4675-ae46-119c533a0928
46	navigation	create	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
47	navigation	read	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
48	navigation	update	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
49	navigation	delete	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
50	navigation_items	create	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
51	navigation_items	read	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
52	navigation_items	delete	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
53	navigation_items	update	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
54	page_blocks	create	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
55	page_blocks	read	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
56	page_blocks	update	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
57	page_blocks	delete	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
58	pages	read	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
59	pages	create	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
60	pages	update	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
61	pages	delete	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
62	posts	create	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
63	posts	read	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
64	posts	update	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
65	posts	delete	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
66	projects_settings	read	{}	{}	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
67	directus_files	read	{"_and":[{"_or":[{"folder":{"name":{"_contains":"Public"}}},{"folder":{"parent":{"name":{"_contains":"Public"}}}}]}]}	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
68	directus_files	create	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
69	directus_files	read	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
70	directus_files	update	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
71	directus_files	delete	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
72	directus_dashboards	create	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
73	directus_dashboards	read	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
74	directus_dashboards	update	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
75	directus_dashboards	delete	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
76	directus_panels	create	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
77	directus_panels	read	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
78	directus_panels	update	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
79	directus_panels	delete	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
80	directus_folders	create	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
81	directus_folders	read	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
82	directus_folders	update	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
83	directus_folders	delete	{}	\N	\N	\N	52598a64-071d-4071-96fa-4b620d6189b5
84	directus_users	read	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
85	directus_users	update	{"id":{"_eq":"$CURRENT_USER"}}	\N	\N	first_name,last_name,email,password,location,title,description,avatar,language,appearance,theme_light,theme_dark,theme_light_overrides,theme_dark_overrides,tfa_secret	52598a64-071d-4071-96fa-4b620d6189b5
86	directus_roles	read	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
87	directus_shares	read	{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
88	directus_shares	create	{}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
89	directus_shares	update	{"user_created":{"_eq":"$CURRENT_USER"}}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
90	directus_shares	delete	{"user_created":{"_eq":"$CURRENT_USER"}}	\N	\N	*	52598a64-071d-4071-96fa-4b620d6189b5
91	directus_flows	read	{"trigger":{"_eq":"manual"}}	\N	\N	id,status,name,icon,color,options,trigger	52598a64-071d-4071-96fa-4b620d6189b5
92	block_form	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
93	block_posts	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
94	form_fields	read	{"_and":[{"form":{"is_active":{"_eq":true}}}]}	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
95	form_fields	read	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
96	form_fields	create	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
97	form_fields	update	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
98	form_fields	delete	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
99	form_submission_values	create	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
100	form_submission_values	read	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
101	form_submissions	create	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
102	form_submissions	read	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
103	block_posts	create	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
104	block_posts	read	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
105	block_posts	update	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
106	block_posts	delete	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
107	block_form	create	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
108	block_form	read	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
109	block_form	update	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
110	block_form	delete	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
111	directus_files	create	\N	{"_and":[{"filesize":{"_lte":"5000000"}}]}	{"folder":"e6308546-92fb-4b10-b586-eefaf1d97f7f"}	*	307380fe-195e-44cc-9cc0-6993aeee9428
112	form_submission_values	create	\N	\N	\N	*	ee1055a2-7c03-4b0b-9b65-ca68491b6329
113	form_submissions	create	\N	\N	\N	*	ee1055a2-7c03-4b0b-9b65-ca68491b6329
114	form_submission_values	read	\N	\N	\N	id	ee1055a2-7c03-4b0b-9b65-ca68491b6329
115	form_submissions	read	\N	\N	\N	id	ee1055a2-7c03-4b0b-9b65-ca68491b6329
116	block_gallery_items	create	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
117	block_gallery_items	read	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
118	block_gallery_items	update	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
119	block_gallery_items	delete	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
120	block_pricing	create	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
121	block_pricing	read	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
122	block_pricing	update	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
123	block_pricing	delete	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
124	block_pricing_cards	create	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
125	block_pricing_cards	read	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
126	block_pricing_cards	update	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
127	block_pricing_cards	delete	\N	\N	\N	*	8ba4ed6f-d330-4675-ae46-119c533a0928
128	block_gallery_items	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
129	block_pricing	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
130	block_pricing_cards	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
131	directus_users	read	{"_and":[{"posts":{"_nnull":true}}]}	\N	\N	first_name,last_name,avatar,title	abf8a154-5b1c-4a46-ac9c-7300570f4f17
132	directus_files	read	{"_and":[{"folder":{"_eq":"e6308546-92fb-4b10-b586-eefaf1d97f7f"}}]}	\N	\N	id	307380fe-195e-44cc-9cc0-6993aeee9428
133	subscription_tiers	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
135	video_courses	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
136	video_courses_lessons	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
\.


--
-- Data for Name: directus_policies; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
abf8a154-5b1c-4a46-ac9c-7300570f4f17	$t:public_label	public	$t:public_description	\N	f	f	f
c907eeb4-7df6-42f8-a2bf-2328ba1533b5	Administrator	verified	$t:admin_description	\N	f	t	t
307380fe-195e-44cc-9cc0-6993aeee9428	Files - Upload	upload	Grants access to upload files less than 5mb.	\N	f	f	f
52598a64-071d-4071-96fa-4b620d6189b5	Team - App Access	badge	Grants Directus Studio access to team members	\N	f	f	t
8ba4ed6f-d330-4675-ae46-119c533a0928	Content - Edit	edit	Grants ability to edit content for the website	\N	f	f	f
ee1055a2-7c03-4b0b-9b65-ca68491b6329	Forms - Submission	smart_button	Allows form submissions.	\N	f	f	f
ef049c8b-546b-4bbc-9cd7-b05d77e58b66	Administrator	verified	$t:admin_policy_description	\N	f	t	t
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
1	\N	60f562f9-84b6-4914-bf63-a7193567fcdf	\N	directus_users	\N	cards	{"cards":{"sort":["email"],"page":1}}	{"cards":{"icon":"account_circle","title":"{{ first_name }} {{ last_name }}","subtitle":"{{ email }}","size":4}}	\N	\N	bookmark	\N
2	\N	\N	\N	pages	\N	tabular	{"tabular":{"page":1,"fields":["title","status","permalink","blocks","published_at"],"sort":["sort"]}}	{"tabular":{"widths":{"status":149.625,"title":179.501708984375}}}	\N	\N	bookmark_border	\N
3	1. Workflow	\N	\N	posts	\N	kanban	{"tabular":{"fields":["status","image","title","date_published"],"sort":["-date_published"],"page":1}}	{"kanban":{"titleField":"title","showUngrouped":false,"dateField":"published_at","textField":"description","crop":true,"groupField":"status","groupTitle":null,"userField":"author"}}	\N	\N	view_kanban	\N
4	\N	\N	\N	directus_files	\N	cards	{"cards":{"sort":["-uploaded_on"],"page":1,"limit":25}}	{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}	\N	\N	bookmark_border	\N
5	\N	\N	\N	posts	\N	tabular	{"tabular":{"page":1,"fields":["image","title","status","published_at","slug","author"],"limit":25}}	{"tabular":{"widths":{"image":55.890625,"title":375.66015625,"status":170.03125}}}	\N	\N	bookmark_border	\N
6	\N	\N	\N	directus_presets	\N	\N	{"tabular":{"page":1,"limit":25,"fields":["bookmark","id","role","user","collection"],"sort":["-collection"]}}	\N	\N	\N	bookmark_border	\N
7	\N	\N	\N	forms	\N	tabular	{"tabular":{"fields":["title","fields","submissions","is_active"]}}	{"tabular":{"widths":{}}}	\N	\N	bookmark	\N
8	\N	\N	\N	form_submissions	\N	tabular	{"tabular":{"fields":["form","timestamp","values","id"]}}	{"tabular":{"widths":{}}}	\N	\N	bookmark	\N
9	\N	\N	\N	navigation	\N	tabular	{"tabular":{"fields":["title","id","items","is_active"]}}	{"tabular":{"widths":{"id":114.37890625}}}	\N	\N	bookmark	\N
10	\N	60f562f9-84b6-4914-bf63-a7193567fcdf	\N	directus_files	\N	cards	{"cards":{"sort":["-uploaded_on"],"page":1,"limit":25}}	{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}	\N	\N	bookmark_border	\N
11	\N	60f562f9-84b6-4914-bf63-a7193567fcdf	\N	navigation	\N	tabular	{"tabular":{"fields":["title","id","items","is_active"],"page":1}}	{"tabular":{"widths":{"id":114.37890625}}}	\N	\N	bookmark	\N
12	\N	60f562f9-84b6-4914-bf63-a7193567fcdf	\N	form_submissions	\N	tabular	{"tabular":{"fields":["form","timestamp","values","id"],"page":1}}	{"tabular":{"widths":{}}}	\N	\N	bookmark	\N
13	\N	60f562f9-84b6-4914-bf63-a7193567fcdf	\N	forms	\N	tabular	{"tabular":{"fields":["title","fields","submissions","is_active"],"page":1}}	{"tabular":{"widths":{}}}	\N	\N	bookmark	\N
14	\N	60f562f9-84b6-4914-bf63-a7193567fcdf	\N	pages	\N	tabular	{"tabular":{"page":1,"fields":["title","status","permalink","blocks","published_at"],"sort":["sort"]}}	{"tabular":{"widths":{"status":149.625,"title":179.501708984375}}}	\N	\N	bookmark_border	\N
15	\N	60f562f9-84b6-4914-bf63-a7193567fcdf	\N	subscription_tiers	\N	\N	{"tabular":{"page":1,"fields":["title","slug","price"]}}	{"tabular":{"widths":{}}}	\N	\N	bookmark	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
1	block_gallery_items	block_gallery	block_gallery	items	\N	\N	directus_file	sort	delete
2	block_gallery_items	directus_file	directus_files	\N	\N	\N	block_gallery	\N	nullify
3	block_hero	image	directus_files	\N	\N	\N	\N	\N	nullify
4	block_hero	button_group	block_button_group	\N	\N	\N	\N	\N	nullify
5	block_form	form	forms	\N	\N	\N	\N	\N	nullify
6	block_pricing_cards	button	block_button	\N	\N	\N	\N	\N	nullify
7	block_pricing_cards	pricing	block_pricing	pricing_cards	\N	\N	\N	sort	nullify
8	form_submission_values	field	form_fields	\N	\N	\N	\N	\N	nullify
9	form_submission_values	form_submission	form_submissions	values	\N	\N	\N	sort	delete
10	form_submission_values	file	directus_files	\N	\N	\N	\N	\N	nullify
11	form_fields	form	forms	fields	\N	\N	\N	sort	delete
12	globals	logo	directus_files	\N	\N	\N	\N	\N	nullify
13	globals	favicon	directus_files	\N	\N	\N	\N	\N	nullify
14	form_submissions	form	forms	submissions	\N	\N	\N	\N	nullify
15	navigation_items	post	posts	\N	\N	\N	\N	\N	nullify
16	navigation_items	parent	navigation_items	children	\N	\N	\N	sort	nullify
17	navigation_items	page	pages	\N	\N	\N	\N	\N	nullify
18	navigation_items	navigation	navigation	items	\N	\N	\N	sort	nullify
19	posts	image	directus_files	\N	\N	\N	\N	\N	nullify
20	posts	author	directus_users	posts	\N	\N	\N	sort	nullify
21	page_blocks	page	pages	blocks	\N	\N	item	sort	nullify
22	block_button	post	posts	\N	\N	\N	\N	\N	nullify
23	block_button	page	pages	\N	\N	\N	\N	\N	nullify
24	block_button	button_group	block_button_group	buttons	\N	\N	\N	sort	nullify
25	page_blocks	item	\N	\N	collection	block_hero,block_richtext,block_form,block_posts,block_gallery,block_pricing	page	\N	nullify
26	subscription_tiers	icon	directus_files	\N	\N	\N	\N	\N	nullify
27	subscriptions	tier	subscription_tiers	\N	\N	\N	\N	\N	nullify
28	directus_users	subscription	subscriptions	\N	\N	\N	\N	\N	nullify
31	video_courses	thumbnail	directus_files	\N	\N	\N	\N	\N	nullify
32	video_courses_lessons	video	directus_files	\N	\N	\N	\N	\N	nullify
33	video_courses_lessons	videoCourse	video_courses	lessons	\N	\N	\N	\N	nullify
34	video_courses	subscriptionTier	subscription_tiers	videoCourses	\N	\N	\N	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
1	2	directus_users	60f562f9-84b6-4914-bf63-a7193567fcdf	{"id":"60f562f9-84b6-4914-bf63-a7193567fcdf","first_name":"Admin","last_name":"User","email":"richard@codeit.ninja","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"c36d4878-9546-4449-857c-bd86f5e50eeb","token":"**********","last_access":"2025-01-14T10:36:44.734Z","last_page":"/users/60f562f9-84b6-4914-bf63-a7193567fcdf","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"policies":[]}	{"token":"**********"}	\N	\N
2	3	directus_fields	1	{"sort":1,"collection":"block_button","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"block_button","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
3	4	directus_fields	2	{"sort":3,"collection":"block_button","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":3,"collection":"block_button","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
4	5	directus_fields	3	{"sort":4,"collection":"block_button","field":"type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Page","value":"page","icon":"web_asset"},{"text":"Post","value":"post","icon":"article"},{"text":"URL","value":"url","icon":"link"}]},"display":"labels","display_options":{"format":true,"choices":[{"text":"Page","value":"page","icon":"web_asset"},{"text":"Post","value":"post","icon":"article"},{"text":"URL","value":"url","icon":"link"}]},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"What type of link is this? Page and Post allow you to link to internal content. URL is for external content. Group can contain other menu items.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":4,"collection":"block_button","field":"type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Page","value":"page","icon":"web_asset"},{"text":"Post","value":"post","icon":"article"},{"text":"URL","value":"url","icon":"link"}]},"display":"labels","display_options":{"format":true,"choices":[{"text":"Page","value":"page","icon":"web_asset"},{"text":"Post","value":"post","icon":"article"},{"text":"URL","value":"url","icon":"link"}]},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"What type of link is this? Page and Post allow you to link to internal content. URL is for external content. Group can contain other menu items.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
5	6	directus_fields	4	{"sort":5,"collection":"block_button","field":"page","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{title}} - {{permalink}}"},"display":"related-values","display_options":null,"readonly":false,"hidden":true,"width":"half","translations":null,"note":"The internal page to link to.","conditions":[{"name":"IF type = pages","rule":{"_and":[{"type":{"_eq":"page"}}]},"hidden":false,"options":{"enableCreate":true,"enableSelect":true}}],"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":5,"collection":"block_button","field":"page","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{title}} - {{permalink}}"},"display":"related-values","display_options":null,"readonly":false,"hidden":true,"width":"half","translations":null,"note":"The internal page to link to.","conditions":[{"name":"IF type = pages","rule":{"_and":[{"type":{"_eq":"page"}}]},"hidden":false,"options":{"enableCreate":true,"enableSelect":true}}],"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
6	7	directus_fields	5	{"sort":6,"collection":"block_button","field":"post","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{title}} - {{slug}}"},"display":"related-values","display_options":null,"readonly":false,"hidden":true,"width":"half","translations":null,"note":"The internal post to link to.","conditions":[{"name":"IF type = post","rule":{"_and":[{"type":{"_eq":"post"}}]},"hidden":false,"options":{"enableCreate":true,"enableSelect":true}}],"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":6,"collection":"block_button","field":"post","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{title}} - {{slug}}"},"display":"related-values","display_options":null,"readonly":false,"hidden":true,"width":"half","translations":null,"note":"The internal post to link to.","conditions":[{"name":"IF type = post","rule":{"_and":[{"type":{"_eq":"post"}}]},"hidden":false,"options":{"enableCreate":true,"enableSelect":true}}],"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
7	8	directus_fields	6	{"sort":9,"collection":"block_button","field":"label","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Text to include on the button.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":9,"collection":"block_button","field":"label","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Text to include on the button.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
8	9	directus_fields	7	{"sort":10,"collection":"block_button","field":"variant","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Default","value":"default"},{"text":"Outline","value":"outline"},{"text":"Soft","value":"soft"},{"text":"Ghost","value":"ghost"},{"text":"Link","value":"link"}]},"display":"formatted-value","display_options":{"format":true},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"What type of button","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":10,"collection":"block_button","field":"variant","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Default","value":"default"},{"text":"Outline","value":"outline"},{"text":"Soft","value":"soft"},{"text":"Ghost","value":"ghost"},{"text":"Link","value":"link"}]},"display":"formatted-value","display_options":{"format":true},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"What type of button","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
9	10	directus_fields	8	{"sort":2,"collection":"block_button","field":"button_group","special":null,"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The id of the Button Group this button belongs to.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"block_button","field":"button_group","special":null,"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The id of the Button Group this button belongs to.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
10	11	directus_fields	9	{"sort":7,"collection":"block_button","field":"url","special":null,"interface":"input","options":{"iconLeft":"link","trim":true},"display":"formatted-value","display_options":{"format":true},"readonly":false,"hidden":true,"width":"half","translations":null,"note":"The URL to link to. Could be relative (ie `/my-page`) or a full external URL (ie `https://docs.directus.io`)","conditions":[{"name":"If type = external","rule":{"_and":[{"type":{"_eq":"url"}}]},"hidden":false,"options":{"font":"sans-serif","trim":false,"masked":false,"clear":false,"slug":false}}],"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":7,"collection":"block_button","field":"url","special":null,"interface":"input","options":{"iconLeft":"link","trim":true},"display":"formatted-value","display_options":{"format":true},"readonly":false,"hidden":true,"width":"half","translations":null,"note":"The URL to link to. Could be relative (ie `/my-page`) or a full external URL (ie `https://docs.directus.io`)","conditions":[{"name":"If type = external","rule":{"_and":[{"type":{"_eq":"url"}}]},"hidden":false,"options":{"font":"sans-serif","trim":false,"masked":false,"clear":false,"slug":false}}],"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
11	12	directus_collections	block_button	{"collection":"block_button","icon":null,"note":null,"display_template":"{{label}} - {{type}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Button","singular":"Button","plural":"Buttons"}],"archive_field":null,"archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"block_button","icon":null,"note":null,"display_template":"{{label}} - {{type}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Button","singular":"Button","plural":"Buttons"}],"archive_field":null,"archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
12	13	directus_fields	10	{"sort":1,"collection":"block_button_group","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"block_button_group","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
13	14	directus_fields	11	{"sort":3,"collection":"block_button_group","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":3,"collection":"block_button_group","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
14	15	directus_fields	12	{"sort":9,"collection":"block_button_group","field":"buttons","special":["o2m"],"interface":"list-o2m","options":{"enableLink":true,"template":"{{label}} - {{type}}"},"display":"related-values","display_options":{"template":"{{label}} - {{type}}"},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Add individual buttons to the button group.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":9,"collection":"block_button_group","field":"buttons","special":["o2m"],"interface":"list-o2m","options":{"enableLink":true,"template":"{{label}} - {{type}}"},"display":"related-values","display_options":{"template":"{{label}} - {{type}}"},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Add individual buttons to the button group.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
15	16	directus_collections	block_button_group	{"collection":"block_button_group","icon":"smart_button","note":null,"display_template":"{{buttons.label}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Button Group","singular":"Button Group","plural":"Button Groups"}],"archive_field":null,"archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":"#18222F","item_duplication_fields":null,"sort":8,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"block_button_group","icon":"smart_button","note":null,"display_template":"{{buttons.label}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Button Group","singular":"Button Group","plural":"Button Groups"}],"archive_field":null,"archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":"#18222F","item_duplication_fields":null,"sort":8,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
16	17	directus_fields	13	{"sort":1,"collection":"block_form","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"block_form","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
26	27	directus_fields	21	{"sort":1,"collection":"block_gallery_items","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"block_gallery_items","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
17	18	directus_fields	14	{"sort":5,"collection":"block_form","field":"form","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Form to show within block","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":5,"collection":"block_form","field":"form","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Form to show within block","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
18	19	directus_fields	15	{"sort":4,"collection":"block_form","field":"headline","special":null,"interface":"input","options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Larger main headline for this page section.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":4,"collection":"block_form","field":"headline","special":null,"interface":"input","options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Larger main headline for this page section.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
19	20	directus_fields	16	{"sort":2,"collection":"block_form","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Smaller copy shown above the headline to label a section or add extra context.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"block_form","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Smaller copy shown above the headline to label a section or add extra context.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
20	21	directus_collections	block_form	{"collection":"block_form","icon":"format_shapes","note":null,"display_template":"{{form.title}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Form"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"block_form","icon":"format_shapes","note":null,"display_template":"{{form.title}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Form"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
21	22	directus_fields	17	{"sort":4,"collection":"block_gallery","field":"headline","special":null,"interface":"input","options":{"toolbar":["italic","removeformat"]},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Larger main headline for this page section.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":4,"collection":"block_gallery","field":"headline","special":null,"interface":"input","options":{"toolbar":["italic","removeformat"]},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Larger main headline for this page section.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
22	23	directus_fields	18	{"sort":1,"collection":"block_gallery","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"block_gallery","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
23	24	directus_fields	19	{"sort":2,"collection":"block_gallery","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Smaller copy shown above the headline to label a section or add extra context.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"block_gallery","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Smaller copy shown above the headline to label a section or add extra context.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
24	25	directus_fields	20	{"sort":5,"collection":"block_gallery","field":"items","special":["files"],"interface":"files","options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Images to include in the image gallery.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":5,"collection":"block_gallery","field":"items","special":["files"],"interface":"files","options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Images to include in the image gallery.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
25	26	directus_collections	block_gallery	{"collection":"block_gallery","icon":"grid_view","note":null,"display_template":"{{headline}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Gallery","singular":"Gallery","plural":"Gallery"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#1A212C","item_duplication_fields":null,"sort":5,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"block_gallery","icon":"grid_view","note":null,"display_template":"{{headline}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Gallery","singular":"Gallery","plural":"Gallery"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#1A212C","item_duplication_fields":null,"sort":5,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
359	360	directus_folders	e6308546-92fb-4b10-b586-eefaf1d97f7f	{"id":"e6308546-92fb-4b10-b586-eefaf1d97f7f","name":"3. Uploads","parent":null}	{"name":"3. Uploads","parent":null}	\N	\N
27	28	directus_fields	22	{"sort":2,"collection":"block_gallery_items","field":"block_gallery","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The id of the gallery block this item belongs to.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"block_gallery_items","field":"block_gallery","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The id of the gallery block this item belongs to.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
28	29	directus_fields	23	{"sort":3,"collection":"block_gallery_items","field":"directus_file","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The id of the file included in the gallery.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":3,"collection":"block_gallery_items","field":"directus_file","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The id of the file included in the gallery.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
29	30	directus_fields	24	{"sort":4,"collection":"block_gallery_items","field":"sort","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":4,"collection":"block_gallery_items","field":"sort","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
30	31	directus_collections	block_gallery_items	{"collection":"block_gallery_items","icon":null,"note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"block_gallery_items","icon":null,"note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
31	32	directus_fields	25	{"sort":3,"collection":"block_hero","field":"headline","special":null,"interface":"input","options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Larger main headline for this page section.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":3,"collection":"block_hero","field":"headline","special":null,"interface":"input","options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Larger main headline for this page section.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
32	33	directus_fields	26	{"sort":1,"collection":"block_hero","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"block_hero","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
33	34	directus_fields	27	{"sort":7,"collection":"block_hero","field":"image","special":["file"],"interface":"file-image","options":{"crop":false,"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Featured image in the hero.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":7,"collection":"block_hero","field":"image","special":["file"],"interface":"file-image","options":{"crop":false,"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Featured image in the hero.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
34	35	directus_fields	28	{"sort":5,"collection":"block_hero","field":"button_group","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{buttons.label}}","createRelatedItem":"always","enableLink":true,"enableSelect":false},"display":"related-values","display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Action buttons that show below headline and description.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":5,"collection":"block_hero","field":"button_group","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{buttons.label}}","createRelatedItem":"always","enableLink":true,"enableSelect":false},"display":"related-values","display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Action buttons that show below headline and description.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
35	36	directus_fields	29	{"sort":4,"collection":"block_hero","field":"description","special":null,"interface":"input-multiline","options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Supporting copy that shows below the headline.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":4,"collection":"block_hero","field":"description","special":null,"interface":"input-multiline","options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Supporting copy that shows below the headline.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
242	243	directus_permissions	30	{"collection":"block_hero","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_hero","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
36	37	directus_fields	30	{"sort":9,"collection":"block_hero","field":"alignment","special":null,"interface":"select-radio","options":{"choices":[{"text":"Left","value":"left"},{"text":"Center","value":"center"},{"text":"Right","value":"right"}]},"display":"formatted-value","display_options":{"format":true},"readonly":false,"hidden":true,"width":"full","translations":null,"note":"Where is the image placed?","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":9,"collection":"block_hero","field":"alignment","special":null,"interface":"select-radio","options":{"choices":[{"text":"Left","value":"left"},{"text":"Center","value":"center"},{"text":"Right","value":"right"}]},"display":"formatted-value","display_options":{"format":true},"readonly":false,"hidden":true,"width":"full","translations":null,"note":"Where is the image placed?","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
37	38	directus_fields	31	{"sort":2,"collection":"block_hero","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Smaller copy shown above the headline to label a section or add extra context.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"block_hero","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Smaller copy shown above the headline to label a section or add extra context.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
38	39	directus_fields	32	{"sort":8,"collection":"block_hero","field":"layout","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Image Left","value":"image_left","icon":"format_image_left"},{"text":"Image Center","value":"image_center","icon":"image"},{"text":"Image Right","value":"image_right","icon":"format_image_right"}]},"display":"labels","display_options":{"format":true,"choices":[{"text":"Image Left","value":"image_left","icon":"format_image_left"},{"text":"Image Center","value":"image_center","icon":"image"},{"text":"Image Right","value":"image_right","icon":"format_image_right"}]},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"The layout for the component. You can set the image to display left, right, or in the center of page..","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":8,"collection":"block_hero","field":"layout","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Image Left","value":"image_left","icon":"format_image_left"},{"text":"Image Center","value":"image_center","icon":"image"},{"text":"Image Right","value":"image_right","icon":"format_image_right"}]},"display":"labels","display_options":{"format":true,"choices":[{"text":"Image Left","value":"image_left","icon":"format_image_left"},{"text":"Image Center","value":"image_center","icon":"image"},{"text":"Image Right","value":"image_right","icon":"format_image_right"}]},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"The layout for the component. You can set the image to display left, right, or in the center of page..","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
39	40	directus_fields	33	{"sort":6,"collection":"block_hero","field":"divider-1zdl4a","special":["alias","no-data"],"interface":"presentation-divider","options":{"inlineTitle":true,"icon":"image","color":"#A2B5CD"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":6,"collection":"block_hero","field":"divider-1zdl4a","special":["alias","no-data"],"interface":"presentation-divider","options":{"inlineTitle":true,"icon":"image","color":"#A2B5CD"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
40	41	directus_collections	block_hero	{"collection":"block_hero","icon":"aspect_ratio","note":null,"display_template":"{{headline}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Hero","singular":"Hero","plural":"Hero"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#1A212C","item_duplication_fields":null,"sort":1,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"block_hero","icon":"aspect_ratio","note":null,"display_template":"{{headline}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Hero","singular":"Hero","plural":"Hero"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#1A212C","item_duplication_fields":null,"sort":1,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
41	42	directus_fields	34	{"sort":1,"collection":"block_posts","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"block_posts","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
42	43	directus_fields	35	{"sort":4,"collection":"block_posts","field":"headline","special":null,"interface":"input","options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Larger main headline for this page section.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":4,"collection":"block_posts","field":"headline","special":null,"interface":"input","options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Larger main headline for this page section.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
52	53	directus_fields	43	{"sort":1,"collection":"block_pricing_cards","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"block_pricing_cards","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
360	361	directus_folders	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	{"id":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","name":"1. Public","parent":null}	{"name":"1. Public","parent":null}	\N	\N
43	44	directus_fields	36	{"sort":5,"collection":"block_posts","field":"collection","special":null,"interface":"select-radio","options":{"choices":[{"text":"Posts","value":"posts"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"The collection of content to fetch and display on the page within this block.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":5,"collection":"block_posts","field":"collection","special":null,"interface":"select-radio","options":{"choices":[{"text":"Posts","value":"posts"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"The collection of content to fetch and display on the page within this block.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
44	45	directus_fields	37	{"sort":3,"collection":"block_posts","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Smaller copy shown above the headline to label a section or add extra context.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":3,"collection":"block_posts","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Smaller copy shown above the headline to label a section or add extra context.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
45	46	directus_fields	38	{"sort":2,"collection":"block_posts","field":"notice-hc-3x7","special":["alias","no-data"],"interface":"presentation-notice","options":{"text":"Add this block to show a collection of your blog posts on any page. It automatically retrieves and lists all published blog posts."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"block_posts","field":"notice-hc-3x7","special":["alias","no-data"],"interface":"presentation-notice","options":{"text":"Add this block to show a collection of your blog posts on any page. It automatically retrieves and lists all published blog posts."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
46	47	directus_collections	block_posts	{"collection":"block_posts","icon":"signpost","note":null,"display_template":"{{headline}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Posts"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"block_posts","icon":"signpost","note":null,"display_template":"{{headline}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Posts"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
47	48	directus_fields	39	{"sort":1,"collection":"block_pricing","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"block_pricing","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
48	49	directus_fields	40	{"sort":4,"collection":"block_pricing","field":"headline","special":null,"interface":"input","options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Larger main headline for this page section.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":4,"collection":"block_pricing","field":"headline","special":null,"interface":"input","options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Larger main headline for this page section.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
49	50	directus_fields	41	{"sort":2,"collection":"block_pricing","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Smaller copy shown above the headline to label a section or add extra context.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"block_pricing","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Smaller copy shown above the headline to label a section or add extra context.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
50	51	directus_fields	42	{"sort":5,"collection":"block_pricing","field":"pricing_cards","special":["o2m"],"interface":"list-o2m","options":{"template":"{{title}} • {{price}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"The individual pricing cards to display.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":5,"collection":"block_pricing","field":"pricing_cards","special":["o2m"],"interface":"list-o2m","options":{"template":"{{title}} • {{price}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"The individual pricing cards to display.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
51	52	directus_collections	block_pricing	{"collection":"block_pricing","icon":"attach_money","note":null,"display_template":"{{headline}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Pricing"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"block_pricing","icon":"attach_money","note":null,"display_template":"{{headline}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Pricing"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
53	54	directus_fields	44	{"sort":2,"collection":"block_pricing_cards","field":"title","special":null,"interface":"input","options":{"placeholder":"Starter Plan"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Name of the pricing plan. Shown at the top of the card.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"block_pricing_cards","field":"title","special":null,"interface":"input","options":{"placeholder":"Starter Plan"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Name of the pricing plan. Shown at the top of the card.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
54	55	directus_fields	45	{"sort":6,"collection":"block_pricing_cards","field":"description","special":null,"interface":"input-multiline","options":{"placeholder":"For small businesses and indie hackers"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Short, one sentence description of the pricing plan and who it is for.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":6,"collection":"block_pricing_cards","field":"description","special":null,"interface":"input-multiline","options":{"placeholder":"For small businesses and indie hackers"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Short, one sentence description of the pricing plan and who it is for.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
55	56	directus_fields	46	{"sort":4,"collection":"block_pricing_cards","field":"price","special":null,"interface":"input","options":{"placeholder":"$199 /month"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Price and term for the pricing plan. (ie `$199/mo`)","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":4,"collection":"block_pricing_cards","field":"price","special":null,"interface":"input","options":{"placeholder":"$199 /month"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Price and term for the pricing plan. (ie `$199/mo`)","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
56	57	directus_fields	47	{"sort":3,"collection":"block_pricing_cards","field":"badge","special":null,"interface":"input","options":{"placeholder":"Most popular"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Badge that displays at the top of the pricing plan card to add helpful context.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":3,"collection":"block_pricing_cards","field":"badge","special":null,"interface":"input","options":{"placeholder":"Most popular"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Badge that displays at the top of the pricing plan card to add helpful context.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
57	58	directus_fields	48	{"sort":7,"collection":"block_pricing_cards","field":"features","special":["cast-json"],"interface":"simple-list","options":{"limit":10},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Short list of features included in this plan. Press `Enter` to add another item to the list.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":7,"collection":"block_pricing_cards","field":"features","special":["cast-json"],"interface":"simple-list","options":{"limit":10},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Short list of features included in this plan. Press `Enter` to add another item to the list.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
58	59	directus_fields	49	{"sort":8,"collection":"block_pricing_cards","field":"button","special":["m2o"],"interface":"select-dropdown-m2o","options":{"createRelatedItem":"always","template":"{{label}} • {{type}}","enableSelect":false,"enableLink":true},"display":"related-values","display_options":{"template":"{{label}} • {{type}}"},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"The action button / link shown at the bottom of the pricing card.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":8,"collection":"block_pricing_cards","field":"button","special":["m2o"],"interface":"select-dropdown-m2o","options":{"createRelatedItem":"always","template":"{{label}} • {{type}}","enableSelect":false,"enableLink":true},"display":"related-values","display_options":{"template":"{{label}} • {{type}}"},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"The action button / link shown at the bottom of the pricing card.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
59	60	directus_fields	50	{"sort":9,"collection":"block_pricing_cards","field":"pricing","special":null,"interface":"select-dropdown-m2o","options":{"enableSelect":false,"enableLink":true},"display":"related-values","display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The id of the pricing block this card belongs to.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":9,"collection":"block_pricing_cards","field":"pricing","special":null,"interface":"select-dropdown-m2o","options":{"enableSelect":false,"enableLink":true},"display":"related-values","display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The id of the pricing block this card belongs to.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
60	61	directus_fields	51	{"sort":5,"collection":"block_pricing_cards","field":"is_highlighted","special":["cast-boolean"],"interface":"boolean","options":{"label":"Highlighted"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Add highlighted border around the pricing plan to make it stand out.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":5,"collection":"block_pricing_cards","field":"is_highlighted","special":["cast-boolean"],"interface":"boolean","options":{"label":"Highlighted"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Add highlighted border around the pricing plan to make it stand out.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
190	191	directus_collections	block_hero	{"collection":"block_hero","icon":"aspect_ratio","note":null,"display_template":"{{headline}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Hero","singular":"Hero","plural":"Hero"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#1A212C","item_duplication_fields":null,"sort":1,"group":"blocks","collapse":"open","preview_url":null,"versioning":false}	{"group":"blocks"}	\N	\N
61	62	directus_fields	52	{"sort":10,"collection":"block_pricing_cards","field":"sort","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":10,"collection":"block_pricing_cards","field":"sort","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
62	63	directus_collections	block_pricing_cards	{"collection":"block_pricing_cards","icon":null,"note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"block_pricing_cards","icon":null,"note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
63	64	directus_fields	53	{"sort":5,"collection":"block_richtext","field":"content","special":null,"interface":"input-rich-text-html","options":{"customFormats":null,"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Rich text content for this block.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":5,"collection":"block_richtext","field":"content","special":null,"interface":"input-rich-text-html","options":{"customFormats":null,"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Rich text content for this block.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
64	65	directus_fields	54	{"sort":4,"collection":"block_richtext","field":"headline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Larger main headline for this page section.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":4,"collection":"block_richtext","field":"headline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Larger main headline for this page section.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
65	66	directus_fields	55	{"sort":1,"collection":"block_richtext","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"block_richtext","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
66	67	directus_fields	56	{"sort":6,"collection":"block_richtext","field":"alignment","special":null,"interface":"select-radio","options":{"choices":[{"text":"Left","value":"left"},{"text":"Center","value":"center"}]},"display":"formatted-value","display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Controls how the content block is positioned on the page. Choose \\"Left\\" to align the block against the left margin or \\"Center\\" to position the block in the middle of the page. This setting affects the entire content block's placement, not the text alignment within it.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":6,"collection":"block_richtext","field":"alignment","special":null,"interface":"select-radio","options":{"choices":[{"text":"Left","value":"left"},{"text":"Center","value":"center"}]},"display":"formatted-value","display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Controls how the content block is positioned on the page. Choose \\"Left\\" to align the block against the left margin or \\"Center\\" to position the block in the middle of the page. This setting affects the entire content block's placement, not the text alignment within it.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
67	68	directus_fields	57	{"sort":2,"collection":"block_richtext","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Smaller copy shown above the headline to label a section or add extra context.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"block_richtext","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Smaller copy shown above the headline to label a section or add extra context.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
68	69	directus_collections	block_richtext	{"collection":"block_richtext","icon":"format_color_text","note":null,"display_template":"{{headline}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Rich Text","singular":"Rich Text","plural":"Rich Text"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#1A212C","item_duplication_fields":null,"sort":2,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"block_richtext","icon":"format_color_text","note":null,"display_template":"{{headline}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Rich Text","singular":"Rich Text","plural":"Rich Text"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#1A212C","item_duplication_fields":null,"sort":2,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
116	117	directus_fields	100	{"sort":1,"collection":"globals","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"globals","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
69	70	directus_collections	blocks	{"collection":"blocks","icon":"content_copy","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#1A212C","item_duplication_fields":null,"sort":2,"collapse":"closed","preview_url":null,"versioning":false}	{"collection":"blocks","icon":"content_copy","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#1A212C","item_duplication_fields":null,"sort":2,"collapse":"closed","preview_url":null,"versioning":false}	\N	\N
70	71	directus_fields	58	{"sort":1,"collection":"form_fields","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"form_fields","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
71	72	directus_fields	59	{"sort":4,"collection":"form_fields","field":"name","special":null,"interface":"input","options":{"slug":true,"trim":true,"iconLeft":"key","placeholder":"full-name"},"display":"formatted-value","display_options":{"format":true},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Unique field identifier, not shown to users (lowercase, hyphenated)","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":4,"collection":"form_fields","field":"name","special":null,"interface":"input","options":{"slug":true,"trim":true,"iconLeft":"key","placeholder":"full-name"},"display":"formatted-value","display_options":{"format":true},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Unique field identifier, not shown to users (lowercase, hyphenated)","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
72	73	directus_fields	60	{"sort":5,"collection":"form_fields","field":"type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Text","value":"text","icon":"format_color_text"},{"text":"Textarea","value":"textarea","icon":"display_external_input"},{"text":"Checkbox","value":"checkbox","icon":"check_box_outline_blank"},{"text":"Checkbox Group","value":"checkbox_group","icon":"library_add_check"},{"text":"Radio","value":"radio","icon":"radio_button_unchecked"},{"text":"File","value":"file","icon":"attach_file"},{"text":"Select","value":"select","icon":"text_select_move_down"},{"text":"Hidden","value":"hidden","icon":"hide_source"}]},"display":"labels","display_options":{"choices":[{"text":"Text","value":"text","icon":"format_color_text"},{"text":"Textarea","value":"textarea","icon":"display_external_input"},{"text":"Checkbox","value":"checkbox","icon":"check_box_outline_blank"},{"text":"Checkbox Group","value":"checkbox_group","icon":"library_add_check"},{"text":"Radio","value":"radio","icon":"radio_button_unchecked"},{"text":"File","value":"file","icon":"attach_file"},{"text":"Select","value":"select","icon":"text_select_move_down"},{"text":"Hidden","value":"hidden","icon":"hide_source"}]},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Input type for the field","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":5,"collection":"form_fields","field":"type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Text","value":"text","icon":"format_color_text"},{"text":"Textarea","value":"textarea","icon":"display_external_input"},{"text":"Checkbox","value":"checkbox","icon":"check_box_outline_blank"},{"text":"Checkbox Group","value":"checkbox_group","icon":"library_add_check"},{"text":"Radio","value":"radio","icon":"radio_button_unchecked"},{"text":"File","value":"file","icon":"attach_file"},{"text":"Select","value":"select","icon":"text_select_move_down"},{"text":"Hidden","value":"hidden","icon":"hide_source"}]},"display":"labels","display_options":{"choices":[{"text":"Text","value":"text","icon":"format_color_text"},{"text":"Textarea","value":"textarea","icon":"display_external_input"},{"text":"Checkbox","value":"checkbox","icon":"check_box_outline_blank"},{"text":"Checkbox Group","value":"checkbox_group","icon":"library_add_check"},{"text":"Radio","value":"radio","icon":"radio_button_unchecked"},{"text":"File","value":"file","icon":"attach_file"},{"text":"Select","value":"select","icon":"text_select_move_down"},{"text":"Hidden","value":"hidden","icon":"hide_source"}]},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Input type for the field","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
73	74	directus_fields	61	{"sort":6,"collection":"form_fields","field":"label","special":null,"interface":"input","options":{"placeholder":"Your Full Name"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Text label shown to form users.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":6,"collection":"form_fields","field":"label","special":null,"interface":"input","options":{"placeholder":"Your Full Name"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Text label shown to form users.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
74	75	directus_fields	62	{"sort":7,"collection":"form_fields","field":"placeholder","special":null,"interface":"input","options":{"placeholder":"John Doe"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Default text shown in empty input.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":7,"collection":"form_fields","field":"placeholder","special":null,"interface":"input","options":{"placeholder":"John Doe"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Default text shown in empty input.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
75	76	directus_fields	63	{"sort":8,"collection":"form_fields","field":"help","special":null,"interface":"input","options":{"placeholder":"Use first and last name"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Additional instructions shown below the input","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":8,"collection":"form_fields","field":"help","special":null,"interface":"input","options":{"placeholder":"Use first and last name"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Additional instructions shown below the input","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
76	77	directus_fields	64	{"sort":9,"collection":"form_fields","field":"validation","special":null,"interface":"input","options":{"placeholder":"max:255","trim":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Validation rules (e.g. `email|max:255`)","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":9,"collection":"form_fields","field":"validation","special":null,"interface":"input","options":{"placeholder":"max:255","trim":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Validation rules (e.g. `email|max:255`)","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
394	395	block_button_group	4cd6d4ca-82ea-4daf-ae79-a4c4265bfb27	{"id":"4cd6d4ca-82ea-4daf-ae79-a4c4265bfb27"}	{"id":"4cd6d4ca-82ea-4daf-ae79-a4c4265bfb27"}	\N	\N
77	78	directus_fields	65	{"sort":11,"collection":"form_fields","field":"width","special":null,"interface":"select-radio","options":{"choices":[{"text":"100%","value":"100"},{"text":"67%","value":"67"},{"text":"50%","value":"50"},{"text":"33%","value":"33"}]},"display":"formatted-value","display_options":{"format":true,"suffix":"%"},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Field width on the form","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":11,"collection":"form_fields","field":"width","special":null,"interface":"select-radio","options":{"choices":[{"text":"100%","value":"100"},{"text":"67%","value":"67"},{"text":"50%","value":"50"},{"text":"33%","value":"33"}]},"display":"formatted-value","display_options":{"format":true,"suffix":"%"},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Field width on the form","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
78	79	directus_fields	66	{"sort":12,"collection":"form_fields","field":"choices","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"text","name":"text","type":"string","meta":{"field":"text","width":"half","type":"string","interface":"input","note":"Displayed label to user","required":true,"options":{"placeholder":"Sales Team"}}},{"field":"value","name":"value","type":"string","meta":{"field":"value","width":"half","type":"string","interface":"input","note":"Stored value","required":true,"options":{"placeholder":"sales"}}}],"template":"{{ text }}"},"display":"formatted-json-value","display_options":{"format":"{{ label }}"},"readonly":false,"hidden":true,"width":"full","translations":null,"note":"Options for radio or select inputs","conditions":[{"name":"Show Choices","rule":{"_and":[{"_or":[{"type":{"_eq":"select"}},{"type":{"_eq":"checkbox_group"}},{"type":{"_eq":"radio"}}]}]},"hidden":false,"options":{}}],"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":12,"collection":"form_fields","field":"choices","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"text","name":"text","type":"string","meta":{"field":"text","width":"half","type":"string","interface":"input","note":"Displayed label to user","required":true,"options":{"placeholder":"Sales Team"}}},{"field":"value","name":"value","type":"string","meta":{"field":"value","width":"half","type":"string","interface":"input","note":"Stored value","required":true,"options":{"placeholder":"sales"}}}],"template":"{{ text }}"},"display":"formatted-json-value","display_options":{"format":"{{ label }}"},"readonly":false,"hidden":true,"width":"full","translations":null,"note":"Options for radio or select inputs","conditions":[{"name":"Show Choices","rule":{"_and":[{"_or":[{"type":{"_eq":"select"}},{"type":{"_eq":"checkbox_group"}},{"type":{"_eq":"radio"}}]}]},"hidden":false,"options":{}}],"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
79	80	directus_fields	67	{"sort":3,"collection":"form_fields","field":"form","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{title}}"},"display":"related-values","display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"Parent form this field belongs to.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":3,"collection":"form_fields","field":"form","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{title}}"},"display":"related-values","display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"Parent form this field belongs to.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
80	81	directus_fields	68	{"sort":2,"collection":"form_fields","field":"sort","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"form_fields","field":"sort","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
81	82	directus_fields	69	{"sort":10,"collection":"form_fields","field":"required","special":["cast-boolean"],"interface":"boolean","options":{"label":"Required"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Make this field mandatory to complete.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":10,"collection":"form_fields","field":"required","special":["cast-boolean"],"interface":"boolean","options":{"label":"Required"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Make this field mandatory to complete.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
82	83	directus_collections	form_fields	{"collection":"form_fields","icon":null,"note":"Individual fields for each form","display_template":"{{name}} • {{type}}","hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"form_fields","icon":null,"note":"Individual fields for each form","display_template":"{{name}} • {{type}}","hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
83	84	directus_fields	70	{"sort":1,"collection":"forms","field":"id","special":["uuid"],"interface":"input","options":{"iconLeft":"vpn_key"},"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"forms","field":"id","special":["uuid"],"interface":"input","options":{"iconLeft":"vpn_key"},"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
84	85	directus_fields	71	{"sort":2,"collection":"forms","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"forms","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
85	86	directus_fields	72	{"sort":3,"collection":"forms","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Form name (for internal reference).","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":3,"collection":"forms","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Form name (for internal reference).","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
86	87	directus_fields	73	{"sort":4,"collection":"forms","field":"is_active","special":["cast-boolean"],"interface":"boolean","options":{"label":"Active"},"display":"boolean","display_options":{"labelOn":"Active","labelOff":"Inactive"},"readonly":false,"hidden":false,"width":"half","translations":[{"language":"en-US","translation":"Active"}],"note":"Show or hide this form from the site.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":4,"collection":"forms","field":"is_active","special":["cast-boolean"],"interface":"boolean","options":{"label":"Active"},"display":"boolean","display_options":{"labelOn":"Active","labelOff":"Inactive"},"readonly":false,"hidden":false,"width":"half","translations":[{"language":"en-US","translation":"Active"}],"note":"Show or hide this form from the site.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
87	88	directus_fields	74	{"sort":5,"collection":"forms","field":"meta_tabs","special":["alias","no-data","group"],"interface":"group-tabs","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":5,"collection":"forms","field":"meta_tabs","special":["alias","no-data","group"],"interface":"group-tabs","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
88	89	directus_fields	75	{"sort":4,"collection":"forms","field":"on_success","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Redirect to URL","value":"redirect","icon":"arrow_outward"},{"text":"Show Message","value":"message","icon":"chat"}]},"display":"labels","display_options":{"choices":[{"text":"Redirect to URL","value":"redirect"},{"text":"Show Message","value":"message"}]},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Action after successful submission.","conditions":null,"required":false,"group":"meta_fields","validation":null,"validation_message":null}	{"sort":4,"collection":"forms","field":"on_success","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Redirect to URL","value":"redirect","icon":"arrow_outward"},{"text":"Show Message","value":"message","icon":"chat"}]},"display":"labels","display_options":{"choices":[{"text":"Redirect to URL","value":"redirect"},{"text":"Show Message","value":"message"}]},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Action after successful submission.","conditions":null,"required":false,"group":"meta_fields","validation":null,"validation_message":null}	\N	\N
89	90	directus_fields	76	{"sort":3,"collection":"forms","field":"submit_label","special":null,"interface":"input","options":{"placeholder":"Sign Up Now","iconLeft":"smart_button"},"display":"raw","display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Text shown on submit button.","conditions":null,"required":false,"group":"meta_fields","validation":null,"validation_message":null}	{"sort":3,"collection":"forms","field":"submit_label","special":null,"interface":"input","options":{"placeholder":"Sign Up Now","iconLeft":"smart_button"},"display":"raw","display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Text shown on submit button.","conditions":null,"required":false,"group":"meta_fields","validation":null,"validation_message":null}	\N	\N
90	91	directus_fields	77	{"sort":5,"collection":"forms","field":"success_message","special":null,"interface":"input-multiline","options":{"placeholder":"Thanks for reaching out! We'll be in touch soon."},"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"Message shown after successful submission.","conditions":[{"name":"If Message","readonly":false,"hidden":false,"options":{"toolbar":["bold","italic","underline","h1","h2","h3","numlist","bullist","removeformat","blockquote","customLink","customImage","customMedia","hr","code","fullscreen"],"font":"sans-serif"},"rule":{"_and":[{"on_success":{"_eq":"message"}}]}}],"required":false,"group":"meta_fields","validation":null,"validation_message":null}	{"sort":5,"collection":"forms","field":"success_message","special":null,"interface":"input-multiline","options":{"placeholder":"Thanks for reaching out! We'll be in touch soon."},"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"Message shown after successful submission.","conditions":[{"name":"If Message","readonly":false,"hidden":false,"options":{"toolbar":["bold","italic","underline","h1","h2","h3","numlist","bullist","removeformat","blockquote","customLink","customImage","customMedia","hr","code","fullscreen"],"font":"sans-serif"},"rule":{"_and":[{"on_success":{"_eq":"message"}}]}}],"required":false,"group":"meta_fields","validation":null,"validation_message":null}	\N	\N
91	92	directus_fields	78	{"sort":6,"collection":"forms","field":"success_redirect_url","special":null,"interface":"input","options":{"iconLeft":"link"},"display":"raw","display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"Destination URL after successful submission.","conditions":[{"name":"If Redirect","options":{"font":"sans-serif","trim":false,"masked":false,"clear":false,"slug":false},"hidden":false,"rule":{"_and":[{"on_success":{"_eq":"redirect"}}]}}],"required":false,"group":"meta_fields","validation":null,"validation_message":null}	{"sort":6,"collection":"forms","field":"success_redirect_url","special":null,"interface":"input","options":{"iconLeft":"link"},"display":"raw","display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"Destination URL after successful submission.","conditions":[{"name":"If Redirect","options":{"font":"sans-serif","trim":false,"masked":false,"clear":false,"slug":false},"hidden":false,"rule":{"_and":[{"on_success":{"_eq":"redirect"}}]}}],"required":false,"group":"meta_fields","validation":null,"validation_message":null}	\N	\N
92	93	directus_fields	79	{"sort":2,"collection":"forms","field":"fields","special":["o2m"],"interface":"list-o2m","options":{"template":"{{name}} • {{type}}","enableSelect":false,"sort":"sort"},"display":"related-values","display_options":{"template":"{{name}} • {{type}}"},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Form structure and input fields","conditions":null,"required":false,"group":"meta_fields","validation":null,"validation_message":null}	{"sort":2,"collection":"forms","field":"fields","special":["o2m"],"interface":"list-o2m","options":{"template":"{{name}} • {{type}}","enableSelect":false,"sort":"sort"},"display":"related-values","display_options":{"template":"{{name}} • {{type}}"},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Form structure and input fields","conditions":null,"required":false,"group":"meta_fields","validation":null,"validation_message":null}	\N	\N
191	192	directus_collections	block_posts	{"collection":"block_posts","icon":"signpost","note":null,"display_template":"{{headline}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Posts"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":"blocks","collapse":"open","preview_url":null,"versioning":false}	{"group":"blocks"}	\N	\N
93	94	directus_fields	80	{"sort":1,"collection":"forms","field":"notice-e1nc86","special":["alias","no-data"],"interface":"presentation-notice","options":{"text":" Create custom forms by adding and configuring your desired input fields below. No coding required."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"meta_fields","validation":null,"validation_message":null}	{"sort":1,"collection":"forms","field":"notice-e1nc86","special":["alias","no-data"],"interface":"presentation-notice","options":{"text":" Create custom forms by adding and configuring your desired input fields below. No coding required."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"meta_fields","validation":null,"validation_message":null}	\N	\N
94	95	directus_fields	81	{"sort":2,"collection":"forms","field":"emails","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"to","name":"to","type":"json","meta":{"field":"to","width":"full","type":"json","required":true,"note":"Add an email address and press enter. To use a form field as the email address use merge tags `{# #}` (e.g. `{# email #}.","interface":"tags","options":{"choices":null},"display":"labels","display_options":{"format":false}}},{"field":"subject","name":"subject","type":"string","meta":{"field":"subject","width":"full","type":"string","required":true,"note":"Email subject line. You can use merge tags like this `Hi {# first-name #}`.","interface":"input","display":"formatted-value","display_options":{}}},{"field":"message","name":"message","type":"text","meta":{"field":"message","width":"full","type":"text","required":true,"note":"Include a message for the email body. To merge form responses use merge tags with the field name like `{# first-name #}`.","interface":"input-rich-text-html","options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","toolbar":["undo","redo","bold","italic","underline","h1","h2","h3","numlist","bullist","removeformat","blockquote","customLink","customImage","table","hr","code","fullscreen"]}}}],"addLabel":"Add New Email","template":"To: {{ to }} • Subject: {{ subject }}"},"display":"formatted-json-value","display_options":{"format":"To: {{ to }} • Subject: {{ subject }}"},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Setup email notifications when forms are submitted.","conditions":null,"required":false,"group":"meta_emails","validation":null,"validation_message":null}	{"sort":2,"collection":"forms","field":"emails","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"to","name":"to","type":"json","meta":{"field":"to","width":"full","type":"json","required":true,"note":"Add an email address and press enter. To use a form field as the email address use merge tags `{# #}` (e.g. `{# email #}.","interface":"tags","options":{"choices":null},"display":"labels","display_options":{"format":false}}},{"field":"subject","name":"subject","type":"string","meta":{"field":"subject","width":"full","type":"string","required":true,"note":"Email subject line. You can use merge tags like this `Hi {# first-name #}`.","interface":"input","display":"formatted-value","display_options":{}}},{"field":"message","name":"message","type":"text","meta":{"field":"message","width":"full","type":"text","required":true,"note":"Include a message for the email body. To merge form responses use merge tags with the field name like `{# first-name #}`.","interface":"input-rich-text-html","options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","toolbar":["undo","redo","bold","italic","underline","h1","h2","h3","numlist","bullist","removeformat","blockquote","customLink","customImage","table","hr","code","fullscreen"]}}}],"addLabel":"Add New Email","template":"To: {{ to }} • Subject: {{ subject }}"},"display":"formatted-json-value","display_options":{"format":"To: {{ to }} • Subject: {{ subject }}"},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Setup email notifications when forms are submitted.","conditions":null,"required":false,"group":"meta_emails","validation":null,"validation_message":null}	\N	\N
95	96	directus_fields	82	{"sort":1,"collection":"forms","field":"notice-38swil","special":["alias","no-data"],"interface":"presentation-notice","options":{"text":"Set up automatic emails to notify your team members when forms are submitted, or send confirmation receipts to people who complete your forms."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"meta_emails","validation":null,"validation_message":null}	{"sort":1,"collection":"forms","field":"notice-38swil","special":["alias","no-data"],"interface":"presentation-notice","options":{"text":"Set up automatic emails to notify your team members when forms are submitted, or send confirmation receipts to people who complete your forms."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"meta_emails","validation":null,"validation_message":null}	\N	\N
96	97	directus_fields	83	{"sort":2,"collection":"forms","field":"submissions","special":["o2m"],"interface":"list-o2m","options":{"layout":"table","fields":["timestamp","values.value","values.field.name"],"sort":"timestamp","enableCreate":false,"enableSelect":false,"limit":25,"enableSearchFilter":true,"enableLink":true},"display":"related-values","display_options":{"template":"{{values.value}}"},"readonly":true,"hidden":false,"width":"fill","translations":null,"note":"Received form responses.","conditions":null,"required":false,"group":"meta_submissions","validation":null,"validation_message":null}	{"sort":2,"collection":"forms","field":"submissions","special":["o2m"],"interface":"list-o2m","options":{"layout":"table","fields":["timestamp","values.value","values.field.name"],"sort":"timestamp","enableCreate":false,"enableSelect":false,"limit":25,"enableSearchFilter":true,"enableLink":true},"display":"related-values","display_options":{"template":"{{values.value}}"},"readonly":true,"hidden":false,"width":"fill","translations":null,"note":"Received form responses.","conditions":null,"required":false,"group":"meta_submissions","validation":null,"validation_message":null}	\N	\N
97	98	directus_fields	84	{"sort":1,"collection":"forms","field":"notice-wcutfr","special":["alias","no-data"],"interface":"presentation-notice","options":{"text":"This table displays all responses submitted through this form. Each entry includes the submission timestamp and the values for each form field."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"meta_submissions","validation":null,"validation_message":null}	{"sort":1,"collection":"forms","field":"notice-wcutfr","special":["alias","no-data"],"interface":"presentation-notice","options":{"text":"This table displays all responses submitted through this form. Each entry includes the submission timestamp and the values for each form field."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"meta_submissions","validation":null,"validation_message":null}	\N	\N
98	99	directus_fields	85	{"sort":1,"collection":"forms","field":"meta_fields","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":[{"language":"en-US","translation":"Fields"}],"note":null,"conditions":null,"required":false,"group":"meta_tabs","validation":null,"validation_message":null}	{"sort":1,"collection":"forms","field":"meta_fields","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":[{"language":"en-US","translation":"Fields"}],"note":null,"conditions":null,"required":false,"group":"meta_tabs","validation":null,"validation_message":null}	\N	\N
99	100	directus_fields	86	{"sort":3,"collection":"forms","field":"meta_emails","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":[{"language":"en-US","translation":"Emails"}],"note":null,"conditions":null,"required":false,"group":"meta_tabs","validation":null,"validation_message":null}	{"sort":3,"collection":"forms","field":"meta_emails","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":[{"language":"en-US","translation":"Emails"}],"note":null,"conditions":null,"required":false,"group":"meta_tabs","validation":null,"validation_message":null}	\N	\N
100	101	directus_fields	87	{"sort":2,"collection":"forms","field":"meta_submissions","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":[{"language":"en-US","translation":"Submissions"}],"note":null,"conditions":null,"required":false,"group":"meta_tabs","validation":null,"validation_message":null}	{"sort":2,"collection":"forms","field":"meta_submissions","special":["alias","no-data","group"],"interface":"group-raw","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":[{"language":"en-US","translation":"Submissions"}],"note":null,"conditions":null,"required":false,"group":"meta_tabs","validation":null,"validation_message":null}	\N	\N
101	102	directus_collections	forms	{"collection":"forms","icon":"text_format","note":"Dynamic forms","display_template":"{{title}}","hidden":false,"singleton":false,"translations":null,"archive_field":"is_active","archive_app_filter":true,"archive_value":"false","unarchive_value":"true","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":["title","submit_label","on_success","success_message","success_redirect_url","status","fields"],"sort":3,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"forms","icon":"text_format","note":"Dynamic forms","display_template":"{{title}}","hidden":false,"singleton":false,"translations":null,"archive_field":"is_active","archive_app_filter":true,"archive_value":"false","unarchive_value":"true","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":["title","submit_label","on_success","success_message","success_redirect_url","status","fields"],"sort":3,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
102	103	directus_fields	88	{"sort":1,"collection":"form_submissions","field":"id","special":["uuid"],"interface":"input","options":{"iconLeft":"vpn_key"},"display":null,"display_options":null,"readonly":true,"hidden":false,"width":"half","translations":null,"note":"Unique ID for this specific form submission","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"form_submissions","field":"id","special":["uuid"],"interface":"input","options":{"iconLeft":"vpn_key"},"display":null,"display_options":null,"readonly":true,"hidden":false,"width":"half","translations":null,"note":"Unique ID for this specific form submission","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
103	104	directus_fields	89	{"sort":2,"collection":"form_submissions","field":"timestamp","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":false,"width":"half","translations":null,"note":"Form submission date and time.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"form_submissions","field":"timestamp","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":false,"width":"half","translations":null,"note":"Form submission date and time.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
104	105	directus_fields	90	{"sort":3,"collection":"form_submissions","field":"form","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{title}}"},"display":"related-values","display_options":{"template":"{{title}}"},"readonly":true,"hidden":false,"width":"full","translations":null,"note":"Associated form for this submission.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":3,"collection":"form_submissions","field":"form","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{title}}"},"display":"related-values","display_options":{"template":"{{title}}"},"readonly":true,"hidden":false,"width":"full","translations":null,"note":"Associated form for this submission.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
105	106	directus_fields	91	{"sort":4,"collection":"form_submissions","field":"values","special":["o2m"],"interface":"list-o2m","options":{"fields":["field.label","value","field.type","file"],"enableSearchFilter":true,"sort":"sort","template":"{{value}} • {{field}}","filter":{"_and":[{"field":{"form":{"_eq":"{{form}}"}}}]},"layout":"table","enableSelect":false,"enableCreate":false,"limit":25},"display":"related-values","display_options":{"template":"{{value}} • {{field}}"},"readonly":true,"hidden":false,"width":"full","translations":null,"note":"Submitted field responses","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":4,"collection":"form_submissions","field":"values","special":["o2m"],"interface":"list-o2m","options":{"fields":["field.label","value","field.type","file"],"enableSearchFilter":true,"sort":"sort","template":"{{value}} • {{field}}","filter":{"_and":[{"field":{"form":{"_eq":"{{form}}"}}}]},"layout":"table","enableSelect":false,"enableCreate":false,"limit":25},"display":"related-values","display_options":{"template":"{{value}} • {{field}}"},"readonly":true,"hidden":false,"width":"full","translations":null,"note":"Submitted field responses","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
106	107	directus_fields	92	{"sort":5,"collection":"form_submissions","field":"notice-fxfrgx","special":["alias","no-data"],"interface":"presentation-notice","options":{"text":"Form submissions are configured to be read-only for data integrity reasons. But they are a great candidate for use in [Flows](/admin/settings/flows). Directus Flows is a drag and drop, low-code automation builder to simplify tasks like automatic notifications or sending incoming requests to third party services. <a href=\\"https://directus.io/tv/quick-connect?ref=simple_website_cms\\" target=\\"_blank\\">Learn more about Flows.</a>"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":5,"collection":"form_submissions","field":"notice-fxfrgx","special":["alias","no-data"],"interface":"presentation-notice","options":{"text":"Form submissions are configured to be read-only for data integrity reasons. But they are a great candidate for use in [Flows](/admin/settings/flows). Directus Flows is a drag and drop, low-code automation builder to simplify tasks like automatic notifications or sending incoming requests to third party services. <a href=\\"https://directus.io/tv/quick-connect?ref=simple_website_cms\\" target=\\"_blank\\">Learn more about Flows.</a>"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
188	189	directus_collections	block_gallery	{"collection":"block_gallery","icon":"grid_view","note":null,"display_template":"{{headline}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Gallery","singular":"Gallery","plural":"Gallery"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#1A212C","item_duplication_fields":null,"sort":5,"group":"blocks","collapse":"open","preview_url":null,"versioning":false}	{"group":"blocks"}	\N	\N
107	108	directus_collections	form_submissions	{"collection":"form_submissions","icon":"inbox","note":"Data for all form responses","display_template":"{{timestamp}} • {{form}}","hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"form_submissions","icon":"inbox","note":"Data for all form responses","display_template":"{{timestamp}} • {{form}}","hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
108	109	directus_fields	93	{"sort":1,"collection":"form_submission_values","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"form_submission_values","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
109	110	directus_fields	94	{"sort":2,"collection":"form_submission_values","field":"form_submission","special":null,"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"Parent form submission for this value.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"form_submission_values","field":"form_submission","special":null,"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"Parent form submission for this value.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
110	111	directus_fields	95	{"sort":5,"collection":"form_submission_values","field":"field","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{name}} • {{type}}"},"display":"related-values","display_options":{"template":"{{name}} • {{type}}"},"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":5,"collection":"form_submission_values","field":"field","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{name}} • {{type}}"},"display":"related-values","display_options":{"template":"{{name}} • {{type}}"},"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
111	112	directus_fields	96	{"sort":4,"collection":"form_submission_values","field":"value","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"The data entered by the user for this specific field in the form submission.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":4,"collection":"form_submission_values","field":"value","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"The data entered by the user for this specific field in the form submission.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
112	113	directus_fields	97	{"sort":6,"collection":"form_submission_values","field":"sort","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":6,"collection":"form_submission_values","field":"sort","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
113	114	directus_fields	98	{"sort":7,"collection":"form_submission_values","field":"file","special":["file"],"interface":"file","options":{"folder":"e6308546-92fb-4b10-b586-eefaf1d97f7f"},"display":"file","display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":7,"collection":"form_submission_values","field":"file","special":["file"],"interface":"file","options":{"folder":"e6308546-92fb-4b10-b586-eefaf1d97f7f"},"display":"file","display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
114	115	directus_collections	form_submission_values	{"collection":"form_submission_values","icon":"list","note":"Individual responses to each form field within a form submission","display_template":null,"hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Submission Values"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"form_submission_values","icon":"list","note":"Individual responses to each form field within a form submission","display_template":null,"hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Submission Values"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
115	116	directus_fields	99	{"sort":10,"collection":"globals","field":"description","special":null,"interface":"input-multiline","options":{"softLength":160},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Site summary for search results.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":10,"collection":"globals","field":"description","special":null,"interface":"input-multiline","options":{"softLength":160},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Site summary for search results.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
238	239	directus_permissions	26	{"collection":"block_gallery","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_gallery","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
117	118	directus_fields	101	{"sort":12,"collection":"globals","field":"social_links","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"service","name":"service","type":"string","meta":{"field":"service","width":"half","type":"string","interface":"select-dropdown","options":{"choices":[{"text":"Facebook","value":"facebook"},{"text":"Instagram","value":"instagram"},{"text":"LinkedIn","value":"linkedin"},{"text":"Twitter","value":"twitter"},{"text":"Vimeo","value":"vimeo"},{"text":"YouTube","value":"youtube"},{"text":"GitHub","value":"github"},{"text":"Discord","value":"discord"},{"text":"Docker","value":"docker"}],"allowOther":true},"note":"Social media platform name"}},{"field":"url","name":"url","type":"string","meta":{"field":"url","width":"half","type":"string","interface":"input","options":{"trim":true,"placeholder":"https://www.linkedin.com/in/fullprofile"},"note":"Full profile URL (not just username)"}}],"template":"{{ service }}","addLabel":"Add New Link"},"display":"labels","display_options":{},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Social media profile URLs","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":12,"collection":"globals","field":"social_links","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"service","name":"service","type":"string","meta":{"field":"service","width":"half","type":"string","interface":"select-dropdown","options":{"choices":[{"text":"Facebook","value":"facebook"},{"text":"Instagram","value":"instagram"},{"text":"LinkedIn","value":"linkedin"},{"text":"Twitter","value":"twitter"},{"text":"Vimeo","value":"vimeo"},{"text":"YouTube","value":"youtube"},{"text":"GitHub","value":"github"},{"text":"Discord","value":"discord"},{"text":"Docker","value":"docker"}],"allowOther":true},"note":"Social media platform name"}},{"field":"url","name":"url","type":"string","meta":{"field":"url","width":"half","type":"string","interface":"input","options":{"trim":true,"placeholder":"https://www.linkedin.com/in/fullprofile"},"note":"Full profile URL (not just username)"}}],"template":"{{ service }}","addLabel":"Add New Link"},"display":"labels","display_options":{},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Social media profile URLs","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
118	119	directus_fields	102	{"sort":9,"collection":"globals","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Short phrase describing the site.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":9,"collection":"globals","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Short phrase describing the site.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
119	120	directus_fields	103	{"sort":3,"collection":"globals","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Main site title","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":3,"collection":"globals","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Main site title","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
120	121	directus_fields	104	{"sort":4,"collection":"globals","field":"url","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Public URL for the website","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":4,"collection":"globals","field":"url","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Public URL for the website","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
121	122	directus_fields	105	{"sort":7,"collection":"globals","field":"favicon","special":["file"],"interface":"file-image","options":{"crop":false},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Small icon for browser tabs. 1:1 ratio. No larger than 512px × 512px.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":7,"collection":"globals","field":"favicon","special":["file"],"interface":"file-image","options":{"crop":false},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Small icon for browser tabs. 1:1 ratio. No larger than 512px × 512px.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
122	123	directus_fields	106	{"sort":6,"collection":"globals","field":"logo","special":["file"],"interface":"file-image","options":{"crop":false},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Main logo shown on the site.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":6,"collection":"globals","field":"logo","special":["file"],"interface":"file-image","options":{"crop":false},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Main logo shown on the site.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
123	124	directus_fields	107	{"sort":8,"collection":"globals","field":"primary_color","special":null,"interface":"select-color","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Primary color for the website.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":8,"collection":"globals","field":"primary_color","special":null,"interface":"select-color","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Primary color for the website.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
124	125	directus_fields	108	{"sort":5,"collection":"globals","field":"divider_logo","special":["alias","no-data"],"interface":"presentation-divider","options":{"color":"#A2B5CD","icon":"imagesmode","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":5,"collection":"globals","field":"divider_logo","special":["alias","no-data"],"interface":"presentation-divider","options":{"color":"#A2B5CD","icon":"imagesmode","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
189	190	directus_collections	block_gallery_items	{"collection":"block_gallery_items","icon":null,"note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"block_gallery","collapse":"open","preview_url":null,"versioning":false}	{"group":"block_gallery"}	\N	\N
125	126	directus_fields	109	{"sort":13,"collection":"globals","field":"meta_credentials","special":["alias","no-data","group"],"interface":"group-detail","options":{"headerIcon":"warning","start":"closed"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":[{"language":"en-US","translation":"Credentials"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":13,"collection":"globals","field":"meta_credentials","special":["alias","no-data","group"],"interface":"group-detail","options":{"headerIcon":"warning","start":"closed"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":[{"language":"en-US","translation":"Credentials"}],"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
126	127	directus_fields	110	{"sort":11,"collection":"globals","field":"divider_social","special":["alias","no-data"],"interface":"presentation-divider","options":{"inlineTitle":true,"icon":"link","title":null,"color":"#A2B5CD"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":11,"collection":"globals","field":"divider_social","special":["alias","no-data"],"interface":"presentation-divider","options":{"inlineTitle":true,"icon":"link","title":null,"color":"#A2B5CD"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
127	128	directus_fields	111	{"sort":2,"collection":"globals","field":"notice-7-fv9g","special":["alias","no-data"],"interface":"presentation-notice","options":{"text":"Globals are settings that are applied across your entire site. Globals use what we call a `singleton` collection type. <a href=\\"https://directus.io/features/global-settings\\" target=\\"_blank\\">Learn more about globals and singletons.</a>"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"globals","field":"notice-7-fv9g","special":["alias","no-data"],"interface":"presentation-notice","options":{"text":"Globals are settings that are applied across your entire site. Globals use what we call a `singleton` collection type. <a href=\\"https://directus.io/features/global-settings\\" target=\\"_blank\\">Learn more about globals and singletons.</a>"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
128	129	directus_fields	112	{"sort":2,"collection":"globals","field":"openai_api_key","special":null,"interface":"input","options":{"trim":true,"iconLeft":"vpn_key_alert","masked":true},"display":"formatted-value","display_options":{"masked":true},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Secret OpenAI API key. Don't share with anyone outside your team.","conditions":null,"required":false,"group":"meta_credentials","validation":null,"validation_message":null}	{"sort":2,"collection":"globals","field":"openai_api_key","special":null,"interface":"input","options":{"trim":true,"iconLeft":"vpn_key_alert","masked":true},"display":"formatted-value","display_options":{"masked":true},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Secret OpenAI API key. Don't share with anyone outside your team.","conditions":null,"required":false,"group":"meta_credentials","validation":null,"validation_message":null}	\N	\N
129	130	directus_fields	113	{"sort":3,"collection":"globals","field":"directus_url","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"The public URL for this Directus instance. Used in Flows.","conditions":null,"required":false,"group":"meta_credentials","validation":null,"validation_message":null}	{"sort":3,"collection":"globals","field":"directus_url","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"The public URL for this Directus instance. Used in Flows.","conditions":null,"required":false,"group":"meta_credentials","validation":null,"validation_message":null}	\N	\N
130	131	directus_fields	114	{"sort":1,"collection":"globals","field":"notice-lxmfvi","special":["alias","no-data"],"interface":"presentation-notice","options":{"color":"warning","icon":"warning","text":"Be careful about changing the access policies and permissions for the `globals` collection so that you don't expose your private API keys."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"meta_credentials","validation":null,"validation_message":null}	{"sort":1,"collection":"globals","field":"notice-lxmfvi","special":["alias","no-data"],"interface":"presentation-notice","options":{"color":"warning","icon":"warning","text":"Be careful about changing the access policies and permissions for the `globals` collection so that you don't expose your private API keys."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"meta_credentials","validation":null,"validation_message":null}	\N	\N
131	132	directus_collections	globals	{"collection":"globals","icon":"south_america","note":"Site-wide settings","display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"globals","icon":"south_america","note":"Site-wide settings","display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
132	133	directus_fields	115	{"sort":3,"collection":"navigation","field":"id","special":null,"interface":"input","options":{"iconLeft":"vpn_key"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Unique identifier for this menu. Can't be edited after creation.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":3,"collection":"navigation","field":"id","special":null,"interface":"input","options":{"iconLeft":"vpn_key"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Unique identifier for this menu. Can't be edited after creation.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
239	240	directus_permissions	27	{"collection":"block_hero","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_hero","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
133	134	directus_fields	116	{"sort":2,"collection":"navigation","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"What is the name of this menu? Only used internally.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"navigation","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"What is the name of this menu? Only used internally.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
134	135	directus_fields	117	{"sort":1,"collection":"navigation","field":"is_active","special":["cast-boolean"],"interface":"boolean","options":{"label":"Active"},"display":"boolean","display_options":{"labelOn":"Active","labelOff":"Inactive"},"readonly":false,"hidden":false,"width":"full","translations":[{"language":"en-US","translation":"Active"}],"note":"Show or hide this menu from the site.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"navigation","field":"is_active","special":["cast-boolean"],"interface":"boolean","options":{"label":"Active"},"display":"boolean","display_options":{"labelOn":"Active","labelOff":"Inactive"},"readonly":false,"hidden":false,"width":"full","translations":[{"language":"en-US","translation":"Active"}],"note":"Show or hide this menu from the site.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
135	136	directus_fields	118	{"sort":4,"collection":"navigation","field":"notice-7491js","special":["alias","no-data"],"interface":"presentation-notice","options":{"text":"Create and manage navigation menus for your website. Each menu can contain multiple links organized into a hierarchy."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":4,"collection":"navigation","field":"notice-7491js","special":["alias","no-data"],"interface":"presentation-notice","options":{"text":"Create and manage navigation menus for your website. Each menu can contain multiple links organized into a hierarchy."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
136	137	directus_fields	119	{"sort":5,"collection":"navigation","field":"items","special":["o2m"],"interface":"list-o2m","options":{"enableLink":true,"filter":{"_and":[{"_and":[{"navigation":{"_null":true}},{"parent":{"navigation":{"_null":true}}}]}]},"template":"{{title}} • {{type}}"},"display":"related-values","display_options":{"template":"{{title}} • {{type}}"},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Links within the menu.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":5,"collection":"navigation","field":"items","special":["o2m"],"interface":"list-o2m","options":{"enableLink":true,"filter":{"_and":[{"_and":[{"navigation":{"_null":true}},{"parent":{"navigation":{"_null":true}}}]}]},"template":"{{title}} • {{type}}"},"display":"related-values","display_options":{"template":"{{title}} • {{type}}"},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Links within the menu.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
137	138	directus_collections	navigation	{"collection":"navigation","icon":"menu_open","note":"Dynamic menus for your site","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"is_active","archive_app_filter":true,"archive_value":"false","unarchive_value":"true","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":["title","status","items.title","items.type","items.page","items.post","items.url","items.children","items.parent"],"sort":5,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"navigation","icon":"menu_open","note":"Dynamic menus for your site","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"is_active","archive_app_filter":true,"archive_value":"false","unarchive_value":"true","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":["title","status","items.title","items.type","items.page","items.post","items.url","items.children","items.parent"],"sort":5,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
138	139	directus_fields	120	{"sort":1,"collection":"navigation_items","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"navigation_items","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
139	140	directus_fields	121	{"sort":3,"collection":"navigation_items","field":"navigation","special":null,"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"Navigation menu that the individual links belong to.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":3,"collection":"navigation_items","field":"navigation","special":null,"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"Navigation menu that the individual links belong to.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
140	141	directus_fields	122	{"sort":6,"collection":"navigation_items","field":"page","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{title}}"},"display":"related-values","display_options":{"template":"{{title}}"},"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The internal page to link to.","conditions":[{"name":"IF page","rule":{"_and":[{"type":{"_eq":"page"}}]},"options":{"enableCreate":true,"enableSelect":true},"hidden":false},{"name":"Hide If Has Children","rule":{"_and":[{"has_children":{"_eq":true}}]},"hidden":true,"options":{"enableCreate":true,"enableSelect":true}}],"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":6,"collection":"navigation_items","field":"page","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{title}}"},"display":"related-values","display_options":{"template":"{{title}}"},"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The internal page to link to.","conditions":[{"name":"IF page","rule":{"_and":[{"type":{"_eq":"page"}}]},"options":{"enableCreate":true,"enableSelect":true},"hidden":false},{"name":"Hide If Has Children","rule":{"_and":[{"has_children":{"_eq":true}}]},"hidden":true,"options":{"enableCreate":true,"enableSelect":true}}],"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
141	142	directus_fields	123	{"sort":10,"collection":"navigation_items","field":"parent","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{title}}"},"display":"related-values","display_options":{"template":"{{title}}"},"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The parent navigation item.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":10,"collection":"navigation_items","field":"parent","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{title}}"},"display":"related-values","display_options":{"template":"{{title}}"},"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The parent navigation item.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
142	143	directus_fields	124	{"sort":2,"collection":"navigation_items","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"navigation_items","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
143	144	directus_fields	125	{"sort":4,"collection":"navigation_items","field":"title","special":null,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Label shown to the user for the menu item.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":4,"collection":"navigation_items","field":"title","special":null,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Label shown to the user for the menu item.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
144	145	directus_fields	126	{"sort":5,"collection":"navigation_items","field":"type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Page","value":"page","icon":"web_asset"},{"text":"Post","value":"post","icon":"article"},{"text":"URL","value":"url","icon":"link"},{"text":"Group","value":"group","icon":"tab_group"}]},"display":"labels","display_options":{"choices":[{"text":"Page","value":"page","icon":"web_asset"},{"text":"Post","value":"post","icon":"article"},{"text":"URL","value":"url","icon":"link"},{"text":"Group","value":"group","icon":"tab_group"}]},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"What type of link is this? Page and Post allow you to link to internal content. URL is for external content. Group can contain other menu items.","conditions":[{"name":"Hide if Children","rule":{"_and":[{"has_children":{"_eq":true}}]},"hidden":true,"options":{"iconOn":"radio_button_checked","iconOff":"radio_button_unchecked","allowOther":false}}],"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":5,"collection":"navigation_items","field":"type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Page","value":"page","icon":"web_asset"},{"text":"Post","value":"post","icon":"article"},{"text":"URL","value":"url","icon":"link"},{"text":"Group","value":"group","icon":"tab_group"}]},"display":"labels","display_options":{"choices":[{"text":"Page","value":"page","icon":"web_asset"},{"text":"Post","value":"post","icon":"article"},{"text":"URL","value":"url","icon":"link"},{"text":"Group","value":"group","icon":"tab_group"}]},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"What type of link is this? Page and Post allow you to link to internal content. URL is for external content. Group can contain other menu items.","conditions":[{"name":"Hide if Children","rule":{"_and":[{"has_children":{"_eq":true}}]},"hidden":true,"options":{"iconOn":"radio_button_checked","iconOff":"radio_button_unchecked","allowOther":false}}],"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
145	146	directus_fields	127	{"sort":8,"collection":"navigation_items","field":"url","special":null,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The URL to link to. Could be relative (ie `/my-page`) or a full external URL (ie `https://docs.directus.io`)","conditions":[{"name":"IF url","rule":{"_and":[{"type":{"_eq":"url"}}]},"options":{"font":"sans-serif","trim":false,"masked":false,"clear":false,"slug":false},"hidden":false},{"name":"Hide If Had Children","rule":{"_and":[{"has_children":{"_eq":true}}]},"hidden":true,"options":{"font":"sans-serif","trim":false,"masked":false,"clear":false,"slug":false}}],"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":8,"collection":"navigation_items","field":"url","special":null,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The URL to link to. Could be relative (ie `/my-page`) or a full external URL (ie `https://docs.directus.io`)","conditions":[{"name":"IF url","rule":{"_and":[{"type":{"_eq":"url"}}]},"options":{"font":"sans-serif","trim":false,"masked":false,"clear":false,"slug":false},"hidden":false},{"name":"Hide If Had Children","rule":{"_and":[{"has_children":{"_eq":true}}]},"hidden":true,"options":{"font":"sans-serif","trim":false,"masked":false,"clear":false,"slug":false}}],"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
146	147	directus_fields	128	{"sort":7,"collection":"navigation_items","field":"post","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{title}}"},"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The internal post to link to.","conditions":[{"name":"Show If Type = Post","rule":{"_and":[{"type":{"_eq":"post"}}]},"hidden":false,"options":{"enableCreate":true,"enableSelect":true}}],"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":7,"collection":"navigation_items","field":"post","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{title}}"},"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The internal post to link to.","conditions":[{"name":"Show If Type = Post","rule":{"_and":[{"type":{"_eq":"post"}}]},"hidden":false,"options":{"enableCreate":true,"enableSelect":true}}],"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
155	156	directus_fields	136	{"sort":11,"collection":"page_blocks","field":"background","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Light","value":"light","icon":"light_mode"},{"text":"Dark","value":"dark","icon":"dark_mode"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Background color for the block to create contrast. Does not control dark or light mode for the entire site.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":11,"collection":"page_blocks","field":"background","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Light","value":"light","icon":"light_mode"},{"text":"Dark","value":"dark","icon":"dark_mode"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Background color for the block to create contrast. Does not control dark or light mode for the entire site.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
395	396	block_button_group	aed01afb-490d-42d3-bbf4-cf64081494b9	{"id":"aed01afb-490d-42d3-bbf4-cf64081494b9"}	{"id":"aed01afb-490d-42d3-bbf4-cf64081494b9"}	\N	\N
147	148	directus_fields	129	{"sort":9,"collection":"navigation_items","field":"children","special":["o2m"],"interface":"list-o2m","options":{"template":"{{title}} • {{type}}","filter":{"_and":[{"_and":[{"navigation":{"_null":true}},{"parent":{"navigation":{"_null":true}}}]}]}},"display":"related-values","display_options":{"template":"{{title}} • {{type}}"},"readonly":false,"hidden":true,"width":"full","translations":null,"note":"Add child menu items within the group.","conditions":[{"name":"Show If Group","rule":{"_and":[{"type":{"_eq":"group"}}]},"hidden":false,"options":{"layout":"list","enableCreate":true,"enableSelect":true,"limit":15,"sortDirection":"+","enableSearchFilter":false,"enableLink":false}}],"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":9,"collection":"navigation_items","field":"children","special":["o2m"],"interface":"list-o2m","options":{"template":"{{title}} • {{type}}","filter":{"_and":[{"_and":[{"navigation":{"_null":true}},{"parent":{"navigation":{"_null":true}}}]}]}},"display":"related-values","display_options":{"template":"{{title}} • {{type}}"},"readonly":false,"hidden":true,"width":"full","translations":null,"note":"Add child menu items within the group.","conditions":[{"name":"Show If Group","rule":{"_and":[{"type":{"_eq":"group"}}]},"hidden":false,"options":{"layout":"list","enableCreate":true,"enableSelect":true,"limit":15,"sortDirection":"+","enableSearchFilter":false,"enableLink":false}}],"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
148	149	directus_collections	navigation_items	{"collection":"navigation_items","icon":"navigate_next","note":"Individual menu items","display_template":"{{title}}","hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#18222F","item_duplication_fields":["children","has_children","image","label","navigation","open_in_new_tab","page","title","type","url","post"],"sort":1,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"navigation_items","icon":"navigate_next","note":"Individual menu items","display_template":"{{title}}","hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#18222F","item_duplication_fields":["children","has_children","image","label","navigation","open_in_new_tab","page","title","type","url","post"],"sort":1,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
149	150	directus_fields	130	{"sort":1,"collection":"page_blocks","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"page_blocks","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
150	151	directus_fields	131	{"sort":2,"collection":"page_blocks","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"page_blocks","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
151	152	directus_fields	132	{"sort":7,"collection":"page_blocks","field":"page","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The id of the page that this block belongs to.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":7,"collection":"page_blocks","field":"page","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The id of the page that this block belongs to.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
152	153	directus_fields	133	{"sort":8,"collection":"page_blocks","field":"item","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The data for the block.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":8,"collection":"page_blocks","field":"item","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The data for the block.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
153	154	directus_fields	134	{"sort":9,"collection":"page_blocks","field":"collection","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The collection (type of block).","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":9,"collection":"page_blocks","field":"collection","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":"The collection (type of block).","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
154	155	directus_fields	135	{"sort":10,"collection":"page_blocks","field":"hide_block","special":["cast-boolean"],"interface":"boolean","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Temporarily hide this block on the website without having to remove it from your page.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":10,"collection":"page_blocks","field":"hide_block","special":["cast-boolean"],"interface":"boolean","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Temporarily hide this block on the website without having to remove it from your page.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
156	157	directus_collections	page_blocks	{"collection":"page_blocks","icon":"code_blocks","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":false,"archive_value":null,"unarchive_value":null,"sort_field":"sort","accountability":"all","color":"#18222F","item_duplication_fields":[],"sort":3,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"page_blocks","icon":"code_blocks","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":false,"archive_value":null,"unarchive_value":null,"sort_field":"sort","accountability":"all","color":"#18222F","item_duplication_fields":[],"sort":3,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
157	158	directus_fields	137	{"sort":1,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
158	159	directus_fields	138	{"sort":2,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"pages","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
159	160	directus_fields	139	{"sort":3,"collection":"pages","field":"title","special":null,"interface":"input","options":{"placeholder":"About Us"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Page title (visible to visitors and used in SEO).","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":3,"collection":"pages","field":"title","special":null,"interface":"input","options":{"placeholder":"About Us"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Page title (visible to visitors and used in SEO).","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
160	161	directus_fields	140	{"sort":4,"collection":"pages","field":"permalink","special":null,"interface":"input","options":{"font":"monospace","trim":true,"placeholder":"/about-us"},"display":"formatted-value","display_options":{"font":"monospace"},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Unique URL for this page (start with `/`, can have multiple segments `/about/me`)).","conditions":null,"required":false,"group":null,"validation":{"_and":[{"permalink":{"_regex":"^/(?:[a-z0-9]+(?:-[a-z0-9]+)*)?(?:/[a-z0-9]+(?:-[a-z0-9]+)*)*$"}}]},"validation_message":"Please use lowercase letters, numbers, and hyphens in your permalink, starting with a slash (/) and without a trailing slash"}	{"sort":4,"collection":"pages","field":"permalink","special":null,"interface":"input","options":{"font":"monospace","trim":true,"placeholder":"/about-us"},"display":"formatted-value","display_options":{"font":"monospace"},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Unique URL for this page (start with `/`, can have multiple segments `/about/me`)).","conditions":null,"required":false,"group":null,"validation":{"_and":[{"permalink":{"_regex":"^/(?:[a-z0-9]+(?:-[a-z0-9]+)*)?(?:/[a-z0-9]+(?:-[a-z0-9]+)*)*$"}}]},"validation_message":"Please use lowercase letters, numbers, and hyphens in your permalink, starting with a slash (/) and without a trailing slash"}	\N	\N
161	162	directus_fields	141	{"sort":12,"collection":"pages","field":"description","special":null,"interface":"input-multiline","options":{"placeholder":"Learn about XYZ Company's mission, values, and 20-year history of innovation in sustainable technology. Meet our diverse team of experts."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Short summary of what's on the page. Also used for SEO meta description.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":12,"collection":"pages","field":"description","special":null,"interface":"input-multiline","options":{"placeholder":"Learn about XYZ Company's mission, values, and 20-year history of innovation in sustainable technology. Meet our diverse team of experts."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Short summary of what's on the page. Also used for SEO meta description.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
162	163	directus_fields	142	{"sort":6,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":"#E2E8F0"},{"text":"In Review","value":"in_review","icon":"rate_review","color":"#FFA439"},{"text":"$t:published","value":"published","icon":"check","color":"#2ECDA7"}]},"display":"labels","display_options":{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":null,"background":"#E2E8F0","foreground":"#18222F"},{"text":"In Review","value":"in_review","icon":"rate_review","color":null,"background":"#FFA439","foreground":"#FFFFFF"},{"text":"$t:published","value":"published","icon":"check","color":null,"background":"#2ECDA7","foreground":"#FFFFFF"}]},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Is this page published?","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":6,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":"#E2E8F0"},{"text":"In Review","value":"in_review","icon":"rate_review","color":"#FFA439"},{"text":"$t:published","value":"published","icon":"check","color":"#2ECDA7"}]},"display":"labels","display_options":{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":null,"background":"#E2E8F0","foreground":"#18222F"},{"text":"In Review","value":"in_review","icon":"rate_review","color":null,"background":"#FFA439","foreground":"#FFFFFF"},{"text":"$t:published","value":"published","icon":"check","color":null,"background":"#2ECDA7","foreground":"#FFFFFF"}]},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Is this page published?","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
163	164	directus_fields	143	{"sort":7,"collection":"pages","field":"published_at","special":null,"interface":"datetime","options":{"use24":false},"display":"datetime","display_options":{"format":"short"},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Publish now or schedule for later.","conditions":[{"name":"Show If Status = Published","rule":{"_and":[{"status":{"_eq":"published"}}]},"hidden":false,"options":{"includeSeconds":false,"use24":true}}],"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":7,"collection":"pages","field":"published_at","special":null,"interface":"datetime","options":{"use24":false},"display":"datetime","display_options":{"format":"short"},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Publish now or schedule for later.","conditions":[{"name":"Show If Status = Published","rule":{"_and":[{"status":{"_eq":"published"}}]},"hidden":false,"options":{"includeSeconds":false,"use24":true}}],"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
396	397	block_form	1419faec-e263-431c-bd5f-a57f394c39f6	{"id":"1419faec-e263-431c-bd5f-a57f394c39f6"}	{"id":"1419faec-e263-431c-bd5f-a57f394c39f6"}	\N	\N
164	165	directus_fields	144	{"sort":5,"collection":"pages","field":"divider-hgvf0u","special":["alias","no-data"],"interface":"presentation-divider","options":{"icon":"calendar_today","inlineTitle":true,"color":"#A2B5CD"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":5,"collection":"pages","field":"divider-hgvf0u","special":["alias","no-data"],"interface":"presentation-divider","options":{"icon":"calendar_today","inlineTitle":true,"color":"#A2B5CD"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
165	166	directus_fields	145	{"sort":8,"collection":"pages","field":"divider-mhnc6m","special":["alias","no-data"],"interface":"presentation-divider","options":{"icon":"format_paragraph","color":"#A2B5CD","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":8,"collection":"pages","field":"divider-mhnc6m","special":["alias","no-data"],"interface":"presentation-divider","options":{"icon":"format_paragraph","color":"#A2B5CD","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
166	167	directus_fields	146	{"sort":11,"collection":"pages","field":"meta_m2a_button","special":["alias","no-data"],"interface":"directus-labs-experimental-m2a-interface","options":{"target":"above"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":11,"collection":"pages","field":"meta_m2a_button","special":["alias","no-data"],"interface":"directus-labs-experimental-m2a-interface","options":{"target":"above"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
167	168	directus_fields	147	{"sort":10,"collection":"pages","field":"blocks","special":["m2a"],"interface":"list-m2a","options":{"enableSelect":false},"display":"related-values","display_options":{"template":"{{collection}}"},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Create and arrange different content blocks (like text, images, or videos) to build your page.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":10,"collection":"pages","field":"blocks","special":["m2a"],"interface":"list-m2a","options":{"enableSelect":false},"display":"related-values","display_options":{"template":"{{collection}}"},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Create and arrange different content blocks (like text, images, or videos) to build your page.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
168	169	directus_fields	148	{"sort":9,"collection":"pages","field":"notice-fzxnav","special":["alias","no-data"],"interface":"presentation-notice","options":{"text":"Build dynamic pages quickly using ready-made blocks. <a href=\\"https://docs.directus.io/guides/headless-cms/reusable-components.html#create-re-usable-page-components\\" target=\\"_blank\\">See our documentation to learn more about the Page Builder</a>."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":9,"collection":"pages","field":"notice-fzxnav","special":["alias","no-data"],"interface":"presentation-notice","options":{"text":"Build dynamic pages quickly using ready-made blocks. <a href=\\"https://docs.directus.io/guides/headless-cms/reusable-components.html#create-re-usable-page-components\\" target=\\"_blank\\">See our documentation to learn more about the Page Builder</a>."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
169	170	directus_collections	pages	{"collection":"pages","icon":"web_asset","note":"Dynamic page builder","display_template":"{{title}}","hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"collapse":"open","preview_url":"http://localhost:3000/posts/{{slug}}?preview=true","versioning":false}	{"collection":"pages","icon":"web_asset","note":"Dynamic page builder","display_template":"{{title}}","hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"collapse":"open","preview_url":"http://localhost:3000/posts/{{slug}}?preview=true","versioning":false}	\N	\N
170	171	directus_fields	149	{"sort":13,"collection":"posts","field":"content","special":null,"interface":"input-rich-text-html","options":{"toolbar":["blockquote","bold","bullist","code","customImage","customLink","customMedia","fullscreen","h1","h2","h3","hr","italic","numlist","redo","removeformat","underline","undo"],"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":"formatted-value","display_options":{"format":true},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Rich text content of your blog post.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":13,"collection":"posts","field":"content","special":null,"interface":"input-rich-text-html","options":{"toolbar":["blockquote","bold","bullist","code","customImage","customLink","customMedia","fullscreen","h1","h2","h3","hr","italic","numlist","redo","removeformat","underline","undo"],"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":"formatted-value","display_options":{"format":true},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Rich text content of your blog post.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
171	172	directus_fields	150	{"sort":1,"collection":"posts","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"posts","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
354	355	directus_access	8a4f1d01-b692-427c-90ad-adbd9c479449	{"id":"8a4f1d01-b692-427c-90ad-adbd9c479449","user":null,"policy":"ee1055a2-7c03-4b0b-9b65-ca68491b6329","sort":3}	{"id":"8a4f1d01-b692-427c-90ad-adbd9c479449","user":null,"policy":"ee1055a2-7c03-4b0b-9b65-ca68491b6329","sort":3}	\N	\N
172	173	directus_fields	151	{"sort":11,"collection":"posts","field":"image","special":["file"],"interface":"file-image","options":{"crop":false,"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":"image","display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Featured image for this post. Used in cards linking to the post and in the post detail page.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":11,"collection":"posts","field":"image","special":["file"],"interface":"file-image","options":{"crop":false,"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":"image","display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Featured image for this post. Used in cards linking to the post and in the post detail page.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
173	174	directus_fields	152	{"sort":4,"collection":"posts","field":"slug","special":null,"interface":"extension-wpslug","options":{"font":"monospace","template":"{{title}}","placeholder":null},"display":"formatted-value","display_options":{"font":"monospace"},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Unique URL for this post (e.g., `yoursite.com/posts/{{your-slug}}`)","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":4,"collection":"posts","field":"slug","special":null,"interface":"extension-wpslug","options":{"font":"monospace","template":"{{title}}","placeholder":null},"display":"formatted-value","display_options":{"font":"monospace"},"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Unique URL for this post (e.g., `yoursite.com/posts/{{your-slug}}`)","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
174	175	directus_fields	153	{"sort":2,"collection":"posts","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":2,"collection":"posts","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
175	176	directus_fields	154	{"sort":6,"collection":"posts","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":"#E2E8F0"},{"text":"In Review","value":"in_review","icon":"rate_review","color":"#FFA439"},{"text":"$t:published","value":"published","icon":"check","color":"#2ECDA7"}]},"display":"labels","display_options":{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":null,"background":"#E2E8F0","foreground":"#18222F"},{"text":"In Review","value":"in_review","icon":"rate_review","color":null,"background":"#FFA439","foreground":"#FFFFFF"},{"text":"$t:published","value":"published","icon":"check","color":null,"background":"#2ECDA7","foreground":"#FFFFFF"}]},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Is this post published?","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":6,"collection":"posts","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":"#E2E8F0"},{"text":"In Review","value":"in_review","icon":"rate_review","color":"#FFA439"},{"text":"$t:published","value":"published","icon":"check","color":"#2ECDA7"}]},"display":"labels","display_options":{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":null,"background":"#E2E8F0","foreground":"#18222F"},{"text":"In Review","value":"in_review","icon":"rate_review","color":null,"background":"#FFA439","foreground":"#FFFFFF"},{"text":"$t:published","value":"published","icon":"check","color":null,"background":"#2ECDA7","foreground":"#FFFFFF"}]},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Is this post published?","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
176	177	directus_fields	155	{"sort":3,"collection":"posts","field":"title","special":null,"interface":"input","options":{"placeholder":"Essential tips for first-time home buyers"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Title of the blog post (used in page title and meta tags)","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":3,"collection":"posts","field":"title","special":null,"interface":"input","options":{"placeholder":"Essential tips for first-time home buyers"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Title of the blog post (used in page title and meta tags)","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
177	178	directus_fields	156	{"sort":8,"collection":"posts","field":"description","special":null,"interface":"input-multiline","options":{"placeholder":"Discover key strategies for navigating the home buying process, from budgeting to closing. Learn how to avoid common pitfalls and make informed decisions."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Short summary of the blog post to entice readers.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":8,"collection":"posts","field":"description","special":null,"interface":"input-multiline","options":{"placeholder":"Discover key strategies for navigating the home buying process, from budgeting to closing. Learn how to avoid common pitfalls and make informed decisions."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Short summary of the blog post to entice readers.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
178	179	directus_fields	157	{"sort":9,"collection":"posts","field":"author","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":{"circle":true},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Select the team member who wrote this post","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":9,"collection":"posts","field":"author","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":{"circle":true},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Select the team member who wrote this post","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
240	241	directus_permissions	28	{"collection":"block_hero","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_hero","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
179	180	directus_fields	158	{"sort":7,"collection":"posts","field":"published_at","special":null,"interface":"datetime","options":{"use24":false},"display":"datetime","display_options":{"format":"short"},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Publish now or schedule for later.","conditions":[{"name":"Show If Status = Published","rule":{"_and":[{"status":{"_eq":"published"}}]},"hidden":false,"options":{"includeSeconds":false,"use24":true}}],"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":7,"collection":"posts","field":"published_at","special":null,"interface":"datetime","options":{"use24":false},"display":"datetime","display_options":{"format":"short"},"readonly":false,"hidden":false,"width":"half","translations":null,"note":"Publish now or schedule for later.","conditions":[{"name":"Show If Status = Published","rule":{"_and":[{"status":{"_eq":"published"}}]},"hidden":false,"options":{"includeSeconds":false,"use24":true}}],"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
180	181	directus_fields	159	{"sort":10,"collection":"posts","field":"divider-ygmf1b","special":["alias","no-data"],"interface":"presentation-divider","options":{"icon":"format_paragraph","color":"#A2B5CD","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":10,"collection":"posts","field":"divider-ygmf1b","special":["alias","no-data"],"interface":"presentation-divider","options":{"icon":"format_paragraph","color":"#A2B5CD","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
181	182	directus_fields	160	{"sort":5,"collection":"posts","field":"divider-cwxsuc","special":["alias","no-data"],"interface":"presentation-divider","options":{"icon":"calendar_month","color":"#A2B5CD","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":5,"collection":"posts","field":"divider-cwxsuc","special":["alias","no-data"],"interface":"presentation-divider","options":{"icon":"calendar_month","color":"#A2B5CD","inlineTitle":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
182	183	directus_fields	161	{"sort":12,"collection":"posts","field":"notice-g8jmnj","special":["alias","no-data"],"interface":"presentation-notice","options":{"color":"info","icon":"help","text":"Need inspiration? Open the right sidebar to use Flows like AI Ghostwriter to help draft your content or AI Image Generator to create custom images that match your style."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":12,"collection":"posts","field":"notice-g8jmnj","special":["alias","no-data"],"interface":"presentation-notice","options":{"color":"info","icon":"help","text":"Need inspiration? Open the right sidebar to use Flows like AI Ghostwriter to help draft your content or AI Image Generator to create custom images that match your style."},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
183	184	directus_collections	posts	{"collection":"posts","icon":"article","note":"Individual blog posts","display_template":"{{title}}","hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":["title","slug","author","status","image","description","content"],"sort":2,"collapse":"open","preview_url":"http://localhost:3000/posts/{{slug}}?preview=true","versioning":false}	{"collection":"posts","icon":"article","note":"Individual blog posts","display_template":"{{title}}","hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":["title","slug","author","status","image","description","content"],"sort":2,"collapse":"open","preview_url":"http://localhost:3000/posts/{{slug}}?preview=true","versioning":false}	\N	\N
184	185	directus_collections	website	{"collection":"website","icon":"folder_special","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"collapse":"open","preview_url":null,"versioning":false}	{"collection":"website","icon":"folder_special","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"collapse":"open","preview_url":null,"versioning":false}	\N	\N
185	186	directus_collections	block_button	{"collection":"block_button","icon":null,"note":null,"display_template":"{{label}} - {{type}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Button","singular":"Button","plural":"Buttons"}],"archive_field":null,"archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"block_button_group","collapse":"open","preview_url":null,"versioning":false}	{"group":"block_button_group"}	\N	\N
186	187	directus_collections	block_button_group	{"collection":"block_button_group","icon":"smart_button","note":null,"display_template":"{{buttons.label}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Button Group","singular":"Button Group","plural":"Button Groups"}],"archive_field":null,"archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":"#18222F","item_duplication_fields":null,"sort":8,"group":"blocks","collapse":"open","preview_url":null,"versioning":false}	{"group":"blocks"}	\N	\N
187	188	directus_collections	block_form	{"collection":"block_form","icon":"format_shapes","note":null,"display_template":"{{form.title}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Form"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"blocks","collapse":"open","preview_url":null,"versioning":false}	{"group":"blocks"}	\N	\N
355	356	directus_folders	d0f67ad6-abbb-45d6-8d3e-b499a4c74d80	{"id":"d0f67ad6-abbb-45d6-8d3e-b499a4c74d80","name":"2. Private"}	{"id":"d0f67ad6-abbb-45d6-8d3e-b499a4c74d80","name":"2. Private"}	\N	\N
192	193	directus_collections	block_pricing	{"collection":"block_pricing","icon":"attach_money","note":null,"display_template":"{{headline}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Pricing"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":"blocks","collapse":"open","preview_url":null,"versioning":false}	{"group":"blocks"}	\N	\N
193	194	directus_collections	block_pricing_cards	{"collection":"block_pricing_cards","icon":null,"note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"block_pricing","collapse":"open","preview_url":null,"versioning":false}	{"group":"block_pricing"}	\N	\N
194	195	directus_collections	block_richtext	{"collection":"block_richtext","icon":"format_color_text","note":null,"display_template":"{{headline}}","hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Rich Text","singular":"Rich Text","plural":"Rich Text"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#1A212C","item_duplication_fields":null,"sort":2,"group":"blocks","collapse":"open","preview_url":null,"versioning":false}	{"group":"blocks"}	\N	\N
195	196	directus_collections	form_fields	{"collection":"form_fields","icon":null,"note":"Individual fields for each form","display_template":"{{name}} • {{type}}","hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"forms","collapse":"open","preview_url":null,"versioning":false}	{"group":"forms"}	\N	\N
196	197	directus_collections	forms	{"collection":"forms","icon":"text_format","note":"Dynamic forms","display_template":"{{title}}","hidden":false,"singleton":false,"translations":null,"archive_field":"is_active","archive_app_filter":true,"archive_value":"false","unarchive_value":"true","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":["title","submit_label","on_success","success_message","success_redirect_url","status","fields"],"sort":3,"group":"website","collapse":"open","preview_url":null,"versioning":false}	{"group":"website"}	\N	\N
197	198	directus_collections	form_submissions	{"collection":"form_submissions","icon":"inbox","note":"Data for all form responses","display_template":"{{timestamp}} • {{form}}","hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":"website","collapse":"open","preview_url":null,"versioning":false}	{"group":"website"}	\N	\N
198	199	directus_collections	form_submission_values	{"collection":"form_submission_values","icon":"list","note":"Individual responses to each form field within a form submission","display_template":null,"hidden":true,"singleton":false,"translations":[{"language":"en-US","translation":"Submission Values"}],"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"form_submissions","collapse":"open","preview_url":null,"versioning":false}	{"group":"form_submissions"}	\N	\N
199	200	directus_collections	globals	{"collection":"globals","icon":"south_america","note":"Site-wide settings","display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":"website","collapse":"open","preview_url":null,"versioning":false}	{"group":"website"}	\N	\N
200	201	directus_collections	navigation	{"collection":"navigation","icon":"menu_open","note":"Dynamic menus for your site","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"is_active","archive_app_filter":true,"archive_value":"false","unarchive_value":"true","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":["title","status","items.title","items.type","items.page","items.post","items.url","items.children","items.parent"],"sort":5,"group":"website","collapse":"open","preview_url":null,"versioning":false}	{"group":"website"}	\N	\N
201	202	directus_collections	navigation_items	{"collection":"navigation_items","icon":"navigate_next","note":"Individual menu items","display_template":"{{title}}","hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#18222F","item_duplication_fields":["children","has_children","image","label","navigation","open_in_new_tab","page","title","type","url","post"],"sort":1,"group":"navigation","collapse":"open","preview_url":null,"versioning":false}	{"group":"navigation"}	\N	\N
202	203	directus_collections	page_blocks	{"collection":"page_blocks","icon":"code_blocks","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":false,"archive_value":null,"unarchive_value":null,"sort_field":"sort","accountability":"all","color":"#18222F","item_duplication_fields":[],"sort":3,"group":"pages","collapse":"open","preview_url":null,"versioning":false}	{"group":"pages"}	\N	\N
203	204	directus_collections	pages	{"collection":"pages","icon":"web_asset","note":"Dynamic page builder","display_template":"{{title}}","hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"website","collapse":"open","preview_url":"http://localhost:3000/posts/{{slug}}?preview=true","versioning":false}	{"group":"website"}	\N	\N
204	205	directus_collections	posts	{"collection":"posts","icon":"article","note":"Individual blog posts","display_template":"{{title}}","hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":["title","slug","author","status","image","description","content"],"sort":2,"group":"website","collapse":"open","preview_url":"http://localhost:3000/posts/{{slug}}?preview=true","versioning":false}	{"group":"website"}	\N	\N
241	242	directus_permissions	29	{"collection":"block_hero","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_hero","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
356	357	directus_folders	e6308546-92fb-4b10-b586-eefaf1d97f7f	{"id":"e6308546-92fb-4b10-b586-eefaf1d97f7f","name":"3. Uploads"}	{"id":"e6308546-92fb-4b10-b586-eefaf1d97f7f","name":"3. Uploads"}	\N	\N
205	206	directus_fields	162	{"sort":1,"collection":"directus_settings","field":"command_palette_settings","special":["cast-json"],"interface":"input-code","options":null,"display":"raw","display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Settings for the Command Palette Module.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"directus_settings","field":"command_palette_settings","special":["cast-json"],"interface":"input-code","options":null,"display":"raw","display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Settings for the Command Palette Module.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
206	207	directus_fields	163	{"sort":1,"collection":"directus_users","field":"posts","special":["o2m"],"interface":"list-o2m","options":{"template":"{{title}}"},"display":"related-values","display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Blog posts this user has authored.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"sort":1,"collection":"directus_users","field":"posts","special":["o2m"],"interface":"list-o2m","options":{"template":"{{title}}"},"display":"related-values","display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":"Blog posts this user has authored.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
207	208	directus_roles	8ba4ed6f-d330-4675-ae46-119c533a0928	{"id":"8ba4ed6f-d330-4675-ae46-119c533a0928","name":"Team Member","icon":"supervised_user_circle","description":"Role for internal team members and employees","children":null,"policies":null}	{"id":"8ba4ed6f-d330-4675-ae46-119c533a0928","name":"Team Member","icon":"supervised_user_circle","description":"Role for internal team members and employees","children":null,"policies":null}	\N	\N
208	209	directus_policies	307380fe-195e-44cc-9cc0-6993aeee9428	{"id":"307380fe-195e-44cc-9cc0-6993aeee9428","name":"Files - Upload","icon":"upload","description":"Grants access to upload files less than 5mb.","ip_access":null,"enforce_tfa":false,"admin_access":false,"app_access":false}	{"id":"307380fe-195e-44cc-9cc0-6993aeee9428","name":"Files - Upload","icon":"upload","description":"Grants access to upload files less than 5mb.","ip_access":null,"enforce_tfa":false,"admin_access":false,"app_access":false}	\N	\N
209	210	directus_policies	52598a64-071d-4071-96fa-4b620d6189b5	{"id":"52598a64-071d-4071-96fa-4b620d6189b5","name":"Team - App Access","icon":"badge","description":"Grants Directus Studio access to team members","ip_access":null,"enforce_tfa":false,"admin_access":false,"app_access":true}	{"id":"52598a64-071d-4071-96fa-4b620d6189b5","name":"Team - App Access","icon":"badge","description":"Grants Directus Studio access to team members","ip_access":null,"enforce_tfa":false,"admin_access":false,"app_access":true}	\N	\N
210	211	directus_policies	8ba4ed6f-d330-4675-ae46-119c533a0928	{"id":"8ba4ed6f-d330-4675-ae46-119c533a0928","name":"Content - Edit","icon":"edit","description":"Grants ability to edit content for the website","ip_access":null,"enforce_tfa":false,"admin_access":false,"app_access":false}	{"id":"8ba4ed6f-d330-4675-ae46-119c533a0928","name":"Content - Edit","icon":"edit","description":"Grants ability to edit content for the website","ip_access":null,"enforce_tfa":false,"admin_access":false,"app_access":false}	\N	\N
211	212	directus_policies	ee1055a2-7c03-4b0b-9b65-ca68491b6329	{"id":"ee1055a2-7c03-4b0b-9b65-ca68491b6329","name":"Forms - Submission","icon":"smart_button","description":"Allows form submissions.","ip_access":null,"enforce_tfa":false,"admin_access":false,"app_access":false}	{"id":"ee1055a2-7c03-4b0b-9b65-ca68491b6329","name":"Forms - Submission","icon":"smart_button","description":"Allows form submissions.","ip_access":null,"enforce_tfa":false,"admin_access":false,"app_access":false}	\N	\N
212	213	directus_policies	ef049c8b-546b-4bbc-9cd7-b05d77e58b66	{"id":"ef049c8b-546b-4bbc-9cd7-b05d77e58b66","name":"Administrator","icon":"verified","description":"$t:admin_policy_description","ip_access":null,"enforce_tfa":false,"admin_access":true,"app_access":true}	{"id":"ef049c8b-546b-4bbc-9cd7-b05d77e58b66","name":"Administrator","icon":"verified","description":"$t:admin_policy_description","ip_access":null,"enforce_tfa":false,"admin_access":true,"app_access":true}	\N	\N
213	214	directus_permissions	1	{"collection":"pages","action":"read","permissions":{"_and":[{"status":{"_eq":"published"}},{"published_at":{"_lte":"$NOW"}}]},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"pages","action":"read","permissions":{"_and":[{"status":{"_eq":"published"}},{"published_at":{"_lte":"$NOW"}}]},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
214	215	directus_permissions	2	{"collection":"posts","action":"read","permissions":{"_and":[{"status":{"_eq":"published"}},{"published_at":{"_lte":"$NOW"}}]},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"posts","action":"read","permissions":{"_and":[{"status":{"_eq":"published"}},{"published_at":{"_lte":"$NOW"}}]},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
215	216	directus_permissions	3	{"collection":"block_hero","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"block_hero","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
216	217	directus_permissions	4	{"collection":"block_richtext","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"block_richtext","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
217	218	directus_permissions	5	{"collection":"globals","action":"read","permissions":{},"validation":{},"presets":null,"fields":["id","seo","url","title","tagline","description","social","og_image","twitter_image","social_links","contact","street_address","address_locality","address_region","postal_code","address_country","email","phone","routes","logo_on_dark_bg","logo_on_light_bg","theme","logo","favicon"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"globals","action":"read","permissions":{},"validation":{},"presets":null,"fields":["id","seo","url","title","tagline","description","social","og_image","twitter_image","social_links","contact","street_address","address_locality","address_region","postal_code","address_country","email","phone","routes","logo_on_dark_bg","logo_on_light_bg","theme","logo","favicon"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
218	219	directus_permissions	6	{"collection":"page_blocks","action":"read","permissions":{"_and":[{"page":{"status":{"_eq":"published"}}}]},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"page_blocks","action":"read","permissions":{"_and":[{"page":{"status":{"_eq":"published"}}}]},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
219	220	directus_permissions	7	{"collection":"forms","action":"read","permissions":{"_and":[{"is_active":{"_eq":true}}]},"validation":{},"presets":null,"fields":["id","sort","title","is_active","meta_tabs","meta_fields","fields","submit_label","on_success","success_message","success_redirect_url"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"forms","action":"read","permissions":{"_and":[{"is_active":{"_eq":true}}]},"validation":{},"presets":null,"fields":["id","sort","title","is_active","meta_tabs","meta_fields","fields","submit_label","on_success","success_message","success_redirect_url"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
220	221	directus_permissions	8	{"collection":"navigation","action":"read","permissions":{"_and":[{"is_active":{"_eq":true}}]},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"navigation","action":"read","permissions":{"_and":[{"is_active":{"_eq":true}}]},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
221	222	directus_permissions	9	{"collection":"navigation_items","action":"read","permissions":{"_and":[{"_or":[{"navigation":{"is_active":{"_eq":true}}},{"parent":{"navigation":{"is_active":{"_eq":true}}}}]}]},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"navigation_items","action":"read","permissions":{"_and":[{"_or":[{"navigation":{"is_active":{"_eq":true}}},{"parent":{"navigation":{"is_active":{"_eq":true}}}}]}]},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
222	223	directus_permissions	10	{"collection":"block_gallery","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"block_gallery","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
223	224	directus_permissions	11	{"collection":"blog_settings","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"blog_settings","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
224	225	directus_permissions	12	{"collection":"chat_config","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"chat_config","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
225	226	directus_permissions	13	{"collection":"block_button_group","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"block_button_group","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
226	227	directus_permissions	14	{"collection":"block_button","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"block_button","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
227	228	directus_permissions	15	{"collection":"block_button","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_button","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
228	229	directus_permissions	16	{"collection":"block_button","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_button","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
229	230	directus_permissions	17	{"collection":"block_button","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_button","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
230	231	directus_permissions	18	{"collection":"block_button","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_button","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
231	232	directus_permissions	19	{"collection":"block_button_group","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_button_group","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
232	233	directus_permissions	20	{"collection":"block_button_group","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_button_group","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
233	234	directus_permissions	21	{"collection":"block_button_group","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_button_group","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
234	235	directus_permissions	22	{"collection":"block_button_group","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_button_group","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
235	236	directus_permissions	23	{"collection":"block_gallery","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_gallery","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
236	237	directus_permissions	24	{"collection":"block_gallery","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_gallery","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
237	238	directus_permissions	25	{"collection":"block_gallery","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_gallery","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
243	244	directus_permissions	31	{"collection":"block_richtext","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_richtext","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
244	245	directus_permissions	32	{"collection":"block_richtext","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_richtext","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
245	246	directus_permissions	33	{"collection":"block_richtext","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_richtext","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
246	247	directus_permissions	34	{"collection":"block_richtext","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_richtext","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
247	248	directus_permissions	35	{"collection":"blog_settings","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"blog_settings","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
248	249	directus_permissions	36	{"collection":"blog_settings","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"blog_settings","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
249	250	directus_permissions	37	{"collection":"blog_settings","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"blog_settings","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
250	251	directus_permissions	38	{"collection":"blog_settings","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"blog_settings","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
251	252	directus_permissions	39	{"collection":"forms","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"forms","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
252	253	directus_permissions	40	{"collection":"forms","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"forms","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
253	254	directus_permissions	41	{"collection":"forms","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"forms","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
254	255	directus_permissions	42	{"collection":"forms","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"forms","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
255	256	directus_permissions	43	{"collection":"globals","action":"create","permissions":{},"validation":{},"presets":null,"fields":["id","title","url","divider_logo","logo","favicon","tagline","description","divider_social","social_links"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"globals","action":"create","permissions":{},"validation":{},"presets":null,"fields":["id","title","url","divider_logo","logo","favicon","tagline","description","divider_social","social_links"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
256	257	directus_permissions	44	{"collection":"globals","action":"read","permissions":{},"validation":{},"presets":null,"fields":["id","title","url","divider_logo","logo","favicon","tagline","description","divider_social","social_links"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"globals","action":"read","permissions":{},"validation":{},"presets":null,"fields":["id","title","url","divider_logo","logo","favicon","tagline","description","divider_social","social_links"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
257	258	directus_permissions	45	{"collection":"globals","action":"update","permissions":{},"validation":{},"presets":null,"fields":["id","title","url","divider_logo","logo","favicon","tagline","description","divider_social","social_links"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"globals","action":"update","permissions":{},"validation":{},"presets":null,"fields":["id","title","url","divider_logo","logo","favicon","tagline","description","divider_social","social_links"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
258	259	directus_permissions	46	{"collection":"navigation","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"navigation","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
259	260	directus_permissions	47	{"collection":"navigation","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"navigation","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
260	261	directus_permissions	48	{"collection":"navigation","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"navigation","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
261	262	directus_permissions	49	{"collection":"navigation","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"navigation","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
357	358	directus_folders	ece7bab9-5433-4a63-b9f7-bde8b517d6d9	{"id":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","name":"1. Public"}	{"id":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","name":"1. Public"}	\N	\N
262	263	directus_permissions	50	{"collection":"navigation_items","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"navigation_items","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
263	264	directus_permissions	51	{"collection":"navigation_items","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"navigation_items","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
264	265	directus_permissions	52	{"collection":"navigation_items","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"navigation_items","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
265	266	directus_permissions	53	{"collection":"navigation_items","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"navigation_items","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
266	267	directus_permissions	54	{"collection":"page_blocks","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"page_blocks","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
267	268	directus_permissions	55	{"collection":"page_blocks","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"page_blocks","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
268	269	directus_permissions	56	{"collection":"page_blocks","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"page_blocks","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
269	270	directus_permissions	57	{"collection":"page_blocks","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"page_blocks","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
270	271	directus_permissions	58	{"collection":"pages","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"pages","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
271	272	directus_permissions	59	{"collection":"pages","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"pages","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
272	273	directus_permissions	60	{"collection":"pages","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"pages","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
273	274	directus_permissions	61	{"collection":"pages","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"pages","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
274	275	directus_permissions	62	{"collection":"posts","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"posts","action":"create","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
275	276	directus_permissions	63	{"collection":"posts","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"posts","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
276	277	directus_permissions	64	{"collection":"posts","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"posts","action":"update","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
277	278	directus_permissions	65	{"collection":"posts","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"posts","action":"delete","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
278	279	directus_permissions	66	{"collection":"projects_settings","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"projects_settings","action":"read","permissions":{},"validation":{},"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
279	280	directus_permissions	67	{"collection":"directus_files","action":"read","permissions":{"_and":[{"_or":[{"folder":{"name":{"_contains":"Public"}}},{"folder":{"parent":{"name":{"_contains":"Public"}}}}]}]},"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"directus_files","action":"read","permissions":{"_and":[{"_or":[{"folder":{"name":{"_contains":"Public"}}},{"folder":{"parent":{"name":{"_contains":"Public"}}}}]}]},"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
280	281	directus_permissions	68	{"collection":"directus_files","action":"create","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_files","action":"create","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
281	282	directus_permissions	69	{"collection":"directus_files","action":"read","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_files","action":"read","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
358	359	directus_folders	d0f67ad6-abbb-45d6-8d3e-b499a4c74d80	{"id":"d0f67ad6-abbb-45d6-8d3e-b499a4c74d80","name":"2. Private","parent":null}	{"name":"2. Private","parent":null}	\N	\N
282	283	directus_permissions	70	{"collection":"directus_files","action":"update","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_files","action":"update","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
283	284	directus_permissions	71	{"collection":"directus_files","action":"delete","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_files","action":"delete","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
284	285	directus_permissions	72	{"collection":"directus_dashboards","action":"create","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_dashboards","action":"create","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
285	286	directus_permissions	73	{"collection":"directus_dashboards","action":"read","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_dashboards","action":"read","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
286	287	directus_permissions	74	{"collection":"directus_dashboards","action":"update","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_dashboards","action":"update","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
287	288	directus_permissions	75	{"collection":"directus_dashboards","action":"delete","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_dashboards","action":"delete","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
288	289	directus_permissions	76	{"collection":"directus_panels","action":"create","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_panels","action":"create","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
289	290	directus_permissions	77	{"collection":"directus_panels","action":"read","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_panels","action":"read","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
290	291	directus_permissions	78	{"collection":"directus_panels","action":"update","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_panels","action":"update","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
291	292	directus_permissions	79	{"collection":"directus_panels","action":"delete","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_panels","action":"delete","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
292	293	directus_permissions	80	{"collection":"directus_folders","action":"create","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_folders","action":"create","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
293	294	directus_permissions	81	{"collection":"directus_folders","action":"read","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_folders","action":"read","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
294	295	directus_permissions	82	{"collection":"directus_folders","action":"update","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_folders","action":"update","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
295	296	directus_permissions	83	{"collection":"directus_folders","action":"delete","permissions":{},"validation":null,"presets":null,"fields":null,"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_folders","action":"delete","permissions":{},"validation":null,"presets":null,"fields":null,"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
296	297	directus_permissions	84	{"collection":"directus_users","action":"read","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_users","action":"read","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
297	298	directus_permissions	85	{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["first_name","last_name","email","password","location","title","description","avatar","language","appearance","theme_light","theme_dark","theme_light_overrides","theme_dark_overrides","tfa_secret"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["first_name","last_name","email","password","location","title","description","avatar","language","appearance","theme_light","theme_dark","theme_light_overrides","theme_dark_overrides","tfa_secret"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
298	299	directus_permissions	86	{"collection":"directus_roles","action":"read","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_roles","action":"read","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
299	300	directus_permissions	87	{"collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
300	301	directus_permissions	88	{"collection":"directus_shares","action":"create","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_shares","action":"create","permissions":{},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
301	302	directus_permissions	89	{"collection":"directus_shares","action":"update","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_shares","action":"update","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
302	303	directus_permissions	90	{"collection":"directus_shares","action":"delete","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_shares","action":"delete","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"validation":null,"presets":null,"fields":["*"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
303	304	directus_permissions	91	{"collection":"directus_flows","action":"read","permissions":{"trigger":{"_eq":"manual"}},"validation":null,"presets":null,"fields":["id","status","name","icon","color","options","trigger"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	{"collection":"directus_flows","action":"read","permissions":{"trigger":{"_eq":"manual"}},"validation":null,"presets":null,"fields":["id","status","name","icon","color","options","trigger"],"policy":"52598a64-071d-4071-96fa-4b620d6189b5"}	\N	\N
304	305	directus_permissions	92	{"collection":"block_form","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"block_form","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
305	306	directus_permissions	93	{"collection":"block_posts","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"block_posts","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
306	307	directus_permissions	94	{"collection":"form_fields","action":"read","permissions":{"_and":[{"form":{"is_active":{"_eq":true}}}]},"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"form_fields","action":"read","permissions":{"_and":[{"form":{"is_active":{"_eq":true}}}]},"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
307	308	directus_permissions	95	{"collection":"form_fields","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"form_fields","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
308	309	directus_permissions	96	{"collection":"form_fields","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"form_fields","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
309	310	directus_permissions	97	{"collection":"form_fields","action":"update","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"form_fields","action":"update","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
310	311	directus_permissions	98	{"collection":"form_fields","action":"delete","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"form_fields","action":"delete","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
311	312	directus_permissions	99	{"collection":"form_submission_values","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"form_submission_values","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
312	313	directus_permissions	100	{"collection":"form_submission_values","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"form_submission_values","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
313	314	directus_permissions	101	{"collection":"form_submissions","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"form_submissions","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
314	315	directus_permissions	102	{"collection":"form_submissions","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"form_submissions","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
315	316	directus_permissions	103	{"collection":"block_posts","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_posts","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
316	317	directus_permissions	104	{"collection":"block_posts","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_posts","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
317	318	directus_permissions	105	{"collection":"block_posts","action":"update","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_posts","action":"update","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
318	319	directus_permissions	106	{"collection":"block_posts","action":"delete","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_posts","action":"delete","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
319	320	directus_permissions	107	{"collection":"block_form","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_form","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
320	321	directus_permissions	108	{"collection":"block_form","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_form","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
321	322	directus_permissions	109	{"collection":"block_form","action":"update","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_form","action":"update","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
322	323	directus_permissions	110	{"collection":"block_form","action":"delete","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_form","action":"delete","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
323	324	directus_permissions	111	{"collection":"directus_files","action":"create","permissions":null,"validation":{"_and":[{"filesize":{"_lte":"5000000"}}]},"presets":{"folder":"e6308546-92fb-4b10-b586-eefaf1d97f7f"},"fields":["*"],"policy":"307380fe-195e-44cc-9cc0-6993aeee9428"}	{"collection":"directus_files","action":"create","permissions":null,"validation":{"_and":[{"filesize":{"_lte":"5000000"}}]},"presets":{"folder":"e6308546-92fb-4b10-b586-eefaf1d97f7f"},"fields":["*"],"policy":"307380fe-195e-44cc-9cc0-6993aeee9428"}	\N	\N
324	325	directus_permissions	112	{"collection":"form_submission_values","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"ee1055a2-7c03-4b0b-9b65-ca68491b6329"}	{"collection":"form_submission_values","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"ee1055a2-7c03-4b0b-9b65-ca68491b6329"}	\N	\N
325	326	directus_permissions	113	{"collection":"form_submissions","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"ee1055a2-7c03-4b0b-9b65-ca68491b6329"}	{"collection":"form_submissions","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"ee1055a2-7c03-4b0b-9b65-ca68491b6329"}	\N	\N
326	327	directus_permissions	114	{"collection":"form_submission_values","action":"read","permissions":null,"validation":null,"presets":null,"fields":["id"],"policy":"ee1055a2-7c03-4b0b-9b65-ca68491b6329"}	{"collection":"form_submission_values","action":"read","permissions":null,"validation":null,"presets":null,"fields":["id"],"policy":"ee1055a2-7c03-4b0b-9b65-ca68491b6329"}	\N	\N
327	328	directus_permissions	115	{"collection":"form_submissions","action":"read","permissions":null,"validation":null,"presets":null,"fields":["id"],"policy":"ee1055a2-7c03-4b0b-9b65-ca68491b6329"}	{"collection":"form_submissions","action":"read","permissions":null,"validation":null,"presets":null,"fields":["id"],"policy":"ee1055a2-7c03-4b0b-9b65-ca68491b6329"}	\N	\N
328	329	directus_permissions	116	{"collection":"block_gallery_items","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_gallery_items","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
329	330	directus_permissions	117	{"collection":"block_gallery_items","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_gallery_items","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
330	331	directus_permissions	118	{"collection":"block_gallery_items","action":"update","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_gallery_items","action":"update","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
331	332	directus_permissions	119	{"collection":"block_gallery_items","action":"delete","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_gallery_items","action":"delete","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
332	333	directus_permissions	120	{"collection":"block_pricing","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_pricing","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
333	334	directus_permissions	121	{"collection":"block_pricing","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_pricing","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
334	335	directus_permissions	122	{"collection":"block_pricing","action":"update","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_pricing","action":"update","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
335	336	directus_permissions	123	{"collection":"block_pricing","action":"delete","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_pricing","action":"delete","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
336	337	directus_permissions	124	{"collection":"block_pricing_cards","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_pricing_cards","action":"create","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
337	338	directus_permissions	125	{"collection":"block_pricing_cards","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_pricing_cards","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
338	339	directus_permissions	126	{"collection":"block_pricing_cards","action":"update","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_pricing_cards","action":"update","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
397	398	block_form	185eca12-4af1-4a1c-bfd7-4bc2fab52097	{"id":"185eca12-4af1-4a1c-bfd7-4bc2fab52097"}	{"id":"185eca12-4af1-4a1c-bfd7-4bc2fab52097"}	\N	\N
339	340	directus_permissions	127	{"collection":"block_pricing_cards","action":"delete","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	{"collection":"block_pricing_cards","action":"delete","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928"}	\N	\N
340	341	directus_permissions	128	{"collection":"block_gallery_items","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"block_gallery_items","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
341	342	directus_permissions	129	{"collection":"block_pricing","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"block_pricing","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
342	343	directus_permissions	130	{"collection":"block_pricing_cards","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"block_pricing_cards","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
343	344	directus_permissions	131	{"collection":"directus_users","action":"read","permissions":{"_and":[{"posts":{"_nnull":true}}]},"validation":null,"presets":null,"fields":["first_name","last_name","avatar","title"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"directus_users","action":"read","permissions":{"_and":[{"posts":{"_nnull":true}}]},"validation":null,"presets":null,"fields":["first_name","last_name","avatar","title"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
344	345	directus_permissions	132	{"collection":"directus_files","action":"read","permissions":{"_and":[{"folder":{"_eq":"e6308546-92fb-4b10-b586-eefaf1d97f7f"}}]},"validation":null,"presets":null,"fields":["id"],"policy":"307380fe-195e-44cc-9cc0-6993aeee9428"}	{"collection":"directus_files","action":"read","permissions":{"_and":[{"folder":{"_eq":"e6308546-92fb-4b10-b586-eefaf1d97f7f"}}]},"validation":null,"presets":null,"fields":["id"],"policy":"307380fe-195e-44cc-9cc0-6993aeee9428"}	\N	\N
345	346	directus_users	88a6e8cf-f0f8-41db-a3a2-8a9741c086cc	{"id":"88a6e8cf-f0f8-41db-a3a2-8a9741c086cc","first_name":"Frontend","last_name":"Bot","location":null,"title":"For server-to-server communication","description":"This user has API only access and is meant for communicating securely with Directus from your frontend.\\n\\nThis user has elevated permissions over the Public to:\\n- Submit Forms \\n- Upload Files \\n\\nFrom a security perspective, you would typically not want to allow public access to upload files or submit forms.\\n\\n- Generate a static token access below and include it in API calls to Directus when submitting forms or uploading files from a form.\\n- Be careful to only use the token server side to prevent the static access token from being exposed to the client side.","tags":["API"],"avatar":"440df429-4715-42a0-afcd-569f5cdfb145","language":null,"tfa_secret":null,"status":"active","role":null,"last_access":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"posts":null}	{"id":"88a6e8cf-f0f8-41db-a3a2-8a9741c086cc","first_name":"Frontend","last_name":"Bot","location":null,"title":"For server-to-server communication","description":"This user has API only access and is meant for communicating securely with Directus from your frontend.\\n\\nThis user has elevated permissions over the Public to:\\n- Submit Forms \\n- Upload Files \\n\\nFrom a security perspective, you would typically not want to allow public access to upload files or submit forms.\\n\\n- Generate a static token access below and include it in API calls to Directus when submitting forms or uploading files from a form.\\n- Be careful to only use the token server side to prevent the static access token from being exposed to the client side.","tags":["API"],"avatar":"440df429-4715-42a0-afcd-569f5cdfb145","language":null,"tfa_secret":null,"status":"active","role":null,"last_access":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"posts":null}	\N	\N
346	347	directus_users	d56956bf-6ed0-465e-bb4a-ec9bde65c5f0	{"id":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","first_name":"Webmaster","last_name":null,"email":"cms@example.com","location":null,"title":null,"description":null,"tags":null,"avatar":"dea64c65-de50-4d86-abea-6dee3d5256b2","language":null,"tfa_secret":null,"status":"active","role":"c36d4878-9546-4449-857c-bd86f5e50eeb","last_access":"2024-12-27T13:28:31.084Z","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"posts":null}	{"id":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","first_name":"Webmaster","last_name":null,"email":"cms@example.com","location":null,"title":null,"description":null,"tags":null,"avatar":"dea64c65-de50-4d86-abea-6dee3d5256b2","language":null,"tfa_secret":null,"status":"active","role":"c36d4878-9546-4449-857c-bd86f5e50eeb","last_access":"2024-12-27T13:28:31.084Z","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"posts":null}	\N	\N
347	348	directus_access	bc851ef2-5b0d-4ebc-adb2-b717f30167f0	{"id":"bc851ef2-5b0d-4ebc-adb2-b717f30167f0","role":"8ba4ed6f-d330-4675-ae46-119c533a0928","user":null,"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928","sort":1}	{"id":"bc851ef2-5b0d-4ebc-adb2-b717f30167f0","role":"8ba4ed6f-d330-4675-ae46-119c533a0928","user":null,"policy":"8ba4ed6f-d330-4675-ae46-119c533a0928","sort":1}	\N	\N
348	349	directus_access	188a6dce-ddf2-4d7d-98b7-02accab9803b	{"id":"188a6dce-ddf2-4d7d-98b7-02accab9803b","user":"88a6e8cf-f0f8-41db-a3a2-8a9741c086cc","policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","sort":1}	{"id":"188a6dce-ddf2-4d7d-98b7-02accab9803b","user":"88a6e8cf-f0f8-41db-a3a2-8a9741c086cc","policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","sort":1}	\N	\N
349	350	directus_access	6de77eee-b06c-4665-97a9-2e54467483f9	{"id":"6de77eee-b06c-4665-97a9-2e54467483f9","role":"c36d4878-9546-4449-857c-bd86f5e50eeb","user":null,"policy":"ef049c8b-546b-4bbc-9cd7-b05d77e58b66","sort":1}	{"id":"6de77eee-b06c-4665-97a9-2e54467483f9","role":"c36d4878-9546-4449-857c-bd86f5e50eeb","user":null,"policy":"ef049c8b-546b-4bbc-9cd7-b05d77e58b66","sort":1}	\N	\N
350	351	directus_access	248a8203-02f3-47a7-9b82-b295e9202967	{"id":"248a8203-02f3-47a7-9b82-b295e9202967","user":null,"policy":"307380fe-195e-44cc-9cc0-6993aeee9428","sort":2}	{"id":"248a8203-02f3-47a7-9b82-b295e9202967","user":null,"policy":"307380fe-195e-44cc-9cc0-6993aeee9428","sort":2}	\N	\N
351	352	directus_access	ce033dd3-b78d-4a56-9bf0-fc6f742389b5	{"id":"ce033dd3-b78d-4a56-9bf0-fc6f742389b5","role":"8ba4ed6f-d330-4675-ae46-119c533a0928","user":null,"policy":"52598a64-071d-4071-96fa-4b620d6189b5","sort":2}	{"id":"ce033dd3-b78d-4a56-9bf0-fc6f742389b5","role":"8ba4ed6f-d330-4675-ae46-119c533a0928","user":null,"policy":"52598a64-071d-4071-96fa-4b620d6189b5","sort":2}	\N	\N
352	353	directus_access	6f680545-4a81-4422-bef4-ba2553b51418	{"id":"6f680545-4a81-4422-bef4-ba2553b51418","user":"88a6e8cf-f0f8-41db-a3a2-8a9741c086cc","policy":"ee1055a2-7c03-4b0b-9b65-ca68491b6329","sort":2}	{"id":"6f680545-4a81-4422-bef4-ba2553b51418","user":"88a6e8cf-f0f8-41db-a3a2-8a9741c086cc","policy":"ee1055a2-7c03-4b0b-9b65-ca68491b6329","sort":2}	\N	\N
353	354	directus_access	2bd7d120-c70d-4469-8851-e14b11cdc823	{"id":"2bd7d120-c70d-4469-8851-e14b11cdc823","user":"88a6e8cf-f0f8-41db-a3a2-8a9741c086cc","policy":"307380fe-195e-44cc-9cc0-6993aeee9428","sort":3}	{"id":"2bd7d120-c70d-4469-8851-e14b11cdc823","user":"88a6e8cf-f0f8-41db-a3a2-8a9741c086cc","policy":"307380fe-195e-44cc-9cc0-6993aeee9428","sort":3}	\N	\N
398	399	block_form	3e262b2d-48fc-4816-b5e8-c991817d56fc	{"id":"3e262b2d-48fc-4816-b5e8-c991817d56fc"}	{"id":"3e262b2d-48fc-4816-b5e8-c991817d56fc"}	\N	\N
361	362	directus_files	03a7d1c7-81e2-432f-9561-9df2691189c8	{"id":"03a7d1c7-81e2-432f-9561-9df2691189c8","title":"169   L 09 Oct 08.55 4","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"03a7d1c7-81e2-432f-9561-9df2691189c8.png","type":"image/png","storage":"local"}	{"id":"03a7d1c7-81e2-432f-9561-9df2691189c8","title":"169   L 09 Oct 08.55 4","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"03a7d1c7-81e2-432f-9561-9df2691189c8.png","type":"image/png","storage":"local"}	\N	\N
362	363	directus_files	12e02b82-b4a4-4aaf-8ca4-e73c20a41c26	{"id":"12e02b82-b4a4-4aaf-8ca4-e73c20a41c26","title":"12e02b82 B4a4 4aaf 8ca4 E73c20a41c26","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"12e02b82-b4a4-4aaf-8ca4-e73c20a41c26.jpeg","type":"image/jpeg","storage":"local"}	{"id":"12e02b82-b4a4-4aaf-8ca4-e73c20a41c26","title":"12e02b82 B4a4 4aaf 8ca4 E73c20a41c26","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"12e02b82-b4a4-4aaf-8ca4-e73c20a41c26.jpeg","type":"image/jpeg","storage":"local"}	\N	\N
363	364	directus_files	1d3d2bd3-ff59-4626-bef5-9d5eef6510b3	{"id":"1d3d2bd3-ff59-4626-bef5-9d5eef6510b3","title":"1024px Visual Studio Code 1.35 Icon.svg.png","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"1d3d2bd3-ff59-4626-bef5-9d5eef6510b3.png","type":"image/png","storage":"local"}	{"id":"1d3d2bd3-ff59-4626-bef5-9d5eef6510b3","title":"1024px Visual Studio Code 1.35 Icon.svg.png","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"1d3d2bd3-ff59-4626-bef5-9d5eef6510b3.png","type":"image/png","storage":"local"}	\N	\N
364	365	directus_files	2b4a0ba0-52c7-4e10-b191-c803d8da6a36	{"id":"2b4a0ba0-52c7-4e10-b191-c803d8da6a36","title":"Directus Logo","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"2b4a0ba0-52c7-4e10-b191-c803d8da6a36.png","type":"image/png","storage":"local"}	{"id":"2b4a0ba0-52c7-4e10-b191-c803d8da6a36","title":"Directus Logo","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"2b4a0ba0-52c7-4e10-b191-c803d8da6a36.png","type":"image/png","storage":"local"}	\N	\N
365	366	directus_files	35a67f1b-d401-4300-a503-b8e583186f2a	{"id":"35a67f1b-d401-4300-a503-b8e583186f2a","title":"Directus Logo","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"35a67f1b-d401-4300-a503-b8e583186f2a.svg","type":"image/svg+xml","storage":"local"}	{"id":"35a67f1b-d401-4300-a503-b8e583186f2a","title":"Directus Logo","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"35a67f1b-d401-4300-a503-b8e583186f2a.svg","type":"image/svg+xml","storage":"local"}	\N	\N
366	367	directus_files	3eff7dc2-445a-47c5-9503-3f600ecdb5c6	{"id":"3eff7dc2-445a-47c5-9503-3f600ecdb5c6","title":"3eff7dc2 445a 47c5 9503 3f600ecdb5c6","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"3eff7dc2-445a-47c5-9503-3f600ecdb5c6.jpeg","type":"image/jpeg","storage":"local"}	{"id":"3eff7dc2-445a-47c5-9503-3f600ecdb5c6","title":"3eff7dc2 445a 47c5 9503 3f600ecdb5c6","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"3eff7dc2-445a-47c5-9503-3f600ecdb5c6.jpeg","type":"image/jpeg","storage":"local"}	\N	\N
367	368	directus_files	43ddd7b8-9b2f-4aa1-b63c-933b4ae81ca2	{"id":"43ddd7b8-9b2f-4aa1-b63c-933b4ae81ca2","title":"Directus Logo Dark","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"43ddd7b8-9b2f-4aa1-b63c-933b4ae81ca2.svg","type":"image/svg+xml","storage":"local"}	{"id":"43ddd7b8-9b2f-4aa1-b63c-933b4ae81ca2","title":"Directus Logo Dark","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"43ddd7b8-9b2f-4aa1-b63c-933b4ae81ca2.svg","type":"image/svg+xml","storage":"local"}	\N	\N
368	369	directus_files	440df429-4715-42a0-afcd-569f5cdfb145	{"id":"440df429-4715-42a0-afcd-569f5cdfb145","title":"Bunny Bot","filename_download":"440df429-4715-42a0-afcd-569f5cdfb145.svg","type":"image/svg+xml","storage":"local"}	{"id":"440df429-4715-42a0-afcd-569f5cdfb145","title":"Bunny Bot","filename_download":"440df429-4715-42a0-afcd-569f5cdfb145.svg","type":"image/svg+xml","storage":"local"}	\N	\N
369	370	directus_files	44a4e780-d59b-4fa5-9b26-1c4b447474d2	{"id":"44a4e780-d59b-4fa5-9b26-1c4b447474d2","title":"Multicolored Can Wall Decor","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"44a4e780-d59b-4fa5-9b26-1c4b447474d2.jpg","type":"image/jpeg","storage":"local"}	{"id":"44a4e780-d59b-4fa5-9b26-1c4b447474d2","title":"Multicolored Can Wall Decor","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"44a4e780-d59b-4fa5-9b26-1c4b447474d2.jpg","type":"image/jpeg","storage":"local"}	\N	\N
370	371	directus_files	50570a31-a990-453c-bdfc-0ad7175dd8bf	{"id":"50570a31-a990-453c-bdfc-0ad7175dd8bf","title":"169   L 09 Oct 09.09","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"50570a31-a990-453c-bdfc-0ad7175dd8bf.png","type":"image/png","storage":"local"}	{"id":"50570a31-a990-453c-bdfc-0ad7175dd8bf","title":"169   L 09 Oct 09.09","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"50570a31-a990-453c-bdfc-0ad7175dd8bf.png","type":"image/png","storage":"local"}	\N	\N
371	372	directus_files	535f1284-dbc4-4e4e-9e50-b44a1df130bd	{"id":"535f1284-dbc4-4e4e-9e50-b44a1df130bd","title":"Content Manager","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"535f1284-dbc4-4e4e-9e50-b44a1df130bd.webp","type":"image/webp","storage":"local"}	{"id":"535f1284-dbc4-4e4e-9e50-b44a1df130bd","title":"Content Manager","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"535f1284-dbc4-4e4e-9e50-b44a1df130bd.webp","type":"image/webp","storage":"local"}	\N	\N
372	373	directus_files	6464e61f-455a-4b47-b623-bb12e5251dfe	{"id":"6464e61f-455a-4b47-b623-bb12e5251dfe","title":"6464e61f 455a 4b47 B623 Bb12e5251dfe","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"6464e61f-455a-4b47-b623-bb12e5251dfe.jpeg","type":"image/jpeg","storage":"local"}	{"id":"6464e61f-455a-4b47-b623-bb12e5251dfe","title":"6464e61f 455a 4b47 B623 Bb12e5251dfe","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"6464e61f-455a-4b47-b623-bb12e5251dfe.jpeg","type":"image/jpeg","storage":"local"}	\N	\N
373	374	directus_files	68103296-6634-4d66-918a-04b09afe6621	{"id":"68103296-6634-4d66-918a-04b09afe6621","title":"68103296 6634 4d66 918a 04b09afe6621","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"68103296-6634-4d66-918a-04b09afe6621.jpeg","type":"image/jpeg","storage":"local"}	{"id":"68103296-6634-4d66-918a-04b09afe6621","title":"68103296 6634 4d66 918a 04b09afe6621","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"68103296-6634-4d66-918a-04b09afe6621.jpeg","type":"image/jpeg","storage":"local"}	\N	\N
374	375	directus_files	6964d750-1c00-4b9c-81e4-0c81cfa82bbb	{"id":"6964d750-1c00-4b9c-81e4-0c81cfa82bbb","title":"169   L 09 Oct 08.53","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"6964d750-1c00-4b9c-81e4-0c81cfa82bbb.png","type":"image/png","storage":"local"}	{"id":"6964d750-1c00-4b9c-81e4-0c81cfa82bbb","title":"169   L 09 Oct 08.53","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"6964d750-1c00-4b9c-81e4-0c81cfa82bbb.png","type":"image/png","storage":"local"}	\N	\N
399	400	block_gallery	34fdcf0e-cc5d-4c40-b61f-4f0a5e167306	{"id":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306"}	{"id":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306"}	\N	\N
400	401	block_gallery	61a1866b-5bff-473a-a6e3-106cd6b37412	{"id":"61a1866b-5bff-473a-a6e3-106cd6b37412"}	{"id":"61a1866b-5bff-473a-a6e3-106cd6b37412"}	\N	\N
375	376	directus_files	7775c53a-6c2c-453d-8c22-8b5445121d10	{"id":"7775c53a-6c2c-453d-8c22-8b5445121d10","title":"7775c53a 6c2c 453d 8c22 8b5445121d10","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"7775c53a-6c2c-453d-8c22-8b5445121d10.jpeg","type":"image/jpeg","storage":"local"}	{"id":"7775c53a-6c2c-453d-8c22-8b5445121d10","title":"7775c53a 6c2c 453d 8c22 8b5445121d10","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"7775c53a-6c2c-453d-8c22-8b5445121d10.jpeg","type":"image/jpeg","storage":"local"}	\N	\N
376	377	directus_files	8f748634-d77b-4985-b27e-7e1f3559881a	{"id":"8f748634-d77b-4985-b27e-7e1f3559881a","title":"8f748634 D77b 4985 B27e 7e1f3559881a","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"8f748634-d77b-4985-b27e-7e1f3559881a.jpeg","type":"image/jpeg","storage":"local"}	{"id":"8f748634-d77b-4985-b27e-7e1f3559881a","title":"8f748634 D77b 4985 B27e 7e1f3559881a","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"8f748634-d77b-4985-b27e-7e1f3559881a.jpeg","type":"image/jpeg","storage":"local"}	\N	\N
377	378	directus_files	9a52e835-e131-4290-81bb-5a512599f93e	{"id":"9a52e835-e131-4290-81bb-5a512599f93e","title":"Img Lxo Xol Uwrdu Q Cswq Xmmk6utm.png","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"9a52e835-e131-4290-81bb-5a512599f93e.png","type":"image/png","storage":"local"}	{"id":"9a52e835-e131-4290-81bb-5a512599f93e","title":"Img Lxo Xol Uwrdu Q Cswq Xmmk6utm.png","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"9a52e835-e131-4290-81bb-5a512599f93e.png","type":"image/png","storage":"local"}	\N	\N
378	379	directus_files	a051ea01-07a5-45cb-bcc6-411af9560be5	{"id":"a051ea01-07a5-45cb-bcc6-411af9560be5","title":"169   L 09 Oct 09.09 2","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"a051ea01-07a5-45cb-bcc6-411af9560be5.png","type":"image/png","storage":"local"}	{"id":"a051ea01-07a5-45cb-bcc6-411af9560be5","title":"169   L 09 Oct 09.09 2","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"a051ea01-07a5-45cb-bcc6-411af9560be5.png","type":"image/png","storage":"local"}	\N	\N
379	380	directus_files	ac905071-0643-4337-8f53-48ed45b1ccf2	{"id":"ac905071-0643-4337-8f53-48ed45b1ccf2","title":"Silhouette Tree Sunset","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"ac905071-0643-4337-8f53-48ed45b1ccf2.jpg","type":"image/jpeg","storage":"local"}	{"id":"ac905071-0643-4337-8f53-48ed45b1ccf2","title":"Silhouette Tree Sunset","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"ac905071-0643-4337-8f53-48ed45b1ccf2.jpg","type":"image/jpeg","storage":"local"}	\N	\N
380	381	directus_files	b9db00d9-535f-4e24-8a46-5f7e5fc65bf2	{"id":"b9db00d9-535f-4e24-8a46-5f7e5fc65bf2","title":"Yellow Click Pen","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"b9db00d9-535f-4e24-8a46-5f7e5fc65bf2.jpg","type":"image/jpeg","storage":"local"}	{"id":"b9db00d9-535f-4e24-8a46-5f7e5fc65bf2","title":"Yellow Click Pen","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"b9db00d9-535f-4e24-8a46-5f7e5fc65bf2.jpg","type":"image/jpeg","storage":"local"}	\N	\N
381	382	directus_files	c2a301bd-74ed-4a50-9b85-3cb1f40f8dee	{"id":"c2a301bd-74ed-4a50-9b85-3cb1f40f8dee","title":"169   L 09 Oct 08.55 2","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"c2a301bd-74ed-4a50-9b85-3cb1f40f8dee.png","type":"image/png","storage":"local"}	{"id":"c2a301bd-74ed-4a50-9b85-3cb1f40f8dee","title":"169   L 09 Oct 08.55 2","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"c2a301bd-74ed-4a50-9b85-3cb1f40f8dee.png","type":"image/png","storage":"local"}	\N	\N
382	383	directus_files	d4fd6edc-4cc5-48c1-8bc7-e646924bbdca	{"id":"d4fd6edc-4cc5-48c1-8bc7-e646924bbdca","title":"D4fd6edc 4cc5 48c1 8bc7 E646924bbdca","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"d4fd6edc-4cc5-48c1-8bc7-e646924bbdca.jpeg","type":"image/jpeg","storage":"local"}	{"id":"d4fd6edc-4cc5-48c1-8bc7-e646924bbdca","title":"D4fd6edc 4cc5 48c1 8bc7 E646924bbdca","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"d4fd6edc-4cc5-48c1-8bc7-e646924bbdca.jpeg","type":"image/jpeg","storage":"local"}	\N	\N
383	384	directus_files	dc258f02-d1a3-47f4-9f3e-2a71a0010c56	{"id":"dc258f02-d1a3-47f4-9f3e-2a71a0010c56","title":"169   L 09 Oct 09.33 1","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"dc258f02-d1a3-47f4-9f3e-2a71a0010c56.png","type":"image/png","storage":"local"}	{"id":"dc258f02-d1a3-47f4-9f3e-2a71a0010c56","title":"169   L 09 Oct 09.33 1","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"dc258f02-d1a3-47f4-9f3e-2a71a0010c56.png","type":"image/png","storage":"local"}	\N	\N
384	385	directus_files	dea64c65-de50-4d86-abea-6dee3d5256b2	{"id":"dea64c65-de50-4d86-abea-6dee3d5256b2","title":"Webmaster","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"dea64c65-de50-4d86-abea-6dee3d5256b2.webp","type":"image/webp","storage":"local"}	{"id":"dea64c65-de50-4d86-abea-6dee3d5256b2","title":"Webmaster","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"dea64c65-de50-4d86-abea-6dee3d5256b2.webp","type":"image/webp","storage":"local"}	\N	\N
385	386	directus_files	df0745c2-b6e3-4b37-b64d-55a4eb0033ab	{"id":"df0745c2-b6e3-4b37-b64d-55a4eb0033ab","title":"C02ae5db 9f53 4c29 Aadf C59b54056845","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"df0745c2-b6e3-4b37-b64d-55a4eb0033ab.avif","type":"image/avif","storage":"local"}	{"id":"df0745c2-b6e3-4b37-b64d-55a4eb0033ab","title":"C02ae5db 9f53 4c29 Aadf C59b54056845","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"df0745c2-b6e3-4b37-b64d-55a4eb0033ab.avif","type":"image/avif","storage":"local"}	\N	\N
386	387	directus_files	fd6440c2-dd48-4792-9d08-3124cd99b40f	{"id":"fd6440c2-dd48-4792-9d08-3124cd99b40f","title":"Img Edz5 Tmm L7 a Mn Fg5 Ijc Uvkd20.png","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"fd6440c2-dd48-4792-9d08-3124cd99b40f.png","type":"image/png","storage":"local"}	{"id":"fd6440c2-dd48-4792-9d08-3124cd99b40f","title":"Img Edz5 Tmm L7 a Mn Fg5 Ijc Uvkd20.png","folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","filename_download":"fd6440c2-dd48-4792-9d08-3124cd99b40f.png","type":"image/png","storage":"local"}	\N	\N
387	388	block_button	3d583c03-4909-4001-aad2-cd7af6ec53af	{"id":"3d583c03-4909-4001-aad2-cd7af6ec53af"}	{"id":"3d583c03-4909-4001-aad2-cd7af6ec53af"}	\N	\N
388	389	block_button	5f902715-6e50-491b-b29c-b947a11a10f1	{"id":"5f902715-6e50-491b-b29c-b947a11a10f1"}	{"id":"5f902715-6e50-491b-b29c-b947a11a10f1"}	\N	\N
389	390	block_button	47ddfe4e-721a-483f-a09b-4c10fe0cec1a	{"id":"47ddfe4e-721a-483f-a09b-4c10fe0cec1a"}	{"id":"47ddfe4e-721a-483f-a09b-4c10fe0cec1a"}	\N	\N
390	391	block_button	b74af9dd-cc34-451c-88cf-c3e14c39cf4f	{"id":"b74af9dd-cc34-451c-88cf-c3e14c39cf4f"}	{"id":"b74af9dd-cc34-451c-88cf-c3e14c39cf4f"}	\N	\N
391	392	block_button	dda7d91c-b449-4ab3-9d9d-84d4e8c09caf	{"id":"dda7d91c-b449-4ab3-9d9d-84d4e8c09caf"}	{"id":"dda7d91c-b449-4ab3-9d9d-84d4e8c09caf"}	\N	\N
392	393	block_button	efb97ae9-d95e-4f9d-bf00-9df9966c65ec	{"id":"efb97ae9-d95e-4f9d-bf00-9df9966c65ec"}	{"id":"efb97ae9-d95e-4f9d-bf00-9df9966c65ec"}	\N	\N
393	394	block_button_group	0b1512d8-3bec-4dbc-919c-4514bbe37dc1	{"id":"0b1512d8-3bec-4dbc-919c-4514bbe37dc1"}	{"id":"0b1512d8-3bec-4dbc-919c-4514bbe37dc1"}	\N	\N
401	402	block_gallery	7b5e5649-40be-4f54-a2fb-b021a520645d	{"id":"7b5e5649-40be-4f54-a2fb-b021a520645d"}	{"id":"7b5e5649-40be-4f54-a2fb-b021a520645d"}	\N	\N
402	403	block_gallery_items	02bb1bbf-c10d-462e-be09-c4556b3ea087	{"id":"02bb1bbf-c10d-462e-be09-c4556b3ea087"}	{"id":"02bb1bbf-c10d-462e-be09-c4556b3ea087"}	\N	\N
403	404	block_gallery_items	1dbac868-e2cc-4930-9f21-5e0dd1b40e52	{"id":"1dbac868-e2cc-4930-9f21-5e0dd1b40e52"}	{"id":"1dbac868-e2cc-4930-9f21-5e0dd1b40e52"}	\N	\N
404	405	block_gallery_items	1f520e55-4054-47f9-896a-baf2787ec007	{"id":"1f520e55-4054-47f9-896a-baf2787ec007"}	{"id":"1f520e55-4054-47f9-896a-baf2787ec007"}	\N	\N
405	406	block_gallery_items	297914c3-b1dd-4683-b6bf-5b8cad3bf743	{"id":"297914c3-b1dd-4683-b6bf-5b8cad3bf743"}	{"id":"297914c3-b1dd-4683-b6bf-5b8cad3bf743"}	\N	\N
406	407	block_gallery_items	2a0369dc-1b43-4d5a-9832-d180a0aa0295	{"id":"2a0369dc-1b43-4d5a-9832-d180a0aa0295"}	{"id":"2a0369dc-1b43-4d5a-9832-d180a0aa0295"}	\N	\N
407	408	block_gallery_items	46f226f4-6d13-4783-878f-3ae0eafcfd5d	{"id":"46f226f4-6d13-4783-878f-3ae0eafcfd5d"}	{"id":"46f226f4-6d13-4783-878f-3ae0eafcfd5d"}	\N	\N
408	409	block_gallery_items	553ea498-554a-478c-89d5-99f33e56642d	{"id":"553ea498-554a-478c-89d5-99f33e56642d"}	{"id":"553ea498-554a-478c-89d5-99f33e56642d"}	\N	\N
409	410	block_gallery_items	62ab01e9-27f7-44e5-90bb-d3f6258dd0cf	{"id":"62ab01e9-27f7-44e5-90bb-d3f6258dd0cf"}	{"id":"62ab01e9-27f7-44e5-90bb-d3f6258dd0cf"}	\N	\N
410	411	block_gallery_items	9527868b-136a-48a9-917d-44e0abc835e2	{"id":"9527868b-136a-48a9-917d-44e0abc835e2"}	{"id":"9527868b-136a-48a9-917d-44e0abc835e2"}	\N	\N
411	412	block_gallery_items	d3481aae-7dc4-446f-8b68-50e77aab58da	{"id":"d3481aae-7dc4-446f-8b68-50e77aab58da"}	{"id":"d3481aae-7dc4-446f-8b68-50e77aab58da"}	\N	\N
412	413	block_gallery_items	f6ce1b83-5020-4a5a-9c71-0d69d3b216ff	{"id":"f6ce1b83-5020-4a5a-9c71-0d69d3b216ff"}	{"id":"f6ce1b83-5020-4a5a-9c71-0d69d3b216ff"}	\N	\N
413	414	block_hero	6aa654f5-b55f-4436-a35c-1f989f26268a	{"id":"6aa654f5-b55f-4436-a35c-1f989f26268a"}	{"id":"6aa654f5-b55f-4436-a35c-1f989f26268a"}	\N	\N
414	415	block_hero	8ece685c-e903-443b-b29d-b36491709743	{"id":"8ece685c-e903-443b-b29d-b36491709743"}	{"id":"8ece685c-e903-443b-b29d-b36491709743"}	\N	\N
415	416	block_hero	93693278-93bc-4a70-a54c-bbbf1e0037d7	{"id":"93693278-93bc-4a70-a54c-bbbf1e0037d7"}	{"id":"93693278-93bc-4a70-a54c-bbbf1e0037d7"}	\N	\N
416	417	block_hero	d81ab264-b2be-4077-84e7-b1406e74d9c3	{"id":"d81ab264-b2be-4077-84e7-b1406e74d9c3"}	{"id":"d81ab264-b2be-4077-84e7-b1406e74d9c3"}	\N	\N
417	418	block_posts	060b632d-d70d-4db1-8b95-4fbab7a52ae8	{"id":"060b632d-d70d-4db1-8b95-4fbab7a52ae8"}	{"id":"060b632d-d70d-4db1-8b95-4fbab7a52ae8"}	\N	\N
418	419	block_pricing	48cf2543-15e0-454f-9b31-cbf3c2406712	{"id":"48cf2543-15e0-454f-9b31-cbf3c2406712"}	{"id":"48cf2543-15e0-454f-9b31-cbf3c2406712"}	\N	\N
419	420	block_pricing_cards	388404db-1703-4b10-b12b-e5d4385f1530	{"id":"388404db-1703-4b10-b12b-e5d4385f1530"}	{"id":"388404db-1703-4b10-b12b-e5d4385f1530"}	\N	\N
420	421	block_pricing_cards	83972d2a-742e-4a6c-8698-563d01dde54d	{"id":"83972d2a-742e-4a6c-8698-563d01dde54d"}	{"id":"83972d2a-742e-4a6c-8698-563d01dde54d"}	\N	\N
421	422	block_richtext	1134799b-3fd1-47ea-963f-13d8ac1b9e3a	{"id":"1134799b-3fd1-47ea-963f-13d8ac1b9e3a"}	{"id":"1134799b-3fd1-47ea-963f-13d8ac1b9e3a"}	\N	\N
422	423	block_richtext	129625db-433f-4104-9922-3b803ba4599d	{"id":"129625db-433f-4104-9922-3b803ba4599d"}	{"id":"129625db-433f-4104-9922-3b803ba4599d"}	\N	\N
423	424	block_richtext	1619b2fe-ce09-4a78-8c47-1428995c7c1c	{"id":"1619b2fe-ce09-4a78-8c47-1428995c7c1c"}	{"id":"1619b2fe-ce09-4a78-8c47-1428995c7c1c"}	\N	\N
424	425	block_richtext	1a273da2-8d00-4ccc-9109-0da0d0d88dcb	{"id":"1a273da2-8d00-4ccc-9109-0da0d0d88dcb"}	{"id":"1a273da2-8d00-4ccc-9109-0da0d0d88dcb"}	\N	\N
425	426	block_richtext	2387edcd-e6ab-451c-befa-30ab247b2290	{"id":"2387edcd-e6ab-451c-befa-30ab247b2290"}	{"id":"2387edcd-e6ab-451c-befa-30ab247b2290"}	\N	\N
426	427	block_richtext	62517520-a3e0-4655-bd92-2d45293eb0c6	{"id":"62517520-a3e0-4655-bd92-2d45293eb0c6"}	{"id":"62517520-a3e0-4655-bd92-2d45293eb0c6"}	\N	\N
427	428	block_richtext	6c5df396-be52-4b1c-a144-d55b229e5a34	{"id":"6c5df396-be52-4b1c-a144-d55b229e5a34"}	{"id":"6c5df396-be52-4b1c-a144-d55b229e5a34"}	\N	\N
428	429	block_richtext	8f714990-cb45-4c6c-afa6-a49615768a4f	{"id":"8f714990-cb45-4c6c-afa6-a49615768a4f"}	{"id":"8f714990-cb45-4c6c-afa6-a49615768a4f"}	\N	\N
429	430	block_richtext	9d65df9c-307f-4049-bc21-0c3a77178d91	{"id":"9d65df9c-307f-4049-bc21-0c3a77178d91"}	{"id":"9d65df9c-307f-4049-bc21-0c3a77178d91"}	\N	\N
430	431	block_richtext	a6275645-16b7-4994-8100-8c43ca07ab06	{"id":"a6275645-16b7-4994-8100-8c43ca07ab06"}	{"id":"a6275645-16b7-4994-8100-8c43ca07ab06"}	\N	\N
431	432	block_richtext	b0c8cec2-acc5-46ad-9044-8a6602000c3e	{"id":"b0c8cec2-acc5-46ad-9044-8a6602000c3e"}	{"id":"b0c8cec2-acc5-46ad-9044-8a6602000c3e"}	\N	\N
432	433	form_fields	0f3deba1-9d6b-44a0-aa87-a9b38e834beb	{"id":"0f3deba1-9d6b-44a0-aa87-a9b38e834beb"}	{"id":"0f3deba1-9d6b-44a0-aa87-a9b38e834beb"}	\N	\N
433	434	form_fields	56c64efd-520f-4578-acca-e0565e247681	{"id":"56c64efd-520f-4578-acca-e0565e247681"}	{"id":"56c64efd-520f-4578-acca-e0565e247681"}	\N	\N
434	435	form_fields	a3d87bc0-f143-44ca-bea0-9eaf56b67783	{"id":"a3d87bc0-f143-44ca-bea0-9eaf56b67783"}	{"id":"a3d87bc0-f143-44ca-bea0-9eaf56b67783"}	\N	\N
435	436	form_fields	a5222af8-f9a2-4d1a-9713-7ce0e2d5edc5	{"id":"a5222af8-f9a2-4d1a-9713-7ce0e2d5edc5"}	{"id":"a5222af8-f9a2-4d1a-9713-7ce0e2d5edc5"}	\N	\N
436	437	form_fields	bbc7b1c6-304e-4ee1-9afa-c5cffda6af27	{"id":"bbc7b1c6-304e-4ee1-9afa-c5cffda6af27"}	{"id":"bbc7b1c6-304e-4ee1-9afa-c5cffda6af27"}	\N	\N
437	438	form_fields	d37bc00f-bfb5-4496-85c3-70190b21b707	{"id":"d37bc00f-bfb5-4496-85c3-70190b21b707"}	{"id":"d37bc00f-bfb5-4496-85c3-70190b21b707"}	\N	\N
438	439	form_fields	eef0eb77-ecab-4fba-9903-c46d6ad6d85b	{"id":"eef0eb77-ecab-4fba-9903-c46d6ad6d85b"}	{"id":"eef0eb77-ecab-4fba-9903-c46d6ad6d85b"}	\N	\N
439	440	forms	36493b64-2bad-4c58-9d70-785ccb12ee26	{"id":"36493b64-2bad-4c58-9d70-785ccb12ee26"}	{"id":"36493b64-2bad-4c58-9d70-785ccb12ee26"}	\N	\N
440	441	forms	5da3d356-d818-434f-b225-db35c418bbb6	{"id":"5da3d356-d818-434f-b225-db35c418bbb6"}	{"id":"5da3d356-d818-434f-b225-db35c418bbb6"}	\N	\N
441	442	form_submissions	133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0	{"id":"133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0"}	{"id":"133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0"}	\N	\N
442	443	form_submissions	3805e2c0-ebba-4070-a1b3-b39ba1b4932b	{"id":"3805e2c0-ebba-4070-a1b3-b39ba1b4932b"}	{"id":"3805e2c0-ebba-4070-a1b3-b39ba1b4932b"}	\N	\N
443	444	form_submission_values	28f8820f-def4-4b3b-b35d-b79fc7f731a1	{"id":"28f8820f-def4-4b3b-b35d-b79fc7f731a1"}	{"id":"28f8820f-def4-4b3b-b35d-b79fc7f731a1"}	\N	\N
444	445	form_submission_values	54e554ef-82e7-463e-8542-624352cdb5ca	{"id":"54e554ef-82e7-463e-8542-624352cdb5ca"}	{"id":"54e554ef-82e7-463e-8542-624352cdb5ca"}	\N	\N
445	446	form_submission_values	63df3a8a-75dd-4ea5-94d6-cad8c0820ef4	{"id":"63df3a8a-75dd-4ea5-94d6-cad8c0820ef4"}	{"id":"63df3a8a-75dd-4ea5-94d6-cad8c0820ef4"}	\N	\N
446	447	form_submission_values	6883038b-15bf-4635-8216-a362e62e7ca2	{"id":"6883038b-15bf-4635-8216-a362e62e7ca2"}	{"id":"6883038b-15bf-4635-8216-a362e62e7ca2"}	\N	\N
447	448	navigation	footer	{"id":"footer"}	{"id":"footer"}	\N	\N
448	449	navigation	main	{"id":"main"}	{"id":"main"}	\N	\N
449	450	navigation_items	0ca39155-c212-4b6e-8156-5a4322731c07	{"id":"0ca39155-c212-4b6e-8156-5a4322731c07"}	{"id":"0ca39155-c212-4b6e-8156-5a4322731c07"}	\N	\N
450	451	navigation_items	192a490a-bbb9-4794-b82f-619a01463723	{"id":"192a490a-bbb9-4794-b82f-619a01463723"}	{"id":"192a490a-bbb9-4794-b82f-619a01463723"}	\N	\N
451	452	navigation_items	28fde01b-647b-4151-96e5-6d876d3f3329	{"id":"28fde01b-647b-4151-96e5-6d876d3f3329"}	{"id":"28fde01b-647b-4151-96e5-6d876d3f3329"}	\N	\N
452	453	navigation_items	717b30fd-1bf6-46eb-a0cd-81923c17fcf6	{"id":"717b30fd-1bf6-46eb-a0cd-81923c17fcf6"}	{"id":"717b30fd-1bf6-46eb-a0cd-81923c17fcf6"}	\N	\N
453	454	navigation_items	c732b100-1f5a-4ce1-8fde-b0072d09623f	{"id":"c732b100-1f5a-4ce1-8fde-b0072d09623f"}	{"id":"c732b100-1f5a-4ce1-8fde-b0072d09623f"}	\N	\N
454	455	navigation_items	dc0870f8-e316-48b0-b34d-ca5c4394344c	{"id":"dc0870f8-e316-48b0-b34d-ca5c4394344c"}	{"id":"dc0870f8-e316-48b0-b34d-ca5c4394344c"}	\N	\N
455	456	navigation_items	e096f25c-a549-4fe5-a284-17b0a347037a	{"id":"e096f25c-a549-4fe5-a284-17b0a347037a"}	{"id":"e096f25c-a549-4fe5-a284-17b0a347037a"}	\N	\N
456	457	page_blocks	1f774f44-3e33-4b0f-93f4-fdd6df898438	{"id":"1f774f44-3e33-4b0f-93f4-fdd6df898438"}	{"id":"1f774f44-3e33-4b0f-93f4-fdd6df898438"}	\N	\N
457	458	page_blocks	b4d48d5a-0450-4e8c-8c5b-198e7063a10f	{"id":"b4d48d5a-0450-4e8c-8c5b-198e7063a10f"}	{"id":"b4d48d5a-0450-4e8c-8c5b-198e7063a10f"}	\N	\N
458	459	page_blocks	bc826e30-4988-4035-98bd-5ffc4799e5fc	{"id":"bc826e30-4988-4035-98bd-5ffc4799e5fc"}	{"id":"bc826e30-4988-4035-98bd-5ffc4799e5fc"}	\N	\N
459	460	page_blocks	090e286c-3dfe-4638-89d9-09b2e0caf2ea	{"id":"090e286c-3dfe-4638-89d9-09b2e0caf2ea"}	{"id":"090e286c-3dfe-4638-89d9-09b2e0caf2ea"}	\N	\N
460	461	page_blocks	45227f61-5ff1-431c-8dee-1a50d369325f	{"id":"45227f61-5ff1-431c-8dee-1a50d369325f"}	{"id":"45227f61-5ff1-431c-8dee-1a50d369325f"}	\N	\N
461	462	page_blocks	2b017efb-ce7c-4b90-9f59-a39236ffe571	{"id":"2b017efb-ce7c-4b90-9f59-a39236ffe571"}	{"id":"2b017efb-ce7c-4b90-9f59-a39236ffe571"}	\N	\N
462	463	page_blocks	0ff1d6c4-ff77-46c6-ad02-f9ae31484505	{"id":"0ff1d6c4-ff77-46c6-ad02-f9ae31484505"}	{"id":"0ff1d6c4-ff77-46c6-ad02-f9ae31484505"}	\N	\N
463	464	page_blocks	2d9abe8f-a7ad-480d-8fc7-603c712e2f40	{"id":"2d9abe8f-a7ad-480d-8fc7-603c712e2f40"}	{"id":"2d9abe8f-a7ad-480d-8fc7-603c712e2f40"}	\N	\N
464	465	page_blocks	529e6408-7372-4195-b82d-e444c06ac492	{"id":"529e6408-7372-4195-b82d-e444c06ac492"}	{"id":"529e6408-7372-4195-b82d-e444c06ac492"}	\N	\N
465	466	page_blocks	ed613af3-b584-47e7-9584-7d6d4d87eaf5	{"id":"ed613af3-b584-47e7-9584-7d6d4d87eaf5"}	{"id":"ed613af3-b584-47e7-9584-7d6d4d87eaf5"}	\N	\N
466	467	page_blocks	39d02b18-18d2-4c29-9268-038f72ea05fe	{"id":"39d02b18-18d2-4c29-9268-038f72ea05fe"}	{"id":"39d02b18-18d2-4c29-9268-038f72ea05fe"}	\N	\N
467	468	page_blocks	7e1ce212-3f8a-43b4-aff7-131bf4241e30	{"id":"7e1ce212-3f8a-43b4-aff7-131bf4241e30"}	{"id":"7e1ce212-3f8a-43b4-aff7-131bf4241e30"}	\N	\N
468	469	pages	636dc283-e634-4d5d-aada-e6743db46036	{"id":"636dc283-e634-4d5d-aada-e6743db46036"}	{"id":"636dc283-e634-4d5d-aada-e6743db46036"}	\N	\N
469	470	pages	1ce02298-817a-46bc-ac92-6a6c10c20f88	{"id":"1ce02298-817a-46bc-ac92-6a6c10c20f88"}	{"id":"1ce02298-817a-46bc-ac92-6a6c10c20f88"}	\N	\N
470	471	pages	9821199f-4b05-49fb-8407-fbfe9b866ef0	{"id":"9821199f-4b05-49fb-8407-fbfe9b866ef0"}	{"id":"9821199f-4b05-49fb-8407-fbfe9b866ef0"}	\N	\N
471	472	pages	2a62887e-2384-4bd2-a919-7665d85fed07	{"id":"2a62887e-2384-4bd2-a919-7665d85fed07"}	{"id":"2a62887e-2384-4bd2-a919-7665d85fed07"}	\N	\N
472	473	pages	93023385-f574-4040-9ead-42b717db2015	{"id":"93023385-f574-4040-9ead-42b717db2015"}	{"id":"93023385-f574-4040-9ead-42b717db2015"}	\N	\N
473	474	posts	c96b64b4-9567-46f6-8eb5-ac2f37c4918d	{"id":"c96b64b4-9567-46f6-8eb5-ac2f37c4918d"}	{"id":"c96b64b4-9567-46f6-8eb5-ac2f37c4918d"}	\N	\N
474	475	posts	ba559a1e-5b0c-4932-ab97-b1ab4ca69955	{"id":"ba559a1e-5b0c-4932-ab97-b1ab4ca69955"}	{"id":"ba559a1e-5b0c-4932-ab97-b1ab4ca69955"}	\N	\N
475	476	posts	ddf1003f-6b9a-460c-83fd-d985d6defbd6	{"id":"ddf1003f-6b9a-460c-83fd-d985d6defbd6"}	{"id":"ddf1003f-6b9a-460c-83fd-d985d6defbd6"}	\N	\N
476	477	posts	f7845a69-edcb-4163-a2a9-fb82b64475c5	{"id":"f7845a69-edcb-4163-a2a9-fb82b64475c5"}	{"id":"f7845a69-edcb-4163-a2a9-fb82b64475c5"}	\N	\N
477	478	posts	a5068543-fdd1-4773-b6c3-43b4c222d377	{"id":"a5068543-fdd1-4773-b6c3-43b4c222d377"}	{"id":"a5068543-fdd1-4773-b6c3-43b4c222d377"}	\N	\N
478	479	posts	399a9a1b-bad5-4b5b-86e4-291ad1676e91	{"id":"399a9a1b-bad5-4b5b-86e4-291ad1676e91"}	{"id":"399a9a1b-bad5-4b5b-86e4-291ad1676e91"}	\N	\N
479	480	block_button	3d583c03-4909-4001-aad2-cd7af6ec53af	{"id":"3d583c03-4909-4001-aad2-cd7af6ec53af","sort":1,"type":"pages","page":null,"post":null,"label":"Start Your Project","variant":"solid","button_group":"0b1512d8-3bec-4dbc-919c-4514bbe37dc1","url":null}	{"sort":1,"type":"pages","page":null,"post":null,"label":"Start Your Project","variant":"solid","button_group":"0b1512d8-3bec-4dbc-919c-4514bbe37dc1","url":null}	\N	\N
480	481	block_button	5f902715-6e50-491b-b29c-b947a11a10f1	{"id":"5f902715-6e50-491b-b29c-b947a11a10f1","sort":1,"type":"page","page":"9821199f-4b05-49fb-8407-fbfe9b866ef0","post":null,"label":"Get A Demo","variant":"default","button_group":"4cd6d4ca-82ea-4daf-ae79-a4c4265bfb27","url":null}	{"sort":1,"type":"page","page":"9821199f-4b05-49fb-8407-fbfe9b866ef0","post":null,"label":"Get A Demo","variant":"default","button_group":"4cd6d4ca-82ea-4daf-ae79-a4c4265bfb27","url":null}	\N	\N
481	482	block_button	47ddfe4e-721a-483f-a09b-4c10fe0cec1a	{"id":"47ddfe4e-721a-483f-a09b-4c10fe0cec1a","sort":null,"type":"pages","page":null,"post":null,"label":"Learn More","variant":"solid","button_group":"aed01afb-490d-42d3-bbf4-cf64081494b9","url":null}	{"sort":null,"type":"pages","page":null,"post":null,"label":"Learn More","variant":"solid","button_group":"aed01afb-490d-42d3-bbf4-cf64081494b9","url":null}	\N	\N
482	483	block_button	b74af9dd-cc34-451c-88cf-c3e14c39cf4f	{"id":"b74af9dd-cc34-451c-88cf-c3e14c39cf4f","sort":null,"type":"pages","page":null,"post":null,"label":"Start Your Project","variant":"outline","button_group":"aed01afb-490d-42d3-bbf4-cf64081494b9","url":null}	{"sort":null,"type":"pages","page":null,"post":null,"label":"Start Your Project","variant":"outline","button_group":"aed01afb-490d-42d3-bbf4-cf64081494b9","url":null}	\N	\N
483	484	block_button	dda7d91c-b449-4ab3-9d9d-84d4e8c09caf	{"id":"dda7d91c-b449-4ab3-9d9d-84d4e8c09caf","sort":null,"type":"url","page":null,"post":null,"label":"Get Started","variant":"solid","button_group":null,"url":"/your-stripe-checkout-link"}	{"sort":null,"type":"url","page":null,"post":null,"label":"Get Started","variant":"solid","button_group":null,"url":"/your-stripe-checkout-link"}	\N	\N
484	485	block_button	efb97ae9-d95e-4f9d-bf00-9df9966c65ec	{"id":"efb97ae9-d95e-4f9d-bf00-9df9966c65ec","sort":null,"type":"url","page":null,"post":null,"label":"Talk to Sales","variant":"solid","button_group":null,"url":"/get-a-demo"}	{"sort":null,"type":"url","page":null,"post":null,"label":"Talk to Sales","variant":"solid","button_group":null,"url":"/get-a-demo"}	\N	\N
485	486	block_button_group	0b1512d8-3bec-4dbc-919c-4514bbe37dc1	{"id":"0b1512d8-3bec-4dbc-919c-4514bbe37dc1","sort":null,"buttons":["3d583c03-4909-4001-aad2-cd7af6ec53af"]}	{"sort":null}	\N	\N
486	487	block_button_group	4cd6d4ca-82ea-4daf-ae79-a4c4265bfb27	{"id":"4cd6d4ca-82ea-4daf-ae79-a4c4265bfb27","sort":null,"buttons":["5f902715-6e50-491b-b29c-b947a11a10f1"]}	{"sort":null}	\N	\N
487	488	block_button_group	aed01afb-490d-42d3-bbf4-cf64081494b9	{"id":"aed01afb-490d-42d3-bbf4-cf64081494b9","sort":null,"buttons":["47ddfe4e-721a-483f-a09b-4c10fe0cec1a","b74af9dd-cc34-451c-88cf-c3e14c39cf4f"]}	{"sort":null}	\N	\N
488	489	block_form	1419faec-e263-431c-bd5f-a57f394c39f6	{"id":"1419faec-e263-431c-bd5f-a57f394c39f6","form":"5da3d356-d818-434f-b225-db35c418bbb6","headline":"Get all the goodness, right in your inbox","tagline":"Newsletter"}	{"form":"5da3d356-d818-434f-b225-db35c418bbb6","headline":"Get all the goodness, right in your inbox","tagline":"Newsletter"}	\N	\N
489	490	block_form	185eca12-4af1-4a1c-bfd7-4bc2fab52097	{"id":"185eca12-4af1-4a1c-bfd7-4bc2fab52097","form":"36493b64-2bad-4c58-9d70-785ccb12ee26","headline":"Let's talk about your project","tagline":"Contact"}	{"form":"36493b64-2bad-4c58-9d70-785ccb12ee26","headline":"Let's talk about your project","tagline":"Contact"}	\N	\N
490	491	block_form	3e262b2d-48fc-4816-b5e8-c991817d56fc	{"id":"3e262b2d-48fc-4816-b5e8-c991817d56fc","form":"5da3d356-d818-434f-b225-db35c418bbb6","headline":"Subscribe to get updates","tagline":"Newsletter"}	{"form":"5da3d356-d818-434f-b225-db35c418bbb6","headline":"Subscribe to get updates","tagline":"Newsletter"}	\N	\N
497	498	block_gallery	34fdcf0e-cc5d-4c40-b61f-4f0a5e167306	{"headline":"Check out some of our latest templates","id":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","tagline":"Template Gallery","items":[]}	{"headline":"Check out some of our latest templates","tagline":"Template Gallery"}	\N	\N
491	492	block_gallery_items	1dbac868-e2cc-4930-9f21-5e0dd1b40e52	{"id":"1dbac868-e2cc-4930-9f21-5e0dd1b40e52","block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":null,"sort":null}	{"block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306"}	497	\N
492	493	block_gallery_items	2a0369dc-1b43-4d5a-9832-d180a0aa0295	{"id":"2a0369dc-1b43-4d5a-9832-d180a0aa0295","block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":null,"sort":null}	{"block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306"}	497	\N
493	494	block_gallery_items	46f226f4-6d13-4783-878f-3ae0eafcfd5d	{"id":"46f226f4-6d13-4783-878f-3ae0eafcfd5d","block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":null,"sort":null}	{"block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306"}	497	\N
494	495	block_gallery_items	02bb1bbf-c10d-462e-be09-c4556b3ea087	{"id":"02bb1bbf-c10d-462e-be09-c4556b3ea087","block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":null,"sort":null}	{"block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306"}	497	\N
495	496	block_gallery_items	d3481aae-7dc4-446f-8b68-50e77aab58da	{"id":"d3481aae-7dc4-446f-8b68-50e77aab58da","block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":null,"sort":null}	{"block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306"}	497	\N
496	497	block_gallery_items	1f520e55-4054-47f9-896a-baf2787ec007	{"id":"1f520e55-4054-47f9-896a-baf2787ec007","block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":null,"sort":null}	{"block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306"}	497	\N
498	499	block_gallery	61a1866b-5bff-473a-a6e3-106cd6b37412	{"headline":"<p>This is an <em>amazing</em> gallery</p>","id":"61a1866b-5bff-473a-a6e3-106cd6b37412","tagline":null,"items":[]}	{"headline":"<p>This is an <em>amazing</em> gallery</p>","tagline":null}	\N	\N
504	505	block_gallery	7b5e5649-40be-4f54-a2fb-b021a520645d	{"headline":"Get started even faster","id":"7b5e5649-40be-4f54-a2fb-b021a520645d","tagline":"Directus Templates","items":[]}	{"headline":"Get started even faster","tagline":"Directus Templates"}	\N	\N
499	500	block_gallery_items	553ea498-554a-478c-89d5-99f33e56642d	{"id":"553ea498-554a-478c-89d5-99f33e56642d","block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d","directus_file":null,"sort":null}	{"block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d"}	504	\N
500	501	block_gallery_items	62ab01e9-27f7-44e5-90bb-d3f6258dd0cf	{"id":"62ab01e9-27f7-44e5-90bb-d3f6258dd0cf","block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d","directus_file":null,"sort":null}	{"block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d"}	504	\N
501	502	block_gallery_items	f6ce1b83-5020-4a5a-9c71-0d69d3b216ff	{"id":"f6ce1b83-5020-4a5a-9c71-0d69d3b216ff","block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d","directus_file":null,"sort":null}	{"block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d"}	504	\N
502	503	block_gallery_items	9527868b-136a-48a9-917d-44e0abc835e2	{"id":"9527868b-136a-48a9-917d-44e0abc835e2","block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d","directus_file":null,"sort":null}	{"block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d"}	504	\N
503	504	block_gallery_items	297914c3-b1dd-4683-b6bf-5b8cad3bf743	{"id":"297914c3-b1dd-4683-b6bf-5b8cad3bf743","block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d","directus_file":null,"sort":null}	{"block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d"}	504	\N
505	506	block_gallery_items	02bb1bbf-c10d-462e-be09-c4556b3ea087	{"id":"02bb1bbf-c10d-462e-be09-c4556b3ea087","block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":"a051ea01-07a5-45cb-bcc6-411af9560be5","sort":10}	{"block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":"a051ea01-07a5-45cb-bcc6-411af9560be5","sort":10}	\N	\N
506	507	block_gallery_items	1dbac868-e2cc-4930-9f21-5e0dd1b40e52	{"id":"1dbac868-e2cc-4930-9f21-5e0dd1b40e52","block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":"03a7d1c7-81e2-432f-9561-9df2691189c8","sort":7}	{"block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":"03a7d1c7-81e2-432f-9561-9df2691189c8","sort":7}	\N	\N
507	508	block_gallery_items	1f520e55-4054-47f9-896a-baf2787ec007	{"id":"1f520e55-4054-47f9-896a-baf2787ec007","block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":"dc258f02-d1a3-47f4-9f3e-2a71a0010c56","sort":12}	{"block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":"dc258f02-d1a3-47f4-9f3e-2a71a0010c56","sort":12}	\N	\N
508	509	block_gallery_items	297914c3-b1dd-4683-b6bf-5b8cad3bf743	{"id":"297914c3-b1dd-4683-b6bf-5b8cad3bf743","block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d","directus_file":"03a7d1c7-81e2-432f-9561-9df2691189c8","sort":5}	{"block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d","directus_file":"03a7d1c7-81e2-432f-9561-9df2691189c8","sort":5}	\N	\N
509	510	block_gallery_items	2a0369dc-1b43-4d5a-9832-d180a0aa0295	{"id":"2a0369dc-1b43-4d5a-9832-d180a0aa0295","block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":"c2a301bd-74ed-4a50-9b85-3cb1f40f8dee","sort":8}	{"block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":"c2a301bd-74ed-4a50-9b85-3cb1f40f8dee","sort":8}	\N	\N
510	511	block_gallery_items	46f226f4-6d13-4783-878f-3ae0eafcfd5d	{"id":"46f226f4-6d13-4783-878f-3ae0eafcfd5d","block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":"6964d750-1c00-4b9c-81e4-0c81cfa82bbb","sort":9}	{"block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":"6964d750-1c00-4b9c-81e4-0c81cfa82bbb","sort":9}	\N	\N
511	512	block_gallery_items	553ea498-554a-478c-89d5-99f33e56642d	{"id":"553ea498-554a-478c-89d5-99f33e56642d","block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d","directus_file":"a051ea01-07a5-45cb-bcc6-411af9560be5","sort":1}	{"block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d","directus_file":"a051ea01-07a5-45cb-bcc6-411af9560be5","sort":1}	\N	\N
512	513	block_gallery_items	62ab01e9-27f7-44e5-90bb-d3f6258dd0cf	{"id":"62ab01e9-27f7-44e5-90bb-d3f6258dd0cf","block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d","directus_file":"50570a31-a990-453c-bdfc-0ad7175dd8bf","sort":2}	{"block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d","directus_file":"50570a31-a990-453c-bdfc-0ad7175dd8bf","sort":2}	\N	\N
513	514	block_gallery_items	9527868b-136a-48a9-917d-44e0abc835e2	{"id":"9527868b-136a-48a9-917d-44e0abc835e2","block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d","directus_file":"c2a301bd-74ed-4a50-9b85-3cb1f40f8dee","sort":4}	{"block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d","directus_file":"c2a301bd-74ed-4a50-9b85-3cb1f40f8dee","sort":4}	\N	\N
514	515	block_gallery_items	d3481aae-7dc4-446f-8b68-50e77aab58da	{"id":"d3481aae-7dc4-446f-8b68-50e77aab58da","block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":"50570a31-a990-453c-bdfc-0ad7175dd8bf","sort":11}	{"block_gallery":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","directus_file":"50570a31-a990-453c-bdfc-0ad7175dd8bf","sort":11}	\N	\N
515	516	block_gallery_items	f6ce1b83-5020-4a5a-9c71-0d69d3b216ff	{"id":"f6ce1b83-5020-4a5a-9c71-0d69d3b216ff","block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d","directus_file":"6964d750-1c00-4b9c-81e4-0c81cfa82bbb","sort":3}	{"block_gallery":"7b5e5649-40be-4f54-a2fb-b021a520645d","directus_file":"6964d750-1c00-4b9c-81e4-0c81cfa82bbb","sort":3}	\N	\N
516	517	block_hero	6aa654f5-b55f-4436-a35c-1f989f26268a	{"headline":"<p>Get to <em>MVP</em> faster</p>","id":"6aa654f5-b55f-4436-a35c-1f989f26268a","image":"df0745c2-b6e3-4b37-b64d-55a4eb0033ab","button_group":"aed01afb-490d-42d3-bbf4-cf64081494b9","description":null,"alignment":null,"tagline":null,"layout":null}	{"headline":"<p>Get to <em>MVP</em> faster</p>","image":"df0745c2-b6e3-4b37-b64d-55a4eb0033ab","button_group":"aed01afb-490d-42d3-bbf4-cf64081494b9","description":null,"alignment":null,"tagline":null,"layout":null}	\N	\N
517	518	block_hero	8ece685c-e903-443b-b29d-b36491709743	{"headline":"<p>Custom <em>web development and design</em> services</p>","id":"8ece685c-e903-443b-b29d-b36491709743","image":"df0745c2-b6e3-4b37-b64d-55a4eb0033ab","button_group":"0b1512d8-3bec-4dbc-919c-4514bbe37dc1","description":null,"alignment":null,"tagline":null,"layout":null}	{"headline":"<p>Custom <em>web development and design</em> services</p>","image":"df0745c2-b6e3-4b37-b64d-55a4eb0033ab","button_group":"0b1512d8-3bec-4dbc-919c-4514bbe37dc1","description":null,"alignment":null,"tagline":null,"layout":null}	\N	\N
518	519	block_hero	93693278-93bc-4a70-a54c-bbbf1e0037d7	{"headline":null,"id":"93693278-93bc-4a70-a54c-bbbf1e0037d7","image":null,"button_group":null,"description":null,"alignment":null,"tagline":null,"layout":null}	{"headline":null,"image":null,"button_group":null,"description":null,"alignment":null,"tagline":null,"layout":null}	\N	\N
564	565	navigation	main	{"id":"main","title":"Main Navigation","is_active":true,"items":["192a490a-bbb9-4794-b82f-619a01463723","0ca39155-c212-4b6e-8156-5a4322731c07"]}	{"title":"Main Navigation","is_active":true}	\N	\N
519	520	block_hero	d81ab264-b2be-4077-84e7-b1406e74d9c3	{"headline":"Headless but not brainless","id":"d81ab264-b2be-4077-84e7-b1406e74d9c3","image":"df0745c2-b6e3-4b37-b64d-55a4eb0033ab","button_group":"4cd6d4ca-82ea-4daf-ae79-a4c4265bfb27","description":"Directus gives you a backend that is perfect for Headless CMS use cases but also everything beyond. Authentication, user permissions.","alignment":"left","tagline":"Backend + CMS","layout":"image_right"}	{"headline":"Headless but not brainless","image":"df0745c2-b6e3-4b37-b64d-55a4eb0033ab","button_group":"4cd6d4ca-82ea-4daf-ae79-a4c4265bfb27","description":"Directus gives you a backend that is perfect for Headless CMS use cases but also everything beyond. Authentication, user permissions.","alignment":"left","tagline":"Backend + CMS","layout":"image_right"}	\N	\N
520	521	block_posts	060b632d-d70d-4db1-8b95-4fbab7a52ae8	{"id":"060b632d-d70d-4db1-8b95-4fbab7a52ae8","headline":"All rabbits, all the time","collection":"posts","tagline":"Blog"}	{"headline":"All rabbits, all the time","collection":"posts","tagline":"Blog"}	\N	\N
523	524	block_pricing	48cf2543-15e0-454f-9b31-cbf3c2406712	{"id":"48cf2543-15e0-454f-9b31-cbf3c2406712","headline":"Plans to fit every budget","tagline":"Pricing","pricing_cards":["83972d2a-742e-4a6c-8698-563d01dde54d","388404db-1703-4b10-b12b-e5d4385f1530"]}	{"headline":"Plans to fit every budget","tagline":"Pricing"}	\N	\N
521	522	block_pricing_cards	83972d2a-742e-4a6c-8698-563d01dde54d	{"id":"83972d2a-742e-4a6c-8698-563d01dde54d","title":null,"description":null,"price":null,"badge":null,"features":null,"button":null,"pricing":"48cf2543-15e0-454f-9b31-cbf3c2406712","is_highlighted":false,"sort":null}	{"pricing":"48cf2543-15e0-454f-9b31-cbf3c2406712"}	523	\N
522	523	block_pricing_cards	388404db-1703-4b10-b12b-e5d4385f1530	{"id":"388404db-1703-4b10-b12b-e5d4385f1530","title":null,"description":null,"price":null,"badge":null,"features":null,"button":null,"pricing":"48cf2543-15e0-454f-9b31-cbf3c2406712","is_highlighted":false,"sort":null}	{"pricing":"48cf2543-15e0-454f-9b31-cbf3c2406712"}	523	\N
524	525	block_pricing_cards	388404db-1703-4b10-b12b-e5d4385f1530	{"id":"388404db-1703-4b10-b12b-e5d4385f1530","title":"Starter Plan","description":"Perfect for your small busines","price":"$199 /month","badge":"Most Popular","features":["One seat","Unlimited","Lifetime access"],"button":"dda7d91c-b449-4ab3-9d9d-84d4e8c09caf","pricing":"48cf2543-15e0-454f-9b31-cbf3c2406712","is_highlighted":false,"sort":null}	{"title":"Starter Plan","description":"Perfect for your small busines","price":"$199 /month","badge":"Most Popular","features":["One seat","Unlimited","Lifetime access"],"button":"dda7d91c-b449-4ab3-9d9d-84d4e8c09caf","pricing":"48cf2543-15e0-454f-9b31-cbf3c2406712","is_highlighted":false,"sort":null}	\N	\N
525	526	block_pricing_cards	83972d2a-742e-4a6c-8698-563d01dde54d	{"id":"83972d2a-742e-4a6c-8698-563d01dde54d","title":"Enterprise Plan","description":"The best plan with all the best features","price":"$599 /month","badge":null,"features":["All of them","Yes all of them"],"button":"efb97ae9-d95e-4f9d-bf00-9df9966c65ec","pricing":"48cf2543-15e0-454f-9b31-cbf3c2406712","is_highlighted":true,"sort":null}	{"title":"Enterprise Plan","description":"The best plan with all the best features","price":"$599 /month","badge":null,"features":["All of them","Yes all of them"],"button":"efb97ae9-d95e-4f9d-bf00-9df9966c65ec","pricing":"48cf2543-15e0-454f-9b31-cbf3c2406712","is_highlighted":true,"sort":null}	\N	\N
526	527	block_richtext	1134799b-3fd1-47ea-963f-13d8ac1b9e3a	{"content":"<p>Welcome to our website solution - where simplicity meets power. While we've made content management beautifully simple, there's a lot more under the hood when you need it.</p>\\n<p>Built on Directus, our platform starts as an intuitive CMS that anyone can use. Update your website, manage blog posts, handle forms, and organize media files with ease - no coding required. It's perfect for content creators, marketing teams, and business owners who want to focus on their message, not technical details.</p>\\n<p>But here's the exciting part: when your needs grow, so can your platform. Directus isn't just a CMS - it's a full-featured backend that can power everything from mobile apps to complex digital experiences. Think of it as future-proofing your digital presence while keeping things simple today.</p>\\n<p><strong>What you'll love:</strong></p>\\n<ul>\\n<li>A friendly interface that just makes sense</li>\\n<li>Easy visual page building</li>\\n<li>Hassle-free media management</li>\\n<li>Smart form handling with email notifications</li>\\n<li>Flexible blog management with drafts</li>\\n<li>Custom navigation menus</li>\\n<li>Team collaboration tools</li>\\n<li>Mobile-ready interface for updates anywhere</li>\\n</ul>\\n<p><strong>And when you're ready for more than just CMS:</strong></p>\\n<ul>\\n<li>API access for custom applications</li>\\n<li>Advanced data relationships</li>\\n<li>Custom workflows</li>\\n<li>Automated tasks</li>\\n<li>Enterprise-grade security</li>\\n</ul>\\n<p>Start simple, grow seamlessly. That's our promise to you. Ready to make your website work better for you?</p>","headline":"Our promise to you","id":"1134799b-3fd1-47ea-963f-13d8ac1b9e3a","alignment":"center","tagline":"About Us"}	{"content":"<p>Welcome to our website solution - where simplicity meets power. While we've made content management beautifully simple, there's a lot more under the hood when you need it.</p>\\n<p>Built on Directus, our platform starts as an intuitive CMS that anyone can use. Update your website, manage blog posts, handle forms, and organize media files with ease - no coding required. It's perfect for content creators, marketing teams, and business owners who want to focus on their message, not technical details.</p>\\n<p>But here's the exciting part: when your needs grow, so can your platform. Directus isn't just a CMS - it's a full-featured backend that can power everything from mobile apps to complex digital experiences. Think of it as future-proofing your digital presence while keeping things simple today.</p>\\n<p><strong>What you'll love:</strong></p>\\n<ul>\\n<li>A friendly interface that just makes sense</li>\\n<li>Easy visual page building</li>\\n<li>Hassle-free media management</li>\\n<li>Smart form handling with email notifications</li>\\n<li>Flexible blog management with drafts</li>\\n<li>Custom navigation menus</li>\\n<li>Team collaboration tools</li>\\n<li>Mobile-ready interface for updates anywhere</li>\\n</ul>\\n<p><strong>And when you're ready for more than just CMS:</strong></p>\\n<ul>\\n<li>API access for custom applications</li>\\n<li>Advanced data relationships</li>\\n<li>Custom workflows</li>\\n<li>Automated tasks</li>\\n<li>Enterprise-grade security</li>\\n</ul>\\n<p>Start simple, grow seamlessly. That's our promise to you. Ready to make your website work better for you?</p>","headline":"Our promise to you","alignment":"center","tagline":"About Us"}	\N	\N
527	528	block_richtext	129625db-433f-4104-9922-3b803ba4599d	{"content":"<p>We were tired of solutions that were super friendly for content editors but were challenging for developers to work with. Conversely, what good is DX if the content editors don't enjoy using the CMS?</p>","headline":"Make your entire team happy","id":"129625db-433f-4104-9922-3b803ba4599d","alignment":"center","tagline":"Why Us?"}	{"content":"<p>We were tired of solutions that were super friendly for content editors but were challenging for developers to work with. Conversely, what good is DX if the content editors don't enjoy using the CMS?</p>","headline":"Make your entire team happy","alignment":"center","tagline":"Why Us?"}	\N	\N
528	529	block_richtext	1619b2fe-ce09-4a78-8c47-1428995c7c1c	{"content":"<p>At our digital agency, we believe that standing out in the crowded digital landscape requires a unique approach. <a href=\\"/team\\" target=\\"_self\\">That's why we take a holistic approach</a> to digital marketing, focusing on building a strong brand identity and developing strategies that are tailored to our clients' specific needs.</p>\\n<p><a class=\\"btn btn-primary btn-md\\" href=\\"/contact-us\\" target=\\"_self\\">Test Button</a></p>\\n<h1>H1</h1>\\n<blockquote>\\n<p>Our team of experts brings a diverse range of skills and experiences to the table, including web design, content creation, SEO, social media marketing, and more. We're not just interested in getting quick results; we're invested in helping our clients build sustainable, long-term success.</p>\\n</blockquote>\\n<ol>\\n<li>Number 1</li>\\n<li>Number 2 (Who does number 2 work for)</li>\\n<li>Number 3</li>\\n</ol>\\n<ul>\\n<li>Item 1</li>\\n<li>Item 2</li>\\n<li>Item 3</li>\\n</ul>\\n<h2>H2</h2>\\n<p>Some text</p>\\n<hr>\\n<h3>H3</h3>\\n<p>Some text</p>\\n<p>From the initial consultation to ongoing support, we're dedicated to providing personalized attention and exceptional service. At our digital agency, we're not just different from the rest - we're better.</p>","headline":"We're different than all the rest.","id":"1619b2fe-ce09-4a78-8c47-1428995c7c1c","alignment":"center","tagline":null}	{"content":"<p>At our digital agency, we believe that standing out in the crowded digital landscape requires a unique approach. <a href=\\"/team\\" target=\\"_self\\">That's why we take a holistic approach</a> to digital marketing, focusing on building a strong brand identity and developing strategies that are tailored to our clients' specific needs.</p>\\n<p><a class=\\"btn btn-primary btn-md\\" href=\\"/contact-us\\" target=\\"_self\\">Test Button</a></p>\\n<h1>H1</h1>\\n<blockquote>\\n<p>Our team of experts brings a diverse range of skills and experiences to the table, including web design, content creation, SEO, social media marketing, and more. We're not just interested in getting quick results; we're invested in helping our clients build sustainable, long-term success.</p>\\n</blockquote>\\n<ol>\\n<li>Number 1</li>\\n<li>Number 2 (Who does number 2 work for)</li>\\n<li>Number 3</li>\\n</ol>\\n<ul>\\n<li>Item 1</li>\\n<li>Item 2</li>\\n<li>Item 3</li>\\n</ul>\\n<h2>H2</h2>\\n<p>Some text</p>\\n<hr>\\n<h3>H3</h3>\\n<p>Some text</p>\\n<p>From the initial consultation to ongoing support, we're dedicated to providing personalized attention and exceptional service. At our digital agency, we're not just different from the rest - we're better.</p>","headline":"We're different than all the rest.","alignment":"center","tagline":null}	\N	\N
529	530	block_richtext	1a273da2-8d00-4ccc-9109-0da0d0d88dcb	{"content":"<p>Hi {{ contact.first_name }},</p>\\n<p>Thanks for meeting with me the other day. It was nice to have the time to dig in and have a more focused conversation. I have outlined three options of increasing complexity for the project. The options are incremental, meaning that each includes and builds upon the previous options. This will allow you to pick a level that suits the urgency and budget.</p>\\n<p>Please note that this is not an estimate, it is a quote. The price you agree to is exactly how much you&rsquo;ll pay. If I have underestimated how long it will take me to do the work, that&rsquo;s my problem, not yours.</p>\\n<p>Because of this, I&rsquo;m strict about what&rsquo;s included and what&rsquo;s not. Please do not assume anything. If there is anything you want included that you don&rsquo;t see explicitly listed, we&rsquo;ll need to talk about it and I&rsquo;ll send a revised quote. When you get a chance, please review and let me know if you have any questions or comments. I&rsquo;ll touch base with you on DATE THAT IS THREE TO FOUR BUSINESS DAYS IN THE FUTURE if I haven&rsquo;t heard back by then.</p>\\n<p>- Bryant Gillespie</p>","headline":"Let's work together","id":"1a273da2-8d00-4ccc-9109-0da0d0d88dcb","alignment":"center","tagline":null}	{"content":"<p>Hi {{ contact.first_name }},</p>\\n<p>Thanks for meeting with me the other day. It was nice to have the time to dig in and have a more focused conversation. I have outlined three options of increasing complexity for the project. The options are incremental, meaning that each includes and builds upon the previous options. This will allow you to pick a level that suits the urgency and budget.</p>\\n<p>Please note that this is not an estimate, it is a quote. The price you agree to is exactly how much you&rsquo;ll pay. If I have underestimated how long it will take me to do the work, that&rsquo;s my problem, not yours.</p>\\n<p>Because of this, I&rsquo;m strict about what&rsquo;s included and what&rsquo;s not. Please do not assume anything. If there is anything you want included that you don&rsquo;t see explicitly listed, we&rsquo;ll need to talk about it and I&rsquo;ll send a revised quote. When you get a chance, please review and let me know if you have any questions or comments. I&rsquo;ll touch base with you on DATE THAT IS THREE TO FOUR BUSINESS DAYS IN THE FUTURE if I haven&rsquo;t heard back by then.</p>\\n<p>- Bryant Gillespie</p>","headline":"Let's work together","alignment":"center","tagline":null}	\N	\N
530	531	block_richtext	2387edcd-e6ab-451c-befa-30ab247b2290	{"content":"<p><strong>Here's a few sentences.</strong></p>","headline":"Rich Text Block","id":"2387edcd-e6ab-451c-befa-30ab247b2290","alignment":"center","tagline":null}	{"content":"<p><strong>Here's a few sentences.</strong></p>","headline":"Rich Text Block","alignment":"center","tagline":null}	\N	\N
531	532	block_richtext	62517520-a3e0-4655-bd92-2d45293eb0c6	{"content":"<p>Given your current setup, we propose an innovative solution leveraging Directus, an open-source headless content management system, to streamline your web development process. This approach involves integrating Directus with your existing system, offering a more efficient and flexible way to manage your web content and applications.</p>\\n<p>Benefits:</p>\\n<ol>\\n<li><strong>Enhanced Flexibility:</strong> Directus provides a more adaptable and customizable content management framework compared to traditional systems.</li>\\n<li><strong>Improved Content Control:</strong> With Directus, you gain more control over how your content is structured and delivered across different platforms.</li>\\n<li><strong>Cost-Effective Solution:</strong> Utilizing Directus significantly reduces the need for extensive custom development, thereby lowering overall project costs.</li>\\n</ol>\\n<p>Drawbacks:</p>\\n<ol>\\n<li><strong>Dependency on Directus Framework:</strong> Your system will rely on the Directus framework, which might require additional learning for your team.</li>\\n<li><strong>Limited Third-Party Integrations:</strong> While Directus is versatile, it may not have as many out-of-the-box integrations as some other platforms.</li>\\n</ol>\\n<p>Timeline and Deliverables:</p>\\n<ol>\\n<li><strong>Planning and System Assessment (2 days):</strong> Evaluating your current system and planning the Directus integration.</li>\\n<li><strong>Directus Setup and Configuration (3 days):</strong> Installing and configuring Directus to fit your specific needs.</li>\\n<li><strong>Data Migration and Integration (4 days):</strong> Migrating existing data and ensuring seamless integration with your systems.</li>\\n<li><strong>Custom Development (if required) (3 days):</strong> Additional customization to meet specific requirements.</li>\\n<li><strong>Testing and Quality Assurance (3 days):</strong> Ensuring the integration works flawlessly across all platforms.</li>\\n<li><strong>Training and Documentation (2 days):</strong> Providing training sessions for your team and comprehensive documentation.</li>\\n<li><strong>Launch and Post-Launch Support (2 days):</strong> Going live and providing immediate support to address any issues.</li>\\n</ol>\\n<p>Cost:</p>\\n<ul>\\n<li><strong>Initial Setup and Integration:</strong> $6,500 one time.</li>\\n<li><strong>Annual Maintenance and Support:</strong> $1,200, covering updates and ongoing support.</li>\\n</ul>\\n<p>This solution offers a robust, flexible approach to managing your web content and applications, aligning with modern web development practices while ensuring cost-effectiveness and scalability.</p>","headline":"How We Can Do This","id":"62517520-a3e0-4655-bd92-2d45293eb0c6","alignment":"left","tagline":null}	{"content":"<p>Given your current setup, we propose an innovative solution leveraging Directus, an open-source headless content management system, to streamline your web development process. This approach involves integrating Directus with your existing system, offering a more efficient and flexible way to manage your web content and applications.</p>\\n<p>Benefits:</p>\\n<ol>\\n<li><strong>Enhanced Flexibility:</strong> Directus provides a more adaptable and customizable content management framework compared to traditional systems.</li>\\n<li><strong>Improved Content Control:</strong> With Directus, you gain more control over how your content is structured and delivered across different platforms.</li>\\n<li><strong>Cost-Effective Solution:</strong> Utilizing Directus significantly reduces the need for extensive custom development, thereby lowering overall project costs.</li>\\n</ol>\\n<p>Drawbacks:</p>\\n<ol>\\n<li><strong>Dependency on Directus Framework:</strong> Your system will rely on the Directus framework, which might require additional learning for your team.</li>\\n<li><strong>Limited Third-Party Integrations:</strong> While Directus is versatile, it may not have as many out-of-the-box integrations as some other platforms.</li>\\n</ol>\\n<p>Timeline and Deliverables:</p>\\n<ol>\\n<li><strong>Planning and System Assessment (2 days):</strong> Evaluating your current system and planning the Directus integration.</li>\\n<li><strong>Directus Setup and Configuration (3 days):</strong> Installing and configuring Directus to fit your specific needs.</li>\\n<li><strong>Data Migration and Integration (4 days):</strong> Migrating existing data and ensuring seamless integration with your systems.</li>\\n<li><strong>Custom Development (if required) (3 days):</strong> Additional customization to meet specific requirements.</li>\\n<li><strong>Testing and Quality Assurance (3 days):</strong> Ensuring the integration works flawlessly across all platforms.</li>\\n<li><strong>Training and Documentation (2 days):</strong> Providing training sessions for your team and comprehensive documentation.</li>\\n<li><strong>Launch and Post-Launch Support (2 days):</strong> Going live and providing immediate support to address any issues.</li>\\n</ol>\\n<p>Cost:</p>\\n<ul>\\n<li><strong>Initial Setup and Integration:</strong> $6,500 one time.</li>\\n<li><strong>Annual Maintenance and Support:</strong> $1,200, covering updates and ongoing support.</li>\\n</ul>\\n<p>This solution offers a robust, flexible approach to managing your web content and applications, aligning with modern web development practices while ensuring cost-effectiveness and scalability.</p>","headline":"How We Can Do This","alignment":"left","tagline":null}	\N	\N
532	533	block_richtext	6c5df396-be52-4b1c-a144-d55b229e5a34	{"content":"<p>Rabbits are a great source of environmental benefit. They help to keep grasslands and other ecosystems in check. Rabbits are herbivores, meaning they eat only plants, which helps to keep vegetation in balance. Additionally, rabbits are crucial to the food chain, providing sustenance for predators in their environment.</p>\\n<p>Rabbits also help to improve the quality of soil by digging burrows and depositing their waste in them. This helps to aerate the soil, improving its quality and allowing for better plant growth. Additionally, the waste from rabbits is a rich source of nutrients for plants and other animals in the area. This helps to keep the soil healthy and support the overall ecosystem.</p>","headline":"The Benefits of Rabbits","id":"6c5df396-be52-4b1c-a144-d55b229e5a34","alignment":"center","tagline":null}	{"content":"<p>Rabbits are a great source of environmental benefit. They help to keep grasslands and other ecosystems in check. Rabbits are herbivores, meaning they eat only plants, which helps to keep vegetation in balance. Additionally, rabbits are crucial to the food chain, providing sustenance for predators in their environment.</p>\\n<p>Rabbits also help to improve the quality of soil by digging burrows and depositing their waste in them. This helps to aerate the soil, improving its quality and allowing for better plant growth. Additionally, the waste from rabbits is a rich source of nutrients for plants and other animals in the area. This helps to keep the soil healthy and support the overall ecosystem.</p>","headline":"The Benefits of Rabbits","alignment":"center","tagline":null}	\N	\N
533	534	block_richtext	8f714990-cb45-4c6c-afa6-a49615768a4f	{"content":"<p>Our website, \\"Bunny Lovers,\\" is dedicated to all things rabbit! Our goal is to provide comprehensive information and resources for rabbit owners and enthusiasts alike. We believe that rabbits make wonderful pets and we want to help people give their furry friends the best life possible.</p>\\n<p>The team behind Bunny Lovers is made up of rabbit owners and experts who have years of experience caring for these cute and cuddly creatures. We share a passion for rabbits and their well-being, and we have combined our knowledge to create a one-stop shop for everything rabbit-related. From breed information to health advice, we aim to provide you with the most up-to-date and accurate information available.</p>\\n<p>In addition to our informative articles, we also offer a lively and supportive community where rabbit owners can connect and share their experiences. Whether you are a seasoned rabbit owner or just starting out, you are sure to find the information and support you need on our site. So, come join us and let's celebrate these amazing animals together!</p>","headline":"About Us","id":"8f714990-cb45-4c6c-afa6-a49615768a4f","alignment":"center","tagline":null}	{"content":"<p>Our website, \\"Bunny Lovers,\\" is dedicated to all things rabbit! Our goal is to provide comprehensive information and resources for rabbit owners and enthusiasts alike. We believe that rabbits make wonderful pets and we want to help people give their furry friends the best life possible.</p>\\n<p>The team behind Bunny Lovers is made up of rabbit owners and experts who have years of experience caring for these cute and cuddly creatures. We share a passion for rabbits and their well-being, and we have combined our knowledge to create a one-stop shop for everything rabbit-related. From breed information to health advice, we aim to provide you with the most up-to-date and accurate information available.</p>\\n<p>In addition to our informative articles, we also offer a lively and supportive community where rabbit owners can connect and share their experiences. Whether you are a seasoned rabbit owner or just starting out, you are sure to find the information and support you need on our site. So, come join us and let's celebrate these amazing animals together!</p>","headline":"About Us","alignment":"center","tagline":null}	\N	\N
534	535	block_richtext	9d65df9c-307f-4049-bc21-0c3a77178d91	{"content":"<p>Thank you for considering our privacy policy at XYZ Development Agency. We take your privacy very seriously and want you to know exactly how we collect, use, share, and protect your information when you visit our website or use our services.</p>\\n<h2>Information We Collect</h2>\\n<p>We collect personal information such as your name, email address, phone number, and company name when you fill out a contact form or sign up for our newsletter. We also collect non-personal information such as your IP address, browser type, and operating system when you visit our website.</p>\\n<h2>How We Use Your Information</h2>\\n<p>We use your personal information to respond to your inquiries, send you newsletters, and provide you with our services. We use non-personal information to analyze website traffic and improve our website's performance.</p>\\n<h2>Information Sharing</h2>\\n<p>We do not sell or rent your personal information to third parties. However, we may share your personal information with trusted third-party service providers who assist us in providing our services to you. We may also share your information when required by law or to protect our rights and property.</p>\\n<h2>Security</h2>\\n<p>We take appropriate measures to protect your personal information from unauthorized access, disclosure, or misuse. We use secure servers and encryption technologies to ensure the confidentiality and integrity of your information.</p>\\n<h2>Cookies and Tracking Technologies</h2>\\n<p>We use cookies and other tracking technologies to collect non-personal information about your website usage. You can disable cookies through your browser settings, but this may limit your access to certain features of our website.</p>\\n<h2>Links to Third-Party Websites</h2>\\n<p>Our website may contain links to third-party websites. We are not responsible for the privacy practices or content of those websites. We encourage you to review the privacy policies of those websites before providing any personal information.</p>\\n<h2>Changes to Our Privacy Policy</h2>\\n<p>We may update our privacy policy from time to time. We will notify you of any changes by posting the new policy on our website. Your continued use of our website or services after any changes to our privacy policy means that you agree to the updated policy.</p>\\n<h2>Contact Us</h2>\\n<p>If you have any questions or concerns about our privacy policy, please contact us at privacy@xyzdevelopment.com.</p>\\n<p>Thank you for trusting XYZ Development Agency with your personal information.</p>","headline":"We <em>protect our clients</em> like our own families","id":"9d65df9c-307f-4049-bc21-0c3a77178d91","alignment":"center","tagline":null}	{"content":"<p>Thank you for considering our privacy policy at XYZ Development Agency. We take your privacy very seriously and want you to know exactly how we collect, use, share, and protect your information when you visit our website or use our services.</p>\\n<h2>Information We Collect</h2>\\n<p>We collect personal information such as your name, email address, phone number, and company name when you fill out a contact form or sign up for our newsletter. We also collect non-personal information such as your IP address, browser type, and operating system when you visit our website.</p>\\n<h2>How We Use Your Information</h2>\\n<p>We use your personal information to respond to your inquiries, send you newsletters, and provide you with our services. We use non-personal information to analyze website traffic and improve our website's performance.</p>\\n<h2>Information Sharing</h2>\\n<p>We do not sell or rent your personal information to third parties. However, we may share your personal information with trusted third-party service providers who assist us in providing our services to you. We may also share your information when required by law or to protect our rights and property.</p>\\n<h2>Security</h2>\\n<p>We take appropriate measures to protect your personal information from unauthorized access, disclosure, or misuse. We use secure servers and encryption technologies to ensure the confidentiality and integrity of your information.</p>\\n<h2>Cookies and Tracking Technologies</h2>\\n<p>We use cookies and other tracking technologies to collect non-personal information about your website usage. You can disable cookies through your browser settings, but this may limit your access to certain features of our website.</p>\\n<h2>Links to Third-Party Websites</h2>\\n<p>Our website may contain links to third-party websites. We are not responsible for the privacy practices or content of those websites. We encourage you to review the privacy policies of those websites before providing any personal information.</p>\\n<h2>Changes to Our Privacy Policy</h2>\\n<p>We may update our privacy policy from time to time. We will notify you of any changes by posting the new policy on our website. Your continued use of our website or services after any changes to our privacy policy means that you agree to the updated policy.</p>\\n<h2>Contact Us</h2>\\n<p>If you have any questions or concerns about our privacy policy, please contact us at privacy@xyzdevelopment.com.</p>\\n<p>Thank you for trusting XYZ Development Agency with your personal information.</p>","headline":"We <em>protect our clients</em> like our own families","alignment":"center","tagline":null}	\N	\N
535	536	block_richtext	a6275645-16b7-4994-8100-8c43ca07ab06	{"content":"<p><strong>Last updated: [Date]</strong></p>\\n<p>Welcome to [Your Website Name] (\\"we\\", \\"us\\", \\"our\\"). We are committed to protecting your personal information and your right to privacy. If you have any questions or concerns about our policy, or our practices with regards to your personal information, please contact us at [Contact Information].</p>\\n<p>By using our website, [Your Website URL], you consent to the collection and use of your personal information as described in this privacy policy.</p>\\n<h2>Information We Collect</h2>\\n<p>We collect personal information that you voluntarily provide to us when registering at the website, expressing an interest in obtaining information about us or our products and services, when participating in activities on the website, or otherwise contacting us.</p>\\n<p>The personal information that we collect depends on the context of your interactions with us and the website, the choices you make, and the products and features you use. The personal information we collect can include the following:</p>\\n<ul>\\n<li>Name and Contact Data: We collect your first and last name, email address, postal address, phone number, and other similar contact data.</li>\\n<li>Credentials: We collect passwords, password hints, and similar security information used for authentication and account access.</li>\\n<li>Payment Data: We collect data necessary to process your payment if you make purchases, such as your payment instrument number (such as a credit card number), and the security code associated with your payment instrument.</li>\\n</ul>\\n<h2>How We Use Your Information</h2>\\n<p>We use personal information collected via our website for a variety of business purposes described below:</p>\\n<ul>\\n<li>To provide and manage our services.</li>\\n<li>To process your transactions.</li>\\n<li>To send you administrative information.</li>\\n<li>To respond to your inquiries and provide customer service.</li>\\n<li>To send you marketing and promotional communications.</li>\\n<li>To enforce our terms, conditions, and policies.</li>\\n</ul>\\n<h2>Sharing Your Information</h2>\\n<p>We may share or disclose your personal information in the following situations:</p>\\n<ul>\\n<li>With Service Providers: We may share your personal information with third-party service providers to monitor and analyze the use of our service, to contact you.</li>\\n<li>For Business Transfers: We may share or transfer your personal information in connection with, or during negotiations of, any merger, sale of company assets, financing, or acquisition of all or a portion of our business to another company.</li>\\n<li>With Affiliates: We may share your information with our affiliates, in which case we will require those affiliates to honor this privacy policy.</li>\\n</ul>\\n<h2>Retention of Your Information</h2>\\n<p>We will retain your personal information only for as long as is necessary for the purposes set out in this privacy policy, and to the extent necessary to comply with our legal obligations, resolve disputes, and enforce our legal agreements and policies.</p>\\n<h2>Security of Your Information</h2>\\n<p>We use administrative, technical, and physical security measures to help protect your personal information. While we have taken reasonable steps to secure the personal information you provide to us, please be aware that despite our efforts, no security measures are perfect or impenetrable, and no method of data transmission can be guaranteed against any interception or other type of misuse.</p>\\n<h2>Your Privacy Rights</h2>\\n<p>Depending on your location, you may have certain rights under applicable data protection laws. These may include the right (i) to request access and obtain a copy of your personal information, (ii) to request rectification or erasure; (iii) to restrict the processing of your personal information; and (iv) if applicable, to data portability.</p>\\n<h2>Updates to Our Privacy Policy</h2>\\n<p>We may update our privacy policy from time to time. The updated version will be indicated by an updated \\"Revised\\" date and the updated version will be effective as soon as it is accessible. We encourage you to review this privacy policy frequently to be informed of how we are protecting your information.</p>","headline":"We take privacy very seriously","id":"a6275645-16b7-4994-8100-8c43ca07ab06","alignment":"center","tagline":null}	{"content":"<p><strong>Last updated: [Date]</strong></p>\\n<p>Welcome to [Your Website Name] (\\"we\\", \\"us\\", \\"our\\"). We are committed to protecting your personal information and your right to privacy. If you have any questions or concerns about our policy, or our practices with regards to your personal information, please contact us at [Contact Information].</p>\\n<p>By using our website, [Your Website URL], you consent to the collection and use of your personal information as described in this privacy policy.</p>\\n<h2>Information We Collect</h2>\\n<p>We collect personal information that you voluntarily provide to us when registering at the website, expressing an interest in obtaining information about us or our products and services, when participating in activities on the website, or otherwise contacting us.</p>\\n<p>The personal information that we collect depends on the context of your interactions with us and the website, the choices you make, and the products and features you use. The personal information we collect can include the following:</p>\\n<ul>\\n<li>Name and Contact Data: We collect your first and last name, email address, postal address, phone number, and other similar contact data.</li>\\n<li>Credentials: We collect passwords, password hints, and similar security information used for authentication and account access.</li>\\n<li>Payment Data: We collect data necessary to process your payment if you make purchases, such as your payment instrument number (such as a credit card number), and the security code associated with your payment instrument.</li>\\n</ul>\\n<h2>How We Use Your Information</h2>\\n<p>We use personal information collected via our website for a variety of business purposes described below:</p>\\n<ul>\\n<li>To provide and manage our services.</li>\\n<li>To process your transactions.</li>\\n<li>To send you administrative information.</li>\\n<li>To respond to your inquiries and provide customer service.</li>\\n<li>To send you marketing and promotional communications.</li>\\n<li>To enforce our terms, conditions, and policies.</li>\\n</ul>\\n<h2>Sharing Your Information</h2>\\n<p>We may share or disclose your personal information in the following situations:</p>\\n<ul>\\n<li>With Service Providers: We may share your personal information with third-party service providers to monitor and analyze the use of our service, to contact you.</li>\\n<li>For Business Transfers: We may share or transfer your personal information in connection with, or during negotiations of, any merger, sale of company assets, financing, or acquisition of all or a portion of our business to another company.</li>\\n<li>With Affiliates: We may share your information with our affiliates, in which case we will require those affiliates to honor this privacy policy.</li>\\n</ul>\\n<h2>Retention of Your Information</h2>\\n<p>We will retain your personal information only for as long as is necessary for the purposes set out in this privacy policy, and to the extent necessary to comply with our legal obligations, resolve disputes, and enforce our legal agreements and policies.</p>\\n<h2>Security of Your Information</h2>\\n<p>We use administrative, technical, and physical security measures to help protect your personal information. While we have taken reasonable steps to secure the personal information you provide to us, please be aware that despite our efforts, no security measures are perfect or impenetrable, and no method of data transmission can be guaranteed against any interception or other type of misuse.</p>\\n<h2>Your Privacy Rights</h2>\\n<p>Depending on your location, you may have certain rights under applicable data protection laws. These may include the right (i) to request access and obtain a copy of your personal information, (ii) to request rectification or erasure; (iii) to restrict the processing of your personal information; and (iv) if applicable, to data portability.</p>\\n<h2>Updates to Our Privacy Policy</h2>\\n<p>We may update our privacy policy from time to time. The updated version will be indicated by an updated \\"Revised\\" date and the updated version will be effective as soon as it is accessible. We encourage you to review this privacy policy frequently to be informed of how we are protecting your information.</p>","headline":"We take privacy very seriously","alignment":"center","tagline":null}	\N	\N
536	537	block_richtext	b0c8cec2-acc5-46ad-9044-8a6602000c3e	{"content":"<p class=\\"project-block__block-element\\">Upon agreement on the proposal details, we'll commence with the project kick-off. This phase will involve an in-depth discussion of your specific needs, followed by the development of a detailed project plan. We believe in maintaining transparency and open communication throughout the project to ensure all your expectations are met.</p>\\n<p class=\\"project-block__block-element\\">We look forward to an opportunity to work together and deliver a software solution that aligns with your vision and drives your business growth. Thank you for considering our proposal.</p>","headline":"Next Steps","id":"b0c8cec2-acc5-46ad-9044-8a6602000c3e","alignment":"center","tagline":null}	{"content":"<p class=\\"project-block__block-element\\">Upon agreement on the proposal details, we'll commence with the project kick-off. This phase will involve an in-depth discussion of your specific needs, followed by the development of a detailed project plan. We believe in maintaining transparency and open communication throughout the project to ensure all your expectations are met.</p>\\n<p class=\\"project-block__block-element\\">We look forward to an opportunity to work together and deliver a software solution that aligns with your vision and drives your business growth. Thank you for considering our proposal.</p>","headline":"Next Steps","alignment":"center","tagline":null}	\N	\N
537	538	form_fields	0f3deba1-9d6b-44a0-aa87-a9b38e834beb	{"id":"0f3deba1-9d6b-44a0-aa87-a9b38e834beb","name":"first-name","type":"text","label":"First Name","placeholder":null,"help":null,"validation":null,"width":"100","choices":null,"form":"5da3d356-d818-434f-b225-db35c418bbb6","sort":1,"required":false}	{"name":"first-name","type":"text","label":"First Name","placeholder":null,"help":null,"validation":null,"width":"100","choices":null,"form":"5da3d356-d818-434f-b225-db35c418bbb6","sort":1,"required":false}	\N	\N
538	539	form_fields	56c64efd-520f-4578-acca-e0565e247681	{"id":"56c64efd-520f-4578-acca-e0565e247681","name":"comments","type":"textarea","label":"How can we help?","placeholder":"Give us the scoop right here.","help":null,"validation":null,"width":"100","choices":null,"form":"36493b64-2bad-4c58-9d70-785ccb12ee26","sort":5,"required":false}	{"name":"comments","type":"textarea","label":"How can we help?","placeholder":"Give us the scoop right here.","help":null,"validation":null,"width":"100","choices":null,"form":"36493b64-2bad-4c58-9d70-785ccb12ee26","sort":5,"required":false}	\N	\N
539	540	form_fields	a3d87bc0-f143-44ca-bea0-9eaf56b67783	{"id":"a3d87bc0-f143-44ca-bea0-9eaf56b67783","name":"email","type":"text","label":"Email","placeholder":"john@example.com","help":null,"validation":null,"width":"100","choices":null,"form":"36493b64-2bad-4c58-9d70-785ccb12ee26","sort":3,"required":true}	{"name":"email","type":"text","label":"Email","placeholder":"john@example.com","help":null,"validation":null,"width":"100","choices":null,"form":"36493b64-2bad-4c58-9d70-785ccb12ee26","sort":3,"required":true}	\N	\N
540	541	form_fields	a5222af8-f9a2-4d1a-9713-7ce0e2d5edc5	{"id":"a5222af8-f9a2-4d1a-9713-7ce0e2d5edc5","name":"department","type":"select","label":"Which team would you like to speak with?","placeholder":null,"help":null,"validation":null,"width":"100","choices":[{"text":"Sales","value":"sales"},{"text":"Support","value":"support"}],"form":"36493b64-2bad-4c58-9d70-785ccb12ee26","sort":4,"required":false}	{"name":"department","type":"select","label":"Which team would you like to speak with?","placeholder":null,"help":null,"validation":null,"width":"100","choices":[{"text":"Sales","value":"sales"},{"text":"Support","value":"support"}],"form":"36493b64-2bad-4c58-9d70-785ccb12ee26","sort":4,"required":false}	\N	\N
541	542	form_fields	bbc7b1c6-304e-4ee1-9afa-c5cffda6af27	{"id":"bbc7b1c6-304e-4ee1-9afa-c5cffda6af27","name":"last-name","type":"text","label":"Last Name","placeholder":"Doe","help":null,"validation":null,"width":"50","choices":null,"form":"36493b64-2bad-4c58-9d70-785ccb12ee26","sort":2,"required":true}	{"name":"last-name","type":"text","label":"Last Name","placeholder":"Doe","help":null,"validation":null,"width":"50","choices":null,"form":"36493b64-2bad-4c58-9d70-785ccb12ee26","sort":2,"required":true}	\N	\N
542	543	form_fields	d37bc00f-bfb5-4496-85c3-70190b21b707	{"id":"d37bc00f-bfb5-4496-85c3-70190b21b707","name":"email","type":"text","label":"Email","placeholder":null,"help":null,"validation":null,"width":"100","choices":null,"form":"5da3d356-d818-434f-b225-db35c418bbb6","sort":2,"required":false}	{"name":"email","type":"text","label":"Email","placeholder":null,"help":null,"validation":null,"width":"100","choices":null,"form":"5da3d356-d818-434f-b225-db35c418bbb6","sort":2,"required":false}	\N	\N
543	544	form_fields	eef0eb77-ecab-4fba-9903-c46d6ad6d85b	{"id":"eef0eb77-ecab-4fba-9903-c46d6ad6d85b","name":"first-name","type":"text","label":"First Name","placeholder":"John","help":null,"validation":null,"width":"50","choices":null,"form":"36493b64-2bad-4c58-9d70-785ccb12ee26","sort":1,"required":true}	{"name":"first-name","type":"text","label":"First Name","placeholder":"John","help":null,"validation":null,"width":"50","choices":null,"form":"36493b64-2bad-4c58-9d70-785ccb12ee26","sort":1,"required":true}	\N	\N
544	545	forms	36493b64-2bad-4c58-9d70-785ccb12ee26	{"id":"36493b64-2bad-4c58-9d70-785ccb12ee26","on_success":"message","sort":null,"submit_label":"Get Started","success_message":null,"title":"Contact Us","success_redirect_url":null,"is_active":true,"emails":null,"fields":["eef0eb77-ecab-4fba-9903-c46d6ad6d85b","bbc7b1c6-304e-4ee1-9afa-c5cffda6af27","a3d87bc0-f143-44ca-bea0-9eaf56b67783","a5222af8-f9a2-4d1a-9713-7ce0e2d5edc5","56c64efd-520f-4578-acca-e0565e247681"],"submissions":[]}	{"on_success":"message","sort":null,"submit_label":"Get Started","success_message":null,"title":"Contact Us","success_redirect_url":null,"is_active":true,"emails":null}	\N	\N
545	546	form_submissions	133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0	{"id":"133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0","timestamp":"2025-01-14T10:43:15.497Z","form":"5da3d356-d818-434f-b225-db35c418bbb6","values":[]}	{"form":"5da3d356-d818-434f-b225-db35c418bbb6"}	547	\N
546	547	form_submissions	3805e2c0-ebba-4070-a1b3-b39ba1b4932b	{"id":"3805e2c0-ebba-4070-a1b3-b39ba1b4932b","timestamp":"2025-01-14T10:43:15.498Z","form":"5da3d356-d818-434f-b225-db35c418bbb6","values":[]}	{"form":"5da3d356-d818-434f-b225-db35c418bbb6"}	547	\N
562	563	navigation_items	192a490a-bbb9-4794-b82f-619a01463723	{"id":"192a490a-bbb9-4794-b82f-619a01463723","navigation":"main","page":null,"parent":null,"sort":null,"title":null,"type":null,"url":null,"post":null,"children":[]}	{"navigation":"main"}	564	\N
563	564	navigation_items	0ca39155-c212-4b6e-8156-5a4322731c07	{"id":"0ca39155-c212-4b6e-8156-5a4322731c07","navigation":"main","page":null,"parent":null,"sort":null,"title":null,"type":null,"url":null,"post":null,"children":[]}	{"navigation":"main"}	564	\N
547	548	forms	5da3d356-d818-434f-b225-db35c418bbb6	{"id":"5da3d356-d818-434f-b225-db35c418bbb6","on_success":"message","sort":null,"submit_label":"Subscribe","success_message":"Thanks for subscribing to our newsletter! Please check your inbox for confirmation.","title":"Newsletter","success_redirect_url":null,"is_active":true,"emails":[{"to":["sales@example.com"],"subject":"Newsletter Signup","message":"<h2>Newsletter Sign Up</h2>\\n<table style=\\"border-collapse: collapse; width: 100%; height: 122.227px;\\" border=\\"1\\"><colgroup><col style=\\"width: 46.0494%;\\"><col style=\\"width: 53.9369%;\\"></colgroup>\\n<tbody>\\n<tr style=\\"height: 61.1094px;\\">\\n<td style=\\"height: 61.1094px;\\"><strong>Name</strong></td>\\n<td style=\\"height: 61.1094px;\\">{# first-name #}</td>\\n</tr>\\n<tr style=\\"height: 61.1172px;\\">\\n<td style=\\"height: 61.1172px;\\"><strong>Email</strong></td>\\n<td style=\\"height: 61.1172px;\\">{# email #}</td>\\n</tr>\\n</tbody>\\n</table>"}],"fields":["0f3deba1-9d6b-44a0-aa87-a9b38e834beb","d37bc00f-bfb5-4496-85c3-70190b21b707"],"submissions":["133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0","3805e2c0-ebba-4070-a1b3-b39ba1b4932b"]}	{"on_success":"message","sort":null,"submit_label":"Subscribe","success_message":"Thanks for subscribing to our newsletter! Please check your inbox for confirmation.","title":"Newsletter","success_redirect_url":null,"is_active":true,"emails":[{"to":["sales@example.com"],"subject":"Newsletter Signup","message":"<h2>Newsletter Sign Up</h2>\\n<table style=\\"border-collapse: collapse; width: 100%; height: 122.227px;\\" border=\\"1\\"><colgroup><col style=\\"width: 46.0494%;\\"><col style=\\"width: 53.9369%;\\"></colgroup>\\n<tbody>\\n<tr style=\\"height: 61.1094px;\\">\\n<td style=\\"height: 61.1094px;\\"><strong>Name</strong></td>\\n<td style=\\"height: 61.1094px;\\">{# first-name #}</td>\\n</tr>\\n<tr style=\\"height: 61.1172px;\\">\\n<td style=\\"height: 61.1172px;\\"><strong>Email</strong></td>\\n<td style=\\"height: 61.1172px;\\">{# email #}</td>\\n</tr>\\n</tbody>\\n</table>"}]}	\N	\N
550	551	form_submissions	133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0	{"id":"133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0","timestamp":"2024-12-19T15:31:25.730Z","form":"5da3d356-d818-434f-b225-db35c418bbb6","values":["6883038b-15bf-4635-8216-a362e62e7ca2","63df3a8a-75dd-4ea5-94d6-cad8c0820ef4"]}	{"timestamp":"2024-12-19T15:31:25.730Z","form":"5da3d356-d818-434f-b225-db35c418bbb6"}	\N	\N
548	549	form_submission_values	6883038b-15bf-4635-8216-a362e62e7ca2	{"id":"6883038b-15bf-4635-8216-a362e62e7ca2","form_submission":"133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0","field":null,"value":null,"sort":null,"file":null}	{"form_submission":"133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0"}	550	\N
549	550	form_submission_values	63df3a8a-75dd-4ea5-94d6-cad8c0820ef4	{"id":"63df3a8a-75dd-4ea5-94d6-cad8c0820ef4","form_submission":"133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0","field":null,"value":null,"sort":null,"file":null}	{"form_submission":"133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0"}	550	\N
553	554	form_submissions	3805e2c0-ebba-4070-a1b3-b39ba1b4932b	{"id":"3805e2c0-ebba-4070-a1b3-b39ba1b4932b","timestamp":"2024-09-24T16:31:02.467Z","form":"5da3d356-d818-434f-b225-db35c418bbb6","values":["28f8820f-def4-4b3b-b35d-b79fc7f731a1","54e554ef-82e7-463e-8542-624352cdb5ca"]}	{"timestamp":"2024-09-24T16:31:02.467Z","form":"5da3d356-d818-434f-b225-db35c418bbb6"}	\N	\N
551	552	form_submission_values	28f8820f-def4-4b3b-b35d-b79fc7f731a1	{"id":"28f8820f-def4-4b3b-b35d-b79fc7f731a1","form_submission":"3805e2c0-ebba-4070-a1b3-b39ba1b4932b","field":null,"value":null,"sort":null,"file":null}	{"form_submission":"3805e2c0-ebba-4070-a1b3-b39ba1b4932b"}	553	\N
552	553	form_submission_values	54e554ef-82e7-463e-8542-624352cdb5ca	{"id":"54e554ef-82e7-463e-8542-624352cdb5ca","form_submission":"3805e2c0-ebba-4070-a1b3-b39ba1b4932b","field":null,"value":null,"sort":null,"file":null}	{"form_submission":"3805e2c0-ebba-4070-a1b3-b39ba1b4932b"}	553	\N
554	555	form_submission_values	28f8820f-def4-4b3b-b35d-b79fc7f731a1	{"id":"28f8820f-def4-4b3b-b35d-b79fc7f731a1","form_submission":"3805e2c0-ebba-4070-a1b3-b39ba1b4932b","field":"0f3deba1-9d6b-44a0-aa87-a9b38e834beb","value":"Steve","sort":1,"file":null}	{"form_submission":"3805e2c0-ebba-4070-a1b3-b39ba1b4932b","field":"0f3deba1-9d6b-44a0-aa87-a9b38e834beb","value":"Steve","sort":1,"file":null}	\N	\N
555	556	form_submission_values	54e554ef-82e7-463e-8542-624352cdb5ca	{"id":"54e554ef-82e7-463e-8542-624352cdb5ca","form_submission":"3805e2c0-ebba-4070-a1b3-b39ba1b4932b","field":"a3d87bc0-f143-44ca-bea0-9eaf56b67783","value":"steve@example.com","sort":2,"file":null}	{"form_submission":"3805e2c0-ebba-4070-a1b3-b39ba1b4932b","field":"a3d87bc0-f143-44ca-bea0-9eaf56b67783","value":"steve@example.com","sort":2,"file":null}	\N	\N
556	557	form_submission_values	63df3a8a-75dd-4ea5-94d6-cad8c0820ef4	{"id":"63df3a8a-75dd-4ea5-94d6-cad8c0820ef4","form_submission":"133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0","field":"d37bc00f-bfb5-4496-85c3-70190b21b707","value":"test@example.com","sort":null,"file":null}	{"form_submission":"133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0","field":"d37bc00f-bfb5-4496-85c3-70190b21b707","value":"test@example.com","sort":null,"file":null}	\N	\N
557	558	form_submission_values	6883038b-15bf-4635-8216-a362e62e7ca2	{"id":"6883038b-15bf-4635-8216-a362e62e7ca2","form_submission":"133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0","field":"0f3deba1-9d6b-44a0-aa87-a9b38e834beb","value":"Mistral AI","sort":null,"file":null}	{"form_submission":"133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0","field":"0f3deba1-9d6b-44a0-aa87-a9b38e834beb","value":"Mistral AI","sort":null,"file":null}	\N	\N
561	562	navigation	footer	{"id":"footer","title":"Footer Navigation","is_active":true,"items":["dc0870f8-e316-48b0-b34d-ca5c4394344c","e096f25c-a549-4fe5-a284-17b0a347037a","c732b100-1f5a-4ce1-8fde-b0072d09623f"]}	{"title":"Footer Navigation","is_active":true}	\N	\N
558	559	navigation_items	dc0870f8-e316-48b0-b34d-ca5c4394344c	{"id":"dc0870f8-e316-48b0-b34d-ca5c4394344c","navigation":"footer","page":null,"parent":null,"sort":null,"title":null,"type":null,"url":null,"post":null,"children":[]}	{"navigation":"footer"}	561	\N
559	560	navigation_items	e096f25c-a549-4fe5-a284-17b0a347037a	{"id":"e096f25c-a549-4fe5-a284-17b0a347037a","navigation":"footer","page":null,"parent":null,"sort":null,"title":null,"type":null,"url":null,"post":null,"children":[]}	{"navigation":"footer"}	561	\N
560	561	navigation_items	c732b100-1f5a-4ce1-8fde-b0072d09623f	{"id":"c732b100-1f5a-4ce1-8fde-b0072d09623f","navigation":"footer","page":null,"parent":null,"sort":null,"title":null,"type":null,"url":null,"post":null,"children":[]}	{"navigation":"footer"}	561	\N
567	568	navigation_items	0ca39155-c212-4b6e-8156-5a4322731c07	{"id":"0ca39155-c212-4b6e-8156-5a4322731c07","navigation":"main","page":null,"parent":null,"sort":2,"title":"About","type":"group","url":null,"post":null,"children":["28fde01b-647b-4151-96e5-6d876d3f3329","717b30fd-1bf6-46eb-a0cd-81923c17fcf6"]}	{"navigation":"main","page":null,"parent":null,"sort":2,"title":"About","type":"group","url":null,"post":null}	\N	\N
565	566	navigation_items	28fde01b-647b-4151-96e5-6d876d3f3329	{"id":"28fde01b-647b-4151-96e5-6d876d3f3329","navigation":null,"page":null,"parent":"0ca39155-c212-4b6e-8156-5a4322731c07","sort":null,"title":null,"type":null,"url":null,"post":null,"children":[]}	{"parent":"0ca39155-c212-4b6e-8156-5a4322731c07"}	567	\N
566	567	navigation_items	717b30fd-1bf6-46eb-a0cd-81923c17fcf6	{"id":"717b30fd-1bf6-46eb-a0cd-81923c17fcf6","navigation":null,"page":null,"parent":"0ca39155-c212-4b6e-8156-5a4322731c07","sort":null,"title":null,"type":null,"url":null,"post":null,"children":[]}	{"parent":"0ca39155-c212-4b6e-8156-5a4322731c07"}	567	\N
568	569	navigation_items	192a490a-bbb9-4794-b82f-619a01463723	{"id":"192a490a-bbb9-4794-b82f-619a01463723","navigation":"main","page":"9821199f-4b05-49fb-8407-fbfe9b866ef0","parent":null,"sort":1,"title":"Contact Us","type":"page","url":null,"post":null,"children":[]}	{"navigation":"main","page":"9821199f-4b05-49fb-8407-fbfe9b866ef0","parent":null,"sort":1,"title":"Contact Us","type":"page","url":null,"post":null}	\N	\N
569	570	navigation_items	28fde01b-647b-4151-96e5-6d876d3f3329	{"id":"28fde01b-647b-4151-96e5-6d876d3f3329","navigation":null,"page":"93023385-f574-4040-9ead-42b717db2015","parent":"0ca39155-c212-4b6e-8156-5a4322731c07","sort":1,"title":"Privacy Policy","type":"page","url":null,"post":null,"children":[]}	{"navigation":null,"page":"93023385-f574-4040-9ead-42b717db2015","parent":"0ca39155-c212-4b6e-8156-5a4322731c07","sort":1,"title":"Privacy Policy","type":"page","url":null,"post":null}	\N	\N
570	571	navigation_items	717b30fd-1bf6-46eb-a0cd-81923c17fcf6	{"id":"717b30fd-1bf6-46eb-a0cd-81923c17fcf6","navigation":null,"page":"1ce02298-817a-46bc-ac92-6a6c10c20f88","parent":"0ca39155-c212-4b6e-8156-5a4322731c07","sort":2,"title":"Blog","type":"page","url":null,"post":null,"children":[]}	{"navigation":null,"page":"1ce02298-817a-46bc-ac92-6a6c10c20f88","parent":"0ca39155-c212-4b6e-8156-5a4322731c07","sort":2,"title":"Blog","type":"page","url":null,"post":null}	\N	\N
571	572	navigation_items	c732b100-1f5a-4ce1-8fde-b0072d09623f	{"id":"c732b100-1f5a-4ce1-8fde-b0072d09623f","navigation":"footer","page":"1ce02298-817a-46bc-ac92-6a6c10c20f88","parent":null,"sort":5,"title":"Blog","type":"page","url":"/posts","post":null,"children":[]}	{"navigation":"footer","page":"1ce02298-817a-46bc-ac92-6a6c10c20f88","parent":null,"sort":5,"title":"Blog","type":"page","url":"/posts","post":null}	\N	\N
572	573	navigation_items	dc0870f8-e316-48b0-b34d-ca5c4394344c	{"id":"dc0870f8-e316-48b0-b34d-ca5c4394344c","navigation":"footer","page":"93023385-f574-4040-9ead-42b717db2015","parent":null,"sort":1,"title":"Privacy Policy","type":"page","url":null,"post":null,"children":[]}	{"navigation":"footer","page":"93023385-f574-4040-9ead-42b717db2015","parent":null,"sort":1,"title":"Privacy Policy","type":"page","url":null,"post":null}	\N	\N
573	574	navigation_items	e096f25c-a549-4fe5-a284-17b0a347037a	{"id":"e096f25c-a549-4fe5-a284-17b0a347037a","navigation":"footer","page":"9821199f-4b05-49fb-8407-fbfe9b866ef0","parent":null,"sort":2,"title":"Contact Us","type":"page","url":null,"post":null,"children":[]}	{"navigation":"footer","page":"9821199f-4b05-49fb-8407-fbfe9b866ef0","parent":null,"sort":2,"title":"Contact Us","type":"page","url":null,"post":null}	\N	\N
574	575	page_blocks	1f774f44-3e33-4b0f-93f4-fdd6df898438	{"id":"1f774f44-3e33-4b0f-93f4-fdd6df898438","sort":1,"page":"9821199f-4b05-49fb-8407-fbfe9b866ef0","item":"185eca12-4af1-4a1c-bfd7-4bc2fab52097","collection":"block_form","hide_block":false,"background":"light"}	{"sort":1,"page":"9821199f-4b05-49fb-8407-fbfe9b866ef0","item":"185eca12-4af1-4a1c-bfd7-4bc2fab52097","collection":"block_form","hide_block":false,"background":"light"}	\N	\N
575	576	page_blocks	b4d48d5a-0450-4e8c-8c5b-198e7063a10f	{"id":"b4d48d5a-0450-4e8c-8c5b-198e7063a10f","sort":1,"page":"636dc283-e634-4d5d-aada-e6743db46036","item":"d81ab264-b2be-4077-84e7-b1406e74d9c3","collection":"block_hero","hide_block":false,"background":"light"}	{"sort":1,"page":"636dc283-e634-4d5d-aada-e6743db46036","item":"d81ab264-b2be-4077-84e7-b1406e74d9c3","collection":"block_hero","hide_block":false,"background":"light"}	\N	\N
576	577	page_blocks	bc826e30-4988-4035-98bd-5ffc4799e5fc	{"id":"bc826e30-4988-4035-98bd-5ffc4799e5fc","sort":1,"page":"93023385-f574-4040-9ead-42b717db2015","item":"a6275645-16b7-4994-8100-8c43ca07ab06","collection":"block_richtext","hide_block":false,"background":"light"}	{"sort":1,"page":"93023385-f574-4040-9ead-42b717db2015","item":"a6275645-16b7-4994-8100-8c43ca07ab06","collection":"block_richtext","hide_block":false,"background":"light"}	\N	\N
577	578	page_blocks	090e286c-3dfe-4638-89d9-09b2e0caf2ea	{"id":"090e286c-3dfe-4638-89d9-09b2e0caf2ea","sort":1,"page":null,"item":"93693278-93bc-4a70-a54c-bbbf1e0037d7","collection":"block_hero","hide_block":false,"background":"light"}	{"sort":1,"page":null,"item":"93693278-93bc-4a70-a54c-bbbf1e0037d7","collection":"block_hero","hide_block":false,"background":"light"}	\N	\N
578	579	page_blocks	45227f61-5ff1-431c-8dee-1a50d369325f	{"id":"45227f61-5ff1-431c-8dee-1a50d369325f","sort":1,"page":"1ce02298-817a-46bc-ac92-6a6c10c20f88","item":"060b632d-d70d-4db1-8b95-4fbab7a52ae8","collection":"block_posts","hide_block":false,"background":"light"}	{"sort":1,"page":"1ce02298-817a-46bc-ac92-6a6c10c20f88","item":"060b632d-d70d-4db1-8b95-4fbab7a52ae8","collection":"block_posts","hide_block":false,"background":"light"}	\N	\N
579	580	page_blocks	2b017efb-ce7c-4b90-9f59-a39236ffe571	{"id":"2b017efb-ce7c-4b90-9f59-a39236ffe571","sort":2,"page":"1ce02298-817a-46bc-ac92-6a6c10c20f88","item":"3e262b2d-48fc-4816-b5e8-c991817d56fc","collection":"block_form","hide_block":false,"background":"light"}	{"sort":2,"page":"1ce02298-817a-46bc-ac92-6a6c10c20f88","item":"3e262b2d-48fc-4816-b5e8-c991817d56fc","collection":"block_form","hide_block":false,"background":"light"}	\N	\N
580	581	page_blocks	0ff1d6c4-ff77-46c6-ad02-f9ae31484505	{"id":"0ff1d6c4-ff77-46c6-ad02-f9ae31484505","sort":2,"page":"2a62887e-2384-4bd2-a919-7665d85fed07","item":"1134799b-3fd1-47ea-963f-13d8ac1b9e3a","collection":"block_richtext","hide_block":false,"background":"light"}	{"sort":2,"page":"2a62887e-2384-4bd2-a919-7665d85fed07","item":"1134799b-3fd1-47ea-963f-13d8ac1b9e3a","collection":"block_richtext","hide_block":false,"background":"light"}	\N	\N
581	582	page_blocks	2d9abe8f-a7ad-480d-8fc7-603c712e2f40	{"id":"2d9abe8f-a7ad-480d-8fc7-603c712e2f40","sort":2,"page":"636dc283-e634-4d5d-aada-e6743db46036","item":"129625db-433f-4104-9922-3b803ba4599d","collection":"block_richtext","hide_block":false,"background":"light"}	{"sort":2,"page":"636dc283-e634-4d5d-aada-e6743db46036","item":"129625db-433f-4104-9922-3b803ba4599d","collection":"block_richtext","hide_block":false,"background":"light"}	\N	\N
582	583	page_blocks	529e6408-7372-4195-b82d-e444c06ac492	{"id":"529e6408-7372-4195-b82d-e444c06ac492","sort":3,"page":"636dc283-e634-4d5d-aada-e6743db46036","item":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","collection":"block_gallery","hide_block":false,"background":"dark"}	{"sort":3,"page":"636dc283-e634-4d5d-aada-e6743db46036","item":"34fdcf0e-cc5d-4c40-b61f-4f0a5e167306","collection":"block_gallery","hide_block":false,"background":"dark"}	\N	\N
583	584	page_blocks	ed613af3-b584-47e7-9584-7d6d4d87eaf5	{"id":"ed613af3-b584-47e7-9584-7d6d4d87eaf5","sort":3,"page":null,"item":"7b5e5649-40be-4f54-a2fb-b021a520645d","collection":"block_gallery","hide_block":false,"background":"light"}	{"sort":3,"page":null,"item":"7b5e5649-40be-4f54-a2fb-b021a520645d","collection":"block_gallery","hide_block":false,"background":"light"}	\N	\N
584	585	page_blocks	39d02b18-18d2-4c29-9268-038f72ea05fe	{"id":"39d02b18-18d2-4c29-9268-038f72ea05fe","sort":4,"page":"636dc283-e634-4d5d-aada-e6743db46036","item":"48cf2543-15e0-454f-9b31-cbf3c2406712","collection":"block_pricing","hide_block":false,"background":"light"}	{"sort":4,"page":"636dc283-e634-4d5d-aada-e6743db46036","item":"48cf2543-15e0-454f-9b31-cbf3c2406712","collection":"block_pricing","hide_block":false,"background":"light"}	\N	\N
585	586	page_blocks	7e1ce212-3f8a-43b4-aff7-131bf4241e30	{"id":"7e1ce212-3f8a-43b4-aff7-131bf4241e30","sort":5,"page":"636dc283-e634-4d5d-aada-e6743db46036","item":"1419faec-e263-431c-bd5f-a57f394c39f6","collection":"block_form","hide_block":false,"background":"light"}	{"sort":5,"page":"636dc283-e634-4d5d-aada-e6743db46036","item":"1419faec-e263-431c-bd5f-a57f394c39f6","collection":"block_form","hide_block":false,"background":"light"}	\N	\N
586	587	pages	636dc283-e634-4d5d-aada-e6743db46036	{"id":"636dc283-e634-4d5d-aada-e6743db46036","sort":1,"title":"Home ","permalink":"/","description":"Directus is a great choice for your headless CMS.","status":"published","published_at":"2024-09-01T16:00:00.000Z","blocks":["b4d48d5a-0450-4e8c-8c5b-198e7063a10f","2d9abe8f-a7ad-480d-8fc7-603c712e2f40","529e6408-7372-4195-b82d-e444c06ac492","39d02b18-18d2-4c29-9268-038f72ea05fe","7e1ce212-3f8a-43b4-aff7-131bf4241e30"]}	{"sort":1,"title":"Home ","permalink":"/","description":"Directus is a great choice for your headless CMS.","status":"published","published_at":"2024-09-01T16:00:00.000Z"}	\N	\N
587	588	pages	1ce02298-817a-46bc-ac92-6a6c10c20f88	{"id":"1ce02298-817a-46bc-ac92-6a6c10c20f88","sort":2,"title":"Blog","permalink":"/blog","description":null,"status":"published","published_at":"2024-09-01T16:00:00.000Z","blocks":["45227f61-5ff1-431c-8dee-1a50d369325f","2b017efb-ce7c-4b90-9f59-a39236ffe571"]}	{"sort":2,"title":"Blog","permalink":"/blog","description":null,"status":"published","published_at":"2024-09-01T16:00:00.000Z"}	\N	\N
588	589	pages	9821199f-4b05-49fb-8407-fbfe9b866ef0	{"id":"9821199f-4b05-49fb-8407-fbfe9b866ef0","sort":3,"title":"Contact","permalink":"/contact","description":null,"status":"published","published_at":"2024-07-01T16:00:00.000Z","blocks":["1f774f44-3e33-4b0f-93f4-fdd6df898438"]}	{"sort":3,"title":"Contact","permalink":"/contact","description":null,"status":"published","published_at":"2024-07-01T16:00:00.000Z"}	\N	\N
589	590	pages	2a62887e-2384-4bd2-a919-7665d85fed07	{"id":"2a62887e-2384-4bd2-a919-7665d85fed07","sort":4,"title":"About Us","permalink":"/about-us","description":null,"status":"published","published_at":"2024-12-01T17:00:00.000Z","blocks":["0ff1d6c4-ff77-46c6-ad02-f9ae31484505"]}	{"sort":4,"title":"About Us","permalink":"/about-us","description":null,"status":"published","published_at":"2024-12-01T17:00:00.000Z"}	\N	\N
590	591	pages	93023385-f574-4040-9ead-42b717db2015	{"id":"93023385-f574-4040-9ead-42b717db2015","sort":5,"title":"Privacy Policy","permalink":"/privacy-policy","description":null,"status":"published","published_at":"2024-05-01T16:00:00.000Z","blocks":["bc826e30-4988-4035-98bd-5ffc4799e5fc"]}	{"sort":5,"title":"Privacy Policy","permalink":"/privacy-policy","description":null,"status":"published","published_at":"2024-05-01T16:00:00.000Z"}	\N	\N
591	592	posts	c96b64b4-9567-46f6-8eb5-ac2f37c4918d	{"content":"<p>Rabbit grooming is an essential aspect of pet care that ensures the overall health, happiness, and well-being of your furry friend. Regular grooming not only keeps your bunny looking their best but also helps to prevent health issues, strengthens the bond between you and your pet, and maintains a clean environment. In this blog post, we'll explore some essential rabbit grooming tips and techniques to help you keep your bunny looking and feeling their best.</p>\\n<h2>1. Brushing</h2>\\n<p>One of the most critical aspects of rabbit grooming is regular brushing. Rabbits have a thick, soft coat that can easily become matted, tangled, or accumulate excess hair. This is especially important during the shedding season when rabbits lose their fur.</p>\\n<p>To brush your rabbit, use a soft-bristle brush or a comb specifically designed for rabbits. Gently brush in the direction of the fur growth, taking extra care around sensitive areas like the face, ears, and belly. Brushing should be done at least once a week, or more frequently during shedding season.</p>\\n<h2>2. Nail Trimming</h2>\\n<p>Just like humans, rabbits need their nails trimmed regularly to prevent overgrowth and potential injury. Rabbit nails can become sharp and curl, making it difficult for them to move and causing discomfort.</p>\\n<p>To trim your rabbit's nails, use a pair of small animal nail clippers. Hold your rabbit securely, but gently, and expose the nail by gently pressing on the surrounding fur. Clip the nail at a 45-degree angle, avoiding the quick, the pink part of the nail containing blood vessels and nerves. If you accidentally cut the quick, apply styptic powder or cornstarch to stop the bleeding. Trim your rabbit's nails every 4-6 weeks or as needed.</p>\\n<h2>3. Ear Cleaning</h2>\\n<p>Rabbits are prone to ear infections, which can lead to severe complications if left untreated. Regular ear cleaning helps to prevent infections and ensure that your rabbit's ears remain healthy.</p>\\n<p>To clean your rabbit's ears, use a soft, damp cloth or cotton ball moistened with warm water. Gently wipe the outer part of the ear, avoiding the ear canal. Never insert anything into the ear canal, as this can cause damage or push debris further in. Clean your rabbit's ears every 2-4 weeks or as needed.</p>\\n<h2>4. Dental Care</h2>\\n<p>Rabbits have continuously growing teeth that need to be worn down to prevent dental problems. Providing your rabbit with hay, wooden chew toys, and other materials to gnaw on will help keep their teeth in check.</p>\\n<p>Monitor your rabbit's teeth regularly to ensure they're not becoming too long or misaligned. If you notice any issues, consult with a veterinarian experienced in rabbit care, as they may need to trim or file the teeth.</p>\\n<h2>5. Bathing</h2>\\n<p>Unlike cats and dogs, rabbits do not require frequent baths. In fact, bathing your rabbit can cause stress and lead to health issues. Instead, spot clean your rabbit using a damp cloth or unscented baby wipes to remove any dirt or debris. If your rabbit becomes soiled and requires a more thorough cleaning, consult with a veterinarian for guidance.</p>\\n<p>In conclusion, maintaining a regular grooming routine is essential for your rabbit's overall health and well-being. By implementing these tips and techniques, you can ensure that your bunny stays clean, comfortable, and happy. Remember to always handle your rabbit gently and with care during grooming sessions to help build trust and strengthen the bond between you and your pet.</p>","id":"c96b64b4-9567-46f6-8eb5-ac2f37c4918d","image":"d4fd6edc-4cc5-48c1-8bc7-e646924bbdca","slug":"rabbit-grooming-essential-tips","sort":2,"status":"in_review","title":"Essential Tips for Keeping Your Bunny Looking and Feeling Their Best","description":"Rabbit grooming, encompassing brushing, nail trimming, ear cleaning, dental care, and spot cleaning, is vital for your bunny's health, appearance, and well-being.","author":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","published_at":null}	{"content":"<p>Rabbit grooming is an essential aspect of pet care that ensures the overall health, happiness, and well-being of your furry friend. Regular grooming not only keeps your bunny looking their best but also helps to prevent health issues, strengthens the bond between you and your pet, and maintains a clean environment. In this blog post, we'll explore some essential rabbit grooming tips and techniques to help you keep your bunny looking and feeling their best.</p>\\n<h2>1. Brushing</h2>\\n<p>One of the most critical aspects of rabbit grooming is regular brushing. Rabbits have a thick, soft coat that can easily become matted, tangled, or accumulate excess hair. This is especially important during the shedding season when rabbits lose their fur.</p>\\n<p>To brush your rabbit, use a soft-bristle brush or a comb specifically designed for rabbits. Gently brush in the direction of the fur growth, taking extra care around sensitive areas like the face, ears, and belly. Brushing should be done at least once a week, or more frequently during shedding season.</p>\\n<h2>2. Nail Trimming</h2>\\n<p>Just like humans, rabbits need their nails trimmed regularly to prevent overgrowth and potential injury. Rabbit nails can become sharp and curl, making it difficult for them to move and causing discomfort.</p>\\n<p>To trim your rabbit's nails, use a pair of small animal nail clippers. Hold your rabbit securely, but gently, and expose the nail by gently pressing on the surrounding fur. Clip the nail at a 45-degree angle, avoiding the quick, the pink part of the nail containing blood vessels and nerves. If you accidentally cut the quick, apply styptic powder or cornstarch to stop the bleeding. Trim your rabbit's nails every 4-6 weeks or as needed.</p>\\n<h2>3. Ear Cleaning</h2>\\n<p>Rabbits are prone to ear infections, which can lead to severe complications if left untreated. Regular ear cleaning helps to prevent infections and ensure that your rabbit's ears remain healthy.</p>\\n<p>To clean your rabbit's ears, use a soft, damp cloth or cotton ball moistened with warm water. Gently wipe the outer part of the ear, avoiding the ear canal. Never insert anything into the ear canal, as this can cause damage or push debris further in. Clean your rabbit's ears every 2-4 weeks or as needed.</p>\\n<h2>4. Dental Care</h2>\\n<p>Rabbits have continuously growing teeth that need to be worn down to prevent dental problems. Providing your rabbit with hay, wooden chew toys, and other materials to gnaw on will help keep their teeth in check.</p>\\n<p>Monitor your rabbit's teeth regularly to ensure they're not becoming too long or misaligned. If you notice any issues, consult with a veterinarian experienced in rabbit care, as they may need to trim or file the teeth.</p>\\n<h2>5. Bathing</h2>\\n<p>Unlike cats and dogs, rabbits do not require frequent baths. In fact, bathing your rabbit can cause stress and lead to health issues. Instead, spot clean your rabbit using a damp cloth or unscented baby wipes to remove any dirt or debris. If your rabbit becomes soiled and requires a more thorough cleaning, consult with a veterinarian for guidance.</p>\\n<p>In conclusion, maintaining a regular grooming routine is essential for your rabbit's overall health and well-being. By implementing these tips and techniques, you can ensure that your bunny stays clean, comfortable, and happy. Remember to always handle your rabbit gently and with care during grooming sessions to help build trust and strengthen the bond between you and your pet.</p>","image":"d4fd6edc-4cc5-48c1-8bc7-e646924bbdca","slug":"rabbit-grooming-essential-tips","sort":2,"status":"in_review","title":"Essential Tips for Keeping Your Bunny Looking and Feeling Their Best","description":"Rabbit grooming, encompassing brushing, nail trimming, ear cleaning, dental care, and spot cleaning, is vital for your bunny's health, appearance, and well-being.","author":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","published_at":null}	\N	\N
592	593	posts	ba559a1e-5b0c-4932-ab97-b1ab4ca69955	{"content":"<p>Ladies and Gentlemen, it is my great pleasure to introduce you to the future of work. And no, I'm not talking about drones, AI, or even cyborgs. The future of work is none other than the stylish, dapper and oh-so-cool steampunk rabbits!</p>\\n<h2>What are Steampunk Rabbits?</h2>\\n<p>Yes, you heard it right, steampunk rabbits. These little creatures are not just cute and cuddly, but they are also the epitome of efficiency and innovation. From the gears in their top hats to the clockwork in their tails, steampunk rabbits are revolutionizing the way we work and live.</p>\\n<p>So, what makes steampunk rabbits so special? Well, for starters, they never sleep. They work tirelessly around the clock, getting more done in a day than any human ever could. They are also incredibly multi-talented. With their clockwork appendages, they can type, write, assemble, and even paint! All while sipping on a cup of tea and looking fabulous, of course.</p>\\n<h2>Benefits of Steampunk Rabbits</h2>\\n<p>And the best part? They are never late for work. They have built-in clocks and calendars, ensuring that they are always on time. And forget a sick days and vacations; steampunk rabbits never get sick or need a break. They just keep working and working, providing us with endless hours of productivity.</p>\\n<p>But wait, there's more! Steampunk rabbits also bring a touch of whimsy and charm to the workplace. Their Victorian-inspired attire and quirky personalities are sure to brighten up any office. They are the perfect office pets, and they make even the most mundane tasks feel like an adventure.</p>\\n<p>So, there you have it folks, steampunk rabbits are the future of work. So, next time you're feeling stressed and overwhelmed with work, just remember, there's a steampunk rabbit out there who's got your back. And if you're lucky, maybe you'll even get to work with one someday.</p>\\n<p>In conclusion, let us embrace the future and welcome our new steampunk rabbit overlords with open arms. The future of work has never looked so bright and full of bunnies!</p>","id":"ba559a1e-5b0c-4932-ab97-b1ab4ca69955","image":"3eff7dc2-445a-47c5-9503-3f600ecdb5c6","slug":"why-steampunk-rabbits-are-the-future-of-work","sort":4,"status":"published","title":"Why Steampunk Rabbits Are The Future of Work","description":"This post discusses how steampunk rabbits could be the future of work, highlighting their efficiency, multi-talented nature, and ability to bring charm to the workplace.","author":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","published_at":"2024-09-01T16:00:00.000Z"}	{"content":"<p>Ladies and Gentlemen, it is my great pleasure to introduce you to the future of work. And no, I'm not talking about drones, AI, or even cyborgs. The future of work is none other than the stylish, dapper and oh-so-cool steampunk rabbits!</p>\\n<h2>What are Steampunk Rabbits?</h2>\\n<p>Yes, you heard it right, steampunk rabbits. These little creatures are not just cute and cuddly, but they are also the epitome of efficiency and innovation. From the gears in their top hats to the clockwork in their tails, steampunk rabbits are revolutionizing the way we work and live.</p>\\n<p>So, what makes steampunk rabbits so special? Well, for starters, they never sleep. They work tirelessly around the clock, getting more done in a day than any human ever could. They are also incredibly multi-talented. With their clockwork appendages, they can type, write, assemble, and even paint! All while sipping on a cup of tea and looking fabulous, of course.</p>\\n<h2>Benefits of Steampunk Rabbits</h2>\\n<p>And the best part? They are never late for work. They have built-in clocks and calendars, ensuring that they are always on time. And forget a sick days and vacations; steampunk rabbits never get sick or need a break. They just keep working and working, providing us with endless hours of productivity.</p>\\n<p>But wait, there's more! Steampunk rabbits also bring a touch of whimsy and charm to the workplace. Their Victorian-inspired attire and quirky personalities are sure to brighten up any office. They are the perfect office pets, and they make even the most mundane tasks feel like an adventure.</p>\\n<p>So, there you have it folks, steampunk rabbits are the future of work. So, next time you're feeling stressed and overwhelmed with work, just remember, there's a steampunk rabbit out there who's got your back. And if you're lucky, maybe you'll even get to work with one someday.</p>\\n<p>In conclusion, let us embrace the future and welcome our new steampunk rabbit overlords with open arms. The future of work has never looked so bright and full of bunnies!</p>","image":"3eff7dc2-445a-47c5-9503-3f600ecdb5c6","slug":"why-steampunk-rabbits-are-the-future-of-work","sort":4,"status":"published","title":"Why Steampunk Rabbits Are The Future of Work","description":"This post discusses how steampunk rabbits could be the future of work, highlighting their efficiency, multi-talented nature, and ability to bring charm to the workplace.","author":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","published_at":"2024-09-01T16:00:00.000Z"}	\N	\N
601	602	directus_fields	18	{"id":18,"collection":"block_gallery","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"block_gallery","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
681	682	directus_extensions	2d64a791-0274-441b-88d3-70675fb29335	{"id":"2d64a791-0274-441b-88d3-70675fb29335","enabled":true,"folder":"09bdf221-3b49-44ff-a514-6258a67ff587","source":"registry","bundle":null}	{"id":"2d64a791-0274-441b-88d3-70675fb29335","enabled":true,"folder":"09bdf221-3b49-44ff-a514-6258a67ff587","source":"registry","bundle":null}	\N	\N
593	594	posts	ddf1003f-6b9a-460c-83fd-d985d6defbd6	{"content":"<p>Rabbits are known for their fast-paced and productive lifestyle. Their ability to multitask and work efficiently makes them a great source of inspiration for anyone looking to boost their productivity levels. In this blog post, we will look at some simple tips and tricks that you can adopt to become a very productive rabbit.</p>\\n<p><a href=\\"https://directus.io\\" target=\\"_blank\\" rel=\\"noopener\\">Test external link</a></p>\\n<p><a href=\\"/about\\" target=\\"_self\\">Test internal link</a></p>\\n<h2>Plan your day in advance</h2>\\n<p>Planning your day is the first step to becoming a productive rabbit. Make a list of tasks you need to complete, prioritize them and allocate enough time for each. This will help you to stay focused and avoid procrastination.</p>\\n<h2>Wake up early</h2>\\n<p>Rabbits are early birds, and for good reason. Waking up early will give you a head start on your day, allowing you to tackle your most important tasks when you are most alert and focused.</p>\\n<h2>Stay hydrated and nourished</h2>\\n<p>Drinking plenty of water and eating a healthy and balanced diet is crucial for maintaining energy levels and concentration throughout the day. Just like rabbits, you should take regular breaks to recharge and refuel.</p>\\n<h2>Practice mindfulness and take breaks</h2>\\n<p>Rabbits know the importance of taking breaks to refresh their mind and recharge their batteries. Regular breaks can help you avoid burnout and increase your overall productivity. Try incorporating mindfulness practices like meditation or deep breathing into your daily routine.</p>\\n<h2>Stay organized</h2>\\n<p>An organized work environment can help you work more efficiently and increase your productivity levels. Keep your workspace tidy, and use tools like calendars, to-do lists, and filing systems to keep track of your tasks and deadlines.</p>\\n<h2>Surround yourself with positive people</h2>\\n<p>Surrounding yourself with positive and supportive people can help to boost your motivation and productivity levels. Seek out coworkers and friends who share your goals and are supportive of your efforts to become more productive.</p>","id":"ddf1003f-6b9a-460c-83fd-d985d6defbd6","image":"7775c53a-6c2c-453d-8c22-8b5445121d10","slug":"how-to-become-a-very-productive-rabbit","sort":5,"status":"published","title":"How To Become A Very Productive Rabbit","description":"In this blog post, we will look at some simple tips and tricks that you can adopt to become a very productive rabbit.","author":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","published_at":"2024-07-01T16:00:00.000Z"}	{"content":"<p>Rabbits are known for their fast-paced and productive lifestyle. Their ability to multitask and work efficiently makes them a great source of inspiration for anyone looking to boost their productivity levels. In this blog post, we will look at some simple tips and tricks that you can adopt to become a very productive rabbit.</p>\\n<p><a href=\\"https://directus.io\\" target=\\"_blank\\" rel=\\"noopener\\">Test external link</a></p>\\n<p><a href=\\"/about\\" target=\\"_self\\">Test internal link</a></p>\\n<h2>Plan your day in advance</h2>\\n<p>Planning your day is the first step to becoming a productive rabbit. Make a list of tasks you need to complete, prioritize them and allocate enough time for each. This will help you to stay focused and avoid procrastination.</p>\\n<h2>Wake up early</h2>\\n<p>Rabbits are early birds, and for good reason. Waking up early will give you a head start on your day, allowing you to tackle your most important tasks when you are most alert and focused.</p>\\n<h2>Stay hydrated and nourished</h2>\\n<p>Drinking plenty of water and eating a healthy and balanced diet is crucial for maintaining energy levels and concentration throughout the day. Just like rabbits, you should take regular breaks to recharge and refuel.</p>\\n<h2>Practice mindfulness and take breaks</h2>\\n<p>Rabbits know the importance of taking breaks to refresh their mind and recharge their batteries. Regular breaks can help you avoid burnout and increase your overall productivity. Try incorporating mindfulness practices like meditation or deep breathing into your daily routine.</p>\\n<h2>Stay organized</h2>\\n<p>An organized work environment can help you work more efficiently and increase your productivity levels. Keep your workspace tidy, and use tools like calendars, to-do lists, and filing systems to keep track of your tasks and deadlines.</p>\\n<h2>Surround yourself with positive people</h2>\\n<p>Surrounding yourself with positive and supportive people can help to boost your motivation and productivity levels. Seek out coworkers and friends who share your goals and are supportive of your efforts to become more productive.</p>","image":"7775c53a-6c2c-453d-8c22-8b5445121d10","slug":"how-to-become-a-very-productive-rabbit","sort":5,"status":"published","title":"How To Become A Very Productive Rabbit","description":"In this blog post, we will look at some simple tips and tricks that you can adopt to become a very productive rabbit.","author":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","published_at":"2024-07-01T16:00:00.000Z"}	\N	\N
594	595	posts	f7845a69-edcb-4163-a2a9-fb82b64475c5	{"content":"<p>Rabbits are cute and cuddly animals that have been a staple of our childhoods. But did you know that there's more to these furry creatures than just their adorable appearance? Here are some rabbit facts that will blow your mind!</p>\\n<ol>\\n<li>\\n<p>Rabbits have excellent vision: Rabbits have excellent vision, with eyes located on the sides of their heads, allowing them to see 360 degrees. This helps them to detect predators and keep themselves safe.</p>\\n</li>\\n<li>\\n<p>Rabbits are fast runners: When it comes to running, rabbits are pretty speedy! They can run up to 45 miles per hour, making them one of the fastest animals in the animal kingdom.</p>\\n</li>\\n<li>\\n<p>Rabbits are herbivores: Unlike many other animals, rabbits are strictly herbivores, meaning they only eat plants and vegetation. Their diet consists of leafy greens, hay, and fresh fruits and vegetables.</p>\\n</li>\\n<li>\\n<p>Rabbits have unique teeth: Rabbits have unique teeth that continuously grow throughout their lives. To keep their teeth from becoming too long, they need to chew on hard objects like wood to file them down.</p>\\n</li>\\n<li>\\n<p>Rabbits have powerful hind legs: Rabbits have incredibly powerful hind legs that allow them to make quick and nimble movements. These legs also help them to escape from predators by jumping away at incredible speeds.</p>\\n</li>\\n<li>\\n<p>Rabbits are social creatures: Rabbits are social creatures and are best kept with other rabbits. They love to play and cuddle, and they will often form close bonds with their rabbit friends.</p>\\n</li>\\n<li>\\n<p>Rabbits have a unique reproductive system: Rabbits have a unique reproductive system, with females capable of producing litters of bunnies several times a year. This makes rabbits some of the most productive mammals on the planet.</p>\\n</li>\\n<li>\\n<p>Rabbits have a good memory: Rabbits have a good memory and can remember things for several months. This means that if you take the time to bond with your rabbit, they will remember you and be more likely to come to you for affection.</p>\\n</li>\\n</ol>\\n<p>In conclusion, rabbits are fascinating creatures that have much more to offer than just their cute appearance. From their excellent vision to their powerful hind legs and their unique reproductive system, rabbits are truly amazing animals that are sure to blow your mind!</p>","id":"f7845a69-edcb-4163-a2a9-fb82b64475c5","image":"8f748634-d77b-4985-b27e-7e1f3559881a","slug":"rabbit-facts-that-will-blow-your-mind","sort":6,"status":"published","title":"Rabbit Facts That Will Blow Your Mind","description":"These interesting facts about rabbits make them fascinating creatures that are worth learning more about.","author":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","published_at":"2024-06-01T16:00:00.000Z"}	{"content":"<p>Rabbits are cute and cuddly animals that have been a staple of our childhoods. But did you know that there's more to these furry creatures than just their adorable appearance? Here are some rabbit facts that will blow your mind!</p>\\n<ol>\\n<li>\\n<p>Rabbits have excellent vision: Rabbits have excellent vision, with eyes located on the sides of their heads, allowing them to see 360 degrees. This helps them to detect predators and keep themselves safe.</p>\\n</li>\\n<li>\\n<p>Rabbits are fast runners: When it comes to running, rabbits are pretty speedy! They can run up to 45 miles per hour, making them one of the fastest animals in the animal kingdom.</p>\\n</li>\\n<li>\\n<p>Rabbits are herbivores: Unlike many other animals, rabbits are strictly herbivores, meaning they only eat plants and vegetation. Their diet consists of leafy greens, hay, and fresh fruits and vegetables.</p>\\n</li>\\n<li>\\n<p>Rabbits have unique teeth: Rabbits have unique teeth that continuously grow throughout their lives. To keep their teeth from becoming too long, they need to chew on hard objects like wood to file them down.</p>\\n</li>\\n<li>\\n<p>Rabbits have powerful hind legs: Rabbits have incredibly powerful hind legs that allow them to make quick and nimble movements. These legs also help them to escape from predators by jumping away at incredible speeds.</p>\\n</li>\\n<li>\\n<p>Rabbits are social creatures: Rabbits are social creatures and are best kept with other rabbits. They love to play and cuddle, and they will often form close bonds with their rabbit friends.</p>\\n</li>\\n<li>\\n<p>Rabbits have a unique reproductive system: Rabbits have a unique reproductive system, with females capable of producing litters of bunnies several times a year. This makes rabbits some of the most productive mammals on the planet.</p>\\n</li>\\n<li>\\n<p>Rabbits have a good memory: Rabbits have a good memory and can remember things for several months. This means that if you take the time to bond with your rabbit, they will remember you and be more likely to come to you for affection.</p>\\n</li>\\n</ol>\\n<p>In conclusion, rabbits are fascinating creatures that have much more to offer than just their cute appearance. From their excellent vision to their powerful hind legs and their unique reproductive system, rabbits are truly amazing animals that are sure to blow your mind!</p>","image":"8f748634-d77b-4985-b27e-7e1f3559881a","slug":"rabbit-facts-that-will-blow-your-mind","sort":6,"status":"published","title":"Rabbit Facts That Will Blow Your Mind","description":"These interesting facts about rabbits make them fascinating creatures that are worth learning more about.","author":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","published_at":"2024-06-01T16:00:00.000Z"}	\N	\N
595	596	posts	a5068543-fdd1-4773-b6c3-43b4c222d377	{"content":"<p>Ahoy, ye digital corsairs! Have ye ever wondered what tools web developers be usin' on their sleek Macs to keep the seas of code navigable? Well, hoist the mainsail and buckle yer swashbuckling selves, for I be sharin' the secret treasures that make a Mac a true vessel of productivity on these here digital seas.</p>\\n<h2>1. Visual Studio Code</h2>\\n<p>First in the treasure chest be <strong>Visual Studio Code</strong>, the trusty compass for many a developer. This mighty editor be free, open-source, and oh-so-customizable. With extensions as plentiful as the fish in the sea, VS Code helps yer code run smoother than a schooner in a gentle breeze.</p>\\n<h2>2. iTerm2</h2>\\n<p>When it be time to navigate through the terminal, <strong>iTerm2</strong> be the anchor ye need. This advanced terminal emulator gives ye multiple panes, session restoration, and a wealth of shortcuts that&rsquo;ll make yer command-line navigations swift as a gull in flight.</p>\\n<h2>3. Homebrew</h2>\\n<p><strong>Homebrew</strong> be the package manager that every Mac-developer swears by. It makes installing and managing software as easy as pie, with a simple command: <code>brew install</code>. Whether ye be needin' a database or a new programming language, Homebrew be the quartermaster providin' the goods.</p>\\n<h2>4. Alfred</h2>\\n<p>Meet <strong>Alfred</strong>, yer first mate when it comes to magic productivity. This mighty app launcher and workflow automator allows ye to control yer Mac with but a flick of the wrist. Custom workflows and powerful searches make sure Alfred steers ye quickly to any file or task.</p>\\n<h2>5. Postman</h2>\\n<p>If ye be workin' on APIs, <strong>Postman</strong> be the ultimate tool in yer treasure trove. It helps ye test, develop, and document yer APIs with ease. No more sendin' messages in bottles; Postman be the efficient way to communicate with yer backend services.</p>\\n<h2>6. Magnet</h2>\\n<p>To keep yer ship&rsquo;s deck clean and tidy, <strong>Magnet</strong> be the window management tool ye need. With simple drag-and-snap functionalities, Magnet arranges all yer open windows and applications in a manner that keeps yer workspace shipshape.</p>\\n<h2>7. Slack</h2>\\n<p>And of course, no seafaring squad be complete without <strong>Slack</strong>. This communication tool keeps the crew in constant contact, sharing semaphore signals across projects. Integrations with other tools make Slack a veritable crow&rsquo;s nest, keepin' ye alert to all happenings aboard the ship.</p>\\n<p>So there ye have it, mateys! Equip yerselves with these fine tools and set sail toward greater productivity. The digital seas be vast and fraught with peril, but with these treasures on yer side, ye&rsquo;ll be ready to chart any course. Arrr!</p>","id":"a5068543-fdd1-4773-b6c3-43b4c222d377","image":"9a52e835-e131-4290-81bb-5a512599f93e","slug":"pirates-guide-productivity-tools-mac","sort":null,"status":"draft","title":"A Pirate's Guide to Productivity: Web Developers' Favorite Tools on Macs","description":"Ahoy, matey! Discover the top productivity tools web developers be usein' on their trusty Macs. Set sail for smoother workflows and greater bounty!","author":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","published_at":null}	{"content":"<p>Ahoy, ye digital corsairs! Have ye ever wondered what tools web developers be usin' on their sleek Macs to keep the seas of code navigable? Well, hoist the mainsail and buckle yer swashbuckling selves, for I be sharin' the secret treasures that make a Mac a true vessel of productivity on these here digital seas.</p>\\n<h2>1. Visual Studio Code</h2>\\n<p>First in the treasure chest be <strong>Visual Studio Code</strong>, the trusty compass for many a developer. This mighty editor be free, open-source, and oh-so-customizable. With extensions as plentiful as the fish in the sea, VS Code helps yer code run smoother than a schooner in a gentle breeze.</p>\\n<h2>2. iTerm2</h2>\\n<p>When it be time to navigate through the terminal, <strong>iTerm2</strong> be the anchor ye need. This advanced terminal emulator gives ye multiple panes, session restoration, and a wealth of shortcuts that&rsquo;ll make yer command-line navigations swift as a gull in flight.</p>\\n<h2>3. Homebrew</h2>\\n<p><strong>Homebrew</strong> be the package manager that every Mac-developer swears by. It makes installing and managing software as easy as pie, with a simple command: <code>brew install</code>. Whether ye be needin' a database or a new programming language, Homebrew be the quartermaster providin' the goods.</p>\\n<h2>4. Alfred</h2>\\n<p>Meet <strong>Alfred</strong>, yer first mate when it comes to magic productivity. This mighty app launcher and workflow automator allows ye to control yer Mac with but a flick of the wrist. Custom workflows and powerful searches make sure Alfred steers ye quickly to any file or task.</p>\\n<h2>5. Postman</h2>\\n<p>If ye be workin' on APIs, <strong>Postman</strong> be the ultimate tool in yer treasure trove. It helps ye test, develop, and document yer APIs with ease. No more sendin' messages in bottles; Postman be the efficient way to communicate with yer backend services.</p>\\n<h2>6. Magnet</h2>\\n<p>To keep yer ship&rsquo;s deck clean and tidy, <strong>Magnet</strong> be the window management tool ye need. With simple drag-and-snap functionalities, Magnet arranges all yer open windows and applications in a manner that keeps yer workspace shipshape.</p>\\n<h2>7. Slack</h2>\\n<p>And of course, no seafaring squad be complete without <strong>Slack</strong>. This communication tool keeps the crew in constant contact, sharing semaphore signals across projects. Integrations with other tools make Slack a veritable crow&rsquo;s nest, keepin' ye alert to all happenings aboard the ship.</p>\\n<p>So there ye have it, mateys! Equip yerselves with these fine tools and set sail toward greater productivity. The digital seas be vast and fraught with peril, but with these treasures on yer side, ye&rsquo;ll be ready to chart any course. Arrr!</p>","image":"9a52e835-e131-4290-81bb-5a512599f93e","slug":"pirates-guide-productivity-tools-mac","sort":null,"status":"draft","title":"A Pirate's Guide to Productivity: Web Developers' Favorite Tools on Macs","description":"Ahoy, matey! Discover the top productivity tools web developers be usein' on their trusty Macs. Set sail for smoother workflows and greater bounty!","author":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","published_at":null}	\N	\N
596	597	posts	399a9a1b-bad5-4b5b-86e4-291ad1676e91	{"content":"<h2>What is a Headless CMS?</h2>\\n<p>Before diving into the benefits, let’s quickly clarify what a headless CMS actually is. Essentially, a headless Content Management System (CMS) is a backend-only content management system. Unlike traditional CMSs, which tie the content and front-end display together, a headless CMS separates the two. This means you can manage your content in the backend while delivering it to any device or platform using APIs.</p>\\n\\n<h2>Top Benefits of a Headless CMS</h2>\\n\\n<h3>1. Flexibility and Customization</h3>\\n<p>One of the standout benefits of a headless CMS is flexibility. Since the front-end and back-end are decoupled, developers have the freedom to choose how they want to present the content. Whether it’s a website, a mobile app, or even a digital kiosk, you can easily adapt the content to fit any platform or screen size. This is ideal for brands wanting to deliver tailored experiences without being locked into specific templates.</p>\\n\\n<h3>2. Omnichannel Experience</h3>\\n<p>We live in a multi-device world, and users expect a seamless experience across all platforms. A headless CMS makes this possible. By serving content via APIs, it can distribute it to any device or channel you can think of—websites, apps, IoT devices, you name it. This ensures your customers receive consistent messaging and a cohesive experience no matter where they interact with your brand.</p>\\n\\n<h3>3. Faster Performance</h3>\\n<p>In today’s fast-paced digital environment, load times can make or break user experience. Since a headless CMS focuses on content delivery via APIs, it can significantly improve performance. Developers can create lighter, faster front-end experiences without the bloat often found in traditional CMSs. This means quicker load times for users, which can lead to lower bounce rates and higher engagement levels.</p>\\n\\n<h3>4. Better Security</h3>\\n<p>Security is a big concern for any online business. With a headless CMS, you can minimize the risks associated with external attacks. Because the front end is separate, hackers are less likely to exploit vulnerabilities within the CMS itself. That doesn't mean you're completely invulnerable, but it does create an additional layer of protection against common threats.</p>\\n\\n<h3>5. Future-Proofing Your Content</h3>\\n<p>Trends and technologies are constantly evolving, and businesses need a way to keep up. A headless CMS allows you to be future-ready. As new platforms and devices emerge, you can easily integrate and reconfigure your content delivery without overhauling your entire system. <strong>It’s a smart investment for businesses looking to adapt to changes down the road.</strong></p>\\n\\n<h2>Final Thoughts</h2>\\n<p>If you're considering a content management system, the benefits of a headless CMS are hard to ignore. While it may require a bit more technical know-how to set up, the payoff in terms of flexibility, performance, and security makes it worth the effort. So, if you're ready to take your content strategy to the next level, a headless CMS might just be the way to go!</p>","id":"399a9a1b-bad5-4b5b-86e4-291ad1676e91","image":"fd6440c2-dd48-4792-9d08-3124cd99b40f","slug":"benefits-of-headless-cms","sort":null,"status":"draft","title":"The Perks of Going Headless: Why You Should Consider a Headless CMS","description":"Discover why a headless CMS might be the right choice for your business.","author":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","published_at":null}	{"content":"<h2>What is a Headless CMS?</h2>\\n<p>Before diving into the benefits, let’s quickly clarify what a headless CMS actually is. Essentially, a headless Content Management System (CMS) is a backend-only content management system. Unlike traditional CMSs, which tie the content and front-end display together, a headless CMS separates the two. This means you can manage your content in the backend while delivering it to any device or platform using APIs.</p>\\n\\n<h2>Top Benefits of a Headless CMS</h2>\\n\\n<h3>1. Flexibility and Customization</h3>\\n<p>One of the standout benefits of a headless CMS is flexibility. Since the front-end and back-end are decoupled, developers have the freedom to choose how they want to present the content. Whether it’s a website, a mobile app, or even a digital kiosk, you can easily adapt the content to fit any platform or screen size. This is ideal for brands wanting to deliver tailored experiences without being locked into specific templates.</p>\\n\\n<h3>2. Omnichannel Experience</h3>\\n<p>We live in a multi-device world, and users expect a seamless experience across all platforms. A headless CMS makes this possible. By serving content via APIs, it can distribute it to any device or channel you can think of—websites, apps, IoT devices, you name it. This ensures your customers receive consistent messaging and a cohesive experience no matter where they interact with your brand.</p>\\n\\n<h3>3. Faster Performance</h3>\\n<p>In today’s fast-paced digital environment, load times can make or break user experience. Since a headless CMS focuses on content delivery via APIs, it can significantly improve performance. Developers can create lighter, faster front-end experiences without the bloat often found in traditional CMSs. This means quicker load times for users, which can lead to lower bounce rates and higher engagement levels.</p>\\n\\n<h3>4. Better Security</h3>\\n<p>Security is a big concern for any online business. With a headless CMS, you can minimize the risks associated with external attacks. Because the front end is separate, hackers are less likely to exploit vulnerabilities within the CMS itself. That doesn't mean you're completely invulnerable, but it does create an additional layer of protection against common threats.</p>\\n\\n<h3>5. Future-Proofing Your Content</h3>\\n<p>Trends and technologies are constantly evolving, and businesses need a way to keep up. A headless CMS allows you to be future-ready. As new platforms and devices emerge, you can easily integrate and reconfigure your content delivery without overhauling your entire system. <strong>It’s a smart investment for businesses looking to adapt to changes down the road.</strong></p>\\n\\n<h2>Final Thoughts</h2>\\n<p>If you're considering a content management system, the benefits of a headless CMS are hard to ignore. While it may require a bit more technical know-how to set up, the payoff in terms of flexibility, performance, and security makes it worth the effort. So, if you're ready to take your content strategy to the next level, a headless CMS might just be the way to go!</p>","image":"fd6440c2-dd48-4792-9d08-3124cd99b40f","slug":"benefits-of-headless-cms","sort":null,"status":"draft","title":"The Perks of Going Headless: Why You Should Consider a Headless CMS","description":"Discover why a headless CMS might be the right choice for your business.","author":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","published_at":null}	\N	\N
597	598	globals	ab89c489-faea-4310-8b59-7ddb3caf279a	{"description":"We empower you to build the best site possible","id":"ab89c489-faea-4310-8b59-7ddb3caf279a","social_links":[{"service":"github","url":"https://github.com/directus/directus"},{"service":"linkedin","url":"https://www.linkedin.com/company/directus-io"},{"service":"youtube","url":"https://www.youtube.com/c/DirectusVideos"},{"url":"https://directus.chat/","service":"discord"},{"service":"twitter","url":"https://twitter.com/directus"}],"tagline":"The best site ever","title":"Your Site","url":"https://www.yoururl.com","favicon":"2b4a0ba0-52c7-4e10-b191-c803d8da6a36","logo":"43ddd7b8-9b2f-4aa1-b63c-933b4ae81ca2","openai_api_key":null,"directus_url":"http://0.0.0.0:8055","primary_color":"#6644FF"}	{"description":"We empower you to build the best site possible","id":"ab89c489-faea-4310-8b59-7ddb3caf279a","social_links":[{"service":"github","url":"https://github.com/directus/directus"},{"service":"linkedin","url":"https://www.linkedin.com/company/directus-io"},{"service":"youtube","url":"https://www.youtube.com/c/DirectusVideos"},{"url":"https://directus.chat/","service":"discord"},{"service":"twitter","url":"https://twitter.com/directus"}],"tagline":"The best site ever","title":"Your Site","url":"https://www.yoururl.com","favicon":"2b4a0ba0-52c7-4e10-b191-c803d8da6a36","logo":"43ddd7b8-9b2f-4aa1-b63c-933b4ae81ca2","openai_api_key":null,"directus_url":"http://0.0.0.0:8055","primary_color":"#6644FF"}	\N	\N
598	599	directus_fields	1	{"id":1,"collection":"block_button","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"block_button","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
599	600	directus_fields	10	{"id":10,"collection":"block_button_group","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"block_button_group","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
600	601	directus_fields	13	{"id":13,"collection":"block_form","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"block_form","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
663	664	directus_operations	599b80e4-7c74-4496-b243-da198c8613d9	{"id":"599b80e4-7c74-4496-b243-da198c8613d9","name":"Form","key":"form","type":"item-read","position_x":19,"position_y":1,"options":{"collection":"forms","key":["{{$trigger.payload.form}}"],"query":{"fields":["*","fields.*"]},"permissions":"$full"},"resolve":"dff1a702-bcc0-4528-905e-309feb880111","reject":null,"flow":"61757ab0-b139-4079-b5eb-4e05bb8142ac","date_created":"2025-01-14T10:43:22.622Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":"dff1a702-bcc0-4528-905e-309feb880111","reject":null}	\N	\N
602	603	directus_fields	21	{"id":21,"collection":"block_gallery_items","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"block_gallery_items","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
603	604	directus_fields	26	{"id":26,"collection":"block_hero","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"block_hero","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
604	605	directus_fields	34	{"id":34,"collection":"block_posts","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"block_posts","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
605	606	directus_fields	36	{"id":36,"collection":"block_posts","field":"collection","special":null,"interface":"select-radio","options":{"choices":[{"text":"Posts","value":"posts"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":"The collection of content to fetch and display on the page within this block.","conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"block_posts","field":"collection","special":null,"interface":"select-radio","options":{"choices":[{"text":"Posts","value":"posts"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":"The collection of content to fetch and display on the page within this block.","conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N	\N
606	607	directus_fields	39	{"id":39,"collection":"block_pricing","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"block_pricing","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
607	608	directus_fields	43	{"id":43,"collection":"block_pricing_cards","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"block_pricing_cards","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
608	609	directus_fields	55	{"id":55,"collection":"block_richtext","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"block_richtext","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
609	610	directus_fields	58	{"id":58,"collection":"form_fields","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"form_fields","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
610	611	directus_fields	93	{"id":93,"collection":"form_submission_values","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"form_submission_values","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
611	612	directus_fields	88	{"id":88,"collection":"form_submissions","field":"id","special":["uuid"],"interface":"input","options":{"iconLeft":"vpn_key"},"display":null,"display_options":null,"readonly":true,"hidden":false,"sort":1,"width":"half","translations":null,"note":"Unique ID for this specific form submission","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"form_submissions","field":"id","special":["uuid"],"interface":"input","options":{"iconLeft":"vpn_key"},"display":null,"display_options":null,"readonly":true,"hidden":false,"sort":1,"width":"half","translations":null,"note":"Unique ID for this specific form submission","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
670	671	directus_operations	bc71ca4e-d979-4ef9-a449-af100a7e1b3b	{"id":"bc71ca4e-d979-4ef9-a449-af100a7e1b3b","name":"Import","key":"import","type":"request","position_x":74,"position_y":1,"options":{"method":"POST","url":"{{globals.directus_url}}/files/import","body":"{\\n  \\"url\\": \\"{{image}}\\"\\n}","headers":[{"header":"Authorization","value":"Bearer fT6_R5in_QUpUSXlLqGIhYtbRlBnopFe"}]},"resolve":"2adf33da-7fd7-42f7-a6fe-48409463d51b","reject":null,"flow":"d4bbac48-a444-49e0-aedb-9af5273b88df","date_created":"2025-01-14T10:43:22.655Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":"2adf33da-7fd7-42f7-a6fe-48409463d51b","reject":null}	\N	\N
612	613	directus_fields	70	{"id":70,"collection":"forms","field":"id","special":["uuid"],"interface":"input","options":{"iconLeft":"vpn_key"},"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"forms","field":"id","special":["uuid"],"interface":"input","options":{"iconLeft":"vpn_key"},"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
613	614	directus_fields	100	{"id":100,"collection":"globals","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"globals","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
614	615	directus_fields	115	{"id":115,"collection":"navigation","field":"id","special":null,"interface":"input","options":{"iconLeft":"vpn_key"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":"Unique identifier for this menu. Can't be edited after creation.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation","field":"id","special":null,"interface":"input","options":{"iconLeft":"vpn_key"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":"Unique identifier for this menu. Can't be edited after creation.","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
615	616	directus_fields	120	{"id":120,"collection":"navigation_items","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation_items","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
616	617	directus_fields	125	{"id":125,"collection":"navigation_items","field":"title","special":null,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"half","translations":null,"note":"Label shown to the user for the menu item.","conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"navigation_items","field":"title","special":null,"interface":"input","options":null,"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"half","translations":null,"note":"Label shown to the user for the menu item.","conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N	\N
617	618	directus_fields	130	{"id":130,"collection":"page_blocks","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"page_blocks","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
618	619	directus_fields	137	{"id":137,"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
619	620	directus_fields	139	{"id":139,"collection":"pages","field":"title","special":null,"interface":"input","options":{"placeholder":"About Us"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":"Page title (visible to visitors and used in SEO).","conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"title","special":null,"interface":"input","options":{"placeholder":"About Us"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":"Page title (visible to visitors and used in SEO).","conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N	\N
620	621	directus_fields	140	{"id":140,"collection":"pages","field":"permalink","special":null,"interface":"input","options":{"font":"monospace","trim":true,"placeholder":"/about-us"},"display":"formatted-value","display_options":{"font":"monospace"},"readonly":false,"hidden":false,"sort":4,"width":"half","translations":null,"note":"Unique URL for this page (start with `/`, can have multiple segments `/about/me`)).","conditions":null,"required":true,"group":null,"validation":{"_and":[{"permalink":{"_regex":"^/(?:[a-z0-9]+(?:-[a-z0-9]+)*)?(?:/[a-z0-9]+(?:-[a-z0-9]+)*)*$"}}]},"validation_message":"Please use lowercase letters, numbers, and hyphens in your permalink, starting with a slash (/) and without a trailing slash"}	{"collection":"pages","field":"permalink","special":null,"interface":"input","options":{"font":"monospace","trim":true,"placeholder":"/about-us"},"display":"formatted-value","display_options":{"font":"monospace"},"readonly":false,"hidden":false,"sort":4,"width":"half","translations":null,"note":"Unique URL for this page (start with `/`, can have multiple segments `/about/me`)).","conditions":null,"required":true,"group":null,"validation":{"_and":[{"permalink":{"_regex":"^/(?:[a-z0-9]+(?:-[a-z0-9]+)*)?(?:/[a-z0-9]+(?:-[a-z0-9]+)*)*$"}}]},"validation_message":"Please use lowercase letters, numbers, and hyphens in your permalink, starting with a slash (/) and without a trailing slash"}	\N	\N
672	673	directus_operations	d6f73e98-19ef-47d6-8d1f-99d77137d36b	{"id":"d6f73e98-19ef-47d6-8d1f-99d77137d36b","name":"Image","key":"image","type":"directus-labs-ai-image-generation","position_x":56,"position_y":1,"options":{"apiKey":"{{globals.openai_api_key}}","quality":"hd","size":"landscape","prompt":"{{prompt}}"},"resolve":"bc71ca4e-d979-4ef9-a449-af100a7e1b3b","reject":null,"flow":"d4bbac48-a444-49e0-aedb-9af5273b88df","date_created":"2025-01-14T10:43:22.662Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":"bc71ca4e-d979-4ef9-a449-af100a7e1b3b","reject":null}	\N	\N
621	622	directus_fields	142	{"id":142,"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":"#E2E8F0"},{"text":"In Review","value":"in_review","icon":"rate_review","color":"#FFA439"},{"text":"$t:published","value":"published","icon":"check","color":"#2ECDA7"}]},"display":"labels","display_options":{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":null,"background":"#E2E8F0","foreground":"#18222F"},{"text":"In Review","value":"in_review","icon":"rate_review","color":null,"background":"#FFA439","foreground":"#FFFFFF"},{"text":"$t:published","value":"published","icon":"check","color":null,"background":"#2ECDA7","foreground":"#FFFFFF"}]},"readonly":false,"hidden":false,"sort":6,"width":"half","translations":null,"note":"Is this page published?","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pages","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":"#E2E8F0"},{"text":"In Review","value":"in_review","icon":"rate_review","color":"#FFA439"},{"text":"$t:published","value":"published","icon":"check","color":"#2ECDA7"}]},"display":"labels","display_options":{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":null,"background":"#E2E8F0","foreground":"#18222F"},{"text":"In Review","value":"in_review","icon":"rate_review","color":null,"background":"#FFA439","foreground":"#FFFFFF"},{"text":"$t:published","value":"published","icon":"check","color":null,"background":"#2ECDA7","foreground":"#FFFFFF"}]},"readonly":false,"hidden":false,"sort":6,"width":"half","translations":null,"note":"Is this page published?","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
622	623	directus_fields	150	{"id":150,"collection":"posts","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"posts","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
623	624	directus_fields	154	{"id":154,"collection":"posts","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":"#E2E8F0"},{"text":"In Review","value":"in_review","icon":"rate_review","color":"#FFA439"},{"text":"$t:published","value":"published","icon":"check","color":"#2ECDA7"}]},"display":"labels","display_options":{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":null,"background":"#E2E8F0","foreground":"#18222F"},{"text":"In Review","value":"in_review","icon":"rate_review","color":null,"background":"#FFA439","foreground":"#FFFFFF"},{"text":"$t:published","value":"published","icon":"check","color":null,"background":"#2ECDA7","foreground":"#FFFFFF"}]},"readonly":false,"hidden":false,"sort":6,"width":"half","translations":null,"note":"Is this post published?","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"posts","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":"#E2E8F0"},{"text":"In Review","value":"in_review","icon":"rate_review","color":"#FFA439"},{"text":"$t:published","value":"published","icon":"check","color":"#2ECDA7"}]},"display":"labels","display_options":{"choices":[{"text":"$t:draft","value":"draft","icon":"draft_orders","color":null,"background":"#E2E8F0","foreground":"#18222F"},{"text":"In Review","value":"in_review","icon":"rate_review","color":null,"background":"#FFA439","foreground":"#FFFFFF"},{"text":"$t:published","value":"published","icon":"check","color":null,"background":"#2ECDA7","foreground":"#FFFFFF"}]},"readonly":false,"hidden":false,"sort":6,"width":"half","translations":null,"note":"Is this post published?","conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
624	625	directus_fields	155	{"id":155,"collection":"posts","field":"title","special":null,"interface":"input","options":{"placeholder":"Essential tips for first-time home buyers"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":"Title of the blog post (used in page title and meta tags)","conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"posts","field":"title","special":null,"interface":"input","options":{"placeholder":"Essential tips for first-time home buyers"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":"Title of the blog post (used in page title and meta tags)","conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	\N	\N
625	626	directus_dashboards	5a5b8448-16f4-46b1-abe8-19730cadc3a5	{"id":"5a5b8448-16f4-46b1-abe8-19730cadc3a5","name":"Form Submissions","icon":"forms_apps_script","note":"Quick dashboard to tracking performance of your forms","date_created":"2024-09-12T20:44:53.881Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","color":null}	{"id":"5a5b8448-16f4-46b1-abe8-19730cadc3a5","name":"Form Submissions","icon":"forms_apps_script","note":"Quick dashboard to tracking performance of your forms","date_created":"2024-09-12T20:44:53.881Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","color":null}	\N	\N
626	627	directus_panels	01914ef3-5512-4c89-9709-904f9b47ddeb	{"id":"01914ef3-5512-4c89-9709-904f9b47ddeb","dashboard":"5a5b8448-16f4-46b1-abe8-19730cadc3a5","name":"Submissions Over Time","icon":null,"color":null,"show_header":true,"note":null,"type":"time-series","position_x":1,"position_y":20,"width":36,"height":12,"options":{"collection":"form_submissions","precision":"day","function":"count","range":"auto","filter":{"_and":[{"_and":[{"timestamp":{"_between":["{{dateFrom}}","{{dateTo}}"]}}]}]},"dateField":"timestamp","valueField":"id"},"date_created":"2024-09-12T20:57:38.458Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"01914ef3-5512-4c89-9709-904f9b47ddeb","dashboard":"5a5b8448-16f4-46b1-abe8-19730cadc3a5","name":"Submissions Over Time","icon":null,"color":null,"show_header":true,"note":null,"type":"time-series","position_x":1,"position_y":20,"width":36,"height":12,"options":{"collection":"form_submissions","precision":"day","function":"count","range":"auto","filter":{"_and":[{"_and":[{"timestamp":{"_between":["{{dateFrom}}","{{dateTo}}"]}}]}]},"dateField":"timestamp","valueField":"id"},"date_created":"2024-09-12T20:57:38.458Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
674	675	directus_operations	e12b95db-a408-4e7e-b30b-264f7fa8baa3	{"id":"e12b95db-a408-4e7e-b30b-264f7fa8baa3","name":"Send","key":"send","type":"trigger","position_x":59,"position_y":1,"options":{"flow":"7c8732cd-9d9e-44be-a3f6-89c0d42c7687","payload":"{{ render }}"},"resolve":null,"reject":null,"flow":"61757ab0-b139-4079-b5eb-4e05bb8142ac","date_created":"2025-01-14T10:43:22.669Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":null,"reject":null}	\N	\N
627	628	directus_panels	19b3d901-aa7c-4a04-bc9a-800e43510e69	{"id":"19b3d901-aa7c-4a04-bc9a-800e43510e69","dashboard":"5a5b8448-16f4-46b1-abe8-19730cadc3a5","name":"Submissions","icon":null,"color":null,"show_header":true,"note":null,"type":"list","position_x":1,"position_y":35,"width":36,"height":30,"options":{"collection":"form_submissions","limit":100,"sortField":"id","linkToItem":true,"displayTemplate":"{{timestamp}} • {{values}} • {{form}}"},"date_created":"2024-09-12T21:00:02.732Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"19b3d901-aa7c-4a04-bc9a-800e43510e69","dashboard":"5a5b8448-16f4-46b1-abe8-19730cadc3a5","name":"Submissions","icon":null,"color":null,"show_header":true,"note":null,"type":"list","position_x":1,"position_y":35,"width":36,"height":30,"options":{"collection":"form_submissions","limit":100,"sortField":"id","linkToItem":true,"displayTemplate":"{{timestamp}} • {{values}} • {{form}}"},"date_created":"2024-09-12T21:00:02.732Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
628	629	directus_panels	3861ceb1-11ff-4e9d-a985-60d862d90aa3	{"id":"3861ceb1-11ff-4e9d-a985-60d862d90aa3","dashboard":"5a5b8448-16f4-46b1-abe8-19730cadc3a5","name":"From","icon":"date_range","color":null,"show_header":true,"note":null,"type":"variable","position_x":1,"position_y":6,"width":18,"height":6,"options":{"field":"dateFrom","type":"timestamp","inter":"datetime","defaultValue":"2024-01-01T12:00:00-05:00","options":{"use24":false}},"date_created":"2024-09-12T20:56:09.536Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"3861ceb1-11ff-4e9d-a985-60d862d90aa3","dashboard":"5a5b8448-16f4-46b1-abe8-19730cadc3a5","name":"From","icon":"date_range","color":null,"show_header":true,"note":null,"type":"variable","position_x":1,"position_y":6,"width":18,"height":6,"options":{"field":"dateFrom","type":"timestamp","inter":"datetime","defaultValue":"2024-01-01T12:00:00-05:00","options":{"use24":false}},"date_created":"2024-09-12T20:56:09.536Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
629	630	directus_panels	53575d2f-e3a0-4532-a176-d047cbbc11a7	{"id":"53575d2f-e3a0-4532-a176-d047cbbc11a7","dashboard":"5a5b8448-16f4-46b1-abe8-19730cadc3a5","name":"Submissions - Last 30 Days","icon":null,"color":null,"show_header":true,"note":null,"type":"metric","position_x":1,"position_y":12,"width":18,"height":8,"options":{"collection":"form_submissions","field":"id","function":"count","sortField":null,"conditionalFormatting":null,"filter":{"_and":[{"timestamp":{"_gt":"$NOW(-30d)"}}]}},"date_created":"2024-09-12T20:56:09.528Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"53575d2f-e3a0-4532-a176-d047cbbc11a7","dashboard":"5a5b8448-16f4-46b1-abe8-19730cadc3a5","name":"Submissions - Last 30 Days","icon":null,"color":null,"show_header":true,"note":null,"type":"metric","position_x":1,"position_y":12,"width":18,"height":8,"options":{"collection":"form_submissions","field":"id","function":"count","sortField":null,"conditionalFormatting":null,"filter":{"_and":[{"timestamp":{"_gt":"$NOW(-30d)"}}]}},"date_created":"2024-09-12T20:56:09.528Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
630	631	directus_panels	8cb3b63c-d8e3-4078-9160-096e32b9fcb0	{"id":"8cb3b63c-d8e3-4078-9160-096e32b9fcb0","dashboard":"5a5b8448-16f4-46b1-abe8-19730cadc3a5","name":"Submissions - Total","icon":null,"color":null,"show_header":true,"note":null,"type":"metric","position_x":19,"position_y":12,"width":18,"height":8,"options":{"collection":"form_submissions","field":"id","function":"count","sortField":null},"date_created":"2024-09-12T21:00:59.426Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"8cb3b63c-d8e3-4078-9160-096e32b9fcb0","dashboard":"5a5b8448-16f4-46b1-abe8-19730cadc3a5","name":"Submissions - Total","icon":null,"color":null,"show_header":true,"note":null,"type":"metric","position_x":19,"position_y":12,"width":18,"height":8,"options":{"collection":"form_submissions","field":"id","function":"count","sortField":null},"date_created":"2024-09-12T21:00:59.426Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
631	632	directus_panels	b770ea7e-1b49-441f-ba6f-2d4b90e08070	{"id":"b770ea7e-1b49-441f-ba6f-2d4b90e08070","dashboard":"5a5b8448-16f4-46b1-abe8-19730cadc3a5","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"label","position_x":1,"position_y":3,"width":36,"height":3,"options":{"text":"Form Dashboard"},"date_created":"2024-09-12T21:00:39.624Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"b770ea7e-1b49-441f-ba6f-2d4b90e08070","dashboard":"5a5b8448-16f4-46b1-abe8-19730cadc3a5","name":null,"icon":null,"color":null,"show_header":false,"note":null,"type":"label","position_x":1,"position_y":3,"width":36,"height":3,"options":{"text":"Form Dashboard"},"date_created":"2024-09-12T21:00:39.624Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
632	633	directus_panels	dc01026c-1728-4e71-ab45-7cea9fc4751c	{"id":"dc01026c-1728-4e71-ab45-7cea9fc4751c","dashboard":"5a5b8448-16f4-46b1-abe8-19730cadc3a5","name":"To","icon":"date_range","color":null,"show_header":true,"note":null,"type":"variable","position_x":19,"position_y":6,"width":18,"height":6,"options":{"field":"dateTo","type":"timestamp","inter":"datetime","defaultValue":"2025-01-01T12:00:00-05:00","options":{"use24":false}},"date_created":"2024-09-12T20:56:09.540Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"dc01026c-1728-4e71-ab45-7cea9fc4751c","dashboard":"5a5b8448-16f4-46b1-abe8-19730cadc3a5","name":"To","icon":"date_range","color":null,"show_header":true,"note":null,"type":"variable","position_x":19,"position_y":6,"width":18,"height":6,"options":{"field":"dateTo","type":"timestamp","inter":"datetime","defaultValue":"2025-01-01T12:00:00-05:00","options":{"use24":false}},"date_created":"2024-09-12T20:56:09.540Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
633	634	directus_flows	5429ccb0-7e97-4ef5-9d65-2bbcf964f9a6	{"id":"5429ccb0-7e97-4ef5-9d65-2bbcf964f9a6","name":"Utils -> Render Template","icon":"picture_in_picture","color":null,"description":"Utility flow to render a Liquid JS template","status":"active","trigger":"operation","accountability":"all","options":{"return":"$last"},"operation":"c846f644-e7c1-43c9-8bb7-81181de0cd60","date_created":"2024-09-25T13:14:24.304Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","operations":null}	{"id":"5429ccb0-7e97-4ef5-9d65-2bbcf964f9a6","name":"Utils -> Render Template","icon":"picture_in_picture","color":null,"description":"Utility flow to render a Liquid JS template","status":"active","trigger":"operation","accountability":"all","options":{"return":"$last"},"operation":"c846f644-e7c1-43c9-8bb7-81181de0cd60","date_created":"2024-09-25T13:14:24.304Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","operations":null}	\N	\N
644	645	directus_operations	5d667ac5-2594-4f16-a863-3847d8917caa	{"id":"5d667ac5-2594-4f16-a863-3847d8917caa","name":"Globals","key":"globals","type":"trigger","position_x":19,"position_y":1,"options":{"flow":"69e87d0b-df14-4779-bdc8-abc05f2f1e97"},"flow":"5915dd55-fff8-4d47-b48c-a0e42e5033c1","date_created":"2024-09-13T02:39:32.169Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"5d667ac5-2594-4f16-a863-3847d8917caa","name":"Globals","key":"globals","type":"trigger","position_x":19,"position_y":1,"options":{"flow":"69e87d0b-df14-4779-bdc8-abc05f2f1e97"},"flow":"5915dd55-fff8-4d47-b48c-a0e42e5033c1","date_created":"2024-09-13T02:39:32.169Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
634	635	directus_flows	5915dd55-fff8-4d47-b48c-a0e42e5033c1	{"id":"5915dd55-fff8-4d47-b48c-a0e42e5033c1","name":"AI Ghostwriter","icon":"magic_button","color":null,"description":"Flow to automatically write blog posts and articles for you using AI.","status":"active","trigger":"manual","accountability":"all","options":{"collections":["posts"],"requireConfirmation":true,"confirmationDescription":"AI Ghostwriter","fields":[{"field":"prompt","type":"text","name":"Prompt","meta":{"interface":"input-multiline","note":"Describe the post you'd like AI to write for you.","width":"full"}},{"field":"voice","type":"json","name":"Tone Of Voice","meta":{"interface":"tags","note":"What tone of voice would you like AI to write with?","options":{"presets":["friendly","professional","casual","pirate"]}}}],"location":"item"},"operation":"5d667ac5-2594-4f16-a863-3847d8917caa","date_created":"2024-09-12T21:27:14.184Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","operations":null}	{"id":"5915dd55-fff8-4d47-b48c-a0e42e5033c1","name":"AI Ghostwriter","icon":"magic_button","color":null,"description":"Flow to automatically write blog posts and articles for you using AI.","status":"active","trigger":"manual","accountability":"all","options":{"collections":["posts"],"requireConfirmation":true,"confirmationDescription":"AI Ghostwriter","fields":[{"field":"prompt","type":"text","name":"Prompt","meta":{"interface":"input-multiline","note":"Describe the post you'd like AI to write for you.","width":"full"}},{"field":"voice","type":"json","name":"Tone Of Voice","meta":{"interface":"tags","note":"What tone of voice would you like AI to write with?","options":{"presets":["friendly","professional","casual","pirate"]}}}],"location":"item"},"operation":"5d667ac5-2594-4f16-a863-3847d8917caa","date_created":"2024-09-12T21:27:14.184Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","operations":null}	\N	\N
636	637	directus_flows	69e87d0b-df14-4779-bdc8-abc05f2f1e97	{"id":"69e87d0b-df14-4779-bdc8-abc05f2f1e97","name":"Utils -> Get Globals","icon":"globe_uk","color":null,"description":"This is a utility flow to use in other flows when you need data from the Globals collection.","status":"active","trigger":"operation","accountability":"activity","options":{"return":"$last"},"operation":"bb1b1e3f-032e-48b7-b260-1cf3af4a116c","date_created":"2024-02-26T13:03:37.631Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","operations":null}	{"id":"69e87d0b-df14-4779-bdc8-abc05f2f1e97","name":"Utils -> Get Globals","icon":"globe_uk","color":null,"description":"This is a utility flow to use in other flows when you need data from the Globals collection.","status":"active","trigger":"operation","accountability":"activity","options":{"return":"$last"},"operation":"bb1b1e3f-032e-48b7-b260-1cf3af4a116c","date_created":"2024-02-26T13:03:37.631Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","operations":null}	\N	\N
639	640	directus_operations	0beeeb1a-2338-4ab4-95f5-0757bf3e43be	{"id":"0beeeb1a-2338-4ab4-95f5-0757bf3e43be","name":"Log Error","key":"log_error","type":"log","position_x":37,"position_y":17,"options":{"message":"Trigger did NOT include a `to` address. "},"flow":"7c8732cd-9d9e-44be-a3f6-89c0d42c7687","date_created":"2024-12-19T15:26:30.553Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"0beeeb1a-2338-4ab4-95f5-0757bf3e43be","name":"Log Error","key":"log_error","type":"log","position_x":37,"position_y":17,"options":{"message":"Trigger did NOT include a `to` address. "},"flow":"7c8732cd-9d9e-44be-a3f6-89c0d42c7687","date_created":"2024-12-19T15:26:30.553Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
640	641	directus_operations	0cf30253-f9ed-413f-ac27-7a0ecffa9ee4	{"id":"0cf30253-f9ed-413f-ac27-7a0ecffa9ee4","name":"Globals","key":"globals","type":"trigger","position_x":19,"position_y":1,"options":{"flow":"69e87d0b-df14-4779-bdc8-abc05f2f1e97"},"flow":"d4bbac48-a444-49e0-aedb-9af5273b88df","date_created":"2024-09-13T04:12:38.641Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"0cf30253-f9ed-413f-ac27-7a0ecffa9ee4","name":"Globals","key":"globals","type":"trigger","position_x":19,"position_y":1,"options":{"flow":"69e87d0b-df14-4779-bdc8-abc05f2f1e97"},"flow":"d4bbac48-a444-49e0-aedb-9af5273b88df","date_created":"2024-09-13T04:12:38.641Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
641	642	directus_operations	2adf33da-7fd7-42f7-a6fe-48409463d51b	{"id":"2adf33da-7fd7-42f7-a6fe-48409463d51b","name":"Update","key":"update","type":"item-update","position_x":92,"position_y":1,"options":{"collection":"posts","payload":{"image":"{{import.data.data.id}}"},"key":"{{$trigger.body.keys}}","permissions":"$full"},"flow":"d4bbac48-a444-49e0-aedb-9af5273b88df","date_created":"2024-09-13T04:12:38.606Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"2adf33da-7fd7-42f7-a6fe-48409463d51b","name":"Update","key":"update","type":"item-update","position_x":92,"position_y":1,"options":{"collection":"posts","payload":{"image":"{{import.data.data.id}}"},"key":"{{$trigger.body.keys}}","permissions":"$full"},"flow":"d4bbac48-a444-49e0-aedb-9af5273b88df","date_created":"2024-09-13T04:12:38.606Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
642	643	directus_operations	3b7d004a-1dba-43c4-b902-a44fd71602ae	{"id":"3b7d004a-1dba-43c4-b902-a44fd71602ae","name":"Format","key":"format","type":"exec","position_x":55,"position_y":1,"options":{"code":"module.exports = function(data) {\\n    const aiResponse = JSON.parse(data.write)\\n\\tconst payload = {}\\n    payload.title = aiResponse.title\\n    payload.description = aiResponse.description\\n    payload.content = aiResponse.content\\n    payload.slug = aiResponse.slug\\n    return payload\\n}"},"flow":"5915dd55-fff8-4d47-b48c-a0e42e5033c1","date_created":"2024-09-13T03:52:01.503Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"3b7d004a-1dba-43c4-b902-a44fd71602ae","name":"Format","key":"format","type":"exec","position_x":55,"position_y":1,"options":{"code":"module.exports = function(data) {\\n    const aiResponse = JSON.parse(data.write)\\n\\tconst payload = {}\\n    payload.title = aiResponse.title\\n    payload.description = aiResponse.description\\n    payload.content = aiResponse.content\\n    payload.slug = aiResponse.slug\\n    return payload\\n}"},"flow":"5915dd55-fff8-4d47-b48c-a0e42e5033c1","date_created":"2024-09-13T03:52:01.503Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
643	644	directus_operations	599b80e4-7c74-4496-b243-da198c8613d9	{"id":"599b80e4-7c74-4496-b243-da198c8613d9","name":"Form","key":"form","type":"item-read","position_x":19,"position_y":1,"options":{"collection":"forms","key":["{{$trigger.payload.form}}"],"query":{"fields":["*","fields.*"]},"permissions":"$full"},"flow":"61757ab0-b139-4079-b5eb-4e05bb8142ac","date_created":"2024-09-13T03:30:58.055Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"599b80e4-7c74-4496-b243-da198c8613d9","name":"Form","key":"form","type":"item-read","position_x":19,"position_y":1,"options":{"collection":"forms","key":["{{$trigger.payload.form}}"],"query":{"fields":["*","fields.*"]},"permissions":"$full"},"flow":"61757ab0-b139-4079-b5eb-4e05bb8142ac","date_created":"2024-09-13T03:30:58.055Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
682	683	directus_extensions	a2587ead-a73a-4718-88e2-02de0c78d57a	{"id":"a2587ead-a73a-4718-88e2-02de0c78d57a","enabled":true,"folder":"64489dc4-ae84-472d-a9f8-fad653d43ba5","source":"registry","bundle":null}	{"id":"a2587ead-a73a-4718-88e2-02de0c78d57a","enabled":true,"folder":"64489dc4-ae84-472d-a9f8-fad653d43ba5","source":"registry","bundle":null}	\N	\N
635	636	directus_flows	61757ab0-b139-4079-b5eb-4e05bb8142ac	{"id":"61757ab0-b139-4079-b5eb-4e05bb8142ac","name":"Form Submissions -> Email Notifications","icon":"attach_email","color":null,"description":"Automatically sends any emails configured for a form whenever a new submission is created.","status":"active","trigger":"event","accountability":"all","options":{"type":"action","scope":["items.create"],"collections":["form_submissions"]},"operation":"599b80e4-7c74-4496-b243-da198c8613d9","date_created":"2024-09-13T03:26:25.396Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","operations":null}	{"id":"61757ab0-b139-4079-b5eb-4e05bb8142ac","name":"Form Submissions -> Email Notifications","icon":"attach_email","color":null,"description":"Automatically sends any emails configured for a form whenever a new submission is created.","status":"active","trigger":"event","accountability":"all","options":{"type":"action","scope":["items.create"],"collections":["form_submissions"]},"operation":"599b80e4-7c74-4496-b243-da198c8613d9","date_created":"2024-09-13T03:26:25.396Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","operations":null}	\N	\N
637	638	directus_flows	7c8732cd-9d9e-44be-a3f6-89c0d42c7687	{"id":"7c8732cd-9d9e-44be-a3f6-89c0d42c7687","name":"Utils -> Send Email","icon":"send","color":null,"description":"Utility flow to send a single email. Used in other flows.","status":"active","trigger":"operation","accountability":"all","options":{"return":"$last"},"operation":"6efe1572-6cdd-4c80-a063-eb71b7f1e519","date_created":"2024-09-13T04:57:48.054Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","operations":null}	{"id":"7c8732cd-9d9e-44be-a3f6-89c0d42c7687","name":"Utils -> Send Email","icon":"send","color":null,"description":"Utility flow to send a single email. Used in other flows.","status":"active","trigger":"operation","accountability":"all","options":{"return":"$last"},"operation":"6efe1572-6cdd-4c80-a063-eb71b7f1e519","date_created":"2024-09-13T04:57:48.054Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","operations":null}	\N	\N
638	639	directus_flows	d4bbac48-a444-49e0-aedb-9af5273b88df	{"id":"d4bbac48-a444-49e0-aedb-9af5273b88df","name":"AI Image Generator","icon":"image_search","color":null,"description":"Generate AI images for your blog posts.","status":"active","trigger":"manual","accountability":"all","options":{"collections":["posts"],"requireConfirmation":true,"confirmationDescription":"AI Image Generator","fields":[{"field":"prompt","type":"text","name":"Prompt","meta":{"interface":"input-rich-text-md","note":"Describe the image you want to generate. The more descriptive - the better the results (usually 😉).","options":{"placeholder":"Create a hand-drawn marker style illustration to be used as a featured image for blog posts targeting developers. The illustration should have a whimsical theme, using bold, uneven marker-style lines to create an engaging and eye-catching design. The background should always be white. ","toolbar":["heading","bold","italic","strikethrough","blockquote","bullist","numlist","table","code","empty"]}}},{"field":"colors","type":"json","name":"Colors","meta":{"interface":"list","options":{"fields":[{"field":"color","name":"color","type":"string","meta":{"field":"color","width":"half","type":"string","interface":"select-color"}},{"field":"name","name":"name","type":"string","meta":{"field":"name","width":"half","type":"string","note":"What is the name of the color? AI seems to do better when supplying color names along with the hex codes.","interface":"input"}},{"field":"type","name":"type","type":"string","meta":{"field":"type","width":"full","type":"string","interface":"select-radio","options":{"choices":[{"text":"Primary","value":"primary"},{"text":"Secondary","value":"secondary"},{"text":"Background","value":"background"}]}}}]}}},{"field":"aspect_ratio","type":"string","name":"Aspect Ratio","meta":{"interface":"select-radio","options":{"choices":[{"text":"1:1","value":"1:1"},{"text":"16:9","value":"16:9"},{"text":"9:16","value":"9:16"}]}}}],"location":"item"},"operation":"0cf30253-f9ed-413f-ac27-7a0ecffa9ee4","date_created":"2024-09-12T21:34:20.685Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","operations":null}	{"id":"d4bbac48-a444-49e0-aedb-9af5273b88df","name":"AI Image Generator","icon":"image_search","color":null,"description":"Generate AI images for your blog posts.","status":"active","trigger":"manual","accountability":"all","options":{"collections":["posts"],"requireConfirmation":true,"confirmationDescription":"AI Image Generator","fields":[{"field":"prompt","type":"text","name":"Prompt","meta":{"interface":"input-rich-text-md","note":"Describe the image you want to generate. The more descriptive - the better the results (usually 😉).","options":{"placeholder":"Create a hand-drawn marker style illustration to be used as a featured image for blog posts targeting developers. The illustration should have a whimsical theme, using bold, uneven marker-style lines to create an engaging and eye-catching design. The background should always be white. ","toolbar":["heading","bold","italic","strikethrough","blockquote","bullist","numlist","table","code","empty"]}}},{"field":"colors","type":"json","name":"Colors","meta":{"interface":"list","options":{"fields":[{"field":"color","name":"color","type":"string","meta":{"field":"color","width":"half","type":"string","interface":"select-color"}},{"field":"name","name":"name","type":"string","meta":{"field":"name","width":"half","type":"string","note":"What is the name of the color? AI seems to do better when supplying color names along with the hex codes.","interface":"input"}},{"field":"type","name":"type","type":"string","meta":{"field":"type","width":"full","type":"string","interface":"select-radio","options":{"choices":[{"text":"Primary","value":"primary"},{"text":"Secondary","value":"secondary"},{"text":"Background","value":"background"}]}}}]}}},{"field":"aspect_ratio","type":"string","name":"Aspect Ratio","meta":{"interface":"select-radio","options":{"choices":[{"text":"1:1","value":"1:1"},{"text":"16:9","value":"16:9"},{"text":"9:16","value":"9:16"}]}}}],"location":"item"},"operation":"0cf30253-f9ed-413f-ac27-7a0ecffa9ee4","date_created":"2024-09-12T21:34:20.685Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0","operations":null}	\N	\N
660	661	directus_operations	0cf30253-f9ed-413f-ac27-7a0ecffa9ee4	{"id":"0cf30253-f9ed-413f-ac27-7a0ecffa9ee4","name":"Globals","key":"globals","type":"trigger","position_x":19,"position_y":1,"options":{"flow":"69e87d0b-df14-4779-bdc8-abc05f2f1e97"},"resolve":"5df25cf8-b407-4fef-9d3b-c328f89f1561","reject":null,"flow":"d4bbac48-a444-49e0-aedb-9af5273b88df","date_created":"2025-01-14T10:43:22.607Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":"5df25cf8-b407-4fef-9d3b-c328f89f1561","reject":null}	\N	\N
662	663	directus_operations	3b7d004a-1dba-43c4-b902-a44fd71602ae	{"id":"3b7d004a-1dba-43c4-b902-a44fd71602ae","name":"Format","key":"format","type":"exec","position_x":55,"position_y":1,"options":{"code":"module.exports = function(data) {\\n    const aiResponse = JSON.parse(data.write)\\n\\tconst payload = {}\\n    payload.title = aiResponse.title\\n    payload.description = aiResponse.description\\n    payload.content = aiResponse.content\\n    payload.slug = aiResponse.slug\\n    return payload\\n}"},"resolve":"e6c50f84-e229-4f15-8119-c7708256e825","reject":null,"flow":"5915dd55-fff8-4d47-b48c-a0e42e5033c1","date_created":"2025-01-14T10:43:22.616Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":"e6c50f84-e229-4f15-8119-c7708256e825","reject":null}	\N	\N
664	665	directus_operations	5d667ac5-2594-4f16-a863-3847d8917caa	{"id":"5d667ac5-2594-4f16-a863-3847d8917caa","name":"Globals","key":"globals","type":"trigger","position_x":19,"position_y":1,"options":{"flow":"69e87d0b-df14-4779-bdc8-abc05f2f1e97"},"resolve":"89125be2-8205-4ad0-a77f-bd3e984202b3","reject":null,"flow":"5915dd55-fff8-4d47-b48c-a0e42e5033c1","date_created":"2025-01-14T10:43:22.629Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":"89125be2-8205-4ad0-a77f-bd3e984202b3","reject":null}	\N	\N
666	667	directus_operations	6efe1572-6cdd-4c80-a063-eb71b7f1e519	{"id":"6efe1572-6cdd-4c80-a063-eb71b7f1e519","name":"Verify To","key":"verify_to","type":"condition","position_x":19,"position_y":1,"options":{"filter":{"$trigger":{"to":{"_nnull":true}}}},"resolve":"8673740a-f7f8-44dd-9abd-5a714e0d6c74","reject":"0beeeb1a-2338-4ab4-95f5-0757bf3e43be","flow":"7c8732cd-9d9e-44be-a3f6-89c0d42c7687","date_created":"2025-01-14T10:43:22.638Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":"8673740a-f7f8-44dd-9abd-5a714e0d6c74","reject":"0beeeb1a-2338-4ab4-95f5-0757bf3e43be"}	\N	\N
668	669	directus_operations	89125be2-8205-4ad0-a77f-bd3e984202b3	{"id":"89125be2-8205-4ad0-a77f-bd3e984202b3","name":"Write","key":"write","type":"directus-labs-ai-writer-operation","position_x":37,"position_y":1,"options":{"apiKey":"{{globals.openai_api_key}}","model":"gpt-4o-mini","promptKey":"custom","system":"You are an expert in writing blog posts that are valuable for readers.\\n\\n## Rules\\n- You are a human content writer. Avoid AI words like \\"empower\\". Avoid using prolix. Sound human.\\n- ALWAYS output a JSON object that matches the sample below.\\n{\\n\\"title\\": \\"Article Title\\",\\n\\"slug\\": \\"formatted-slug\\",\\n\\"description\\": \\"Short summary of the article to entice readers\\",\\n\\"content\\": \\"Article content goes here. This needs to be properly encoded HTML string with proper line breaks, etc.\\"\\n}","json_mode":true,"text":"Write an article based on this prompt.\\n{{$trigger.body.prompt}}\\n\\n\\n## Voice\\nMatch this style and tone of voice when writing.\\n{{ $trigger.body.voice }}","aiProvider":"openai","apiKeyOpenAi":"{{globals.openai_api_key}}","maxToken":8192},"resolve":"3b7d004a-1dba-43c4-b902-a44fd71602ae","reject":null,"flow":"5915dd55-fff8-4d47-b48c-a0e42e5033c1","date_created":"2025-01-14T10:43:22.648Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":"3b7d004a-1dba-43c4-b902-a44fd71602ae","reject":null}	\N	\N
676	677	directus_operations	edc5e1ae-a3ed-45af-ae77-10409a66cd03	{"id":"edc5e1ae-a3ed-45af-ae77-10409a66cd03","name":"Format","key":"format","type":"exec","position_x":37,"position_y":1,"options":{"code":"module.exports = function(data) {\\n\\treturn {\\n        ...data.$trigger,\\n        body: data.render.template\\n    }\\n}"},"resolve":null,"reject":null,"flow":"5429ccb0-7e97-4ef5-9d65-2bbcf964f9a6","date_created":"2025-01-14T10:43:22.677Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":null,"reject":null}	\N	\N
645	646	directus_operations	5df25cf8-b407-4fef-9d3b-c328f89f1561	{"id":"5df25cf8-b407-4fef-9d3b-c328f89f1561","name":"Prompt","key":"prompt","type":"directus-labs-ai-writer-operation","position_x":37,"position_y":1,"options":{"apiKey":"{{globals.openai_api_key}}","promptKey":"custom","system":"You are an expert in writing prompts for generating images through Dall•E 3. \\n\\n## Rules\\nReturn only the prompt text","text":"Use the following information and context to write a prompt to generate an image for a blog post.\\n\\nImage Style:\\n{{ $trigger.body.prompt }}\\n\\nAspect Ratio: \\n{{ $trigger.body.aspect_ratio }}\\n\\nColor Palette:\\n{{ $trigger.body.colors }}","model":"gpt-4o-mini","aiProvider":"openai","apiKeyOpenAi":"{{globals.openai_api_key}}"},"flow":"d4bbac48-a444-49e0-aedb-9af5273b88df","date_created":"2024-09-13T04:12:38.633Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"5df25cf8-b407-4fef-9d3b-c328f89f1561","name":"Prompt","key":"prompt","type":"directus-labs-ai-writer-operation","position_x":37,"position_y":1,"options":{"apiKey":"{{globals.openai_api_key}}","promptKey":"custom","system":"You are an expert in writing prompts for generating images through Dall•E 3. \\n\\n## Rules\\nReturn only the prompt text","text":"Use the following information and context to write a prompt to generate an image for a blog post.\\n\\nImage Style:\\n{{ $trigger.body.prompt }}\\n\\nAspect Ratio: \\n{{ $trigger.body.aspect_ratio }}\\n\\nColor Palette:\\n{{ $trigger.body.colors }}","model":"gpt-4o-mini","aiProvider":"openai","apiKeyOpenAi":"{{globals.openai_api_key}}"},"flow":"d4bbac48-a444-49e0-aedb-9af5273b88df","date_created":"2024-09-13T04:12:38.633Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
646	647	directus_operations	6efe1572-6cdd-4c80-a063-eb71b7f1e519	{"id":"6efe1572-6cdd-4c80-a063-eb71b7f1e519","name":"Verify To","key":"verify_to","type":"condition","position_x":19,"position_y":1,"options":{"filter":{"$trigger":{"to":{"_nnull":true}}}},"flow":"7c8732cd-9d9e-44be-a3f6-89c0d42c7687","date_created":"2024-12-19T15:26:30.564Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"6efe1572-6cdd-4c80-a063-eb71b7f1e519","name":"Verify To","key":"verify_to","type":"condition","position_x":19,"position_y":1,"options":{"filter":{"$trigger":{"to":{"_nnull":true}}}},"flow":"7c8732cd-9d9e-44be-a3f6-89c0d42c7687","date_created":"2024-12-19T15:26:30.564Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
647	648	directus_operations	8673740a-f7f8-44dd-9abd-5a714e0d6c74	{"id":"8673740a-f7f8-44dd-9abd-5a714e0d6c74","name":"Send Email","key":"send_email","type":"mail","position_x":37,"position_y":1,"options":{"to":"{{$trigger.to}}","subject":"{{$trigger.subject}}","type":"wysiwyg","body":"<p>{{$trigger.body}}</p>"},"flow":"7c8732cd-9d9e-44be-a3f6-89c0d42c7687","date_created":"2024-09-25T13:08:40.529Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"8673740a-f7f8-44dd-9abd-5a714e0d6c74","name":"Send Email","key":"send_email","type":"mail","position_x":37,"position_y":1,"options":{"to":"{{$trigger.to}}","subject":"{{$trigger.subject}}","type":"wysiwyg","body":"<p>{{$trigger.body}}</p>"},"flow":"7c8732cd-9d9e-44be-a3f6-89c0d42c7687","date_created":"2024-09-25T13:08:40.529Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
648	649	directus_operations	89125be2-8205-4ad0-a77f-bd3e984202b3	{"id":"89125be2-8205-4ad0-a77f-bd3e984202b3","name":"Write","key":"write","type":"directus-labs-ai-writer-operation","position_x":37,"position_y":1,"options":{"apiKey":"{{globals.openai_api_key}}","model":"gpt-4o-mini","promptKey":"custom","system":"You are an expert in writing blog posts that are valuable for readers.\\n\\n## Rules\\n- You are a human content writer. Avoid AI words like \\"empower\\". Avoid using prolix. Sound human.\\n- ALWAYS output a JSON object that matches the sample below.\\n{\\n\\"title\\": \\"Article Title\\",\\n\\"slug\\": \\"formatted-slug\\",\\n\\"description\\": \\"Short summary of the article to entice readers\\",\\n\\"content\\": \\"Article content goes here. This needs to be properly encoded HTML string with proper line breaks, etc.\\"\\n}","json_mode":true,"text":"Write an article based on this prompt.\\n{{$trigger.body.prompt}}\\n\\n\\n## Voice\\nMatch this style and tone of voice when writing.\\n{{ $trigger.body.voice }}","aiProvider":"openai","apiKeyOpenAi":"{{globals.openai_api_key}}","maxToken":8192},"flow":"5915dd55-fff8-4d47-b48c-a0e42e5033c1","date_created":"2024-09-13T03:52:01.514Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"89125be2-8205-4ad0-a77f-bd3e984202b3","name":"Write","key":"write","type":"directus-labs-ai-writer-operation","position_x":37,"position_y":1,"options":{"apiKey":"{{globals.openai_api_key}}","model":"gpt-4o-mini","promptKey":"custom","system":"You are an expert in writing blog posts that are valuable for readers.\\n\\n## Rules\\n- You are a human content writer. Avoid AI words like \\"empower\\". Avoid using prolix. Sound human.\\n- ALWAYS output a JSON object that matches the sample below.\\n{\\n\\"title\\": \\"Article Title\\",\\n\\"slug\\": \\"formatted-slug\\",\\n\\"description\\": \\"Short summary of the article to entice readers\\",\\n\\"content\\": \\"Article content goes here. This needs to be properly encoded HTML string with proper line breaks, etc.\\"\\n}","json_mode":true,"text":"Write an article based on this prompt.\\n{{$trigger.body.prompt}}\\n\\n\\n## Voice\\nMatch this style and tone of voice when writing.\\n{{ $trigger.body.voice }}","aiProvider":"openai","apiKeyOpenAi":"{{globals.openai_api_key}}","maxToken":8192},"flow":"5915dd55-fff8-4d47-b48c-a0e42e5033c1","date_created":"2024-09-13T03:52:01.514Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
649	650	directus_operations	bb1b1e3f-032e-48b7-b260-1cf3af4a116c	{"id":"bb1b1e3f-032e-48b7-b260-1cf3af4a116c","name":"Read Globals","key":"read_globals","type":"item-read","position_x":19,"position_y":1,"options":{"permissions":"$full","collection":"globals"},"flow":"69e87d0b-df14-4779-bdc8-abc05f2f1e97","date_created":"2024-02-26T13:03:38.721Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"bb1b1e3f-032e-48b7-b260-1cf3af4a116c","name":"Read Globals","key":"read_globals","type":"item-read","position_x":19,"position_y":1,"options":{"permissions":"$full","collection":"globals"},"flow":"69e87d0b-df14-4779-bdc8-abc05f2f1e97","date_created":"2024-02-26T13:03:38.721Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
650	651	directus_operations	bc71ca4e-d979-4ef9-a449-af100a7e1b3b	{"id":"bc71ca4e-d979-4ef9-a449-af100a7e1b3b","name":"Import","key":"import","type":"request","position_x":74,"position_y":1,"options":{"method":"POST","url":"{{globals.directus_url}}/files/import","body":"{\\n  \\"url\\": \\"{{image}}\\"\\n}","headers":[{"header":"Authorization","value":"Bearer fT6_R5in_QUpUSXlLqGIhYtbRlBnopFe"}]},"flow":"d4bbac48-a444-49e0-aedb-9af5273b88df","date_created":"2024-09-13T04:12:38.612Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"bc71ca4e-d979-4ef9-a449-af100a7e1b3b","name":"Import","key":"import","type":"request","position_x":74,"position_y":1,"options":{"method":"POST","url":"{{globals.directus_url}}/files/import","body":"{\\n  \\"url\\": \\"{{image}}\\"\\n}","headers":[{"header":"Authorization","value":"Bearer fT6_R5in_QUpUSXlLqGIhYtbRlBnopFe"}]},"flow":"d4bbac48-a444-49e0-aedb-9af5273b88df","date_created":"2024-09-13T04:12:38.612Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
651	652	directus_operations	c846f644-e7c1-43c9-8bb7-81181de0cd60	{"id":"c846f644-e7c1-43c9-8bb7-81181de0cd60","name":"Render Template","key":"render","type":"liquidjs-operation","position_x":19,"position_y":1,"options":{"publicUrl":"http://localhost:8001/","mode":"custom","operationMode":"single","template":"{{ $trigger.template }}","data":"{{ $trigger.data }}"},"flow":"5429ccb0-7e97-4ef5-9d65-2bbcf964f9a6","date_created":"2024-09-25T13:15:05.717Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"c846f644-e7c1-43c9-8bb7-81181de0cd60","name":"Render Template","key":"render","type":"liquidjs-operation","position_x":19,"position_y":1,"options":{"publicUrl":"http://localhost:8001/","mode":"custom","operationMode":"single","template":"{{ $trigger.template }}","data":"{{ $trigger.data }}"},"flow":"5429ccb0-7e97-4ef5-9d65-2bbcf964f9a6","date_created":"2024-09-25T13:15:05.717Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
678	679	directus_operations	fd271542-fac2-42d8-aa10-a02520c3753f	{"id":"fd271542-fac2-42d8-aa10-a02520c3753f","name":"Format","key":"format","type":"exec","position_x":37,"position_y":1,"options":{"code":"module.exports = async function(data) {\\n    return data.read_globals[0]\\n}"},"resolve":null,"reject":null,"flow":"69e87d0b-df14-4779-bdc8-abc05f2f1e97","date_created":"2025-01-14T10:43:22.684Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":null,"reject":null}	\N	\N
652	653	directus_operations	d6f73e98-19ef-47d6-8d1f-99d77137d36b	{"id":"d6f73e98-19ef-47d6-8d1f-99d77137d36b","name":"Image","key":"image","type":"directus-labs-ai-image-generation","position_x":56,"position_y":1,"options":{"apiKey":"{{globals.openai_api_key}}","quality":"hd","size":"landscape","prompt":"{{prompt}}"},"flow":"d4bbac48-a444-49e0-aedb-9af5273b88df","date_created":"2024-09-13T04:12:38.623Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"d6f73e98-19ef-47d6-8d1f-99d77137d36b","name":"Image","key":"image","type":"directus-labs-ai-image-generation","position_x":56,"position_y":1,"options":{"apiKey":"{{globals.openai_api_key}}","quality":"hd","size":"landscape","prompt":"{{prompt}}"},"flow":"d4bbac48-a444-49e0-aedb-9af5273b88df","date_created":"2024-09-13T04:12:38.623Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
653	654	directus_operations	dff1a702-bcc0-4528-905e-309feb880111	{"id":"dff1a702-bcc0-4528-905e-309feb880111","name":"Format","key":"format","type":"exec","position_x":19,"position_y":18,"options":{"code":"/**\\n * Prepares email template data by matching trigger values with form fields\\n * @param {Object} trigger - The trigger object containing payload values\\n * @param {Object} form - The form object containing fields and email templates\\n * @returns {Array} Array of prepared email template objects\\n * @throws {Error} If required data is missing or invalid\\n */\\nfunction prepareEmailTemplateData(trigger, form) {\\n  // Validate input parameters\\n  if (!trigger?.payload?.values || !Array.isArray(trigger.payload.values)) {\\n    throw new Error('Invalid trigger payload values');\\n  }\\n  \\n  if (!form?.fields || !Array.isArray(form.fields)) {\\n    throw new Error('Invalid form fields');\\n  }\\n  \\n  if (!form?.emails || !Array.isArray(form.emails)) {\\n    throw new Error('Invalid form emails');\\n  }\\n\\n  // Create an object to store the field name-value pairs\\n  const data = {};\\n  \\n  // Iterate through the trigger values and match them with form fields\\n  trigger.payload.values.forEach(item => {\\n    if (!item || typeof item !== 'object') {\\n      throw new Error('Invalid trigger value item');\\n    }\\n\\n    // Ensure required properties exist\\n    if (!item.field && !item.field_name) {\\n      throw new Error('Missing field identifier in trigger value');\\n    }\\n    \\n    if (item.value === undefined) {\\n      throw new Error('Missing value in trigger value');\\n    }\\n\\n    // Find the corresponding field in the form\\n    const formField = form.fields.find(field => field.id === item.field);\\n    \\n    // If a matching field is found, use its name as the key\\n    if (formField && formField.name) {\\n      data[formField.name] = item.value;\\n    } else {\\n      // Fallback to using the field_name from the trigger if no match is found\\n      data[item.field_name || item.field] = item.value;\\n    }\\n  });\\n\\n  // Process and validate all email templates\\n  const emailTemplates = form.emails.map(email => {\\n    // Validate required email template properties\\n    if (!email.subject) {\\n      throw new Error('Missing email subject');\\n    }\\n    \\n    if (!email.message) {\\n      throw new Error('Missing email message template');\\n    }\\n    \\n    if (!email.to) {\\n      throw new Error('Missing email recipient');\\n    }\\n\\n    // Normalize 'to' field to always be an array\\n    const toField = Array.isArray(email.to) ? email.to : [email.to];\\n    \\n    // Validate each email address\\n    toField.forEach(recipient => {\\n      if (typeof recipient !== 'string' || !recipient.trim()) {\\n        throw new Error('Invalid email recipient');\\n      }\\n    });\\n\\n    return {\\n      to: toField,\\n      subject: email.subject,\\n      template: email.message,\\n      data: data\\n    };\\n  });\\n\\n  return emailTemplates;\\n}\\n\\nmodule.exports = function(data) {\\n  if (!data?.$trigger || !data?.form) {\\n    throw new Error('Missing required data');\\n  }\\n  \\n  return prepareEmailTemplateData(data.$trigger, data.form);\\n};"},"flow":"61757ab0-b139-4079-b5eb-4e05bb8142ac","date_created":"2024-09-13T03:41:36.144Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"dff1a702-bcc0-4528-905e-309feb880111","name":"Format","key":"format","type":"exec","position_x":19,"position_y":18,"options":{"code":"/**\\n * Prepares email template data by matching trigger values with form fields\\n * @param {Object} trigger - The trigger object containing payload values\\n * @param {Object} form - The form object containing fields and email templates\\n * @returns {Array} Array of prepared email template objects\\n * @throws {Error} If required data is missing or invalid\\n */\\nfunction prepareEmailTemplateData(trigger, form) {\\n  // Validate input parameters\\n  if (!trigger?.payload?.values || !Array.isArray(trigger.payload.values)) {\\n    throw new Error('Invalid trigger payload values');\\n  }\\n  \\n  if (!form?.fields || !Array.isArray(form.fields)) {\\n    throw new Error('Invalid form fields');\\n  }\\n  \\n  if (!form?.emails || !Array.isArray(form.emails)) {\\n    throw new Error('Invalid form emails');\\n  }\\n\\n  // Create an object to store the field name-value pairs\\n  const data = {};\\n  \\n  // Iterate through the trigger values and match them with form fields\\n  trigger.payload.values.forEach(item => {\\n    if (!item || typeof item !== 'object') {\\n      throw new Error('Invalid trigger value item');\\n    }\\n\\n    // Ensure required properties exist\\n    if (!item.field && !item.field_name) {\\n      throw new Error('Missing field identifier in trigger value');\\n    }\\n    \\n    if (item.value === undefined) {\\n      throw new Error('Missing value in trigger value');\\n    }\\n\\n    // Find the corresponding field in the form\\n    const formField = form.fields.find(field => field.id === item.field);\\n    \\n    // If a matching field is found, use its name as the key\\n    if (formField && formField.name) {\\n      data[formField.name] = item.value;\\n    } else {\\n      // Fallback to using the field_name from the trigger if no match is found\\n      data[item.field_name || item.field] = item.value;\\n    }\\n  });\\n\\n  // Process and validate all email templates\\n  const emailTemplates = form.emails.map(email => {\\n    // Validate required email template properties\\n    if (!email.subject) {\\n      throw new Error('Missing email subject');\\n    }\\n    \\n    if (!email.message) {\\n      throw new Error('Missing email message template');\\n    }\\n    \\n    if (!email.to) {\\n      throw new Error('Missing email recipient');\\n    }\\n\\n    // Normalize 'to' field to always be an array\\n    const toField = Array.isArray(email.to) ? email.to : [email.to];\\n    \\n    // Validate each email address\\n    toField.forEach(recipient => {\\n      if (typeof recipient !== 'string' || !recipient.trim()) {\\n        throw new Error('Invalid email recipient');\\n      }\\n    });\\n\\n    return {\\n      to: toField,\\n      subject: email.subject,\\n      template: email.message,\\n      data: data\\n    };\\n  });\\n\\n  return emailTemplates;\\n}\\n\\nmodule.exports = function(data) {\\n  if (!data?.$trigger || !data?.form) {\\n    throw new Error('Missing required data');\\n  }\\n  \\n  return prepareEmailTemplateData(data.$trigger, data.form);\\n};"},"flow":"61757ab0-b139-4079-b5eb-4e05bb8142ac","date_created":"2024-09-13T03:41:36.144Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
654	655	directus_operations	e12b95db-a408-4e7e-b30b-264f7fa8baa3	{"id":"e12b95db-a408-4e7e-b30b-264f7fa8baa3","name":"Send","key":"send","type":"trigger","position_x":59,"position_y":1,"options":{"flow":"7c8732cd-9d9e-44be-a3f6-89c0d42c7687","payload":"{{ render }}"},"flow":"61757ab0-b139-4079-b5eb-4e05bb8142ac","date_created":"2024-09-25T13:33:39.709Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"e12b95db-a408-4e7e-b30b-264f7fa8baa3","name":"Send","key":"send","type":"trigger","position_x":59,"position_y":1,"options":{"flow":"7c8732cd-9d9e-44be-a3f6-89c0d42c7687","payload":"{{ render }}"},"flow":"61757ab0-b139-4079-b5eb-4e05bb8142ac","date_created":"2024-09-25T13:33:39.709Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
655	656	directus_operations	e6c50f84-e229-4f15-8119-c7708256e825	{"id":"e6c50f84-e229-4f15-8119-c7708256e825","name":"Update","key":"update","type":"item-update","position_x":73,"position_y":1,"options":{"collection":"posts","permissions":"$full","key":["{{$trigger.body.keys}}"],"payload":"{{format}}"},"flow":"5915dd55-fff8-4d47-b48c-a0e42e5033c1","date_created":"2024-09-13T03:52:01.490Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"e6c50f84-e229-4f15-8119-c7708256e825","name":"Update","key":"update","type":"item-update","position_x":73,"position_y":1,"options":{"collection":"posts","permissions":"$full","key":["{{$trigger.body.keys}}"],"payload":"{{format}}"},"flow":"5915dd55-fff8-4d47-b48c-a0e42e5033c1","date_created":"2024-09-13T03:52:01.490Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
656	657	directus_operations	edc5e1ae-a3ed-45af-ae77-10409a66cd03	{"id":"edc5e1ae-a3ed-45af-ae77-10409a66cd03","name":"Format","key":"format","type":"exec","position_x":37,"position_y":1,"options":{"code":"module.exports = function(data) {\\n\\treturn {\\n        ...data.$trigger,\\n        body: data.render.template\\n    }\\n}"},"flow":"5429ccb0-7e97-4ef5-9d65-2bbcf964f9a6","date_created":"2024-09-25T13:31:35.265Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"edc5e1ae-a3ed-45af-ae77-10409a66cd03","name":"Format","key":"format","type":"exec","position_x":37,"position_y":1,"options":{"code":"module.exports = function(data) {\\n\\treturn {\\n        ...data.$trigger,\\n        body: data.render.template\\n    }\\n}"},"flow":"5429ccb0-7e97-4ef5-9d65-2bbcf964f9a6","date_created":"2024-09-25T13:31:35.265Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
657	658	directus_operations	fbf696ea-c6af-4230-8f62-c663beebd6d9	{"id":"fbf696ea-c6af-4230-8f62-c663beebd6d9","name":"Render","key":"render","type":"trigger","position_x":41,"position_y":1,"options":{"flow":"5429ccb0-7e97-4ef5-9d65-2bbcf964f9a6","payload":"{{ format }}"},"flow":"61757ab0-b139-4079-b5eb-4e05bb8142ac","date_created":"2024-09-25T13:29:26.743Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"fbf696ea-c6af-4230-8f62-c663beebd6d9","name":"Render","key":"render","type":"trigger","position_x":41,"position_y":1,"options":{"flow":"5429ccb0-7e97-4ef5-9d65-2bbcf964f9a6","payload":"{{ format }}"},"flow":"61757ab0-b139-4079-b5eb-4e05bb8142ac","date_created":"2024-09-25T13:29:26.743Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
658	659	directus_operations	fd271542-fac2-42d8-aa10-a02520c3753f	{"id":"fd271542-fac2-42d8-aa10-a02520c3753f","name":"Format","key":"format","type":"exec","position_x":37,"position_y":1,"options":{"code":"module.exports = async function(data) {\\n    return data.read_globals[0]\\n}"},"flow":"69e87d0b-df14-4779-bdc8-abc05f2f1e97","date_created":"2024-02-26T13:03:38.753Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	{"id":"fd271542-fac2-42d8-aa10-a02520c3753f","name":"Format","key":"format","type":"exec","position_x":37,"position_y":1,"options":{"code":"module.exports = async function(data) {\\n    return data.read_globals[0]\\n}"},"flow":"69e87d0b-df14-4779-bdc8-abc05f2f1e97","date_created":"2024-02-26T13:03:38.753Z","user_created":"d56956bf-6ed0-465e-bb4a-ec9bde65c5f0"}	\N	\N
659	660	directus_operations	0beeeb1a-2338-4ab4-95f5-0757bf3e43be	{"id":"0beeeb1a-2338-4ab4-95f5-0757bf3e43be","name":"Log Error","key":"log_error","type":"log","position_x":37,"position_y":17,"options":{"message":"Trigger did NOT include a `to` address. "},"resolve":null,"reject":null,"flow":"7c8732cd-9d9e-44be-a3f6-89c0d42c7687","date_created":"2025-01-14T10:43:22.602Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":null,"reject":null}	\N	\N
661	662	directus_operations	2adf33da-7fd7-42f7-a6fe-48409463d51b	{"id":"2adf33da-7fd7-42f7-a6fe-48409463d51b","name":"Update","key":"update","type":"item-update","position_x":92,"position_y":1,"options":{"collection":"posts","payload":{"image":"{{import.data.data.id}}"},"key":"{{$trigger.body.keys}}","permissions":"$full"},"resolve":null,"reject":null,"flow":"d4bbac48-a444-49e0-aedb-9af5273b88df","date_created":"2025-01-14T10:43:22.612Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":null,"reject":null}	\N	\N
748	757	directus_fields	181	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"video_course_chapters"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"video_course_chapters"}	\N	\N
665	666	directus_operations	5df25cf8-b407-4fef-9d3b-c328f89f1561	{"id":"5df25cf8-b407-4fef-9d3b-c328f89f1561","name":"Prompt","key":"prompt","type":"directus-labs-ai-writer-operation","position_x":37,"position_y":1,"options":{"apiKey":"{{globals.openai_api_key}}","promptKey":"custom","system":"You are an expert in writing prompts for generating images through Dall•E 3. \\n\\n## Rules\\nReturn only the prompt text","text":"Use the following information and context to write a prompt to generate an image for a blog post.\\n\\nImage Style:\\n{{ $trigger.body.prompt }}\\n\\nAspect Ratio: \\n{{ $trigger.body.aspect_ratio }}\\n\\nColor Palette:\\n{{ $trigger.body.colors }}","model":"gpt-4o-mini","aiProvider":"openai","apiKeyOpenAi":"{{globals.openai_api_key}}"},"resolve":"d6f73e98-19ef-47d6-8d1f-99d77137d36b","reject":null,"flow":"d4bbac48-a444-49e0-aedb-9af5273b88df","date_created":"2025-01-14T10:43:22.634Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":"d6f73e98-19ef-47d6-8d1f-99d77137d36b","reject":null}	\N	\N
667	668	directus_operations	8673740a-f7f8-44dd-9abd-5a714e0d6c74	{"id":"8673740a-f7f8-44dd-9abd-5a714e0d6c74","name":"Send Email","key":"send_email","type":"mail","position_x":37,"position_y":1,"options":{"to":"{{$trigger.to}}","subject":"{{$trigger.subject}}","type":"wysiwyg","body":"<p>{{$trigger.body}}</p>"},"resolve":null,"reject":null,"flow":"7c8732cd-9d9e-44be-a3f6-89c0d42c7687","date_created":"2025-01-14T10:43:22.643Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":null,"reject":null}	\N	\N
669	670	directus_operations	bb1b1e3f-032e-48b7-b260-1cf3af4a116c	{"id":"bb1b1e3f-032e-48b7-b260-1cf3af4a116c","name":"Read Globals","key":"read_globals","type":"item-read","position_x":19,"position_y":1,"options":{"permissions":"$full","collection":"globals"},"resolve":"fd271542-fac2-42d8-aa10-a02520c3753f","reject":null,"flow":"69e87d0b-df14-4779-bdc8-abc05f2f1e97","date_created":"2025-01-14T10:43:22.652Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":"fd271542-fac2-42d8-aa10-a02520c3753f","reject":null}	\N	\N
671	672	directus_operations	c846f644-e7c1-43c9-8bb7-81181de0cd60	{"id":"c846f644-e7c1-43c9-8bb7-81181de0cd60","name":"Render Template","key":"render","type":"liquidjs-operation","position_x":19,"position_y":1,"options":{"publicUrl":"http://localhost:8001/","mode":"custom","operationMode":"single","template":"{{ $trigger.template }}","data":"{{ $trigger.data }}"},"resolve":"edc5e1ae-a3ed-45af-ae77-10409a66cd03","reject":null,"flow":"5429ccb0-7e97-4ef5-9d65-2bbcf964f9a6","date_created":"2025-01-14T10:43:22.659Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":"edc5e1ae-a3ed-45af-ae77-10409a66cd03","reject":null}	\N	\N
673	674	directus_operations	dff1a702-bcc0-4528-905e-309feb880111	{"id":"dff1a702-bcc0-4528-905e-309feb880111","name":"Format","key":"format","type":"exec","position_x":19,"position_y":18,"options":{"code":"/**\\n * Prepares email template data by matching trigger values with form fields\\n * @param {Object} trigger - The trigger object containing payload values\\n * @param {Object} form - The form object containing fields and email templates\\n * @returns {Array} Array of prepared email template objects\\n * @throws {Error} If required data is missing or invalid\\n */\\nfunction prepareEmailTemplateData(trigger, form) {\\n  // Validate input parameters\\n  if (!trigger?.payload?.values || !Array.isArray(trigger.payload.values)) {\\n    throw new Error('Invalid trigger payload values');\\n  }\\n  \\n  if (!form?.fields || !Array.isArray(form.fields)) {\\n    throw new Error('Invalid form fields');\\n  }\\n  \\n  if (!form?.emails || !Array.isArray(form.emails)) {\\n    throw new Error('Invalid form emails');\\n  }\\n\\n  // Create an object to store the field name-value pairs\\n  const data = {};\\n  \\n  // Iterate through the trigger values and match them with form fields\\n  trigger.payload.values.forEach(item => {\\n    if (!item || typeof item !== 'object') {\\n      throw new Error('Invalid trigger value item');\\n    }\\n\\n    // Ensure required properties exist\\n    if (!item.field && !item.field_name) {\\n      throw new Error('Missing field identifier in trigger value');\\n    }\\n    \\n    if (item.value === undefined) {\\n      throw new Error('Missing value in trigger value');\\n    }\\n\\n    // Find the corresponding field in the form\\n    const formField = form.fields.find(field => field.id === item.field);\\n    \\n    // If a matching field is found, use its name as the key\\n    if (formField && formField.name) {\\n      data[formField.name] = item.value;\\n    } else {\\n      // Fallback to using the field_name from the trigger if no match is found\\n      data[item.field_name || item.field] = item.value;\\n    }\\n  });\\n\\n  // Process and validate all email templates\\n  const emailTemplates = form.emails.map(email => {\\n    // Validate required email template properties\\n    if (!email.subject) {\\n      throw new Error('Missing email subject');\\n    }\\n    \\n    if (!email.message) {\\n      throw new Error('Missing email message template');\\n    }\\n    \\n    if (!email.to) {\\n      throw new Error('Missing email recipient');\\n    }\\n\\n    // Normalize 'to' field to always be an array\\n    const toField = Array.isArray(email.to) ? email.to : [email.to];\\n    \\n    // Validate each email address\\n    toField.forEach(recipient => {\\n      if (typeof recipient !== 'string' || !recipient.trim()) {\\n        throw new Error('Invalid email recipient');\\n      }\\n    });\\n\\n    return {\\n      to: toField,\\n      subject: email.subject,\\n      template: email.message,\\n      data: data\\n    };\\n  });\\n\\n  return emailTemplates;\\n}\\n\\nmodule.exports = function(data) {\\n  if (!data?.$trigger || !data?.form) {\\n    throw new Error('Missing required data');\\n  }\\n  \\n  return prepareEmailTemplateData(data.$trigger, data.form);\\n};"},"resolve":"fbf696ea-c6af-4230-8f62-c663beebd6d9","reject":null,"flow":"61757ab0-b139-4079-b5eb-4e05bb8142ac","date_created":"2025-01-14T10:43:22.665Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":"fbf696ea-c6af-4230-8f62-c663beebd6d9","reject":null}	\N	\N
675	676	directus_operations	e6c50f84-e229-4f15-8119-c7708256e825	{"id":"e6c50f84-e229-4f15-8119-c7708256e825","name":"Update","key":"update","type":"item-update","position_x":73,"position_y":1,"options":{"collection":"posts","permissions":"$full","key":["{{$trigger.body.keys}}"],"payload":"{{format}}"},"resolve":null,"reject":null,"flow":"5915dd55-fff8-4d47-b48c-a0e42e5033c1","date_created":"2025-01-14T10:43:22.674Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":null,"reject":null}	\N	\N
677	678	directus_operations	fbf696ea-c6af-4230-8f62-c663beebd6d9	{"id":"fbf696ea-c6af-4230-8f62-c663beebd6d9","name":"Render","key":"render","type":"trigger","position_x":41,"position_y":1,"options":{"flow":"5429ccb0-7e97-4ef5-9d65-2bbcf964f9a6","payload":"{{ format }}"},"resolve":"e12b95db-a408-4e7e-b30b-264f7fa8baa3","reject":null,"flow":"61757ab0-b139-4079-b5eb-4e05bb8142ac","date_created":"2025-01-14T10:43:22.681Z","user_created":"60f562f9-84b6-4914-bf63-a7193567fcdf"}	{"resolve":"e12b95db-a408-4e7e-b30b-264f7fa8baa3","reject":null}	\N	\N
679	680	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":"/^.{8,}$/","storage_asset_transform":"all","storage_asset_presets":[{"key":"800w","fit":"inside","width":800,"quality":90,"withoutEnlargement":true,"format":"webp","transforms":[],"height":null},{"key":"1200w","fit":"inside","width":1200,"quality":90,"withoutEnlargement":true,"format":"webp","transforms":[]}],"custom_css":".v-divider.inlineTitle.large.add-margin-top {\\n    margin-top: 0 !important;\\n}\\n\\nbody {\\n    font-size: 16px !important;\\n}\\n\\n.drawer-item-content {\\n   --theme--form--row-gap: 18px;\\n   --theme--form--column-gap: 32px;\\n}\\n\\n.v-workspace-tile {\\n    background: #fff !important;\\n}","storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"link","id":"docs","name":"Directus Docs","url":"https://docs.directus.io","icon":"help_outline","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true},{"type":"module","id":"global-search","enabled":true}],"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":"Directus Default","theme_light_overrides":{"form":{"rowGap":"18px","field":{"input":{"height":"52px","background":"#ffffff"}}},"borderWidth":"1px","navigation":{"modules":{"background":"color-mix(in srgb, #000000, var(--theme--primary) 80%)","button":{"foreground":"color-mix(in srgb, #FFFFFF, var(--theme--primary) 20%)","foregroundActive":"var(--theme--primary)","backgroundActive":"#FFFFFF"}},"background":"#fff","project":{"background":"transparent"},"borderColor":"color-mix(in srgb, #000000, var(--theme--background) 95%)","borderWidth":"1px","list":{"divider":{"borderColor":"var(--theme--border-color-subdued)"},"backgroundHover":"color-mix(in srgb, #FFFFFF, var(--theme--primary) 10%)","backgroundActive":"color-mix(in srgb, #FFFFFF, var(--theme--primary) 15%)"}},"fonts":{"display":{"fontFamily":"\\"Space Grotesk\\", system-ui","fontWeight":"600"},"sans":{"fontFamily":"\\"DM Sans\\", system-ui"}},"borderRadius":"6px","sidebar":{"background":"#FFFFFF","borderWidth":"1px","borderColor":"var(--theme--border-color-subdued)","section":{"toggle":{"borderColor":"var(--theme--border-color-subdued)","borderWidth":"1px","background":"#FFFFFF","foreground":"var(--theme--foreground)","foregroundHover":"var(--theme--foreground)","icon":{"foreground":"var(--theme--foreground)","foregroundHover":"var(--theme--foreground)","foregroundActive":"var(--theme--foreground-accent)"}}}},"backgroundAccent":"color-mix(in srgb, #FFFFFF, var(--theme--primary) 10%)"},"default_theme_dark":null,"theme_dark_overrides":{},"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"command_palette_settings":{"searchMode":"as_you_type","collections":[{"collection":"pages","displayTemplate":"{{title}}","descriptionField":"permalink","fields":["title","permalink"],"limit":10,"availableGlobally":false},{"collection":"posts","displayTemplate":"{{title}}","descriptionField":"description","fields":["title","description"],"limit":10,"availableGlobally":true},{"collection":"forms","displayTemplate":"{{title}}","descriptionField":null,"fields":["values.field_name","title"],"limit":10,"availableGlobally":false}],"triggerRate":250,"commandPaletteEnabled":true}}	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":"/^.{8,}$/","storage_asset_transform":"all","storage_asset_presets":[{"key":"800w","fit":"inside","width":800,"quality":90,"withoutEnlargement":true,"format":"webp","transforms":[],"height":null},{"key":"1200w","fit":"inside","width":1200,"quality":90,"withoutEnlargement":true,"format":"webp","transforms":[]}],"custom_css":".v-divider.inlineTitle.large.add-margin-top {\\n    margin-top: 0 !important;\\n}\\n\\nbody {\\n    font-size: 16px !important;\\n}\\n\\n.drawer-item-content {\\n   --theme--form--row-gap: 18px;\\n   --theme--form--column-gap: 32px;\\n}\\n\\n.v-workspace-tile {\\n    background: #fff !important;\\n}","storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"link","id":"docs","name":"Directus Docs","url":"https://docs.directus.io","icon":"help_outline","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true},{"type":"module","id":"global-search","enabled":true}],"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":"Directus Default","theme_light_overrides":{"form":{"rowGap":"18px","field":{"input":{"height":"52px","background":"#ffffff"}}},"borderWidth":"1px","navigation":{"modules":{"background":"color-mix(in srgb, #000000, var(--theme--primary) 80%)","button":{"foreground":"color-mix(in srgb, #FFFFFF, var(--theme--primary) 20%)","foregroundActive":"var(--theme--primary)","backgroundActive":"#FFFFFF"}},"background":"#fff","project":{"background":"transparent"},"borderColor":"color-mix(in srgb, #000000, var(--theme--background) 95%)","borderWidth":"1px","list":{"divider":{"borderColor":"var(--theme--border-color-subdued)"},"backgroundHover":"color-mix(in srgb, #FFFFFF, var(--theme--primary) 10%)","backgroundActive":"color-mix(in srgb, #FFFFFF, var(--theme--primary) 15%)"}},"fonts":{"display":{"fontFamily":"\\"Space Grotesk\\", system-ui","fontWeight":"600"},"sans":{"fontFamily":"\\"DM Sans\\", system-ui"}},"borderRadius":"6px","sidebar":{"background":"#FFFFFF","borderWidth":"1px","borderColor":"var(--theme--border-color-subdued)","section":{"toggle":{"borderColor":"var(--theme--border-color-subdued)","borderWidth":"1px","background":"#FFFFFF","foreground":"var(--theme--foreground)","foregroundHover":"var(--theme--foreground)","icon":{"foreground":"var(--theme--foreground)","foregroundHover":"var(--theme--foreground)","foregroundActive":"var(--theme--foreground-accent)"}}}},"backgroundAccent":"color-mix(in srgb, #FFFFFF, var(--theme--primary) 10%)"},"default_theme_dark":null,"theme_dark_overrides":{},"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"command_palette_settings":{"searchMode":"as_you_type","collections":[{"collection":"pages","displayTemplate":"{{title}}","descriptionField":"permalink","fields":["title","permalink"],"limit":10,"availableGlobally":false},{"collection":"posts","displayTemplate":"{{title}}","descriptionField":"description","fields":["title","description"],"limit":10,"availableGlobally":true},{"collection":"forms","displayTemplate":"{{title}}","descriptionField":null,"fields":["values.field_name","title"],"limit":10,"availableGlobally":false}],"triggerRate":250,"commandPaletteEnabled":true}}	\N	\N
680	681	directus_extensions	1c09c3a4-2750-4a01-94fd-c0d91fe35870	{"id":"1c09c3a4-2750-4a01-94fd-c0d91fe35870","enabled":true,"folder":"467d87ba-5246-41b7-be33-2bd0aa9c6c5e","source":"registry","bundle":null}	{"id":"1c09c3a4-2750-4a01-94fd-c0d91fe35870","enabled":true,"folder":"467d87ba-5246-41b7-be33-2bd0aa9c6c5e","source":"registry","bundle":null}	\N	\N
749	758	directus_collections	video_course_chapters	{"singleton":false,"collection":"video_course_chapters"}	{"singleton":false,"collection":"video_course_chapters"}	\N	\N
683	684	directus_extensions	8a827d6a-f820-4814-8803-9bcf398282d4	{"id":"8a827d6a-f820-4814-8803-9bcf398282d4","enabled":true,"folder":"9bde3cf6-c3bd-4bbf-befe-e65294d4b632","source":"registry","bundle":null}	{"id":"8a827d6a-f820-4814-8803-9bcf398282d4","enabled":true,"folder":"9bde3cf6-c3bd-4bbf-befe-e65294d4b632","source":"registry","bundle":null}	\N	\N
684	685	directus_extensions	8c20b301-38aa-48a7-99c4-3142338da1b2	{"id":"8c20b301-38aa-48a7-99c4-3142338da1b2","enabled":true,"folder":"b9534a05-19a0-4f19-912b-729086969eef","source":"registry","bundle":null}	{"id":"8c20b301-38aa-48a7-99c4-3142338da1b2","enabled":true,"folder":"b9534a05-19a0-4f19-912b-729086969eef","source":"registry","bundle":null}	\N	\N
685	686	directus_extensions	c53d1496-ab3b-4a23-9b0c-9fb8ce85800f	{"id":"c53d1496-ab3b-4a23-9b0c-9fb8ce85800f","enabled":true,"folder":"e77fd62a-c9f5-4937-b153-cf10d8d13264","source":"registry","bundle":null}	{"id":"c53d1496-ab3b-4a23-9b0c-9fb8ce85800f","enabled":true,"folder":"e77fd62a-c9f5-4937-b153-cf10d8d13264","source":"registry","bundle":null}	\N	\N
686	687	directus_extensions	bfa185ec-f15c-4d3e-8e0e-06925ba6cdfe	{"id":"bfa185ec-f15c-4d3e-8e0e-06925ba6cdfe","enabled":true,"folder":"3b80b125-4f65-4a6f-96c6-4ede2ed9f506","source":"registry","bundle":null}	{"id":"bfa185ec-f15c-4d3e-8e0e-06925ba6cdfe","enabled":true,"folder":"3b80b125-4f65-4a6f-96c6-4ede2ed9f506","source":"registry","bundle":null}	\N	\N
687	688	directus_extensions	dab2c341-5ce5-42da-872f-40e596c4db16	{"id":"dab2c341-5ce5-42da-872f-40e596c4db16","enabled":true,"folder":"9621987d-012d-475a-bd7f-e293cac7b077","source":"registry","bundle":null}	{"id":"dab2c341-5ce5-42da-872f-40e596c4db16","enabled":true,"folder":"9621987d-012d-475a-bd7f-e293cac7b077","source":"registry","bundle":null}	\N	\N
688	689	globals	ab89c489-faea-4310-8b59-7ddb3caf279a	{"description":"We empower you to build the best site possible","id":"ab89c489-faea-4310-8b59-7ddb3caf279a","social_links":[{"service":"github","url":"https://github.com/directus/directus"},{"service":"linkedin","url":"https://www.linkedin.com/company/directus-io"},{"service":"youtube","url":"https://www.youtube.com/c/DirectusVideos"},{"url":"https://directus.chat/","service":"discord"},{"service":"twitter","url":"https://twitter.com/directus"}],"tagline":"The best site ever","title":"Your Site","url":"http://127.0.0.1:5173","favicon":"2b4a0ba0-52c7-4e10-b191-c803d8da6a36","logo":"43ddd7b8-9b2f-4aa1-b63c-933b4ae81ca2","openai_api_key":null,"directus_url":"http://0.0.0.0:8055","primary_color":"#6644FF"}	{"url":"http://127.0.0.1:5173"}	\N	\N
689	690	globals	ab89c489-faea-4310-8b59-7ddb3caf279a	{"description":"We empower you to build the best site possible","id":"ab89c489-faea-4310-8b59-7ddb3caf279a","social_links":[{"service":"github","url":"https://github.com/directus/directus"},{"service":"linkedin","url":"https://www.linkedin.com/company/directus-io"},{"service":"youtube","url":"https://www.youtube.com/c/DirectusVideos"},{"url":"https://directus.chat/","service":"discord"},{"service":"twitter","url":"https://twitter.com/directus"}],"tagline":"The best site ever","title":"Meijer theorie","url":"http://127.0.0.1:5173","favicon":"2b4a0ba0-52c7-4e10-b191-c803d8da6a36","logo":"43ddd7b8-9b2f-4aa1-b63c-933b4ae81ca2","openai_api_key":null,"directus_url":"http://0.0.0.0:8055","primary_color":"#6644FF"}	{"title":"Meijer theorie"}	\N	\N
690	692	directus_extensions	2e7698db-cfb1-471f-bed1-5e975a4071bb	{"enabled":false,"id":"2e7698db-cfb1-471f-bed1-5e975a4071bb","folder":"directus-extension-generate-types-master","source":"local","bundle":null}	{"enabled":false}	\N	\N
691	693	directus_extensions	2e7698db-cfb1-471f-bed1-5e975a4071bb	{"enabled":true,"id":"2e7698db-cfb1-471f-bed1-5e975a4071bb","folder":"directus-extension-generate-types-master","source":"local","bundle":null}	{"enabled":true}	\N	\N
692	697	directus_extensions	b392a0ff-61c3-4d8e-a6db-631135986a15	{"id":"b392a0ff-61c3-4d8e-a6db-631135986a15","enabled":true,"folder":"25990187-d028-4099-ae46-70232d998d9f","source":"registry","bundle":null}	{"id":"b392a0ff-61c3-4d8e-a6db-631135986a15","enabled":true,"folder":"25990187-d028-4099-ae46-70232d998d9f","source":"registry","bundle":null}	\N	\N
693	698	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":"/^.{8,}$/","storage_asset_transform":"all","storage_asset_presets":[{"key":"800w","fit":"inside","width":800,"quality":90,"withoutEnlargement":true,"format":"webp","transforms":[],"height":null},{"key":"1200w","fit":"inside","width":1200,"quality":90,"withoutEnlargement":true,"format":"webp","transforms":[]}],"custom_css":".v-divider.inlineTitle.large.add-margin-top {\\n    margin-top: 0 !important;\\n}\\n\\nbody {\\n    font-size: 16px !important;\\n}\\n\\n.drawer-item-content {\\n   --theme--form--row-gap: 18px;\\n   --theme--form--column-gap: 32px;\\n}\\n\\n.v-workspace-tile {\\n    background: #fff !important;\\n}","storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"link","id":"docs","name":"Directus Docs","url":"https://docs.directus.io","icon":"help_outline","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true},{"type":"module","id":"global-search","enabled":true},{"type":"module","id":"generate-types","enabled":true}],"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":"Directus Default","theme_light_overrides":{"form":{"rowGap":"18px","field":{"input":{"height":"52px","background":"#ffffff"}}},"borderWidth":"1px","navigation":{"modules":{"background":"color-mix(in srgb, #000000, var(--theme--primary) 80%)","button":{"foreground":"color-mix(in srgb, #FFFFFF, var(--theme--primary) 20%)","foregroundActive":"var(--theme--primary)","backgroundActive":"#FFFFFF"}},"background":"#fff","project":{"background":"transparent"},"borderColor":"color-mix(in srgb, #000000, var(--theme--background) 95%)","borderWidth":"1px","list":{"divider":{"borderColor":"var(--theme--border-color-subdued)"},"backgroundHover":"color-mix(in srgb, #FFFFFF, var(--theme--primary) 10%)","backgroundActive":"color-mix(in srgb, #FFFFFF, var(--theme--primary) 15%)"}},"fonts":{"display":{"fontFamily":"\\"Space Grotesk\\", system-ui","fontWeight":"600"},"sans":{"fontFamily":"\\"DM Sans\\", system-ui"}},"borderRadius":"6px","sidebar":{"background":"#FFFFFF","borderWidth":"1px","borderColor":"var(--theme--border-color-subdued)","section":{"toggle":{"borderColor":"var(--theme--border-color-subdued)","borderWidth":"1px","background":"#FFFFFF","foreground":"var(--theme--foreground)","foregroundHover":"var(--theme--foreground)","icon":{"foreground":"var(--theme--foreground)","foregroundHover":"var(--theme--foreground)","foregroundActive":"var(--theme--foreground-accent)"}}}},"backgroundAccent":"color-mix(in srgb, #FFFFFF, var(--theme--primary) 10%)"},"default_theme_dark":null,"theme_dark_overrides":{},"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"command_palette_settings":{"searchMode":"as_you_type","collections":[{"collection":"pages","displayTemplate":"{{title}}","descriptionField":"permalink","fields":["title","permalink"],"limit":10,"availableGlobally":false},{"collection":"posts","displayTemplate":"{{title}}","descriptionField":"description","fields":["title","description"],"limit":10,"availableGlobally":true},{"collection":"forms","displayTemplate":"{{title}}","descriptionField":null,"fields":["values.field_name","title"],"limit":10,"availableGlobally":false}],"triggerRate":250,"commandPaletteEnabled":true}}	{"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"link","id":"docs","name":"Directus Docs","url":"https://docs.directus.io","icon":"help_outline","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true},{"type":"module","id":"global-search","enabled":true},{"type":"module","id":"generate-types","enabled":true}]}	\N	\N
694	699	directus_fields	164	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"subscriptions"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"subscriptions"}	\N	\N
695	700	directus_fields	165	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"subscriptions"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"subscriptions"}	\N	\N
696	701	directus_fields	166	{"sort":3,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"createdAt","collection":"subscriptions"}	{"sort":3,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"createdAt","collection":"subscriptions"}	\N	\N
697	702	directus_fields	167	{"sort":4,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"updatedAt","collection":"subscriptions"}	{"sort":4,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"updatedAt","collection":"subscriptions"}	\N	\N
698	703	directus_collections	subscriptions	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"subscriptions"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"subscriptions"}	\N	\N
699	704	directus_fields	168	{"sort":5,"interface":"datetime","special":null,"required":true,"options":{},"collection":"subscriptions","field":"expiresAt"}	{"sort":5,"interface":"datetime","special":null,"required":true,"options":{},"collection":"subscriptions","field":"expiresAt"}	\N	\N
700	705	directus_fields	168	{"id":168,"collection":"subscriptions","field":"expiresAt","special":null,"interface":"datetime","options":{},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscriptions","field":"expiresAt","width":"half"}	\N	\N
701	706	directus_fields	166	{"id":166,"collection":"subscriptions","field":"createdAt","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"subscriptions","field":"createdAt","required":false}	\N	\N
702	707	directus_fields	166	{"id":166,"collection":"subscriptions","field":"createdAt","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"subscriptions","field":"createdAt","hidden":false}	\N	\N
703	708	directus_fields	169	{"sort":6,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"Car","value":"car","icon":"directions_car"},{"text":"Scooter","value":"scooter","icon":"bike_scooter"},{"text":"Motor","value":"motor","icon":"motorcycle"}]},"collection":"subscriptions","field":"type"}	{"sort":6,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"Car","value":"car","icon":"directions_car"},{"text":"Scooter","value":"scooter","icon":"bike_scooter"},{"text":"Motor","value":"motor","icon":"motorcycle"}]},"collection":"subscriptions","field":"type"}	\N	\N
704	709	directus_fields	169	{"id":169,"collection":"subscriptions","field":"type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Car","value":"car","icon":"directions_car"},{"text":"Scooter","value":"scooter","icon":"bike_scooter"},{"text":"Motor","value":"motor","icon":"motorcycle"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscriptions","field":"type","required":true}	\N	\N
705	710	directus_fields	170	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"subscription_tiers"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"subscription_tiers"}	\N	\N
706	711	directus_collections	subscription_tiers	{"singleton":false,"collection":"subscription_tiers"}	{"singleton":false,"collection":"subscription_tiers"}	\N	\N
707	712	directus_fields	171	{"sort":2,"interface":"file-image","special":["file"],"options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"required":true,"note":"Recommended size is 100x100 pixels","conditions":null,"validation":null,"collection":"subscription_tiers","field":"icon"}	{"sort":2,"interface":"file-image","special":["file"],"options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"required":true,"note":"Recommended size is 100x100 pixels","conditions":null,"validation":null,"collection":"subscription_tiers","field":"icon"}	\N	\N
708	713	directus_fields	172	{"sort":3,"interface":"input","special":null,"collection":"subscription_tiers","field":"title"}	{"sort":3,"interface":"input","special":null,"collection":"subscription_tiers","field":"title"}	\N	\N
709	714	directus_fields	172	{"id":172,"collection":"subscription_tiers","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"title","required":true}	\N	\N
710	715	directus_extensions	ba006417-d6d5-4eed-a8a8-d51d89073a9c	{"id":"ba006417-d6d5-4eed-a8a8-d51d89073a9c","enabled":true,"folder":"9108c453-4ebf-4827-a42c-b90740888480","source":"registry","bundle":null}	{"id":"ba006417-d6d5-4eed-a8a8-d51d89073a9c","enabled":true,"folder":"9108c453-4ebf-4827-a42c-b90740888480","source":"registry","bundle":null}	\N	\N
711	716	directus_fields	173	{"sort":4,"interface":"extension-wpslug","special":null,"options":{"template":"{{title}}","prefix":"{{title}}"},"required":true,"collection":"subscription_tiers","field":"slug"}	{"sort":4,"interface":"extension-wpslug","special":null,"options":{"template":"{{title}}","prefix":"{{title}}"},"required":true,"collection":"subscription_tiers","field":"slug"}	\N	\N
712	717	directus_fields	173	{"id":173,"collection":"subscription_tiers","field":"slug","special":null,"interface":"extension-wpslug","options":{"template":"{{title}}","prefix":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"slug","options":{"template":"{{title}}","prefix":null}}	\N	\N
713	718	directus_collections	subscription_tiers	{"collection":"subscription_tiers","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"subscriptions","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"subscriptions"}	\N	\N
714	719	directus_collections	website	{"collection":"website","icon":"folder_special","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
715	720	directus_collections	blocks	{"collection":"blocks","icon":"content_copy","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#1A212C","item_duplication_fields":null,"sort":2,"group":null,"collapse":"closed","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
716	721	directus_collections	subscriptions	{"collection":"subscriptions","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
717	722	directus_fields	170	{"id":170,"collection":"subscription_tiers","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"id","sort":1,"group":null}	\N	\N
718	723	directus_fields	171	{"id":171,"collection":"subscription_tiers","field":"icon","special":["file"],"interface":"file-image","options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":"Recommended size is 100x100 pixels","conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"icon","sort":2,"group":null}	\N	\N
719	724	directus_fields	173	{"id":173,"collection":"subscription_tiers","field":"slug","special":null,"interface":"extension-wpslug","options":{"template":"{{title}}","prefix":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"slug","sort":3,"group":null}	\N	\N
720	725	directus_fields	172	{"id":172,"collection":"subscription_tiers","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"title","sort":4,"group":null}	\N	\N
721	726	directus_fields	170	{"id":170,"collection":"subscription_tiers","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"id","sort":1,"group":null}	\N	\N
722	727	directus_fields	173	{"id":173,"collection":"subscription_tiers","field":"slug","special":null,"interface":"extension-wpslug","options":{"template":"{{title}}","prefix":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"slug","sort":2,"group":null}	\N	\N
723	728	directus_fields	172	{"id":172,"collection":"subscription_tiers","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"title","sort":3,"group":null}	\N	\N
724	729	directus_fields	171	{"id":171,"collection":"subscription_tiers","field":"icon","special":["file"],"interface":"file-image","options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":"Recommended size is 100x100 pixels","conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"icon","sort":4,"group":null}	\N	\N
725	730	directus_fields	174	{"sort":5,"interface":"input","special":null,"options":{"placeholder":"The duration of customer access to the platform"},"required":true,"collection":"subscription_tiers","field":"daysOfAccess"}	{"sort":5,"interface":"input","special":null,"options":{"placeholder":"The duration of customer access to the platform"},"required":true,"collection":"subscription_tiers","field":"daysOfAccess"}	\N	\N
726	731	directus_fields	175	{"sort":6,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"description","name":"description","type":"string","meta":{"field":"description","type":"string","required":true,"interface":"input"}}]},"required":true,"collection":"subscription_tiers","field":"featureList"}	{"sort":6,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"description","name":"description","type":"string","meta":{"field":"description","type":"string","required":true,"interface":"input"}}]},"required":true,"collection":"subscription_tiers","field":"featureList"}	\N	\N
727	732	directus_fields	176	{"sort":7,"interface":"input","special":null,"required":true,"options":{"min":0,"max":10000},"collection":"subscription_tiers","field":"price"}	{"sort":7,"interface":"input","special":null,"required":true,"options":{"min":0,"max":10000},"collection":"subscription_tiers","field":"price"}	\N	\N
728	733	directus_fields	177	{"sort":8,"interface":"input","special":null,"collection":"subscription_tiers","field":"discountPrice"}	{"sort":8,"interface":"input","special":null,"collection":"subscription_tiers","field":"discountPrice"}	\N	\N
729	734	directus_fields	176	{"id":176,"collection":"subscription_tiers","field":"price","special":null,"interface":"input","options":{"min":0,"max":10000},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"price","width":"half"}	\N	\N
730	735	directus_fields	177	{"id":177,"collection":"subscription_tiers","field":"discountPrice","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"discountPrice","width":"half"}	\N	\N
731	736	directus_extensions	2dc2e66e-5625-4c84-bf4d-0e76174739f9	{"id":"2dc2e66e-5625-4c84-bf4d-0e76174739f9","enabled":true,"folder":"91e6a795-a123-4426-b113-0288970f61e4","source":"registry","bundle":null}	{"id":"2dc2e66e-5625-4c84-bf4d-0e76174739f9","enabled":true,"folder":"91e6a795-a123-4426-b113-0288970f61e4","source":"registry","bundle":null}	\N	\N
732	738	directus_fields	178	{"sort":7,"interface":"select-dropdown-m2o","special":["m2o"],"required":true,"options":{"template":"{{title}}"},"collection":"subscriptions","field":"tier"}	{"sort":7,"interface":"select-dropdown-m2o","special":["m2o"],"required":true,"options":{"template":"{{title}}"},"collection":"subscriptions","field":"tier"}	\N	\N
733	739	directus_fields	179	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"required":true,"options":{"template":"{{type}}{{tier.title}}"},"collection":"directus_users","field":"subscription"}	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"required":true,"options":{"template":"{{type}}{{tier.title}}"},"collection":"directus_users","field":"subscription"}	\N	\N
734	740	directus_files	2af31103-959f-45a6-98b6-14c05a27412d	{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","title":"🚀","filename_download":"🚀.png","type":"image/png","storage":"local"}	{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","title":"🚀","filename_download":"🚀.png","type":"image/png","storage":"local"}	\N	\N
735	741	subscription_tiers	8e173084-fb18-45db-8d7a-bc78819b26ca	{"title":"Meijerdeluxe pakket","slug":"meijerdeluxe-pakket","icon":"2af31103-959f-45a6-98b6-14c05a27412d","daysOfAccess":"31","featureList":[{"description":"14 oefen examens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"De goedkoopste van Nederland!"}],"price":59.99}	{"title":"Meijerdeluxe pakket","slug":"meijerdeluxe-pakket","icon":"2af31103-959f-45a6-98b6-14c05a27412d","daysOfAccess":"31","featureList":[{"description":"14 oefen examens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"De goedkoopste van Nederland!"}],"price":59.99}	\N	\N
736	742	directus_files	f28f2e8f-dfe4-4021-a029-583f6c8a6da4	{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","title":"Wie Mag Hier Als Eerst Rijden 11","filename_download":"Wie-mag-hier-als-eerst-rijden-11.png","type":"image/png","storage":"local"}	{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","title":"Wie Mag Hier Als Eerst Rijden 11","filename_download":"Wie-mag-hier-als-eerst-rijden-11.png","type":"image/png","storage":"local"}	\N	\N
737	743	subscription_tiers	ab307bd9-1850-4117-886b-bb61bf4fc8cc	{"featureList":[{"description":"9 oefenexamens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"Goedkoopste van Nederland"}],"price":49.99,"icon":"f28f2e8f-dfe4-4021-a029-583f6c8a6da4","daysOfAccess":"9","title":"Gold pakket","slug":"gold-pakket"}	{"featureList":[{"description":"9 oefenexamens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"Goedkoopste van Nederland"}],"price":49.99,"icon":"f28f2e8f-dfe4-4021-a029-583f6c8a6da4","daysOfAccess":"9","title":"Gold pakket","slug":"gold-pakket"}	\N	\N
738	744	directus_files	788cae90-bd68-400c-a262-ff6c02b4555b	{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","title":"Wie Mag Hier Als Eerst Rijden 16","filename_download":"Wie-mag-hier-als-eerst-rijden-16.png","type":"image/png","storage":"local"}	{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","title":"Wie Mag Hier Als Eerst Rijden 16","filename_download":"Wie-mag-hier-als-eerst-rijden-16.png","type":"image/png","storage":"local"}	\N	\N
739	745	subscription_tiers	bdbafc2e-eeef-4c21-aed1-e9d806ed7612	{"title":"Zilver pakket","slug":"zilver-pakket","icon":"788cae90-bd68-400c-a262-ff6c02b4555b","daysOfAccess":"14","featureList":[{"description":"5 oefenexamens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"Goedkoopste van Nederland"}],"price":39.99}	{"title":"Zilver pakket","slug":"zilver-pakket","icon":"788cae90-bd68-400c-a262-ff6c02b4555b","daysOfAccess":"14","featureList":[{"description":"5 oefenexamens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"Goedkoopste van Nederland"}],"price":39.99}	\N	\N
740	746	directus_files	bcc1e125-9bed-4ea6-a28f-c619127a9423	{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","title":"Wie Mag Hier Als Eerst Rijden 17","filename_download":"Wie-mag-hier-als-eerst-rijden-17.png","type":"image/png","storage":"local"}	{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","title":"Wie Mag Hier Als Eerst Rijden 17","filename_download":"Wie-mag-hier-als-eerst-rijden-17.png","type":"image/png","storage":"local"}	\N	\N
741	747	subscription_tiers	0bebcf60-2913-49c8-b028-f3ce091ac4ab	{"featureList":[{"description":"3 oefenexamens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"Goedkoopste van Nederland"}],"price":29.99,"title":"Spoedpakket Lambo","slug":"spoedpakket-lambo","daysOfAccess":"3","icon":"bcc1e125-9bed-4ea6-a28f-c619127a9423"}	{"featureList":[{"description":"3 oefenexamens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"Goedkoopste van Nederland"}],"price":29.99,"title":"Spoedpakket Lambo","slug":"spoedpakket-lambo","daysOfAccess":"3","icon":"bcc1e125-9bed-4ea6-a28f-c619127a9423"}	\N	\N
743	749	directus_users	60f562f9-84b6-4914-bf63-a7193567fcdf	{"id":"60f562f9-84b6-4914-bf63-a7193567fcdf","first_name":"Admin","last_name":"User","email":"richard@codeit.ninja","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"c36d4878-9546-4449-857c-bd86f5e50eeb","token":"**********","last_access":"2025-01-14T14:00:58.516Z","last_page":"/users/60f562f9-84b6-4914-bf63-a7193567fcdf","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"subscription":1,"posts":[],"policies":[]}	{"subscription":1}	\N	\N
742	748	subscriptions	1	{"tier":"8e173084-fb18-45db-8d7a-bc78819b26ca","expiresAt":"2025-02-04T12:00:00"}	{"tier":"8e173084-fb18-45db-8d7a-bc78819b26ca","expiresAt":"2025-02-04T12:00:00"}	743	\N
744	750	directus_permissions	133	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"subscription_tiers","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"subscription_tiers","action":"read"}	\N	\N
745	751	directus_permissions	134	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"subscriptions","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"subscriptions","action":"read"}	\N	\N
746	755	directus_fields	180	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"video_courses"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"video_courses"}	\N	\N
747	756	directus_collections	video_courses	{"singleton":false,"collection":"video_courses"}	{"singleton":false,"collection":"video_courses"}	\N	\N
750	759	directus_fields	182	{"sort":2,"interface":"input","special":null,"required":true,"collection":"video_course_chapters","field":"title"}	{"sort":2,"interface":"input","special":null,"required":true,"collection":"video_course_chapters","field":"title"}	\N	\N
751	760	directus_fields	183	{"sort":3,"interface":"extension-wpslug","special":null,"required":true,"options":{"template":"{{title}}"},"collection":"video_course_chapters","field":"slug"}	{"sort":3,"interface":"extension-wpslug","special":null,"required":true,"options":{"template":"{{title}}"},"collection":"video_course_chapters","field":"slug"}	\N	\N
752	761	directus_fields	183	{"id":183,"collection":"video_course_chapters","field":"slug","special":null,"interface":"extension-wpslug","options":{"template":"{{title}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_course_chapters","field":"slug","width":"half"}	\N	\N
753	762	directus_fields	182	{"id":182,"collection":"video_course_chapters","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_course_chapters","field":"title","width":"half"}	\N	\N
754	763	directus_fields	184	{"sort":4,"interface":"file-image","special":["file"],"required":true,"collection":"video_course_chapters","field":"thumbnail"}	{"sort":4,"interface":"file-image","special":["file"],"required":true,"collection":"video_course_chapters","field":"thumbnail"}	\N	\N
755	764	directus_fields	185	{"sort":5,"interface":"input","special":null,"required":true,"collection":"video_course_chapters","field":"tagline"}	{"sort":5,"interface":"input","special":null,"required":true,"collection":"video_course_chapters","field":"tagline"}	\N	\N
756	765	directus_fields	181	{"id":181,"collection":"video_course_chapters","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"video_course_chapters","field":"id","sort":1,"group":null}	\N	\N
757	766	directus_fields	182	{"id":182,"collection":"video_course_chapters","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_course_chapters","field":"title","sort":2,"group":null}	\N	\N
758	767	directus_fields	183	{"id":183,"collection":"video_course_chapters","field":"slug","special":null,"interface":"extension-wpslug","options":{"template":"{{title}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_course_chapters","field":"slug","sort":3,"group":null}	\N	\N
759	768	directus_fields	185	{"id":185,"collection":"video_course_chapters","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_course_chapters","field":"tagline","sort":4,"group":null}	\N	\N
760	769	directus_fields	184	{"id":184,"collection":"video_course_chapters","field":"thumbnail","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_course_chapters","field":"thumbnail","sort":5,"group":null}	\N	\N
761	770	directus_fields	186	{"sort":6,"interface":"input","special":null,"required":true,"collection":"video_course_chapters","field":"estimatedDurationInMinutes"}	{"sort":6,"interface":"input","special":null,"required":true,"collection":"video_course_chapters","field":"estimatedDurationInMinutes"}	\N	\N
762	771	directus_fields	181	{"id":181,"collection":"video_course_chapters","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"video_course_chapters","field":"id","sort":1,"group":null}	\N	\N
763	772	directus_fields	182	{"id":182,"collection":"video_course_chapters","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_course_chapters","field":"title","sort":2,"group":null}	\N	\N
764	773	directus_fields	183	{"id":183,"collection":"video_course_chapters","field":"slug","special":null,"interface":"extension-wpslug","options":{"template":"{{title}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_course_chapters","field":"slug","sort":3,"group":null}	\N	\N
765	774	directus_fields	185	{"id":185,"collection":"video_course_chapters","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_course_chapters","field":"tagline","sort":4,"group":null}	\N	\N
766	775	directus_fields	186	{"id":186,"collection":"video_course_chapters","field":"estimatedDurationInMinutes","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_course_chapters","field":"estimatedDurationInMinutes","sort":5,"group":null}	\N	\N
767	776	directus_fields	184	{"id":184,"collection":"video_course_chapters","field":"thumbnail","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_course_chapters","field":"thumbnail","sort":6,"group":null}	\N	\N
768	777	directus_collections	website	{"collection":"website","icon":"folder_special","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
769	778	directus_collections	blocks	{"collection":"blocks","icon":"content_copy","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#1A212C","item_duplication_fields":null,"sort":2,"group":null,"collapse":"closed","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
770	779	directus_collections	subscriptions	{"collection":"subscriptions","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
771	780	directus_collections	video_courses	{"collection":"video_courses","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
772	781	directus_collections	video_course_chapters	{"collection":"video_course_chapters","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
773	782	directus_collections	video_course_chapters	{"collection":"video_course_chapters","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"video_courses","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"video_courses"}	\N	\N
774	783	directus_collections	website	{"collection":"website","icon":"folder_special","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
775	784	directus_collections	blocks	{"collection":"blocks","icon":"content_copy","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#1A212C","item_duplication_fields":null,"sort":2,"group":null,"collapse":"closed","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
776	785	directus_collections	subscriptions	{"collection":"subscriptions","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
777	786	directus_collections	video_courses	{"collection":"video_courses","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
778	787	directus_fields	187	{"sort":2,"interface":"list-o2m","special":["o2m"],"required":true,"options":{"template":"{{title}}"},"collection":"video_courses","field":"chapters"}	{"sort":2,"interface":"list-o2m","special":["o2m"],"required":true,"options":{"template":"{{title}}"},"collection":"video_courses","field":"chapters"}	\N	\N
779	788	directus_fields	188	{"sort":7,"interface":"select-dropdown-m2o","hidden":true,"collection":"video_course_chapters","field":"videoCourse"}	{"sort":7,"interface":"select-dropdown-m2o","hidden":true,"collection":"video_course_chapters","field":"videoCourse"}	\N	\N
780	789	directus_fields	189	{"sort":3,"interface":"input","special":null,"required":true,"collection":"video_courses","field":"title"}	{"sort":3,"interface":"input","special":null,"required":true,"collection":"video_courses","field":"title"}	\N	\N
781	790	directus_fields	180	{"id":180,"collection":"video_courses","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"video_courses","field":"id","sort":1,"group":null}	\N	\N
782	791	directus_fields	189	{"id":189,"collection":"video_courses","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_courses","field":"title","sort":2,"group":null}	\N	\N
783	792	directus_fields	187	{"id":187,"collection":"video_courses","field":"chapters","special":["o2m"],"interface":"list-o2m","options":{"template":"{{title}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_courses","field":"chapters","sort":3,"group":null}	\N	\N
784	793	directus_fields	189	{"id":189,"collection":"video_courses","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_courses","field":"title","width":"half"}	\N	\N
785	794	directus_fields	190	{"sort":4,"interface":"extension-wpslug","special":null,"options":{"template":"{{title}}"},"required":true,"collection":"video_courses","field":"slug"}	{"sort":4,"interface":"extension-wpslug","special":null,"options":{"template":"{{title}}"},"required":true,"collection":"video_courses","field":"slug"}	\N	\N
786	795	directus_fields	190	{"id":190,"collection":"video_courses","field":"slug","special":null,"interface":"extension-wpslug","options":{"template":"{{title}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_courses","field":"slug","width":"half"}	\N	\N
787	796	directus_fields	180	{"id":180,"collection":"video_courses","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"video_courses","field":"id","sort":1,"group":null}	\N	\N
788	797	directus_fields	189	{"id":189,"collection":"video_courses","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_courses","field":"title","sort":2,"group":null}	\N	\N
789	798	directus_fields	190	{"id":190,"collection":"video_courses","field":"slug","special":null,"interface":"extension-wpslug","options":{"template":"{{title}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_courses","field":"slug","sort":3,"group":null}	\N	\N
790	799	directus_fields	187	{"id":187,"collection":"video_courses","field":"chapters","special":["o2m"],"interface":"list-o2m","options":{"template":"{{title}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_courses","field":"chapters","sort":4,"group":null}	\N	\N
791	800	directus_collections	website	{"collection":"website","icon":"folder_special","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
792	801	directus_collections	blocks	{"collection":"blocks","icon":"content_copy","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#1A212C","item_duplication_fields":null,"sort":2,"group":null,"collapse":"closed","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
793	802	directus_collections	subscriptions	{"collection":"subscriptions","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
794	803	directus_collections	video_course_chapters	{"collection":"video_course_chapters","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
795	804	directus_collections	video_courses	{"collection":"video_courses","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
796	806	directus_fields	191	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"video_courses"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"video_courses"}	\N	\N
797	807	directus_collections	video_courses	{"singleton":false,"collection":"video_courses"}	{"singleton":false,"collection":"video_courses"}	\N	\N
798	808	directus_fields	192	{"sort":2,"collection":"video_courses","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null}	{"sort":2,"collection":"video_courses","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null}	\N	\N
799	809	directus_fields	193	{"sort":3,"collection":"video_courses","field":"slug","special":null,"interface":"extension-wpslug","options":{"template":"{{title}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null}	{"sort":3,"collection":"video_courses","field":"slug","special":null,"interface":"extension-wpslug","options":{"template":"{{title}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null}	\N	\N
800	810	directus_fields	194	{"sort":4,"collection":"video_courses","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null}	{"sort":4,"collection":"video_courses","field":"tagline","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null}	\N	\N
801	811	directus_fields	195	{"sort":5,"collection":"video_courses","field":"estimatedDurationInMinutes","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null}	{"sort":5,"collection":"video_courses","field":"estimatedDurationInMinutes","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"validation":null,"validation_message":null}	\N	\N
802	813	directus_fields	196	{"sort":6,"interface":"file-image","special":["file"],"required":true,"collection":"video_courses","field":"thumbnail"}	{"sort":6,"interface":"file-image","special":["file"],"required":true,"collection":"video_courses","field":"thumbnail"}	\N	\N
803	814	directus_fields	197	{"sort":9,"interface":"input","special":null,"collection":"subscription_tiers","field":"daysOfAccess"}	{"sort":9,"interface":"input","special":null,"collection":"subscription_tiers","field":"daysOfAccess"}	\N	\N
804	815	directus_fields	197	{"id":197,"collection":"subscription_tiers","field":"daysOfAccess","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"daysOfAccess","required":true}	\N	\N
805	816	directus_fields	170	{"id":170,"collection":"subscription_tiers","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"id","sort":1,"group":null}	\N	\N
806	817	directus_fields	173	{"id":173,"collection":"subscription_tiers","field":"slug","special":null,"interface":"extension-wpslug","options":{"template":"{{title}}","prefix":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"slug","sort":2,"group":null}	\N	\N
807	818	directus_fields	172	{"id":172,"collection":"subscription_tiers","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"title","sort":3,"group":null}	\N	\N
808	819	directus_fields	171	{"id":171,"collection":"subscription_tiers","field":"icon","special":["file"],"interface":"file-image","options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":"Recommended size is 100x100 pixels","conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"icon","sort":4,"group":null}	\N	\N
809	820	directus_fields	197	{"id":197,"collection":"subscription_tiers","field":"daysOfAccess","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"daysOfAccess","sort":5,"group":null}	\N	\N
810	821	directus_fields	175	{"id":175,"collection":"subscription_tiers","field":"featureList","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"description","name":"description","type":"string","meta":{"field":"description","type":"string","required":true,"interface":"input"}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"featureList","sort":6,"group":null}	\N	\N
811	822	directus_fields	176	{"id":176,"collection":"subscription_tiers","field":"price","special":null,"interface":"input","options":{"min":0,"max":10000},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"price","sort":7,"group":null}	\N	\N
812	823	directus_fields	177	{"id":177,"collection":"subscription_tiers","field":"discountPrice","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"discountPrice","sort":8,"group":null}	\N	\N
813	824	subscription_tiers	0bebcf60-2913-49c8-b028-f3ce091ac4ab	{"id":"0bebcf60-2913-49c8-b028-f3ce091ac4ab","icon":"bcc1e125-9bed-4ea6-a28f-c619127a9423","title":"Spoedpakket Lambo","slug":"spoedpakket-lambo","featureList":[{"description":"3 oefenexamens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"Goedkoopste van Nederland"}],"price":29.99,"discountPrice":null,"daysOfAccess":14}	{"daysOfAccess":14}	\N	\N
814	825	subscription_tiers	8e173084-fb18-45db-8d7a-bc78819b26ca	{"id":"8e173084-fb18-45db-8d7a-bc78819b26ca","icon":"2af31103-959f-45a6-98b6-14c05a27412d","title":"Meijerdeluxe pakket","slug":"meijerdeluxe-pakket","featureList":[{"description":"14 oefen examens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"De goedkoopste van Nederland!"}],"price":59.99,"discountPrice":null,"daysOfAccess":31}	{"daysOfAccess":31}	\N	\N
815	826	subscription_tiers	bdbafc2e-eeef-4c21-aed1-e9d806ed7612	{"id":"bdbafc2e-eeef-4c21-aed1-e9d806ed7612","icon":"788cae90-bd68-400c-a262-ff6c02b4555b","title":"Zilver pakket","slug":"zilver-pakket","featureList":[{"description":"5 oefenexamens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"Goedkoopste van Nederland"}],"price":39.99,"discountPrice":null,"daysOfAccess":3}	{"daysOfAccess":3}	\N	\N
816	827	subscription_tiers	ab307bd9-1850-4117-886b-bb61bf4fc8cc	{"id":"ab307bd9-1850-4117-886b-bb61bf4fc8cc","icon":"f28f2e8f-dfe4-4021-a029-583f6c8a6da4","title":"Gold pakket","slug":"gold-pakket","featureList":[{"description":"9 oefenexamens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"Goedkoopste van Nederland"}],"price":49.99,"discountPrice":null,"daysOfAccess":9}	{"daysOfAccess":9}	\N	\N
817	828	directus_fields	198	{"sort":9,"interface":"input","special":null,"required":true,"collection":"subscription_tiers","field":"maxPracticeExams"}	{"sort":9,"interface":"input","special":null,"required":true,"collection":"subscription_tiers","field":"maxPracticeExams"}	\N	\N
818	829	directus_fields	170	{"id":170,"collection":"subscription_tiers","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"id","sort":1,"group":null}	\N	\N
819	830	directus_fields	173	{"id":173,"collection":"subscription_tiers","field":"slug","special":null,"interface":"extension-wpslug","options":{"template":"{{title}}","prefix":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"slug","sort":2,"group":null}	\N	\N
820	831	directus_fields	172	{"id":172,"collection":"subscription_tiers","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"title","sort":3,"group":null}	\N	\N
821	832	directus_fields	171	{"id":171,"collection":"subscription_tiers","field":"icon","special":["file"],"interface":"file-image","options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":"Recommended size is 100x100 pixels","conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"icon","sort":4,"group":null}	\N	\N
822	833	directus_fields	197	{"id":197,"collection":"subscription_tiers","field":"daysOfAccess","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"daysOfAccess","sort":5,"group":null}	\N	\N
823	834	directus_fields	198	{"id":198,"collection":"subscription_tiers","field":"maxPracticeExams","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"maxPracticeExams","sort":6,"group":null}	\N	\N
824	835	directus_fields	175	{"id":175,"collection":"subscription_tiers","field":"featureList","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"description","name":"description","type":"string","meta":{"field":"description","type":"string","required":true,"interface":"input"}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"featureList","sort":7,"group":null}	\N	\N
825	836	directus_fields	176	{"id":176,"collection":"subscription_tiers","field":"price","special":null,"interface":"input","options":{"min":0,"max":10000},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"price","sort":8,"group":null}	\N	\N
826	837	directus_fields	177	{"id":177,"collection":"subscription_tiers","field":"discountPrice","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"discountPrice","sort":9,"group":null}	\N	\N
827	838	subscription_tiers	8e173084-fb18-45db-8d7a-bc78819b26ca	{"id":"8e173084-fb18-45db-8d7a-bc78819b26ca","icon":"2af31103-959f-45a6-98b6-14c05a27412d","title":"Meijerdeluxe pakket","slug":"meijerdeluxe-pakket","featureList":[{"description":"14 oefen examens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"De goedkoopste van Nederland!"}],"price":59.99,"discountPrice":null,"daysOfAccess":31,"maxPracticeExams":14}	{"maxPracticeExams":14}	\N	\N
828	839	subscription_tiers	0bebcf60-2913-49c8-b028-f3ce091ac4ab	{"id":"0bebcf60-2913-49c8-b028-f3ce091ac4ab","icon":"bcc1e125-9bed-4ea6-a28f-c619127a9423","title":"Spoedpakket Lambo","slug":"spoedpakket-lambo","featureList":[{"description":"3 oefenexamens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"Goedkoopste van Nederland"}],"price":29.99,"discountPrice":null,"daysOfAccess":14,"maxPracticeExams":9}	{"maxPracticeExams":9}	\N	\N
829	840	subscription_tiers	ab307bd9-1850-4117-886b-bb61bf4fc8cc	{"id":"ab307bd9-1850-4117-886b-bb61bf4fc8cc","icon":"f28f2e8f-dfe4-4021-a029-583f6c8a6da4","title":"Gold pakket","slug":"gold-pakket","featureList":[{"description":"9 oefenexamens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"Goedkoopste van Nederland"}],"price":49.99,"discountPrice":null,"daysOfAccess":9,"maxPracticeExams":6}	{"maxPracticeExams":6}	\N	\N
830	841	directus_fields	199	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"video_courses_lessons"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"video_courses_lessons"}	\N	\N
831	842	directus_collections	video_courses_lessons	{"singleton":false,"collection":"video_courses_lessons"}	{"singleton":false,"collection":"video_courses_lessons"}	\N	\N
832	843	directus_fields	200	{"sort":2,"interface":"input","special":null,"required":true,"collection":"video_courses_lessons","field":"title"}	{"sort":2,"interface":"input","special":null,"required":true,"collection":"video_courses_lessons","field":"title"}	\N	\N
833	844	directus_fields	201	{"sort":3,"interface":"file","special":["file"],"required":true,"options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"validation":null,"conditions":null,"collection":"video_courses_lessons","field":"video"}	{"sort":3,"interface":"file","special":["file"],"required":true,"options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"validation":null,"conditions":null,"collection":"video_courses_lessons","field":"video"}	\N	\N
834	845	directus_fields	202	{"sort":4,"interface":"input-multiline","special":null,"collection":"video_courses_lessons","field":"description"}	{"sort":4,"interface":"input-multiline","special":null,"collection":"video_courses_lessons","field":"description"}	\N	\N
835	846	directus_fields	199	{"id":199,"collection":"video_courses_lessons","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"video_courses_lessons","field":"id","sort":1,"group":null}	\N	\N
836	847	directus_fields	200	{"id":200,"collection":"video_courses_lessons","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_courses_lessons","field":"title","sort":2,"group":null}	\N	\N
837	848	directus_fields	202	{"id":202,"collection":"video_courses_lessons","field":"description","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"video_courses_lessons","field":"description","sort":3,"group":null}	\N	\N
838	849	directus_fields	201	{"id":201,"collection":"video_courses_lessons","field":"video","special":["file"],"interface":"file","options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"video_courses_lessons","field":"video","sort":4,"group":null}	\N	\N
839	850	directus_collections	video_courses_lessons	{"collection":"video_courses_lessons","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"video_courses","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"video_courses"}	\N	\N
840	851	directus_collections	website	{"collection":"website","icon":"folder_special","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
841	852	directus_collections	blocks	{"collection":"blocks","icon":"content_copy","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#1A212C","item_duplication_fields":null,"sort":2,"group":null,"collapse":"closed","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
842	853	directus_collections	subscriptions	{"collection":"subscriptions","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
843	854	directus_collections	video_courses	{"collection":"video_courses","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
844	855	directus_fields	203	{"sort":7,"interface":"list-o2m","special":["o2m"],"required":true,"options":{"template":"{{title}}"},"collection":"video_courses","field":"lessons"}	{"sort":7,"interface":"list-o2m","special":["o2m"],"required":true,"options":{"template":"{{title}}"},"collection":"video_courses","field":"lessons"}	\N	\N
845	856	directus_fields	204	{"sort":5,"interface":"select-dropdown-m2o","hidden":true,"collection":"video_courses_lessons","field":"videoCourse"}	{"sort":5,"interface":"select-dropdown-m2o","hidden":true,"collection":"video_courses_lessons","field":"videoCourse"}	\N	\N
846	857	directus_files	6fdbc31c-c2b2-46d0-b473-10dc08d9bc98	{"title":"335d19aa122ffaedd315fc9064882a30","filename_download":"335d19aa122ffaedd315fc9064882a30.png","type":"image/png","storage":"local"}	{"title":"335d19aa122ffaedd315fc9064882a30","filename_download":"335d19aa122ffaedd315fc9064882a30.png","type":"image/png","storage":"local"}	\N	\N
847	858	directus_files	82616dcf-a772-49b5-a4c3-f1d159b3d10a	{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","title":"Meijer Theorie 1.1","filename_download":"meijer-theorie-1.1.mp4","type":"video/mp4","storage":"local"}	{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","title":"Meijer Theorie 1.1","filename_download":"meijer-theorie-1.1.mp4","type":"video/mp4","storage":"local"}	\N	\N
848	859	directus_files	0b592bdc-d961-42aa-b8b8-4f609cbe1804	{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","title":"Meijer Theorie 1.2","filename_download":"meijer-theorie-1.2.mp4","type":"video/mp4","storage":"local"}	{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9","title":"Meijer Theorie 1.2","filename_download":"meijer-theorie-1.2.mp4","type":"video/mp4","storage":"local"}	\N	\N
851	862	video_courses	1	{"title":"Hoofdstuk 1","slug":"hoofdstuk-1","tagline":"Introductie","estimatedDurationInMinutes":36,"thumbnail":"6fdbc31c-c2b2-46d0-b473-10dc08d9bc98","lessons":{"create":[{"title":"Voertuigen","description":"In dit onderwerp gaan we het hebben over de verschillende voertuigen die je kan tegen komen op de weg.","video":"82616dcf-a772-49b5-a4c3-f1d159b3d10a"},{"description":"In deze video gaan we het hebben over de algemene bepalingen. ","title":"Algemene bepalingen","video":"0b592bdc-d961-42aa-b8b8-4f609cbe1804"}],"update":[],"delete":[]}}	{"title":"Hoofdstuk 1","slug":"hoofdstuk-1","tagline":"Introductie","estimatedDurationInMinutes":36,"thumbnail":"6fdbc31c-c2b2-46d0-b473-10dc08d9bc98","lessons":{"create":[{"title":"Voertuigen","description":"In dit onderwerp gaan we het hebben over de verschillende voertuigen die je kan tegen komen op de weg.","video":"82616dcf-a772-49b5-a4c3-f1d159b3d10a"},{"description":"In deze video gaan we het hebben over de algemene bepalingen. ","title":"Algemene bepalingen","video":"0b592bdc-d961-42aa-b8b8-4f609cbe1804"}],"update":[],"delete":[]}}	\N	\N
849	860	video_courses_lessons	1	{"title":"Voertuigen","description":"In dit onderwerp gaan we het hebben over de verschillende voertuigen die je kan tegen komen op de weg.","video":"82616dcf-a772-49b5-a4c3-f1d159b3d10a","videoCourse":1}	{"title":"Voertuigen","description":"In dit onderwerp gaan we het hebben over de verschillende voertuigen die je kan tegen komen op de weg.","video":"82616dcf-a772-49b5-a4c3-f1d159b3d10a","videoCourse":1}	851	\N
850	861	video_courses_lessons	2	{"description":"In deze video gaan we het hebben over de algemene bepalingen. ","title":"Algemene bepalingen","video":"0b592bdc-d961-42aa-b8b8-4f609cbe1804","videoCourse":1}	{"description":"In deze video gaan we het hebben over de algemene bepalingen. ","title":"Algemene bepalingen","video":"0b592bdc-d961-42aa-b8b8-4f609cbe1804","videoCourse":1}	851	\N
852	863	directus_fields	205	{"sort":10,"interface":"list-o2m","special":["o2m"],"required":true,"collection":"subscription_tiers","field":"videoCourses"}	{"sort":10,"interface":"list-o2m","special":["o2m"],"required":true,"collection":"subscription_tiers","field":"videoCourses"}	\N	\N
853	864	directus_fields	206	{"sort":8,"interface":"select-dropdown-m2o","hidden":true,"collection":"video_courses","field":"subscriptionTier"}	{"sort":8,"interface":"select-dropdown-m2o","hidden":true,"collection":"video_courses","field":"subscriptionTier"}	\N	\N
854	865	directus_fields	170	{"id":170,"collection":"subscription_tiers","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"id","sort":1,"group":null}	\N	\N
855	866	directus_fields	173	{"id":173,"collection":"subscription_tiers","field":"slug","special":null,"interface":"extension-wpslug","options":{"template":"{{title}}","prefix":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"slug","sort":2,"group":null}	\N	\N
856	867	directus_fields	172	{"id":172,"collection":"subscription_tiers","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"title","sort":3,"group":null}	\N	\N
878	892	directus_fields	206	{"id":206,"collection":"video_courses","field":"subscriptionTier","special":null,"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"video_courses","field":"subscriptionTier","hidden":false}	\N	\N
857	868	directus_fields	176	{"id":176,"collection":"subscription_tiers","field":"price","special":null,"interface":"input","options":{"min":0,"max":10000},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"price","sort":4,"group":null}	\N	\N
858	869	directus_fields	171	{"id":171,"collection":"subscription_tiers","field":"icon","special":["file"],"interface":"file-image","options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":"Recommended size is 100x100 pixels","conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"icon","sort":5,"group":null}	\N	\N
859	870	directus_fields	197	{"id":197,"collection":"subscription_tiers","field":"daysOfAccess","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"daysOfAccess","sort":6,"group":null}	\N	\N
860	871	directus_fields	198	{"id":198,"collection":"subscription_tiers","field":"maxPracticeExams","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"maxPracticeExams","sort":7,"group":null}	\N	\N
861	872	directus_fields	175	{"id":175,"collection":"subscription_tiers","field":"featureList","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"description","name":"description","type":"string","meta":{"field":"description","type":"string","required":true,"interface":"input"}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"featureList","sort":8,"group":null}	\N	\N
862	873	directus_fields	177	{"id":177,"collection":"subscription_tiers","field":"discountPrice","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"discountPrice","sort":9,"group":null}	\N	\N
863	874	directus_fields	205	{"id":205,"collection":"subscription_tiers","field":"videoCourses","special":["o2m"],"interface":"list-o2m","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"videoCourses","sort":10,"group":null}	\N	\N
864	875	directus_fields	170	{"id":170,"collection":"subscription_tiers","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"id","sort":1,"group":null}	\N	\N
865	876	directus_fields	173	{"id":173,"collection":"subscription_tiers","field":"slug","special":null,"interface":"extension-wpslug","options":{"template":"{{title}}","prefix":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"slug","sort":2,"group":null}	\N	\N
866	877	directus_fields	172	{"id":172,"collection":"subscription_tiers","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"title","sort":3,"group":null}	\N	\N
867	878	directus_fields	176	{"id":176,"collection":"subscription_tiers","field":"price","special":null,"interface":"input","options":{"min":0,"max":10000},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"price","sort":4,"group":null}	\N	\N
868	879	directus_fields	177	{"id":177,"collection":"subscription_tiers","field":"discountPrice","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"discountPrice","sort":5,"group":null}	\N	\N
869	880	directus_fields	171	{"id":171,"collection":"subscription_tiers","field":"icon","special":["file"],"interface":"file-image","options":{"folder":"ece7bab9-5433-4a63-b9f7-bde8b517d6d9"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":"Recommended size is 100x100 pixels","conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"icon","sort":6,"group":null}	\N	\N
870	881	directus_fields	197	{"id":197,"collection":"subscription_tiers","field":"daysOfAccess","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"daysOfAccess","sort":7,"group":null}	\N	\N
871	882	directus_fields	198	{"id":198,"collection":"subscription_tiers","field":"maxPracticeExams","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"maxPracticeExams","sort":8,"group":null}	\N	\N
872	883	directus_fields	175	{"id":175,"collection":"subscription_tiers","field":"featureList","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"description","name":"description","type":"string","meta":{"field":"description","type":"string","required":true,"interface":"input"}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"featureList","sort":9,"group":null}	\N	\N
873	884	directus_fields	205	{"id":205,"collection":"subscription_tiers","field":"videoCourses","special":["o2m"],"interface":"list-o2m","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"subscription_tiers","field":"videoCourses","sort":10,"group":null}	\N	\N
874	885	video_courses	1	{"id":1,"title":"Hoofdstuk 1","slug":"hoofdstuk-1","tagline":"Introductie","estimatedDurationInMinutes":36,"thumbnail":"6fdbc31c-c2b2-46d0-b473-10dc08d9bc98","subscriptionTier":"0bebcf60-2913-49c8-b028-f3ce091ac4ab","lessons":[1,2]}	{"subscriptionTier":"0bebcf60-2913-49c8-b028-f3ce091ac4ab"}	\N	\N
875	887	video_courses	1	{"id":1,"title":"Hoofdstuk 1","slug":"hoofdstuk-1","tagline":"Introductie","estimatedDurationInMinutes":36,"thumbnail":"6fdbc31c-c2b2-46d0-b473-10dc08d9bc98","subscriptionTier":"8e173084-fb18-45db-8d7a-bc78819b26ca","lessons":[1,2]}	{"subscriptionTier":"8e173084-fb18-45db-8d7a-bc78819b26ca"}	\N	\N
876	889	directus_permissions	135	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"video_courses","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"video_courses","action":"read"}	\N	\N
877	890	directus_permissions	136	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"video_courses_lessons","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"video_courses_lessons","action":"read"}	\N	\N
879	893	directus_files	c3b1434f-d9db-4b78-8cca-17fef70984a9	{"title":"Logo Meijer","filename_download":"logo-meijer.svg","type":"image/svg+xml","storage":"local"}	{"title":"Logo Meijer","filename_download":"logo-meijer.svg","type":"image/svg+xml","storage":"local"}	\N	\N
880	894	directus_files	cd1f8e25-d49f-46c8-ba43-55155b255f06	{"title":"Schermafbeelding 2024 09 06 114723 1 300x300","filename_download":"Schermafbeelding-2024-09-06-114723-1-300x300.png","type":"image/png","storage":"local"}	{"title":"Schermafbeelding 2024 09 06 114723 1 300x300","filename_download":"Schermafbeelding-2024-09-06-114723-1-300x300.png","type":"image/png","storage":"local"}	\N	\N
881	895	globals	ab89c489-faea-4310-8b59-7ddb3caf279a	{"description":"We empower you to build the best site possible","id":"ab89c489-faea-4310-8b59-7ddb3caf279a","social_links":[{"service":"github","url":"https://github.com/directus/directus"},{"service":"linkedin","url":"https://www.linkedin.com/company/directus-io"},{"service":"youtube","url":"https://www.youtube.com/c/DirectusVideos"},{"url":"https://directus.chat/","service":"discord"},{"service":"twitter","url":"https://twitter.com/directus"}],"tagline":"The best site ever","title":"Meijer theorie","url":"http://127.0.0.1:5173","favicon":"cd1f8e25-d49f-46c8-ba43-55155b255f06","logo":"c3b1434f-d9db-4b78-8cca-17fef70984a9","openai_api_key":null,"directus_url":"http://0.0.0.0:8055","primary_color":"#6644FF"}	{"favicon":"cd1f8e25-d49f-46c8-ba43-55155b255f06","logo":"c3b1434f-d9db-4b78-8cca-17fef70984a9"}	\N	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_roles (id, name, icon, description, parent) FROM stdin;
c36d4878-9546-4449-857c-bd86f5e50eeb	Administrator	verified	$t:admin_description	\N
8ba4ed6f-d330-4675-ae46-119c533a0928	Team Member	supervised_user_circle	Role for internal team members and employees	\N
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token) FROM stdin;
_ATgVPr8kDmEg05tNsOwBqoQyGAtX_f12VbacNTuChnMlSm8gdH73xIERL1QZSDJ	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-15 10:43:33.895+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	http://127.0.0.1:8055	\N
aQdGt9GFv1Ap9TAsaIMRomenk2a9GaVocpzje7pLWTQWPZZ-MaM2XFyFZVlL28c7	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-15 11:28:59.799+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	http://127.0.0.1:8055	\N
D6y-Fb9We1QAnF4tx5VrMMERiwzgggZDwg4gxh8l58hKlvmEB-M2leSvgYd9gYnJ	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-15 11:22:48.463+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	http://127.0.0.1:8055	\N
ThAHvqyLRI7MxVRrfvB8ZG2biyEPwT1LTg0ueECo8kcNpQsgzWzz79ZichZQxLJu	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-15 11:26:13.877+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	http://127.0.0.1:8055	\N
WrEMEbcMbb54vtxqHaDfG0TOH5CakQKWl_G6JzBj0hkw2uUTfJ4T_GdLXjSJJstN	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-14 14:58:50.34+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	http://127.0.0.1:8055	MexlL2LHdUMDxwz98ImHggj5F2vQBFosyR5PcffKrY5Li5lKfQ6Dn99bXEWVued0
MexlL2LHdUMDxwz98ImHggj5F2vQBFosyR5PcffKrY5Li5lKfQ6Dn99bXEWVued0	60f562f9-84b6-4914-bf63-a7193567fcdf	2025-01-15 14:58:40.339+00	172.21.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	http://127.0.0.1:8055	\N
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, report_error_url, report_bug_url, report_feature_url, public_registration, public_registration_verify_email, public_registration_role, public_registration_email_filter, command_palette_settings) FROM stdin;
1	Directus	\N	#6644FF	\N	\N	\N	\N	25	/^.{8,}$/	all	[{"key":"800w","fit":"inside","width":800,"quality":90,"withoutEnlargement":true,"format":"webp","transforms":[],"height":null},{"key":"1200w","fit":"inside","width":1200,"quality":90,"withoutEnlargement":true,"format":"webp","transforms":[]}]	.v-divider.inlineTitle.large.add-margin-top {\n    margin-top: 0 !important;\n}\n\nbody {\n    font-size: 16px !important;\n}\n\n.drawer-item-content {\n   --theme--form--row-gap: 18px;\n   --theme--form--column-gap: 32px;\n}\n\n.v-workspace-tile {\n    background: #fff !important;\n}	\N	\N	\N	[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"link","id":"docs","name":"Directus Docs","url":"https://docs.directus.io","icon":"help_outline","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true},{"type":"module","id":"global-search","enabled":true},{"type":"module","id":"generate-types","enabled":true}]	\N	en-US	\N	\N	auto	Directus Default	{"form":{"rowGap":"18px","field":{"input":{"height":"52px","background":"#ffffff"}}},"borderWidth":"1px","navigation":{"modules":{"background":"color-mix(in srgb, #000000, var(--theme--primary) 80%)","button":{"foreground":"color-mix(in srgb, #FFFFFF, var(--theme--primary) 20%)","foregroundActive":"var(--theme--primary)","backgroundActive":"#FFFFFF"}},"background":"#fff","project":{"background":"transparent"},"borderColor":"color-mix(in srgb, #000000, var(--theme--background) 95%)","borderWidth":"1px","list":{"divider":{"borderColor":"var(--theme--border-color-subdued)"},"backgroundHover":"color-mix(in srgb, #FFFFFF, var(--theme--primary) 10%)","backgroundActive":"color-mix(in srgb, #FFFFFF, var(--theme--primary) 15%)"}},"fonts":{"display":{"fontFamily":"\\"Space Grotesk\\", system-ui","fontWeight":"600"},"sans":{"fontFamily":"\\"DM Sans\\", system-ui"}},"borderRadius":"6px","sidebar":{"background":"#FFFFFF","borderWidth":"1px","borderColor":"var(--theme--border-color-subdued)","section":{"toggle":{"borderColor":"var(--theme--border-color-subdued)","borderWidth":"1px","background":"#FFFFFF","foreground":"var(--theme--foreground)","foregroundHover":"var(--theme--foreground)","icon":{"foreground":"var(--theme--foreground)","foregroundHover":"var(--theme--foreground)","foregroundActive":"var(--theme--foreground-accent)"}}}},"backgroundAccent":"color-mix(in srgb, #FFFFFF, var(--theme--primary) 10%)"}	\N	{}	\N	\N	\N	f	t	\N	\N	{"searchMode":"as_you_type","collections":[{"collection":"pages","displayTemplate":"{{title}}","descriptionField":"permalink","fields":["title","permalink"],"limit":10,"availableGlobally":false},{"collection":"posts","displayTemplate":"{{title}}","descriptionField":"description","fields":["title","description"],"limit":10,"availableGlobally":true},{"collection":"forms","displayTemplate":"{{title}}","descriptionField":null,"fields":["values.field_name","title"],"limit":10,"availableGlobally":false}],"triggerRate":250,"commandPaletteEnabled":true}
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides, subscription) FROM stdin;
60f562f9-84b6-4914-bf63-a7193567fcdf	Admin	User	richard@codeit.ninja	$argon2id$v=19$m=65536,t=3,p=4$RJcQ9WpW48oYbrw//JWwRQ$CPjd79nlZLHxOoZVk6Dbpp0nqR2mp6ijXqjv6mKbnxQ	\N	\N	\N	\N	\N	\N	\N	active	c36d4878-9546-4449-857c-bd86f5e50eeb	1nrsO0lzBtkRGPcVcxPsexKQrrW6v97d	2025-01-14 14:58:40.347+00	/content/globals	default	\N	\N	t	\N	\N	\N	\N	\N	1
88a6e8cf-f0f8-41db-a3a2-8a9741c086cc	Frontend	Bot	\N	\N	\N	For server-to-server communication	This user has API only access and is meant for communicating securely with Directus from your frontend.\n\nThis user has elevated permissions over the Public to:\n- Submit Forms \n- Upload Files \n\nFrom a security perspective, you would typically not want to allow public access to upload files or submit forms.\n\n- Generate a static token access below and include it in API calls to Directus when submitting forms or uploading files from a form.\n- Be careful to only use the token server side to prevent the static access token from being exposed to the client side.	["API"]	440df429-4715-42a0-afcd-569f5cdfb145	\N	\N	active	\N	\N	\N	\N	default	\N	\N	t	\N	\N	\N	\N	\N	\N
d56956bf-6ed0-465e-bb4a-ec9bde65c5f0	Webmaster	\N	cms@example.com	\N	\N	\N	\N	\N	dea64c65-de50-4d86-abea-6dee3d5256b2	\N	\N	active	c36d4878-9546-4449-857c-bd86f5e50eeb	\N	2024-12-27 13:28:31.084+00	\N	default	\N	\N	t	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: directus_versions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated, delta) FROM stdin;
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers, was_active_before_deprecation, migrated_flow) FROM stdin;
\.


--
-- Data for Name: form_fields; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.form_fields (id, name, type, label, placeholder, help, validation, width, choices, form, sort, required) FROM stdin;
0f3deba1-9d6b-44a0-aa87-a9b38e834beb	first-name	text	First Name	\N	\N	\N	100	\N	5da3d356-d818-434f-b225-db35c418bbb6	1	f
56c64efd-520f-4578-acca-e0565e247681	comments	textarea	How can we help?	Give us the scoop right here.	\N	\N	100	\N	36493b64-2bad-4c58-9d70-785ccb12ee26	5	f
a3d87bc0-f143-44ca-bea0-9eaf56b67783	email	text	Email	john@example.com	\N	\N	100	\N	36493b64-2bad-4c58-9d70-785ccb12ee26	3	t
a5222af8-f9a2-4d1a-9713-7ce0e2d5edc5	department	select	Which team would you like to speak with?	\N	\N	\N	100	[{"text":"Sales","value":"sales"},{"text":"Support","value":"support"}]	36493b64-2bad-4c58-9d70-785ccb12ee26	4	f
bbc7b1c6-304e-4ee1-9afa-c5cffda6af27	last-name	text	Last Name	Doe	\N	\N	50	\N	36493b64-2bad-4c58-9d70-785ccb12ee26	2	t
d37bc00f-bfb5-4496-85c3-70190b21b707	email	text	Email	\N	\N	\N	100	\N	5da3d356-d818-434f-b225-db35c418bbb6	2	f
eef0eb77-ecab-4fba-9903-c46d6ad6d85b	first-name	text	First Name	John	\N	\N	50	\N	36493b64-2bad-4c58-9d70-785ccb12ee26	1	t
\.


--
-- Data for Name: form_submission_values; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.form_submission_values (id, form_submission, field, value, sort, file) FROM stdin;
28f8820f-def4-4b3b-b35d-b79fc7f731a1	3805e2c0-ebba-4070-a1b3-b39ba1b4932b	0f3deba1-9d6b-44a0-aa87-a9b38e834beb	Steve	1	\N
54e554ef-82e7-463e-8542-624352cdb5ca	3805e2c0-ebba-4070-a1b3-b39ba1b4932b	a3d87bc0-f143-44ca-bea0-9eaf56b67783	steve@example.com	2	\N
63df3a8a-75dd-4ea5-94d6-cad8c0820ef4	133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0	d37bc00f-bfb5-4496-85c3-70190b21b707	test@example.com	\N	\N
6883038b-15bf-4635-8216-a362e62e7ca2	133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0	0f3deba1-9d6b-44a0-aa87-a9b38e834beb	Mistral AI	\N	\N
\.


--
-- Data for Name: form_submissions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.form_submissions (id, "timestamp", form) FROM stdin;
133ad5ce-02ef-4f4e-b0a2-408bf9f99ff0	2024-12-19 15:31:25.73+00	5da3d356-d818-434f-b225-db35c418bbb6
3805e2c0-ebba-4070-a1b3-b39ba1b4932b	2024-09-24 16:31:02.467+00	5da3d356-d818-434f-b225-db35c418bbb6
\.


--
-- Data for Name: forms; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.forms (id, on_success, sort, submit_label, success_message, title, success_redirect_url, is_active, emails) FROM stdin;
36493b64-2bad-4c58-9d70-785ccb12ee26	message	\N	Get Started	\N	Contact Us	\N	t	\N
5da3d356-d818-434f-b225-db35c418bbb6	message	\N	Subscribe	Thanks for subscribing to our newsletter! Please check your inbox for confirmation.	Newsletter	\N	t	[{"to":["sales@example.com"],"subject":"Newsletter Signup","message":"<h2>Newsletter Sign Up</h2>\\n<table style=\\"border-collapse: collapse; width: 100%; height: 122.227px;\\" border=\\"1\\"><colgroup><col style=\\"width: 46.0494%;\\"><col style=\\"width: 53.9369%;\\"></colgroup>\\n<tbody>\\n<tr style=\\"height: 61.1094px;\\">\\n<td style=\\"height: 61.1094px;\\"><strong>Name</strong></td>\\n<td style=\\"height: 61.1094px;\\">{# first-name #}</td>\\n</tr>\\n<tr style=\\"height: 61.1172px;\\">\\n<td style=\\"height: 61.1172px;\\"><strong>Email</strong></td>\\n<td style=\\"height: 61.1172px;\\">{# email #}</td>\\n</tr>\\n</tbody>\\n</table>"}]
\.


--
-- Data for Name: globals; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.globals (description, id, social_links, tagline, title, url, favicon, logo, openai_api_key, directus_url, primary_color) FROM stdin;
We empower you to build the best site possible	ab89c489-faea-4310-8b59-7ddb3caf279a	[{"service":"github","url":"https://github.com/directus/directus"},{"service":"linkedin","url":"https://www.linkedin.com/company/directus-io"},{"service":"youtube","url":"https://www.youtube.com/c/DirectusVideos"},{"url":"https://directus.chat/","service":"discord"},{"service":"twitter","url":"https://twitter.com/directus"}]	The best site ever	Meijer theorie	http://127.0.0.1:5173	cd1f8e25-d49f-46c8-ba43-55155b255f06	c3b1434f-d9db-4b78-8cca-17fef70984a9	\N	http://0.0.0.0:8055	#6644FF
\.


--
-- Data for Name: navigation; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.navigation (id, title, is_active) FROM stdin;
footer	Footer Navigation	t
main	Main Navigation	t
\.


--
-- Data for Name: navigation_items; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.navigation_items (id, navigation, page, parent, sort, title, type, url, post) FROM stdin;
0ca39155-c212-4b6e-8156-5a4322731c07	main	\N	\N	2	About	group	\N	\N
192a490a-bbb9-4794-b82f-619a01463723	main	9821199f-4b05-49fb-8407-fbfe9b866ef0	\N	1	Contact Us	page	\N	\N
28fde01b-647b-4151-96e5-6d876d3f3329	\N	93023385-f574-4040-9ead-42b717db2015	0ca39155-c212-4b6e-8156-5a4322731c07	1	Privacy Policy	page	\N	\N
717b30fd-1bf6-46eb-a0cd-81923c17fcf6	\N	1ce02298-817a-46bc-ac92-6a6c10c20f88	0ca39155-c212-4b6e-8156-5a4322731c07	2	Blog	page	\N	\N
c732b100-1f5a-4ce1-8fde-b0072d09623f	footer	1ce02298-817a-46bc-ac92-6a6c10c20f88	\N	5	Blog	page	/posts	\N
dc0870f8-e316-48b0-b34d-ca5c4394344c	footer	93023385-f574-4040-9ead-42b717db2015	\N	1	Privacy Policy	page	\N	\N
e096f25c-a549-4fe5-a284-17b0a347037a	footer	9821199f-4b05-49fb-8407-fbfe9b866ef0	\N	2	Contact Us	page	\N	\N
\.


--
-- Data for Name: page_blocks; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.page_blocks (id, sort, page, item, collection, hide_block, background) FROM stdin;
1f774f44-3e33-4b0f-93f4-fdd6df898438	1	9821199f-4b05-49fb-8407-fbfe9b866ef0	185eca12-4af1-4a1c-bfd7-4bc2fab52097	block_form	f	light
b4d48d5a-0450-4e8c-8c5b-198e7063a10f	1	636dc283-e634-4d5d-aada-e6743db46036	d81ab264-b2be-4077-84e7-b1406e74d9c3	block_hero	f	light
bc826e30-4988-4035-98bd-5ffc4799e5fc	1	93023385-f574-4040-9ead-42b717db2015	a6275645-16b7-4994-8100-8c43ca07ab06	block_richtext	f	light
090e286c-3dfe-4638-89d9-09b2e0caf2ea	1	\N	93693278-93bc-4a70-a54c-bbbf1e0037d7	block_hero	f	light
45227f61-5ff1-431c-8dee-1a50d369325f	1	1ce02298-817a-46bc-ac92-6a6c10c20f88	060b632d-d70d-4db1-8b95-4fbab7a52ae8	block_posts	f	light
2b017efb-ce7c-4b90-9f59-a39236ffe571	2	1ce02298-817a-46bc-ac92-6a6c10c20f88	3e262b2d-48fc-4816-b5e8-c991817d56fc	block_form	f	light
0ff1d6c4-ff77-46c6-ad02-f9ae31484505	2	2a62887e-2384-4bd2-a919-7665d85fed07	1134799b-3fd1-47ea-963f-13d8ac1b9e3a	block_richtext	f	light
2d9abe8f-a7ad-480d-8fc7-603c712e2f40	2	636dc283-e634-4d5d-aada-e6743db46036	129625db-433f-4104-9922-3b803ba4599d	block_richtext	f	light
529e6408-7372-4195-b82d-e444c06ac492	3	636dc283-e634-4d5d-aada-e6743db46036	34fdcf0e-cc5d-4c40-b61f-4f0a5e167306	block_gallery	f	dark
ed613af3-b584-47e7-9584-7d6d4d87eaf5	3	\N	7b5e5649-40be-4f54-a2fb-b021a520645d	block_gallery	f	light
39d02b18-18d2-4c29-9268-038f72ea05fe	4	636dc283-e634-4d5d-aada-e6743db46036	48cf2543-15e0-454f-9b31-cbf3c2406712	block_pricing	f	light
7e1ce212-3f8a-43b4-aff7-131bf4241e30	5	636dc283-e634-4d5d-aada-e6743db46036	1419faec-e263-431c-bd5f-a57f394c39f6	block_form	f	light
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.pages (id, sort, title, permalink, description, status, published_at) FROM stdin;
636dc283-e634-4d5d-aada-e6743db46036	1	Home 	/	Directus is a great choice for your headless CMS.	published	2024-09-01 16:00:00+00
1ce02298-817a-46bc-ac92-6a6c10c20f88	2	Blog	/blog	\N	published	2024-09-01 16:00:00+00
9821199f-4b05-49fb-8407-fbfe9b866ef0	3	Contact	/contact	\N	published	2024-07-01 16:00:00+00
2a62887e-2384-4bd2-a919-7665d85fed07	4	About Us	/about-us	\N	published	2024-12-01 17:00:00+00
93023385-f574-4040-9ead-42b717db2015	5	Privacy Policy	/privacy-policy	\N	published	2024-05-01 16:00:00+00
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.posts (content, id, image, slug, sort, status, title, description, author, published_at) FROM stdin;
<p>Rabbit grooming is an essential aspect of pet care that ensures the overall health, happiness, and well-being of your furry friend. Regular grooming not only keeps your bunny looking their best but also helps to prevent health issues, strengthens the bond between you and your pet, and maintains a clean environment. In this blog post, we'll explore some essential rabbit grooming tips and techniques to help you keep your bunny looking and feeling their best.</p>\n<h2>1. Brushing</h2>\n<p>One of the most critical aspects of rabbit grooming is regular brushing. Rabbits have a thick, soft coat that can easily become matted, tangled, or accumulate excess hair. This is especially important during the shedding season when rabbits lose their fur.</p>\n<p>To brush your rabbit, use a soft-bristle brush or a comb specifically designed for rabbits. Gently brush in the direction of the fur growth, taking extra care around sensitive areas like the face, ears, and belly. Brushing should be done at least once a week, or more frequently during shedding season.</p>\n<h2>2. Nail Trimming</h2>\n<p>Just like humans, rabbits need their nails trimmed regularly to prevent overgrowth and potential injury. Rabbit nails can become sharp and curl, making it difficult for them to move and causing discomfort.</p>\n<p>To trim your rabbit's nails, use a pair of small animal nail clippers. Hold your rabbit securely, but gently, and expose the nail by gently pressing on the surrounding fur. Clip the nail at a 45-degree angle, avoiding the quick, the pink part of the nail containing blood vessels and nerves. If you accidentally cut the quick, apply styptic powder or cornstarch to stop the bleeding. Trim your rabbit's nails every 4-6 weeks or as needed.</p>\n<h2>3. Ear Cleaning</h2>\n<p>Rabbits are prone to ear infections, which can lead to severe complications if left untreated. Regular ear cleaning helps to prevent infections and ensure that your rabbit's ears remain healthy.</p>\n<p>To clean your rabbit's ears, use a soft, damp cloth or cotton ball moistened with warm water. Gently wipe the outer part of the ear, avoiding the ear canal. Never insert anything into the ear canal, as this can cause damage or push debris further in. Clean your rabbit's ears every 2-4 weeks or as needed.</p>\n<h2>4. Dental Care</h2>\n<p>Rabbits have continuously growing teeth that need to be worn down to prevent dental problems. Providing your rabbit with hay, wooden chew toys, and other materials to gnaw on will help keep their teeth in check.</p>\n<p>Monitor your rabbit's teeth regularly to ensure they're not becoming too long or misaligned. If you notice any issues, consult with a veterinarian experienced in rabbit care, as they may need to trim or file the teeth.</p>\n<h2>5. Bathing</h2>\n<p>Unlike cats and dogs, rabbits do not require frequent baths. In fact, bathing your rabbit can cause stress and lead to health issues. Instead, spot clean your rabbit using a damp cloth or unscented baby wipes to remove any dirt or debris. If your rabbit becomes soiled and requires a more thorough cleaning, consult with a veterinarian for guidance.</p>\n<p>In conclusion, maintaining a regular grooming routine is essential for your rabbit's overall health and well-being. By implementing these tips and techniques, you can ensure that your bunny stays clean, comfortable, and happy. Remember to always handle your rabbit gently and with care during grooming sessions to help build trust and strengthen the bond between you and your pet.</p>	c96b64b4-9567-46f6-8eb5-ac2f37c4918d	d4fd6edc-4cc5-48c1-8bc7-e646924bbdca	rabbit-grooming-essential-tips	2	in_review	Essential Tips for Keeping Your Bunny Looking and Feeling Their Best	Rabbit grooming, encompassing brushing, nail trimming, ear cleaning, dental care, and spot cleaning, is vital for your bunny's health, appearance, and well-being.	d56956bf-6ed0-465e-bb4a-ec9bde65c5f0	\N
<p>Ladies and Gentlemen, it is my great pleasure to introduce you to the future of work. And no, I'm not talking about drones, AI, or even cyborgs. The future of work is none other than the stylish, dapper and oh-so-cool steampunk rabbits!</p>\n<h2>What are Steampunk Rabbits?</h2>\n<p>Yes, you heard it right, steampunk rabbits. These little creatures are not just cute and cuddly, but they are also the epitome of efficiency and innovation. From the gears in their top hats to the clockwork in their tails, steampunk rabbits are revolutionizing the way we work and live.</p>\n<p>So, what makes steampunk rabbits so special? Well, for starters, they never sleep. They work tirelessly around the clock, getting more done in a day than any human ever could. They are also incredibly multi-talented. With their clockwork appendages, they can type, write, assemble, and even paint! All while sipping on a cup of tea and looking fabulous, of course.</p>\n<h2>Benefits of Steampunk Rabbits</h2>\n<p>And the best part? They are never late for work. They have built-in clocks and calendars, ensuring that they are always on time. And forget a sick days and vacations; steampunk rabbits never get sick or need a break. They just keep working and working, providing us with endless hours of productivity.</p>\n<p>But wait, there's more! Steampunk rabbits also bring a touch of whimsy and charm to the workplace. Their Victorian-inspired attire and quirky personalities are sure to brighten up any office. They are the perfect office pets, and they make even the most mundane tasks feel like an adventure.</p>\n<p>So, there you have it folks, steampunk rabbits are the future of work. So, next time you're feeling stressed and overwhelmed with work, just remember, there's a steampunk rabbit out there who's got your back. And if you're lucky, maybe you'll even get to work with one someday.</p>\n<p>In conclusion, let us embrace the future and welcome our new steampunk rabbit overlords with open arms. The future of work has never looked so bright and full of bunnies!</p>	ba559a1e-5b0c-4932-ab97-b1ab4ca69955	3eff7dc2-445a-47c5-9503-3f600ecdb5c6	why-steampunk-rabbits-are-the-future-of-work	4	published	Why Steampunk Rabbits Are The Future of Work	This post discusses how steampunk rabbits could be the future of work, highlighting their efficiency, multi-talented nature, and ability to bring charm to the workplace.	d56956bf-6ed0-465e-bb4a-ec9bde65c5f0	2024-09-01 16:00:00+00
<p>Rabbits are known for their fast-paced and productive lifestyle. Their ability to multitask and work efficiently makes them a great source of inspiration for anyone looking to boost their productivity levels. In this blog post, we will look at some simple tips and tricks that you can adopt to become a very productive rabbit.</p>\n<p><a href="https://directus.io" target="_blank" rel="noopener">Test external link</a></p>\n<p><a href="/about" target="_self">Test internal link</a></p>\n<h2>Plan your day in advance</h2>\n<p>Planning your day is the first step to becoming a productive rabbit. Make a list of tasks you need to complete, prioritize them and allocate enough time for each. This will help you to stay focused and avoid procrastination.</p>\n<h2>Wake up early</h2>\n<p>Rabbits are early birds, and for good reason. Waking up early will give you a head start on your day, allowing you to tackle your most important tasks when you are most alert and focused.</p>\n<h2>Stay hydrated and nourished</h2>\n<p>Drinking plenty of water and eating a healthy and balanced diet is crucial for maintaining energy levels and concentration throughout the day. Just like rabbits, you should take regular breaks to recharge and refuel.</p>\n<h2>Practice mindfulness and take breaks</h2>\n<p>Rabbits know the importance of taking breaks to refresh their mind and recharge their batteries. Regular breaks can help you avoid burnout and increase your overall productivity. Try incorporating mindfulness practices like meditation or deep breathing into your daily routine.</p>\n<h2>Stay organized</h2>\n<p>An organized work environment can help you work more efficiently and increase your productivity levels. Keep your workspace tidy, and use tools like calendars, to-do lists, and filing systems to keep track of your tasks and deadlines.</p>\n<h2>Surround yourself with positive people</h2>\n<p>Surrounding yourself with positive and supportive people can help to boost your motivation and productivity levels. Seek out coworkers and friends who share your goals and are supportive of your efforts to become more productive.</p>	ddf1003f-6b9a-460c-83fd-d985d6defbd6	7775c53a-6c2c-453d-8c22-8b5445121d10	how-to-become-a-very-productive-rabbit	5	published	How To Become A Very Productive Rabbit	In this blog post, we will look at some simple tips and tricks that you can adopt to become a very productive rabbit.	d56956bf-6ed0-465e-bb4a-ec9bde65c5f0	2024-07-01 16:00:00+00
<p>Rabbits are cute and cuddly animals that have been a staple of our childhoods. But did you know that there's more to these furry creatures than just their adorable appearance? Here are some rabbit facts that will blow your mind!</p>\n<ol>\n<li>\n<p>Rabbits have excellent vision: Rabbits have excellent vision, with eyes located on the sides of their heads, allowing them to see 360 degrees. This helps them to detect predators and keep themselves safe.</p>\n</li>\n<li>\n<p>Rabbits are fast runners: When it comes to running, rabbits are pretty speedy! They can run up to 45 miles per hour, making them one of the fastest animals in the animal kingdom.</p>\n</li>\n<li>\n<p>Rabbits are herbivores: Unlike many other animals, rabbits are strictly herbivores, meaning they only eat plants and vegetation. Their diet consists of leafy greens, hay, and fresh fruits and vegetables.</p>\n</li>\n<li>\n<p>Rabbits have unique teeth: Rabbits have unique teeth that continuously grow throughout their lives. To keep their teeth from becoming too long, they need to chew on hard objects like wood to file them down.</p>\n</li>\n<li>\n<p>Rabbits have powerful hind legs: Rabbits have incredibly powerful hind legs that allow them to make quick and nimble movements. These legs also help them to escape from predators by jumping away at incredible speeds.</p>\n</li>\n<li>\n<p>Rabbits are social creatures: Rabbits are social creatures and are best kept with other rabbits. They love to play and cuddle, and they will often form close bonds with their rabbit friends.</p>\n</li>\n<li>\n<p>Rabbits have a unique reproductive system: Rabbits have a unique reproductive system, with females capable of producing litters of bunnies several times a year. This makes rabbits some of the most productive mammals on the planet.</p>\n</li>\n<li>\n<p>Rabbits have a good memory: Rabbits have a good memory and can remember things for several months. This means that if you take the time to bond with your rabbit, they will remember you and be more likely to come to you for affection.</p>\n</li>\n</ol>\n<p>In conclusion, rabbits are fascinating creatures that have much more to offer than just their cute appearance. From their excellent vision to their powerful hind legs and their unique reproductive system, rabbits are truly amazing animals that are sure to blow your mind!</p>	f7845a69-edcb-4163-a2a9-fb82b64475c5	8f748634-d77b-4985-b27e-7e1f3559881a	rabbit-facts-that-will-blow-your-mind	6	published	Rabbit Facts That Will Blow Your Mind	These interesting facts about rabbits make them fascinating creatures that are worth learning more about.	d56956bf-6ed0-465e-bb4a-ec9bde65c5f0	2024-06-01 16:00:00+00
<p>Ahoy, ye digital corsairs! Have ye ever wondered what tools web developers be usin' on their sleek Macs to keep the seas of code navigable? Well, hoist the mainsail and buckle yer swashbuckling selves, for I be sharin' the secret treasures that make a Mac a true vessel of productivity on these here digital seas.</p>\n<h2>1. Visual Studio Code</h2>\n<p>First in the treasure chest be <strong>Visual Studio Code</strong>, the trusty compass for many a developer. This mighty editor be free, open-source, and oh-so-customizable. With extensions as plentiful as the fish in the sea, VS Code helps yer code run smoother than a schooner in a gentle breeze.</p>\n<h2>2. iTerm2</h2>\n<p>When it be time to navigate through the terminal, <strong>iTerm2</strong> be the anchor ye need. This advanced terminal emulator gives ye multiple panes, session restoration, and a wealth of shortcuts that&rsquo;ll make yer command-line navigations swift as a gull in flight.</p>\n<h2>3. Homebrew</h2>\n<p><strong>Homebrew</strong> be the package manager that every Mac-developer swears by. It makes installing and managing software as easy as pie, with a simple command: <code>brew install</code>. Whether ye be needin' a database or a new programming language, Homebrew be the quartermaster providin' the goods.</p>\n<h2>4. Alfred</h2>\n<p>Meet <strong>Alfred</strong>, yer first mate when it comes to magic productivity. This mighty app launcher and workflow automator allows ye to control yer Mac with but a flick of the wrist. Custom workflows and powerful searches make sure Alfred steers ye quickly to any file or task.</p>\n<h2>5. Postman</h2>\n<p>If ye be workin' on APIs, <strong>Postman</strong> be the ultimate tool in yer treasure trove. It helps ye test, develop, and document yer APIs with ease. No more sendin' messages in bottles; Postman be the efficient way to communicate with yer backend services.</p>\n<h2>6. Magnet</h2>\n<p>To keep yer ship&rsquo;s deck clean and tidy, <strong>Magnet</strong> be the window management tool ye need. With simple drag-and-snap functionalities, Magnet arranges all yer open windows and applications in a manner that keeps yer workspace shipshape.</p>\n<h2>7. Slack</h2>\n<p>And of course, no seafaring squad be complete without <strong>Slack</strong>. This communication tool keeps the crew in constant contact, sharing semaphore signals across projects. Integrations with other tools make Slack a veritable crow&rsquo;s nest, keepin' ye alert to all happenings aboard the ship.</p>\n<p>So there ye have it, mateys! Equip yerselves with these fine tools and set sail toward greater productivity. The digital seas be vast and fraught with peril, but with these treasures on yer side, ye&rsquo;ll be ready to chart any course. Arrr!</p>	a5068543-fdd1-4773-b6c3-43b4c222d377	9a52e835-e131-4290-81bb-5a512599f93e	pirates-guide-productivity-tools-mac	\N	draft	A Pirate's Guide to Productivity: Web Developers' Favorite Tools on Macs	Ahoy, matey! Discover the top productivity tools web developers be usein' on their trusty Macs. Set sail for smoother workflows and greater bounty!	d56956bf-6ed0-465e-bb4a-ec9bde65c5f0	\N
<h2>What is a Headless CMS?</h2>\n<p>Before diving into the benefits, let’s quickly clarify what a headless CMS actually is. Essentially, a headless Content Management System (CMS) is a backend-only content management system. Unlike traditional CMSs, which tie the content and front-end display together, a headless CMS separates the two. This means you can manage your content in the backend while delivering it to any device or platform using APIs.</p>\n\n<h2>Top Benefits of a Headless CMS</h2>\n\n<h3>1. Flexibility and Customization</h3>\n<p>One of the standout benefits of a headless CMS is flexibility. Since the front-end and back-end are decoupled, developers have the freedom to choose how they want to present the content. Whether it’s a website, a mobile app, or even a digital kiosk, you can easily adapt the content to fit any platform or screen size. This is ideal for brands wanting to deliver tailored experiences without being locked into specific templates.</p>\n\n<h3>2. Omnichannel Experience</h3>\n<p>We live in a multi-device world, and users expect a seamless experience across all platforms. A headless CMS makes this possible. By serving content via APIs, it can distribute it to any device or channel you can think of—websites, apps, IoT devices, you name it. This ensures your customers receive consistent messaging and a cohesive experience no matter where they interact with your brand.</p>\n\n<h3>3. Faster Performance</h3>\n<p>In today’s fast-paced digital environment, load times can make or break user experience. Since a headless CMS focuses on content delivery via APIs, it can significantly improve performance. Developers can create lighter, faster front-end experiences without the bloat often found in traditional CMSs. This means quicker load times for users, which can lead to lower bounce rates and higher engagement levels.</p>\n\n<h3>4. Better Security</h3>\n<p>Security is a big concern for any online business. With a headless CMS, you can minimize the risks associated with external attacks. Because the front end is separate, hackers are less likely to exploit vulnerabilities within the CMS itself. That doesn't mean you're completely invulnerable, but it does create an additional layer of protection against common threats.</p>\n\n<h3>5. Future-Proofing Your Content</h3>\n<p>Trends and technologies are constantly evolving, and businesses need a way to keep up. A headless CMS allows you to be future-ready. As new platforms and devices emerge, you can easily integrate and reconfigure your content delivery without overhauling your entire system. <strong>It’s a smart investment for businesses looking to adapt to changes down the road.</strong></p>\n\n<h2>Final Thoughts</h2>\n<p>If you're considering a content management system, the benefits of a headless CMS are hard to ignore. While it may require a bit more technical know-how to set up, the payoff in terms of flexibility, performance, and security makes it worth the effort. So, if you're ready to take your content strategy to the next level, a headless CMS might just be the way to go!</p>	399a9a1b-bad5-4b5b-86e4-291ad1676e91	fd6440c2-dd48-4792-9d08-3124cd99b40f	benefits-of-headless-cms	\N	draft	The Perks of Going Headless: Why You Should Consider a Headless CMS	Discover why a headless CMS might be the right choice for your business.	d56956bf-6ed0-465e-bb4a-ec9bde65c5f0	\N
\.


--
-- Data for Name: subscription_tiers; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.subscription_tiers (id, icon, title, slug, "featureList", price, "discountPrice", "daysOfAccess", "maxPracticeExams") FROM stdin;
bdbafc2e-eeef-4c21-aed1-e9d806ed7612	788cae90-bd68-400c-a262-ff6c02b4555b	Zilver pakket	zilver-pakket	[{"description":"5 oefenexamens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"Goedkoopste van Nederland"}]	39.99	\N	3	3
8e173084-fb18-45db-8d7a-bc78819b26ca	2af31103-959f-45a6-98b6-14c05a27412d	Meijerdeluxe pakket	meijerdeluxe-pakket	[{"description":"14 oefen examens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"De goedkoopste van Nederland!"}]	59.99	\N	31	14
0bebcf60-2913-49c8-b028-f3ce091ac4ab	bcc1e125-9bed-4ea6-a28f-c619127a9423	Spoedpakket Lambo	spoedpakket-lambo	[{"description":"3 oefenexamens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"Goedkoopste van Nederland"}]	29.99	\N	14	9
ab307bd9-1850-4117-886b-bb61bf4fc8cc	f28f2e8f-dfe4-4021-a029-583f6c8a6da4	Gold pakket	gold-pakket	[{"description":"9 oefenexamens"},{"description":"Alle CBR onderdelen"},{"description":"Digitale coach"},{"description":"Goedkoopste van Nederland"}]	49.99	\N	9	6
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.subscriptions (id, "createdAt", "expiresAt", type, tier) FROM stdin;
1	2025-01-14 14:10:28.282+00	2025-02-04 12:00:00	car	8e173084-fb18-45db-8d7a-bc78819b26ca
\.


--
-- Data for Name: video_courses; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.video_courses (id, title, slug, tagline, "estimatedDurationInMinutes", thumbnail, "subscriptionTier") FROM stdin;
1	Hoofdstuk 1	hoofdstuk-1	Introductie	36	6fdbc31c-c2b2-46d0-b473-10dc08d9bc98	8e173084-fb18-45db-8d7a-bc78819b26ca
\.


--
-- Data for Name: video_courses_lessons; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.video_courses_lessons (id, title, video, description, "videoCourse") FROM stdin;
1	Voertuigen	82616dcf-a772-49b5-a4c3-f1d159b3d10a	In dit onderwerp gaan we het hebben over de verschillende voertuigen die je kan tegen komen op de weg.	1
2	Algemene bepalingen	0b592bdc-d961-42aa-b8b8-4f609cbe1804	In deze video gaan we het hebben over de algemene bepalingen. 	1
\.


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 895, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 206, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 136, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 15, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 34, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 881, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 1, true);


--
-- Name: video_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.video_courses_id_seq', 1, true);


--
-- Name: video_courses_lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.video_courses_lessons_id_seq', 2, true);


--
-- Name: block_button_group block_button_group_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_button_group
    ADD CONSTRAINT block_button_group_pkey PRIMARY KEY (id);


--
-- Name: block_button block_button_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_button
    ADD CONSTRAINT block_button_pkey PRIMARY KEY (id);


--
-- Name: block_form block_form_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_form
    ADD CONSTRAINT block_form_pkey PRIMARY KEY (id);


--
-- Name: block_gallery_items block_gallery_items_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_gallery_items
    ADD CONSTRAINT block_gallery_items_pkey PRIMARY KEY (id);


--
-- Name: block_gallery block_gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_gallery
    ADD CONSTRAINT block_gallery_pkey PRIMARY KEY (id);


--
-- Name: block_hero block_hero_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_hero
    ADD CONSTRAINT block_hero_pkey PRIMARY KEY (id);


--
-- Name: block_posts block_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_posts
    ADD CONSTRAINT block_posts_pkey PRIMARY KEY (id);


--
-- Name: block_pricing_cards block_pricing_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_pricing_cards
    ADD CONSTRAINT block_pricing_cards_pkey PRIMARY KEY (id);


--
-- Name: block_pricing block_pricing_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_pricing
    ADD CONSTRAINT block_pricing_pkey PRIMARY KEY (id);


--
-- Name: block_richtext block_richtext_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_richtext
    ADD CONSTRAINT block_richtext_pkey PRIMARY KEY (id);


--
-- Name: directus_access directus_access_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_comments directus_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_pkey PRIMARY KEY (id);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_policies directus_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: form_fields form_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.form_fields
    ADD CONSTRAINT form_fields_pkey PRIMARY KEY (id);


--
-- Name: form_submission_values form_submission_values_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.form_submission_values
    ADD CONSTRAINT form_submission_values_pkey PRIMARY KEY (id);


--
-- Name: form_submissions form_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.form_submissions
    ADD CONSTRAINT form_submissions_pkey PRIMARY KEY (id);


--
-- Name: forms forms_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_pkey PRIMARY KEY (id);


--
-- Name: globals globals_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.globals
    ADD CONSTRAINT globals_pkey PRIMARY KEY (id);


--
-- Name: navigation_items navigation_items_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.navigation_items
    ADD CONSTRAINT navigation_items_pkey PRIMARY KEY (id);


--
-- Name: navigation navigation_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.navigation
    ADD CONSTRAINT navigation_pkey PRIMARY KEY (id);


--
-- Name: page_blocks page_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.page_blocks
    ADD CONSTRAINT page_blocks_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: subscription_tiers subscription_tiers_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.subscription_tiers
    ADD CONSTRAINT subscription_tiers_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_tier_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_tier_unique UNIQUE (tier);


--
-- Name: video_courses_lessons video_courses_lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.video_courses_lessons
    ADD CONSTRAINT video_courses_lessons_pkey PRIMARY KEY (id);


--
-- Name: video_courses video_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.video_courses
    ADD CONSTRAINT video_courses_pkey PRIMARY KEY (id);


--
-- Name: video_courses video_courses_slug_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.video_courses
    ADD CONSTRAINT video_courses_slug_unique UNIQUE (slug);


--
-- Name: video_courses video_courses_thumbnail_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.video_courses
    ADD CONSTRAINT video_courses_thumbnail_unique UNIQUE (thumbnail);


--
-- Name: video_courses video_courses_title_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.video_courses
    ADD CONSTRAINT video_courses_title_unique UNIQUE (title);


--
-- Name: video_courses_lessons_title_index; Type: INDEX; Schema: public; Owner: directus
--

CREATE INDEX video_courses_lessons_title_index ON public.video_courses_lessons USING btree (title);


--
-- Name: video_courses_slug_index; Type: INDEX; Schema: public; Owner: directus
--

CREATE INDEX video_courses_slug_index ON public.video_courses USING btree (slug);


--
-- Name: video_courses_title_index; Type: INDEX; Schema: public; Owner: directus
--

CREATE INDEX video_courses_title_index ON public.video_courses USING btree (title);


--
-- Name: block_button block_button_button_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_button
    ADD CONSTRAINT block_button_button_group_foreign FOREIGN KEY (button_group) REFERENCES public.block_button_group(id) ON DELETE SET NULL;


--
-- Name: block_button block_button_page_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_button
    ADD CONSTRAINT block_button_page_foreign FOREIGN KEY (page) REFERENCES public.pages(id) ON DELETE SET NULL;


--
-- Name: block_button block_button_post_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_button
    ADD CONSTRAINT block_button_post_foreign FOREIGN KEY (post) REFERENCES public.posts(id) ON DELETE SET NULL;


--
-- Name: block_form block_form_form_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_form
    ADD CONSTRAINT block_form_form_foreign FOREIGN KEY (form) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: block_gallery_items block_gallery_items_block_gallery_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_gallery_items
    ADD CONSTRAINT block_gallery_items_block_gallery_foreign FOREIGN KEY (block_gallery) REFERENCES public.block_gallery(id) ON DELETE CASCADE;


--
-- Name: block_gallery_items block_gallery_items_directus_file_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_gallery_items
    ADD CONSTRAINT block_gallery_items_directus_file_foreign FOREIGN KEY (directus_file) REFERENCES public.directus_files(id) ON DELETE CASCADE;


--
-- Name: block_hero block_hero_button_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_hero
    ADD CONSTRAINT block_hero_button_group_foreign FOREIGN KEY (button_group) REFERENCES public.block_button_group(id) ON DELETE SET NULL;


--
-- Name: block_hero block_hero_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_hero
    ADD CONSTRAINT block_hero_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: block_pricing_cards block_pricing_cards_button_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_pricing_cards
    ADD CONSTRAINT block_pricing_cards_button_foreign FOREIGN KEY (button) REFERENCES public.block_button(id) ON DELETE SET NULL;


--
-- Name: block_pricing_cards block_pricing_cards_pricing_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.block_pricing_cards
    ADD CONSTRAINT block_pricing_cards_pricing_foreign FOREIGN KEY (pricing) REFERENCES public.block_pricing(id) ON DELETE SET NULL;


--
-- Name: directus_access directus_access_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_comments directus_comments_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_comments directus_comments_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_revisions directus_revisions_version_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;


--
-- Name: directus_roles directus_roles_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_roles(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_registration_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_registration_role_foreign FOREIGN KEY (public_registration_role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_subscription_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_subscription_foreign FOREIGN KEY (subscription) REFERENCES public.subscriptions(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_versions directus_versions_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_webhooks directus_webhooks_migrated_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_migrated_flow_foreign FOREIGN KEY (migrated_flow) REFERENCES public.directus_flows(id) ON DELETE SET NULL;


--
-- Name: form_fields form_fields_form_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.form_fields
    ADD CONSTRAINT form_fields_form_foreign FOREIGN KEY (form) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: form_submission_values form_submission_values_field_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.form_submission_values
    ADD CONSTRAINT form_submission_values_field_foreign FOREIGN KEY (field) REFERENCES public.form_fields(id) ON DELETE SET NULL;


--
-- Name: form_submission_values form_submission_values_file_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.form_submission_values
    ADD CONSTRAINT form_submission_values_file_foreign FOREIGN KEY (file) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: form_submission_values form_submission_values_form_submission_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.form_submission_values
    ADD CONSTRAINT form_submission_values_form_submission_foreign FOREIGN KEY (form_submission) REFERENCES public.form_submissions(id) ON DELETE CASCADE;


--
-- Name: form_submissions form_submissions_form_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.form_submissions
    ADD CONSTRAINT form_submissions_form_foreign FOREIGN KEY (form) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: globals globals_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.globals
    ADD CONSTRAINT globals_favicon_foreign FOREIGN KEY (favicon) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: globals globals_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.globals
    ADD CONSTRAINT globals_logo_foreign FOREIGN KEY (logo) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: navigation_items navigation_items_navigation_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.navigation_items
    ADD CONSTRAINT navigation_items_navigation_foreign FOREIGN KEY (navigation) REFERENCES public.navigation(id) ON DELETE SET NULL;


--
-- Name: navigation_items navigation_items_page_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.navigation_items
    ADD CONSTRAINT navigation_items_page_foreign FOREIGN KEY (page) REFERENCES public.pages(id) ON DELETE SET NULL;


--
-- Name: navigation_items navigation_items_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.navigation_items
    ADD CONSTRAINT navigation_items_parent_foreign FOREIGN KEY (parent) REFERENCES public.navigation_items(id);


--
-- Name: navigation_items navigation_items_post_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.navigation_items
    ADD CONSTRAINT navigation_items_post_foreign FOREIGN KEY (post) REFERENCES public.posts(id) ON DELETE SET NULL;


--
-- Name: page_blocks page_blocks_page_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.page_blocks
    ADD CONSTRAINT page_blocks_page_foreign FOREIGN KEY (page) REFERENCES public.pages(id) ON DELETE SET NULL;


--
-- Name: posts posts_author_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_author_foreign FOREIGN KEY (author) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: posts posts_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: subscription_tiers subscription_tiers_icon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.subscription_tiers
    ADD CONSTRAINT subscription_tiers_icon_foreign FOREIGN KEY (icon) REFERENCES public.directus_files(id);


--
-- Name: subscriptions subscriptions_tier_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_tier_foreign FOREIGN KEY (tier) REFERENCES public.subscription_tiers(id) ON DELETE SET NULL;


--
-- Name: video_courses_lessons video_courses_lessons_video_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.video_courses_lessons
    ADD CONSTRAINT video_courses_lessons_video_foreign FOREIGN KEY (video) REFERENCES public.directus_files(id);


--
-- Name: video_courses_lessons video_courses_lessons_videocourse_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.video_courses_lessons
    ADD CONSTRAINT video_courses_lessons_videocourse_foreign FOREIGN KEY ("videoCourse") REFERENCES public.video_courses(id) ON DELETE SET NULL;


--
-- Name: video_courses video_courses_subscriptiontier_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.video_courses
    ADD CONSTRAINT video_courses_subscriptiontier_foreign FOREIGN KEY ("subscriptionTier") REFERENCES public.subscription_tiers(id) ON DELETE SET NULL;


--
-- Name: video_courses video_courses_thumbnail_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.video_courses
    ADD CONSTRAINT video_courses_thumbnail_foreign FOREIGN KEY (thumbnail) REFERENCES public.directus_files(id);


--
-- PostgreSQL database dump complete
--

