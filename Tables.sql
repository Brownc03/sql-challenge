DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


CREAT TABLE employee (
	emp_no	INT	NOT NULL,
	birth_date	DATE NOT NULL,
	first_name VARCHAR(14) NOT NULL,
	last_name VARCHAR(16) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no));
	
CREAT TABLE department_employees (
	emp_no INT NOT NULL,
	dept_no	VARCHAR(30)
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE department (
	dept_no VARCHAR(30) NOT NULL,
	dept_name VARCHAR(255) NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(30) NOT NULL,
	emp_no INTEGER,
	from_date VARCHAR(30),
	to_date VARCHAR(30),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	from_date VARCHAR(30),
	to_date VARCHAR(30),
	PRIMARY KEY (emp_no)
);

CREATE TABLES titles(
	emp_no INTEGER NOT NULL,
	title VARCHAR(255) NOT NULL,
	from_date VARCHAR(30),
	to_date VARCHAR(30),
	PRIMARY KEY (emp_no,title,from_date)
);