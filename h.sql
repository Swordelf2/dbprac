--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE hospital;
--
-- Name: hospital; Type: DATABASE; Schema: -; Owner: swordelf
--

CREATE DATABASE hospital WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE hospital OWNER TO swordelf;

\connect hospital

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Врач; Type: TABLE; Schema: public; Owner: swordelf
--

CREATE TABLE public."Врач" (
    "Врач_id" integer NOT NULL,
    "Фамилия" character varying(30),
    "Имя" character varying(15),
    "Отчество" character varying(20),
    "Время_начала" time without time zone,
    "Время_окончания" time without time zone,
    "Кабинет" smallint
);


ALTER TABLE public."Врач" OWNER TO swordelf;

--
-- Name: Врач_Специализация; Type: TABLE; Schema: public; Owner: swordelf
--

CREATE TABLE public."Врач_Специализация" (
    "Врач_id" integer NOT NULL,
    "Специализация_id" integer NOT NULL
);


ALTER TABLE public."Врач_Специализация" OWNER TO swordelf;

--
-- Name: Диагноз; Type: TABLE; Schema: public; Owner: swordelf
--

CREATE TABLE public."Диагноз" (
    "Диагноз_id" integer NOT NULL,
    "Название" character varying(50),
    "Описание" character varying(300)
);


ALTER TABLE public."Диагноз" OWNER TO swordelf;

--
-- Name: Лечение; Type: TABLE; Schema: public; Owner: swordelf
--

CREATE TABLE public."Лечение" (
    "Лечение_id" integer NOT NULL,
    "Пациент_id" integer,
    "Врач_id" integer,
    "Дата_начала" date,
    "Дата_окончания" date,
    "Состояние_id" integer,
    "Диагноз_id" integer
);


ALTER TABLE public."Лечение" OWNER TO swordelf;

--
-- Name: Пациент; Type: TABLE; Schema: public; Owner: swordelf
--

CREATE TABLE public."Пациент" (
    "Пациент_id" integer NOT NULL,
    "Номер_полиса" integer NOT NULL,
    "Фамилия" character varying(30),
    "Имя" character varying(15),
    "Отчество" character varying(20),
    "Год_рождения" smallint,
    "Социальный_статус_id" integer,
    CONSTRAINT "Пациент_Год_рождения_check" CHECK ((("Год_рождения" >= 1900) AND ("Год_рождения" <= 2018)))
);


ALTER TABLE public."Пациент" OWNER TO swordelf;

--
-- Name: Прием; Type: TABLE; Schema: public; Owner: swordelf
--

CREATE TABLE public."Прием" (
    "Прием_id" integer NOT NULL,
    "Лечение_id" integer,
    "Время_начала" timestamp without time zone,
    "Время_окончания" timestamp without time zone
);


ALTER TABLE public."Прием" OWNER TO swordelf;

--
-- Name: Состояние; Type: TABLE; Schema: public; Owner: swordelf
--

CREATE TABLE public."Состояние" (
    "Состояние_id" integer NOT NULL,
    "Описание" character varying(50)
);


ALTER TABLE public."Состояние" OWNER TO swordelf;

--
-- Name: Социальный_статус; Type: TABLE; Schema: public; Owner: swordelf
--

CREATE TABLE public."Социальный_статус" (
    "Социальный_статус_id" integer NOT NULL,
    "Описание" character varying(50)
);


ALTER TABLE public."Социальный_статус" OWNER TO swordelf;

--
-- Name: Специализация; Type: TABLE; Schema: public; Owner: swordelf
--

CREATE TABLE public."Специализация" (
    "Специализация_id" integer NOT NULL,
    "Название" character varying(30)
);


ALTER TABLE public."Специализация" OWNER TO swordelf;

--
-- Data for Name: Врач; Type: TABLE DATA; Schema: public; Owner: swordelf
--

COPY public."Врач" ("Врач_id", "Фамилия", "Имя", "Отчество", "Время_начала", "Время_окончания", "Кабинет") FROM stdin;
\.


--
-- Data for Name: Врач_Специализация; Type: TABLE DATA; Schema: public; Owner: swordelf
--

COPY public."Врач_Специализация" ("Врач_id", "Специализация_id") FROM stdin;
\.


--
-- Data for Name: Диагноз; Type: TABLE DATA; Schema: public; Owner: swordelf
--

COPY public."Диагноз" ("Диагноз_id", "Название", "Описание") FROM stdin;
\.


--
-- Data for Name: Лечение; Type: TABLE DATA; Schema: public; Owner: swordelf
--

COPY public."Лечение" ("Лечение_id", "Пациент_id", "Врач_id", "Дата_начала", "Дата_окончания", "Состояние_id", "Диагноз_id") FROM stdin;
\.


--
-- Data for Name: Пациент; Type: TABLE DATA; Schema: public; Owner: swordelf
--

COPY public."Пациент" ("Пациент_id", "Номер_полиса", "Фамилия", "Имя", "Отчество", "Год_рождения", "Социальный_статус_id") FROM stdin;
\.


--
-- Data for Name: Прием; Type: TABLE DATA; Schema: public; Owner: swordelf
--

COPY public."Прием" ("Прием_id", "Лечение_id", "Время_начала", "Время_окончания") FROM stdin;
\.


--
-- Data for Name: Состояние; Type: TABLE DATA; Schema: public; Owner: swordelf
--

COPY public."Состояние" ("Состояние_id", "Описание") FROM stdin;
\.


--
-- Data for Name: Социальный_статус; Type: TABLE DATA; Schema: public; Owner: swordelf
--

COPY public."Социальный_статус" ("Социальный_статус_id", "Описание") FROM stdin;
\.


--
-- Data for Name: Специализация; Type: TABLE DATA; Schema: public; Owner: swordelf
--

COPY public."Специализация" ("Специализация_id", "Название") FROM stdin;
\.


--
-- Name: Врач Врач_pkey; Type: CONSTRAINT; Schema: public; Owner: swordelf
--

ALTER TABLE ONLY public."Врач"
    ADD CONSTRAINT "Врач_pkey" PRIMARY KEY ("Врач_id");


--
-- Name: Врач_Специализация Врач_Специализация_pkey; Type: CONSTRAINT; Schema: public; Owner: swordelf
--

ALTER TABLE ONLY public."Врач_Специализация"
    ADD CONSTRAINT "Врач_Специализация_pkey" PRIMARY KEY ("Врач_id", "Специализация_id");


--
-- Name: Диагноз Диагноз_pkey; Type: CONSTRAINT; Schema: public; Owner: swordelf
--

ALTER TABLE ONLY public."Диагноз"
    ADD CONSTRAINT "Диагноз_pkey" PRIMARY KEY ("Диагноз_id");


--
-- Name: Лечение Лечение_pkey; Type: CONSTRAINT; Schema: public; Owner: swordelf
--

ALTER TABLE ONLY public."Лечение"
    ADD CONSTRAINT "Лечение_pkey" PRIMARY KEY ("Лечение_id");


--
-- Name: Пациент Пациент_pkey; Type: CONSTRAINT; Schema: public; Owner: swordelf
--

ALTER TABLE ONLY public."Пациент"
    ADD CONSTRAINT "Пациент_pkey" PRIMARY KEY ("Пациент_id");


--
-- Name: Прием Прием_pkey; Type: CONSTRAINT; Schema: public; Owner: swordelf
--

ALTER TABLE ONLY public."Прием"
    ADD CONSTRAINT "Прием_pkey" PRIMARY KEY ("Прием_id");


--
-- Name: Состояние Состояние_pkey; Type: CONSTRAINT; Schema: public; Owner: swordelf
--

ALTER TABLE ONLY public."Состояние"
    ADD CONSTRAINT "Состояние_pkey" PRIMARY KEY ("Состояние_id");


--
-- Name: Социальный_статус Социальный_статус_pkey; Type: CONSTRAINT; Schema: public; Owner: swordelf
--

ALTER TABLE ONLY public."Социальный_статус"
    ADD CONSTRAINT "Социальный_статус_pkey" PRIMARY KEY ("Социальный_статус_id");


--
-- Name: Специализация Специализация_pkey; Type: CONSTRAINT; Schema: public; Owner: swordelf
--

ALTER TABLE ONLY public."Специализация"
    ADD CONSTRAINT "Специализация_pkey" PRIMARY KEY ("Специализация_id");


--
-- Name: Врач_Специализация Врач_Специализа_Специализация_i_fkey; Type: FK CONSTRAINT; Schema: public; Owner: swordelf
--

ALTER TABLE ONLY public."Врач_Специализация"
    ADD CONSTRAINT "Врач_Специализа_Специализация_i_fkey" FOREIGN KEY ("Специализация_id") REFERENCES public."Специализация"("Специализация_id");


--
-- Name: Врач_Специализация Врач_Специализация_Врач_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: swordelf
--

ALTER TABLE ONLY public."Врач_Специализация"
    ADD CONSTRAINT "Врач_Специализация_Врач_id_fkey" FOREIGN KEY ("Врач_id") REFERENCES public."Врач"("Врач_id");


--
-- Name: Лечение Лечение_Врач_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: swordelf
--

ALTER TABLE ONLY public."Лечение"
    ADD CONSTRAINT "Лечение_Врач_id_fkey" FOREIGN KEY ("Врач_id") REFERENCES public."Врач"("Врач_id");


--
-- Name: Лечение Лечение_Диагноз_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: swordelf
--

ALTER TABLE ONLY public."Лечение"
    ADD CONSTRAINT "Лечение_Диагноз_id_fkey" FOREIGN KEY ("Диагноз_id") REFERENCES public."Диагноз"("Диагноз_id");


--
-- Name: Лечение Лечение_Пациент_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: swordelf
--

ALTER TABLE ONLY public."Лечение"
    ADD CONSTRAINT "Лечение_Пациент_id_fkey" FOREIGN KEY ("Пациент_id") REFERENCES public."Пациент"("Пациент_id");


--
-- Name: Лечение Лечение_Состояние_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: swordelf
--

ALTER TABLE ONLY public."Лечение"
    ADD CONSTRAINT "Лечение_Состояние_id_fkey" FOREIGN KEY ("Состояние_id") REFERENCES public."Состояние"("Состояние_id");


--
-- Name: Пациент Пациент_Социальный_статус_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: swordelf
--

ALTER TABLE ONLY public."Пациент"
    ADD CONSTRAINT "Пациент_Социальный_статус_id_fkey" FOREIGN KEY ("Социальный_статус_id") REFERENCES public."Социальный_статус"("Социальный_статус_id");


--
-- Name: Прием Прием_Лечение_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: swordelf
--

ALTER TABLE ONLY public."Прием"
    ADD CONSTRAINT "Прием_Лечение_id_fkey" FOREIGN KEY ("Лечение_id") REFERENCES public."Лечение"("Лечение_id");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

