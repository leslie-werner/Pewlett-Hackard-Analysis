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

DROP TABLE managers;

-- Retirement eligibility
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create a new table using the INTO clause for retirement_titles.

SELECT e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees AS e
JOIN titles AS ti ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')

SELECT * FROM retirement_titles;

-- UNIQUE TITLES.CSV INFO 

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM emp_info_tab
WHERE (to_date BETWEEN '1920-01-01' AND '9999-01-01')
ORDER BY emp_no, to_date DESC;

DROP TABLE unique_titles; 

SELECT * FROM unique_titles;


-- Retrieve the number of employees by most recent job title who are about to retire

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

-- Del. 2 Write a query to create Mentorship Elgibility table that holds the employees wh oare eligible to participate in mentorship program.
-- USE DISTINCT ON to find elgibility

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, d.from_date, d.to_date, t.title
INTO mentorship_elgibility
FROM employees AS e
INNER JOIN dept_emp AS d ON (e.emp_no = d.emp_no)
INNER JOIN titles AS t ON (e.emp_no = t.emp_no)
WHERE (d.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

SELECT * FROM mentorship_elgibility;

DROP TABLE mentorship_elgibility;


SELECT COUNT(title), title
INTO mentorship_titles
FROM mentorship_elgibility
GROUP BY title
ORDER BY count DESC;

SELECT * FROM mentorship_titles;

DROP TABLE mentorship_elgibility;

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, s.from_date, s.to_date, title, s.salary 
INTO retiring_salaries
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
JOIN titles ON s.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
ORDER BY emp_no;

SELECT * FROM retiring_salaries;

DROP TABLE retiring_salaries;

SELECT me.emp_no, me.first_name, me.last_name, me.title, salary
INTO eligible_emp_salaries
FROM mentorship_elgibility AS me
JOIN salaries ON me.emp_no = salaries.emp_no;

SELECT * FROM eligible_emp_salaries;

DROP TABLE eligible_emp_salaries;









