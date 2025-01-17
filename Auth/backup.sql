failed to get console mode for stdout: The handle is invalid.
--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE userdb;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:JvMawF0iRxsbiAu88W0A3Q==$m0Gt55QT0l6j1zWcItB0mTBhTq1g+ZuB5Cn7kI5sKZs=:RqNgogmoK6jk3T8UCI1VcXWF2D5G8UudWUsKpkWIoUM=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+2)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+2)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+2)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+2)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "userdb" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+2)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+2)

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

--
-- Name: userdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE userdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE userdb OWNER TO postgres;

\connect userdb

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
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id bigint NOT NULL,
    check_in timestamp with time zone,
    check_out timestamp with time zone,
    user_id bigint,
    hotel_room text
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_id_seq OWNER TO postgres;

--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    email text,
    password text,
    name text,
    token text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (id, check_in, check_out, user_id, hotel_room) FROM stdin;
1	2024-11-24 15:00:00+00	2024-11-24 12:00:00+00	1	1_5
2	2024-11-24 15:00:00+00	2024-11-24 12:00:00+00	2	1_5
3	2024-11-12 15:00:00+00	2024-11-12 12:00:00+00	2	1_5
4	2024-11-12 12:00:00+00	2024-11-23 09:00:00+00	2	1_5
5	2024-11-12 12:00:00+00	2024-11-23 09:00:00+00	2	1_6
6	2024-11-12 12:00:00+00	2024-11-25 09:00:00+00	2	1_6
7	2024-11-12 12:00:00+00	2024-11-20 09:00:00+00	2	1_6
8	2024-10-29 12:00:00+00	2024-10-31 09:00:00+00	3	3_19
9	2024-11-28 12:00:00+00	2024-12-02 09:00:00+00	3	3_19
10	2024-12-04 12:00:00+00	2024-12-06 09:00:00+00	3	3_19
11	2024-12-07 12:00:00+00	2024-12-11 09:00:00+00	3	3_19
12	2024-12-01 12:00:00+00	2024-12-09 09:00:00+00	3	3_20
13	2024-12-24 12:00:00+00	2024-12-26 09:00:00+00	3	3_19
14	2024-12-16 12:00:00+00	2024-12-19 09:00:00+00	3	2_11
15	2024-12-01 12:00:00+00	2024-12-03 09:00:00+00	3	2_15
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, created_at, updated_at, deleted_at, email, password, name, token) FROM stdin;
3	2024-11-25 18:28:10.832924+00	2024-11-30 06:03:54.614693+00	\N	c@a.ru	$2a$10$KviKNs/paFcao1Bz11qrI.PUKL3KCFLWdWUqOKrXB4xYjkCS0Hm5S	Nick	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjcmVhdGVkIjoiMjAyNC0xMS0zMFQwOTowMzo1NC42MDg3MjM3KzAzOjAwIiwiZW1haWwiOiIiLCJleHBpcmVzIjoiMjAyNC0xMi0zMFQwOTowMzo1NC42MDg3MjM3KzAzOjAwIn0.S1lR6kObYeHP_tPW5Ul9NrCLqK41EwpDujaMnMnbi74
4	2024-11-25 18:42:47.529437+00	2024-11-27 16:27:36.886508+00	\N	nickolapavlovich@gmail.com	$2a$10$TPXoN16fYCoVltvsI9JFTuSR.BeQw7dAZ3x0bY3vVbcGtMumjDPhK	awdawd	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjcmVhdGVkIjoiMjAyNC0xMS0yN1QxOToyNzozNi44ODIzMjY0KzAzOjAwIiwiZW1haWwiOiIiLCJleHBpcmVzIjoiMjAyNC0xMi0yN1QxOToyNzozNi44ODIzMjY0KzAzOjAwIn0.b8U1jINcPlg9RejlmOLljoQ5c608q_sW7_kgHqOuGE8
1	2024-11-24 16:41:27.404373+00	2024-11-24 16:53:30.200393+00	\N	a@a.ru	$2a$10$2dXinjoT0CO2D6fI1E7AXuaTrVTcUZLC5rTcSESZCPkmVrXFdDc9u	Paty	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjcmVhdGVkIjoiMjAyNC0xMS0yNFQxOTo0MToyNy40NDcyMzQ4KzAzOjAwIiwiZW1haWwiOiIiLCJleHBpcmVzIjoiMjAyNC0xMi0yNFQxOTo0MToyNy40NDcyMzQ4KzAzOjAwIn0.VakpZJHZVHkf7PAYszXAzMukO2_A-IlMMmU0kE0TpkQ
2	2024-11-24 17:16:29.953414+00	2024-11-24 17:16:29.971243+00	\N	b@a.ru	$2a$10$m3cMQgyX4KH4tsytLhDpQ.pDuEBETH4Ora/USiT.W9/dOSLcdp3NO	Nick	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjcmVhdGVkIjoiMjAyNC0xMS0yNFQyMDoxNjoyOS45Njc2OTQ4KzAzOjAwIiwiZW1haWwiOiIiLCJleHBpcmVzIjoiMjAyNC0xMi0yNFQyMDoxNjoyOS45Njc2OTQ4KzAzOjAwIn0.JYSUTl0jXan3pO9saE3FDMWSeUfKGowUZXSJ_HaWZBM
5	2024-11-25 18:48:32.319124+00	2024-11-25 18:48:32.340156+00	\N	nickolapavl@gmail.com	$2a$10$ysmV3V5MRXljebQsEtnFlO/vKKTkCRf8IEm3G4G2oVP.Xpmar1ShW	Patia	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjcmVhdGVkIjoiMjAyNC0xMS0yNVQyMTo0ODozMi4zMzQ5NDkxKzAzOjAwIiwiZW1haWwiOiIiLCJleHBpcmVzIjoiMjAyNC0xMi0yNVQyMTo0ODozMi4zMzQ5NDkxKzAzOjAwIn0.72pp2tMwnhzPjz1NZURlT2mZ1OTmcSjrluUCs6dTzRk
6	2024-11-25 19:10:46.041316+00	2024-11-25 19:10:46.049304+00	\N	nickvich@gmail.com	$2a$10$Nbapc8CwiGJcFiOIMpvTYOm/DZjbNitkY7IjmMbCJVIOxYT9V082q	╤Д╨д╨Т╤Д╤Ж╨▓	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjcmVhdGVkIjoiMjAyNC0xMS0yNVQyMjoxMDo0Ni4wNDUzMTg0KzAzOjAwIiwiZW1haWwiOiIiLCJleHBpcmVzIjoiMjAyNC0xMi0yNVQyMjoxMDo0Ni4wNDUzMTg0KzAzOjAwIn0.iQVnIFjZbUu12fLy0PS1bqvi4vbVWIjXWUIvXcsryA4
7	2024-11-25 19:12:11.311989+00	2024-11-25 19:12:11.331066+00	\N	nkvich@gmail.com	$2a$10$uyZQEJ6f5DkavDh1bHTiO.A2VrKF.x.RwIy0R90YsAi2lwDDsiR/u	╤Д╨д╨Т╤Д╤Ж╨▓	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjcmVhdGVkIjoiMjAyNC0xMS0yNVQyMjoxMjoxMS4zMjc4ODEyKzAzOjAwIiwiZW1haWwiOiIiLCJleHBpcmVzIjoiMjAyNC0xMi0yNVQyMjoxMjoxMS4zMjc4ODEyKzAzOjAwIn0.W992X-VRrltO0wxOgB1eUFvtkpHPJwZ59OH8sxemeQM
\.


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 15, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_users_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_deleted_at ON public.users USING btree (deleted_at);


--
-- Name: bookings fk_users_bookings; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT fk_users_bookings FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

