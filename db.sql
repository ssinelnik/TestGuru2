--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Postgres.app)
-- Dumped by pg_dump version 16.3 (Postgres.app)

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
-- Name: answers; Type: TABLE; Schema: public; Owner: alexandersinelnik
--

CREATE TABLE public.answers (
    id bigint NOT NULL,
    body character varying NOT NULL,
    correct boolean DEFAULT false NOT NULL,
    question_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.answers OWNER TO alexandersinelnik;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: alexandersinelnik
--

CREATE SEQUENCE public.answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.answers_id_seq OWNER TO alexandersinelnik;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexandersinelnik
--

ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: alexandersinelnik
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO alexandersinelnik;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: alexandersinelnik
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    title character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO alexandersinelnik;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: alexandersinelnik
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO alexandersinelnik;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexandersinelnik
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: alexandersinelnik
--

CREATE TABLE public.questions (
    id bigint NOT NULL,
    body character varying NOT NULL,
    test_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.questions OWNER TO alexandersinelnik;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: alexandersinelnik
--

CREATE SEQUENCE public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.questions_id_seq OWNER TO alexandersinelnik;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexandersinelnik
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: alexandersinelnik
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO alexandersinelnik;

--
-- Name: tests; Type: TABLE; Schema: public; Owner: alexandersinelnik
--

CREATE TABLE public.tests (
    id bigint NOT NULL,
    title character varying NOT NULL,
    level integer DEFAULT 0 NOT NULL,
    category_id bigint NOT NULL,
    author_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.tests OWNER TO alexandersinelnik;

--
-- Name: tests_id_seq; Type: SEQUENCE; Schema: public; Owner: alexandersinelnik
--

CREATE SEQUENCE public.tests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tests_id_seq OWNER TO alexandersinelnik;

--
-- Name: tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexandersinelnik
--

ALTER SEQUENCE public.tests_id_seq OWNED BY public.tests.id;


--
-- Name: tests_users; Type: TABLE; Schema: public; Owner: alexandersinelnik
--

CREATE TABLE public.tests_users (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    test_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.tests_users OWNER TO alexandersinelnik;

--
-- Name: tests_users_id_seq; Type: SEQUENCE; Schema: public; Owner: alexandersinelnik
--

CREATE SEQUENCE public.tests_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tests_users_id_seq OWNER TO alexandersinelnik;

--
-- Name: tests_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexandersinelnik
--

ALTER SEQUENCE public.tests_users_id_seq OWNED BY public.tests_users.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: alexandersinelnik
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO alexandersinelnik;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: alexandersinelnik
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO alexandersinelnik;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexandersinelnik
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: tests id; Type: DEFAULT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.tests ALTER COLUMN id SET DEFAULT nextval('public.tests_id_seq'::regclass);


--
-- Name: tests_users id; Type: DEFAULT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.tests_users ALTER COLUMN id SET DEFAULT nextval('public.tests_users_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: alexandersinelnik
--

COPY public.answers (id, body, correct, question_id, created_at, updated_at) FROM stdin;
1	Symbols	f	1	2024-06-16 12:46:52.968693	2024-06-16 12:46:52.968693
2	Object Relational Mapper	f	2	2024-06-16 12:46:52.98259	2024-06-16 12:46:52.98259
3	UTF-8	f	3	2024-06-16 12:46:52.987693	2024-06-16 12:46:52.987693
4	Cascading Style Sheets	f	4	2024-06-16 12:46:52.992622	2024-06-16 12:46:52.992622
5	Body	f	5	2024-06-16 12:46:52.997824	2024-06-16 12:46:52.997824
6	No	f	6	2024-06-16 12:46:53.003419	2024-06-16 12:46:53.003419
7	No	f	7	2024-06-16 12:46:53.009568	2024-06-16 12:46:53.009568
8	Set	f	8	2024-06-16 12:46:53.014777	2024-06-16 12:46:53.014777
9	No	f	9	2024-06-16 12:46:53.025462	2024-06-16 12:46:53.025462
10	Fun	f	10	2024-06-16 12:46:53.030781	2024-06-16 12:46:53.030781
11	Yes	f	11	2024-06-16 12:46:53.036283	2024-06-16 12:46:53.036283
12	Who	f	12	2024-06-16 12:46:53.041606	2024-06-16 12:46:53.041606
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: alexandersinelnik
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-06-16 04:57:18.351611	2024-06-16 04:57:18.351618
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: alexandersinelnik
--

COPY public.categories (id, title, created_at, updated_at) FROM stdin;
1	Frontend	2024-06-16 12:46:52.648978	2024-06-16 12:46:52.648978
2	Backend	2024-06-16 12:46:52.663837	2024-06-16 12:46:52.663837
3	Data Science	2024-06-16 12:46:52.669541	2024-06-16 12:46:52.669541
4	Machine learning	2024-06-16 12:46:52.674762	2024-06-16 12:46:52.674762
5	Mobile development	2024-06-16 12:46:52.680113	2024-06-16 12:46:52.680113
6	Math searching	2024-06-16 12:46:52.685029	2024-06-16 12:46:52.685029
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: alexandersinelnik
--

COPY public.questions (id, body, test_id, created_at, updated_at) FROM stdin;
1	What is the name of a specialized data type in the Ruby language?	1	2024-06-16 12:46:52.840251	2024-06-16 12:46:52.840251
2	What does ORM stand for?	2	2024-06-16 12:46:52.881017	2024-06-16 12:46:52.881017
3	What encoding should use on the site?	3	2024-06-16 12:46:52.888991	2024-06-16 12:46:52.888991
4	What does CSS stand for?	4	2024-06-16 12:46:52.895093	2024-06-16 12:46:52.895093
5	Where is the correct place to insert a JavaScript?	5	2024-06-16 12:46:52.90074	2024-06-16 12:46:52.90074
6	In R, you must declare the data type of a variable?	6	2024-06-16 12:46:52.90607	2024-06-16 12:46:52.90607
7	C++ is an alias of C#?	7	2024-06-16 12:46:52.911378	2024-06-16 12:46:52.911378
8	Which collection does not allow duplicate members?	8	2024-06-16 12:46:52.916725	2024-06-16 12:46:52.916725
9	Java is short for JavaScript?	9	2024-06-16 12:46:52.921815	2024-06-16 12:46:52.921815
10	Which keyword is used to declare a function?	10	2024-06-16 12:46:52.927263	2024-06-16 12:46:52.927263
11	Is Fortran interpreter type language?	11	2024-06-16 12:46:52.932556	2024-06-16 12:46:52.932556
12	Which commands are used to display the content of the workspace?	12	2024-06-16 12:46:52.937814	2024-06-16 12:46:52.937814
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: alexandersinelnik
--

COPY public.schema_migrations (version) FROM stdin;
20240616052848
20240616053015
20240616053713
20240616054310
20240616054846
20240616055047
20240708143246
\.


--
-- Data for Name: tests; Type: TABLE DATA; Schema: public; Owner: alexandersinelnik
--

COPY public.tests (id, title, level, category_id, author_id, created_at, updated_at) FROM stdin;
1	Ruby	1	2	1	2024-06-16 12:46:52.735221	2024-06-16 12:46:52.735221
2	Rails	2	2	1	2024-06-16 12:46:52.755411	2024-06-16 12:46:52.755411
3	HTML	1	1	2	2024-06-16 12:46:52.760733	2024-06-16 12:46:52.760733
4	CSS	1	1	2	2024-06-16 12:46:52.766036	2024-06-16 12:46:52.766036
5	JavaScript	2	1	2	2024-06-16 12:46:52.7712	2024-06-16 12:46:52.7712
6	R	2	3	4	2024-06-16 12:46:52.776474	2024-06-16 12:46:52.776474
7	C/C++	3	3	3	2024-06-16 12:46:52.78179	2024-06-16 12:46:52.78179
8	Python	2	4	3	2024-06-16 12:46:52.787481	2024-06-16 12:46:52.787481
9	Java	2	5	5	2024-06-16 12:46:52.793793	2024-06-16 12:46:52.793793
10	Kotlin	1	5	5	2024-06-16 12:46:52.798688	2024-06-16 12:46:52.798688
11	Fortran	3	6	4	2024-06-16 12:46:52.803339	2024-06-16 12:46:52.803339
12	Matlab	3	6	4	2024-06-16 12:46:52.808744	2024-06-16 12:46:52.808744
\.


--
-- Data for Name: tests_users; Type: TABLE DATA; Schema: public; Owner: alexandersinelnik
--

COPY public.tests_users (id, user_id, test_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: alexandersinelnik
--

COPY public.users (id, name, email, created_at, updated_at) FROM stdin;
1	Alexander	alexander1999@mail.com	2024-06-16 12:46:52.530137	2024-06-16 12:46:52.530137
2	Anna	anna2003@mail.com	2024-06-16 12:46:52.601559	2024-06-16 12:46:52.601559
3	Georgy	georgy2001@mail.com	2024-06-16 12:46:52.610721	2024-06-16 12:46:52.610721
4	Artem	artem2005@mail.com	2024-06-16 12:46:52.618821	2024-06-16 12:46:52.618821
5	Ekaterina	ekaterina2000@mail.com	2024-06-16 12:46:52.625926	2024-06-16 12:46:52.625926
\.


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexandersinelnik
--

SELECT pg_catalog.setval('public.answers_id_seq', 12, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexandersinelnik
--

SELECT pg_catalog.setval('public.categories_id_seq', 6, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexandersinelnik
--

SELECT pg_catalog.setval('public.questions_id_seq', 12, true);


--
-- Name: tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexandersinelnik
--

SELECT pg_catalog.setval('public.tests_id_seq', 12, true);


--
-- Name: tests_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexandersinelnik
--

SELECT pg_catalog.setval('public.tests_users_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexandersinelnik
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tests tests_pkey; Type: CONSTRAINT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (id);


--
-- Name: tests_users tests_users_pkey; Type: CONSTRAINT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.tests_users
    ADD CONSTRAINT tests_users_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_answers_on_question_id; Type: INDEX; Schema: public; Owner: alexandersinelnik
--

CREATE INDEX index_answers_on_question_id ON public.answers USING btree (question_id);


--
-- Name: index_questions_on_test_id; Type: INDEX; Schema: public; Owner: alexandersinelnik
--

CREATE INDEX index_questions_on_test_id ON public.questions USING btree (test_id);


--
-- Name: index_tests_on_author_id; Type: INDEX; Schema: public; Owner: alexandersinelnik
--

CREATE INDEX index_tests_on_author_id ON public.tests USING btree (author_id);


--
-- Name: index_tests_on_category_id; Type: INDEX; Schema: public; Owner: alexandersinelnik
--

CREATE INDEX index_tests_on_category_id ON public.tests USING btree (category_id);


--
-- Name: index_tests_on_title_and_level; Type: INDEX; Schema: public; Owner: alexandersinelnik
--

CREATE UNIQUE INDEX index_tests_on_title_and_level ON public.tests USING btree (title, level);


--
-- Name: index_tests_users_on_test_id; Type: INDEX; Schema: public; Owner: alexandersinelnik
--

CREATE INDEX index_tests_users_on_test_id ON public.tests_users USING btree (test_id);


--
-- Name: index_tests_users_on_user_id; Type: INDEX; Schema: public; Owner: alexandersinelnik
--

CREATE INDEX index_tests_users_on_user_id ON public.tests_users USING btree (user_id);


--
-- Name: tests_users fk_rails_318b772344; Type: FK CONSTRAINT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.tests_users
    ADD CONSTRAINT fk_rails_318b772344 FOREIGN KEY (test_id) REFERENCES public.tests(id);


--
-- Name: answers fk_rails_3d5ed4418f; Type: FK CONSTRAINT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk_rails_3d5ed4418f FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- Name: questions fk_rails_cb4b358d50; Type: FK CONSTRAINT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT fk_rails_cb4b358d50 FOREIGN KEY (test_id) REFERENCES public.tests(id);


--
-- Name: tests fk_rails_cda342dc0a; Type: FK CONSTRAINT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT fk_rails_cda342dc0a FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: tests fk_rails_d58c5057b2; Type: FK CONSTRAINT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT fk_rails_d58c5057b2 FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- Name: tests_users fk_rails_eef596ff3f; Type: FK CONSTRAINT; Schema: public; Owner: alexandersinelnik
--

ALTER TABLE ONLY public.tests_users
    ADD CONSTRAINT fk_rails_eef596ff3f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

