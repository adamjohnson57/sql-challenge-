CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(30)
);

CREATE TABLE titles(
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR (30)
);

CREATE TABLE employees(
	emp_no INT, 
	emp_title_id VARCHAR(10),
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex CHAR, 
	hire_date DATE,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp(
	emp_no INTEGER,
	dept_no VARCHAR(4),
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(4),
	emp_no INT,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
