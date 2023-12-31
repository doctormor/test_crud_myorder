toc.dat                                                                                             0000600 0004000 0002000 00000006313 14514073625 0014451 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   9                	    {            db_test    16.0    16.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    18974    db_test    DATABASE     �   CREATE DATABASE db_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.874';
    DROP DATABASE db_test;
                postgres    false         �            1259    18976    tbl_employees    TABLE       CREATE TABLE public.tbl_employees (
    id integer NOT NULL,
    "perId" character varying(13) NOT NULL,
    name character varying(150) NOT NULL,
    surname character varying(150) NOT NULL,
    address character varying NOT NULL,
    mobile character varying(50) NOT NULL,
    email character varying,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    sex character varying(10) NOT NULL
);
 !   DROP TABLE public.tbl_employees;
       public         heap    postgres    false         �            1259    18975    tbl_employees_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tbl_employees_id_seq;
       public          postgres    false    216         �           0    0    tbl_employees_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tbl_employees_id_seq OWNED BY public.tbl_employees.id;
          public          postgres    false    215                    2604    18979    tbl_employees id    DEFAULT     t   ALTER TABLE ONLY public.tbl_employees ALTER COLUMN id SET DEFAULT nextval('public.tbl_employees_id_seq'::regclass);
 ?   ALTER TABLE public.tbl_employees ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216         �          0    18976    tbl_employees 
   TABLE DATA           �   COPY public.tbl_employees (id, "perId", name, surname, address, mobile, email, "isActive", "createdAt", "updatedAt", sex) FROM stdin;
    public          postgres    false    216       4784.dat �           0    0    tbl_employees_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tbl_employees_id_seq', 3, true);
          public          postgres    false    215                    2606    18986 ,   tbl_employees PK_e7ef1049c44fc44dfb6c65a15fe 
   CONSTRAINT     l   ALTER TABLE ONLY public.tbl_employees
    ADD CONSTRAINT "PK_e7ef1049c44fc44dfb6c65a15fe" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.tbl_employees DROP CONSTRAINT "PK_e7ef1049c44fc44dfb6c65a15fe";
       public            postgres    false    216                                                                                                                                                                                                                                                                                                                             4784.dat                                                                                            0000600 0004000 0002000 00000001235 14514073625 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1234567891234	สมชาย	แซ่ย่าง	12/45 ต.แสนสุข อ.เมือง จ.ชลบุรี	0811112222	test1@gmail.com	t	2023-10-18 11:04:29.776814	2023-10-18 11:04:29.776814	male
2	5556667777888	ศศิณี	สมประสงค์	4/89 ต.หนองปรือ อ.บางละมุง จ.ชลบุรี 	0894445555	test2@gmail.com	t	2023-10-18 11:05:15.277055	2023-10-18 11:05:15.277055	female
3	9999888888777	อิทธิพล	แสนสุข	99/99 ต.แสนสุข อ.เมือง จ.ชลบุรี	0899999999	test3@gmail.com	t	2023-10-18 11:05:55.9664	2023-10-18 11:05:55.9664	male
\.


                                                                                                                                                                                                                                                                                                                                                                   restore.sql                                                                                         0000600 0004000 0002000 00000006534 14514073625 0015403 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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

DROP DATABASE db_test;
--
-- Name: db_test; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.874';


ALTER DATABASE db_test OWNER TO postgres;

\connect db_test

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
-- Name: tbl_employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_employees (
    id integer NOT NULL,
    "perId" character varying(13) NOT NULL,
    name character varying(150) NOT NULL,
    surname character varying(150) NOT NULL,
    address character varying NOT NULL,
    mobile character varying(50) NOT NULL,
    email character varying,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    sex character varying(10) NOT NULL
);


ALTER TABLE public.tbl_employees OWNER TO postgres;

--
-- Name: tbl_employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_employees_id_seq OWNER TO postgres;

--
-- Name: tbl_employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_employees_id_seq OWNED BY public.tbl_employees.id;


--
-- Name: tbl_employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_employees ALTER COLUMN id SET DEFAULT nextval('public.tbl_employees_id_seq'::regclass);


--
-- Data for Name: tbl_employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_employees (id, "perId", name, surname, address, mobile, email, "isActive", "createdAt", "updatedAt", sex) FROM stdin;
\.
COPY public.tbl_employees (id, "perId", name, surname, address, mobile, email, "isActive", "createdAt", "updatedAt", sex) FROM '$$PATH$$/4784.dat';

--
-- Name: tbl_employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_employees_id_seq', 3, true);


--
-- Name: tbl_employees PK_e7ef1049c44fc44dfb6c65a15fe; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_employees
    ADD CONSTRAINT "PK_e7ef1049c44fc44dfb6c65a15fe" PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    