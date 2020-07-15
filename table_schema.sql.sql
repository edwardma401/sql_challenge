-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/BJRvHk
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE departments (
    dept_no VARCHAR(5)   NOT NULL,
    dept_name VARCHAR(20)   NOT NULL,
    PRIMARY KEY (dept_no)
     );

CREATE TABLE titles (
    title_id VARCHAR(10)   NOT NULL,
    title VARCHAR(20)   NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE employees (
    emp_no int   NOT NULL,
    title_id VARCHAR(10)   NOT NULL,
    birth_date VARCHAR(15)   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    sex VARCHAR(2)   NOT NULL,
    hire_date VARCHAR(15)   NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY(title_id) REFERENCES titles (title_id)
);

CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    dept_no VARCHAR(5)   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(5)   NOT NULL,
    emp_no int   NOT NULL,
    FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY(emp_no) REFERENCES employees (emp_no)

);

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
