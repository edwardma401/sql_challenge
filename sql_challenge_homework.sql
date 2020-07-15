--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dept_no character varying(5) NOT NULL,
    dept_name character varying(20) NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: dept_emp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_emp (
    emp_no integer NOT NULL,
    dept_no character varying(5) NOT NULL
);


ALTER TABLE public.dept_emp OWNER TO postgres;

--
-- Name: dept_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_manager (
    dept_no character varying(5) NOT NULL,
    emp_no integer NOT NULL
);


ALTER TABLE public.dept_manager OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    emp_no integer NOT NULL,
    title_id character varying(10) NOT NULL,
    birth_date character varying(15) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    sex character varying(2) NOT NULL,
    hire_date character varying(15) NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    emp_no integer NOT NULL,
    salary integer NOT NULL
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- Name: task_1; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.task_1 AS
 SELECT employees.emp_no,
    employees.last_name,
    employees.first_name,
    employees.sex,
    salaries.salary
   FROM (public.employees
     JOIN public.salaries ON ((employees.emp_no = salaries.emp_no)));


ALTER TABLE public.task_1 OWNER TO postgres;

--
-- Name: task_2; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.task_2 AS
 SELECT employees.first_name,
    employees.last_name,
    employees.hire_date
   FROM public.employees
  WHERE ((employees.hire_date)::text ~~ '%1986'::text);


ALTER TABLE public.task_2 OWNER TO postgres;

--
-- Name: task_3; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.task_3 AS
 SELECT departments.dept_no,
    departments.dept_name,
    dept_manager.emp_no,
    employees.last_name,
    employees.first_name
   FROM ((public.departments
     JOIN public.dept_manager ON (((departments.dept_no)::text = (dept_manager.dept_no)::text)))
     JOIN public.employees ON ((dept_manager.emp_no = employees.emp_no)));


ALTER TABLE public.task_3 OWNER TO postgres;

--
-- Name: task_4; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.task_4 AS
 SELECT employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name
   FROM ((public.employees
     JOIN public.dept_emp ON ((employees.emp_no = dept_emp.emp_no)))
     JOIN public.departments ON (((dept_emp.dept_no)::text = (departments.dept_no)::text)));


ALTER TABLE public.task_4 OWNER TO postgres;

--
-- Name: task_5; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.task_5 AS
 SELECT employees.first_name,
    employees.last_name,
    employees.sex
   FROM public.employees
  WHERE (((employees.first_name)::text = 'Hercules'::text) AND ((employees.last_name)::text ~~ 'B%'::text));


ALTER TABLE public.task_5 OWNER TO postgres;

--
-- Name: task_6; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.task_6 AS
 SELECT employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name
   FROM ((public.employees
     JOIN public.dept_emp ON ((employees.emp_no = dept_emp.emp_no)))
     JOIN public.departments ON (((dept_emp.dept_no)::text = (departments.dept_no)::text)))
  WHERE ((departments.dept_name)::text = 'Sales'::text);


ALTER TABLE public.task_6 OWNER TO postgres;

--
-- Name: task_7; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.task_7 AS
 SELECT employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name
   FROM ((public.employees
     JOIN public.dept_emp ON ((employees.emp_no = dept_emp.emp_no)))
     JOIN public.departments ON (((dept_emp.dept_no)::text = (departments.dept_no)::text)))
  WHERE (((departments.dept_name)::text = 'Sales'::text) OR ((departments.dept_name)::text = 'Development'::text));


ALTER TABLE public.task_7 OWNER TO postgres;

--
-- Name: task_8; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.task_8 AS
 SELECT employees.last_name,
    count(employees.first_name) AS last_name_counts
   FROM public.employees
  GROUP BY employees.last_name
  ORDER BY (count(employees.first_name)) DESC;


ALTER TABLE public.task_8 OWNER TO postgres;

--
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    title_id character varying(10) NOT NULL,
    title character varying(20) NOT NULL
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_no);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_no);


--
-- Name: titles titles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_pkey PRIMARY KEY (title_id);


--
-- Name: dept_emp dept_emp_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- Name: dept_emp dept_emp_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- Name: dept_manager dept_manager_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- Name: dept_manager dept_manager_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- Name: employees employees_title_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_title_id_fkey FOREIGN KEY (title_id) REFERENCES public.titles(title_id);


--
-- Name: salaries salaries_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- PostgreSQL database dump complete
--

