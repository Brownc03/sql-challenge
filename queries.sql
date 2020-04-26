--  List the following details of each employee:
-- employee number, last name, first name, gender, and salary.
SELECT    employee.emp_no, 
		  employee.gender, 
		  employee.first_name, 
		  employee.last_name,  
		  salaries.salary
FROM 	  salaries
LEFT JOIN employee ON
employee.emp_no = salaries.emp_no;

-- List employees who were hired in 1986
SELECT employee.emp_no,
employee.first_name,
employee.last_name,
employee.hire_date
FROM employee
WHERE employee.hire_date between '1986-1-1' and '1986-12-31'
ORDER BY employee.hire_date

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, 
-- and start and end employment dates.
SELECT  department.dept_name, 
		department.dept_no, 
		dept_manager.emp_no, 
		employee.first_name, 
		employee.last_name, 
		salaries.from_date, 
		salaries.to_date
FROM 	dept_manager 
JOIN 	employee
ON   	dept_manager.emp_no = employee.emp_no 
JOIN 	department
ON   	dept_manager.dept_no = department.dept_no
JOIN 	salaries
ON   	dept_manager.emp_no = salaries.emp_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT department_employees.emp_no, employee.first_name, employee.last_name, department.dept_name  
FROM department_employees
JOIN employee
ON department_employees.emp_no = employee.emp_no
JOIN department 
ON  department_employees.dept_no = department.dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employee
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT department_employees.emp_no, 
	   employee.first_name, 
	   employee.last_name, 
	   department.dept_name  
FROM department_employees
JOIN employee
ON department_employees.emp_no = employee.emp_no
JOIN department 
ON  department_employees.dept_no = department.dept_no
WHERE department.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT department_employees.emp_no, department.dept_name, employee.first_name, employee.last_name
FROM department_employees
JOIN employee
ON department_employees.emp_no = employee.emp_no
JOIN department 
ON  department_employees.dept_no = department.dept_no
WHERE department.dept_name = 'Development' OR department.dept_name = 'Sales'

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) total_count
FROM employee
GROUP BY last_name;
