--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: branches; Type: TABLE; Schema: public; Owner: postgresuser
--

CREATE TABLE public.branches (
    id bigint NOT NULL,
    district character varying(255) NOT NULL,
    opening_hours character varying(255) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL
);


ALTER TABLE public.branches OWNER TO postgresuser;

--
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresuser
--

CREATE SEQUENCE public.branches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.branches_id_seq OWNER TO postgresuser;

--
-- Name: branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresuser
--

ALTER SEQUENCE public.branches_id_seq OWNED BY public.branches.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgresuser
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgresuser;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresuser
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgresuser;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresuser
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: menu_item_branches; Type: TABLE; Schema: public; Owner: postgresuser
--

CREATE TABLE public.menu_item_branches (
    menu_item_id integer NOT NULL,
    branch_id integer NOT NULL
);


ALTER TABLE public.menu_item_branches OWNER TO postgresuser;

--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: postgresuser
--

CREATE TABLE public.menu_items (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    calories integer,
    price double precision,
    category_id bigint
);


ALTER TABLE public.menu_items OWNER TO postgresuser;

--
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresuser
--

CREATE SEQUENCE public.menu_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_items_id_seq OWNER TO postgresuser;

--
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresuser
--

ALTER SEQUENCE public.menu_items_id_seq OWNED BY public.menu_items.id;


--
-- Name: branches id; Type: DEFAULT; Schema: public; Owner: postgresuser
--

ALTER TABLE ONLY public.branches ALTER COLUMN id SET DEFAULT nextval('public.branches_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgresuser
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: menu_items id; Type: DEFAULT; Schema: public; Owner: postgresuser
--

ALTER TABLE ONLY public.menu_items ALTER COLUMN id SET DEFAULT nextval('public.menu_items_id_seq'::regclass);


--
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: postgresuser
--

COPY public.branches (id, district, opening_hours, latitude, longitude) FROM stdin;
1	Al Olaya	4 PM - 11 PM	24.7113	46.674
2	Al Olaya	8 AM - 11 PM	24.689583	46.685083
3	Al Aqiq	8 AM - 11 PM	24.7632	46.6401
4	Diriyah	4 PM - 11 PM	24.737	46.573
5	Alyasmin	8 AM - 11 PM	24.835	46.637
6	Al Mutamarat	8 AM - 11 PM	24.667593	46.681996
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgresuser
--

COPY public.categories (id, name) FROM stdin;
1	All Day Brunch
2	Appetizers & Soups
3	Sandwiches & Burgers
4	Main Course
5	Desserts
6	Drinks
\.


--
-- Data for Name: menu_item_branches; Type: TABLE DATA; Schema: public; Owner: postgresuser
--

COPY public.menu_item_branches (menu_item_id, branch_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
2	1
2	2
2	3
2	4
2	5
2	6
3	1
3	2
3	3
3	4
3	5
3	6
4	1
4	2
4	3
4	4
4	5
4	6
5	1
5	2
5	3
5	4
5	5
5	6
6	1
6	2
6	3
6	4
6	5
6	6
7	1
7	2
7	3
7	4
7	5
7	6
8	1
8	2
8	3
8	4
8	5
8	6
9	1
9	2
9	3
9	4
9	5
9	6
10	1
10	2
10	3
10	4
10	5
10	6
11	1
11	2
11	3
11	4
11	5
11	6
12	1
12	2
12	3
12	4
12	5
12	6
13	1
13	2
13	3
13	4
13	5
13	6
14	1
14	2
14	3
14	4
14	5
14	6
15	1
15	2
15	3
15	4
15	5
15	6
16	1
16	2
16	3
16	4
16	5
16	6
\.


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: postgresuser
--

COPY public.menu_items (id, name, description, calories, price, category_id) FROM stdin;
1	Grilled Sandwich	Croque-Monsieur frensh Open-faced sandwich with beef, Emmental cheese, crispy bread, Cornichons and cheese with Grain Mustard	609	64	1
2	Caramelized Potatoes & Poached Eggs	Potatoes dauphinoise, poached eggs, parmesan coulis sauce with rosemary and thyme, served with salad mix	925	59	1
3	Labneh Harissa	Poached eggs, creamy labneh with olive dukkha & hazelnut za''atar, served with fougasse bread	966	64	1
4	Red Lentil Soup	Red lentil, lemon juice, coriander, sun-dried tomato, served with crouton	537	39	2
5	Salmon tartare	Chilled salmon and avocado tartare with citrus vinaigrette, sesame seeds, and toasted bread	991	69	2
6	Beed Burger	Beef patty with cheddar, grilled onion, pickled cucumber, umami dill sauce, served with fries	1454	69	3
7	Tuna Pesto Sandwich	Ciabatta with pesto, avocado, tuna mousse, tomato, jalapeño, served with green salad	1051	69	3
8	Creamy Shrimp Pasta	Linguini pasta with shrimps, burrata, rosé sauce, chili garlic oil, crispy onions	1168	79	4
9	Mushroom Risotto	Parmesan truffle risotto with three types of mushrooms	980	89	4
10	Chicken Tagliatelle	Tagliatelle with cream, sautéed chicken, pine nuts, sun-dried tomatoes, Parmesan and rosemary	1053	79	4
11	Crème Brûlée	French dessert with creamy custard and hard caramel top	709	36	5
12	Chocolate Fondant	Valrhona chocolate fondant, served with ice cream and chocolate shavings	532	44	5
14	Cappuccino		122	27	6
15	Flat White		205	27	6
16	Cortado		44	21	6
13	Water		0	6	6
\.


--
-- Name: branches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresuser
--

SELECT pg_catalog.setval('public.branches_id_seq', 6, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresuser
--

SELECT pg_catalog.setval('public.categories_id_seq', 6, true);


--
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresuser
--

SELECT pg_catalog.setval('public.menu_items_id_seq', 16, true);


--
-- Name: branches branches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresuser
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgresuser
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresuser
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: menu_item_branches menu_item_branches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresuser
--

ALTER TABLE ONLY public.menu_item_branches
    ADD CONSTRAINT menu_item_branches_pkey PRIMARY KEY (menu_item_id, branch_id);


--
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresuser
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- Name: menu_item_branches menu_item_branches_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgresuser
--

ALTER TABLE ONLY public.menu_item_branches
    ADD CONSTRAINT menu_item_branches_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branches(id);


--
-- Name: menu_item_branches menu_item_branches_menu_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgresuser
--

ALTER TABLE ONLY public.menu_item_branches
    ADD CONSTRAINT menu_item_branches_menu_item_id_fkey FOREIGN KEY (menu_item_id) REFERENCES public.menu_items(id);


--
-- Name: menu_items menu_items_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgresuser
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- PostgreSQL database dump complete
--

