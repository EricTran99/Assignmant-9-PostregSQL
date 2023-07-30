--1st part of the assignment 9 - CREATE TABLE--

CREATE TABLE title_key_list (
	title_id VARCHAR (30) PRIMARY KEY,
	title VARCHAR (30)
);

CREATE TABLE salaries_key_list (
	emp_no INTEGER PRIMARY KEY,
	salary INTEGER
);

CREATE TABLE department_key_list (
	dept_no VARCHAR (30) PRIMARY KEY,	
	dept_name VARCHAR (30),
	UNIQUE (dept_no)
);

CREATE TABLE dept_manager_key_list (
  emp_no INTEGER,
  FOREIGN KEY (emp_no) REFERENCES salaries_key_list(emp_no),
  dept_no VARCHAR (30),
  FOREIGN KEY (dept_no) REFERENCES department_key_list(dept_no),
	PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE dept_emp_key_list (
  emp_no INTEGER,
  FOREIGN KEY (emp_no) REFERENCES salaries_key_list(emp_no),
  dept_no VARCHAR (30),
  FOREIGN KEY (dept_no) REFERENCES department_key_list(dept_no),
	PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE employees_key_list (
	 emp_no INTEGER PRIMARY KEY,
  FOREIGN KEY (emp_no) REFERENCES salaries_key_list(emp_no),
	emp_title VARCHAR, 
	birth_date date,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date date
);
--the csv file 'format' wasn't working properly, hence it have to run 'alter database' instead
ALTER DATABASE sql_challenge_week_9 SET datestyle TO "ISO, MDY";

--RESET TABLE BY DROPPING--
DROP TABLE department_key_list;
--DATA CHECK--
select * from employees_key_list;

COPY employees_key_list TO 'C:/Module_9/Exported_data/List_of_employee_details.csv' DELIMITER ',' CSV HEADER;


--second part of the assignment 9 - ANALYSE DATA TABLE --
--List the employee number, last name, first name, sex, and salary of each employee.
select l.emp_no,first_name,last_name,sex,salary
from employees_key_list k INNER JOIN salaries_key_list l on (k.emp_no = l.emp_no);
		
--List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name,last_name,hire_date
from employees_key_list
where hire_date  >= '1986-01-01' and
hire_date < '1986-12-30';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        e.last_name,
        e.first_name
FROM dept_manager_key_list AS dm
    INNER JOIN department_key_list AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN employees_key_list AS e
        ON (dm.emp_no = e.emp_no);
		
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select dekl.dept_no,
		ekl.emp_no,
		last_name,
		first_name,
		dept_name
	
from employees_key_list ekl
	 INNER JOIN dept_emp_key_list dekl on (dekl.emp_no = ekl.emp_no)
	 INNER JOIN department_key_list dl on (dl.dept_no = dekl.dept_no);
	 
--List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees_key_list
WHERE first_name = 'Hercules' AND last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
select 
		dept_name,
		ekl.emp_no,
		last_name,
		first_name
	
from employees_key_list ekl
	 INNER JOIN dept_emp_key_list dekl on (dekl.emp_no = ekl.emp_no)
	 INNER JOIN department_key_list dl on (dl.dept_no = dekl.dept_no)
	 WHERE dept_name = 'Sales';
	 
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select 
		dept_name,
		ekl.emp_no,
		last_name,
		first_name
	
from employees_key_list ekl
	 INNER JOIN dept_emp_key_list dekl on (dekl.emp_no = ekl.emp_no)
	 INNER JOIN department_key_list dl on (dl.dept_no = dekl.dept_no)
	 WHERE dept_name IN ('Sales','Development');
	 
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
	last_name,
    COUNT(last_name) as counts
FROM employees_key_list
GROUP BY last_name 
ORDER BY counts DESC;
