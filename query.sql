SELECT * FROM departments
SELECT * FROM titles
SELECT * FROM employees
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM salaries

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
	e.emp_no AS "Employee No.", 
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	e.sex AS "Gender", 
	s.salary AS "Salary"
	FROM employees AS e
	LEFT JOIN salaries AS s ON
	e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT
	first_name AS "First Name",
	last_name AS "Last Name",
	hire_date AS "Hire Date"
FROM employees
	WHERE hire_date BETWEEN '1986-1-1' AND '1986-12-31';  

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
	d.dept_no AS "Department No.",
	d.dept_name AS "Department Name",
	e.emp_no AS "Manager's Employee No.",
	e.last_name AS "Manager's Last Name",
	e.first_name AS "Manager's First Name"
FROM departments d
LEFT JOIN dept_manager dm ON
	d.dept_no = dm.dept_no
JOIN employees e ON
	dm.emp_no = e.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT 
	e.emp_no AS "Employee No.",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	de.dept_no AS "Department No.",
	dp.dept_name AS "Department Name"
FROM employees e
LEFT JOIN dept_emp de ON
	e.emp_no = de.emp_no
LEFT JOIN departments dp ON
	de.dept_no = dp.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	first_name AS "First Name",
	last_name AS "Last Name",
	sex AS "Gender"
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no AS "Employee No.",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
FROM employees e
LEFT JOIN dept_emp de ON
	de.emp_no = e.emp_no
LEFT JOIN departments d ON
	d.dept_no = de.dept_no
WHERE d.dept_no = 'd007';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	e.emp_no AS "Employee No.",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
FROM employees e
LEFT JOIN dept_emp de ON
	e.emp_no = de.emp_no
LEFT JOIN departments d ON
	de.dept_no = d.dept_no
WHERE (de.dept_no = 'd007') OR (de.dept_no = 'd005');

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT 
	last_name AS "Last Name", COUNT(last_name)
FROM employees e
GROUP BY last_name 
ORDER BY last_name DESC;
