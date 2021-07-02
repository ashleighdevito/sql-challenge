--  List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employee e
	JOIN salary s 
	ON e.emp_no=s.emp_no;

--  List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employee
	WHERE hire_date LIKE '%1986';

--  List the manager of each department with the following information: 
--  department number, department name, the manager's employee number, last name, first name.
SELECT m.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM department d
	JOIN department_manager m
	ON d.dept_no=m.dept_no
		INNER JOIN employee e
		ON e.emp_no=m.emp_no;
		
--  List the department of each employee with the following information: 
--  employee number, last name, first name, and department name.
CREATE VIEW employee_department AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee e
	JOIN department_employee p
	ON e.emp_no=p.emp_no
		JOIN department d
		ON p.dept_no=d.dept_no;
		
--  List first name, last name, and sex for 
--  employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employee
	WHERE first_name = 'Hercules' 
	AND last_name LIKE 'B%';

--  List all employees in the Sales department, 
--  including their employee number, last name, first name, and department name.
SELECT *
FROM employee_department
	WHERE dept_name = 'Sales';

--  List all employees in the Sales and Development departments, 
--  including their employee number, last name, first name, and department name.
SELECT *
FROM employee_department
	WHERE dept_name = 'Sales'
	OR dept_name = 'Development';

DROP VIEW employee_department;

--  In descending order, list the frequency count of employee last names, 
--  i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Name Count"
FROM employee
	GROUP BY last_name
	ORDER BY "Name Count" DESC;