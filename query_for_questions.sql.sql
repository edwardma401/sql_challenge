--
-- task_1
--

CREATE VIEW task_1 AS
 SELECT employees.emp_no,
    employees.last_name,
    employees.first_name,
    employees.sex,
    salaries.salary
   FROM employees
     INNER JOIN salaries ON employees.emp_no = salaries.emp_no

CREATE VIEW task_2 AS
 SELECT employees.first_name,
    employees.last_name,
    employees.hire_date
   FROM employees
  WHERE employees.hire_date = '%1986'

--
-- task_2
--

CREATE VIEW task_3 AS
 SELECT departments.dept_no,
    departments.dept_name,
    dept_manager.emp_no,
    employees.last_name,
    employees.first_name
   FROM departments
     INNER JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
     INNER JOIN employees ON dept_manager.emp_no = employees.emp_no
--
-- task_4
--

CREATE VIEW task_4 AS
 SELECT employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name
   FROM employees
     JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
     JOIN departments ON dept_emp.dept_no = departments.dept_no


ALTER TABLE public.task_4 OWNER TO postgres;

--
-- task_5
--

CREATE VIEW task_5 AS
 SELECT employees.first_name,
    employees.last_name,
    employees.sex
   FROM employees
  WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%'

--
-- task_6
--

CREATE VIEW task_6 AS
 SELECT employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name
   FROM employees
     INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
     INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
  WHERE departments.dept_name = 'Sales'

--
-- task_7
--

CREATE VIEW task_7 AS
 SELECT employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_name
   FROM employees
     INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
     INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
  WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
--
-- task_8
--

CREATE VIEW task_8 AS
 SELECT last_name,
    count(first_name) AS last_name_counts
   FROM employees
  GROUP BY last_name
  ORDER BY last_name_counts DESC
