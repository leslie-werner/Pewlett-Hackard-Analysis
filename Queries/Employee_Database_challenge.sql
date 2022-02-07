-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE employees (
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

CREATE TABLE managers (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(24) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

SELECT * FROM departments;


SELECT * FROM managers;

DROP TABLE retirement_info;

-- Retirement eligibility
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- 1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name 
FROM employees
-- 2. Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date 
FROM titles

-- 3. Create a new table using the INTO clause.
SELECT title, from_date, to_date, emp_no
INTO retirement_titles
FROM titles;

DROP TABLE retirement_titles;

SELECT * FROM retirement_emp;

SELECT emp_no, first_name, last_name 
INTO retirement_emp
FROM employees;

SELECT retirement_titles.emp_no, first_name, last_name, title, from_date, to_date
INTO emp_info_tab
FROM retirement_titles
JOIN retirement_info ON retirement_titles.emp_no = retirement_info.emp_no;

SELECT * FROM emp_info_tab;

-- UNIQUE TITLES.CSV INFO 

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO emp_retirement_info
FROM emp_info_tab
WHERE (to_date BETWEEN '1920-01-01' AND '9999-01-01')
ORDER BY emp_no, to_date DESC;

DROP TABLE emp_retirement_info; 

SELECT * FROM emp_retirement_info;


-- Retrieve the number of employees by most recent job title who are about to retire

SELECT COUNT(title), title
FROM emp_retirement_info
GROUP BY title;

-- Del. 2 Write a query to create Mentorship Elgibility table that holds the employees wh oare eligible to participate in mentorship program.
SELECT emp_no, first_name, last_name, birth_date
FROM employees;

SELECT from_date, to_date
FROM dept_emp;

SELECT title
FROM titles;

-- USE DISTINCT ON to find elgibility

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, d.from_date, d.to_date, title
INTO mentorship_elgibility
FROM employees AS e
JOIN dept_emp AS d ON e.emp_no = d.emp_no
JOIN titles ON d.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

SELECT * FROM mentorship_elgibility;

DROP TABLE mentorship_elgibility;