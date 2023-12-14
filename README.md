# Department Table-SQL

This module challenges in utilising the PostregSQL through pgAdmin in order to create tables and link through the use of 'Primary and foreign keys'. The visualisation of entity relationship diagram (ERD) is
also used to provide a visual look of which tables are connect through which keys.<br/>

The module contains several csv files, each containing details that provide values per row. Although the table contents are small, in the industry, most company will have table that contains thousands of rows. Hence manually searching 
will be time consuming. The benefit for SQL and thus the imporatance of being challenged in using PostRegSQL, is that it can be used to structure proper information easily and efficiently where instead of one massive table, that dataset can be
broken into small tables which can be connected, Additionally, this makes it more efficient in editing the dataset should a client request a change. <br/>
With the csv files, the first step was to figure out which columns among the table are connected through an ERD diagram <br/>

## ERD
For the data modelling, the ERD is used as a visual display in order to determine which table would need to be linked to, as well as which column have in common and which can be used as primary keys.
In the repository is a txt file which contains the coding for ERD diagram which can be imported through any ERD modelling programs. Below is an image that shows what the ERD looks like and what the sql program
used to connect various tables.<br/>

![week 9 ERD screenshot](https://github.com/Nisloen/Assignmant-9-PostregSQL/assets/134130254/b6f3be30-0cb9-42d7-8310-48e76cba7c83)


## How does it work?
In the SQL program, it is split into two sections. <br/>
1. the creation of the tables and the inter-connection through a mix of primary and foreign keys. <br/>
2. the usage of the tables to display certain tables which displays certain columns linked with the primary key (emp_no) <br/>

The first half of the module are series of create tables that have columns in specific positions as it's used to import the relating csv files, found in the repository. The name of the csv are similar to the
name of the table names to know which goes to which. However, for the "employees_key_list" table, the csv file isn't able to 'format change' into the correct format "yyyy-mm-dd" hence it needs to "ALTER DATABASE"
which is below the create table for employees_key_list. <br/>
So create the table, run the alter database, and then import the employee csv file to the table. <br/>

```
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

```
Each of the create table code are based on the csv file including the table names, the connections between the primary and foreign keys are based on the ERD diagrams. with the setted tables, the second half of the project stems on testing whether the
table recieves the correct information and row. Those script can be found in the SQL files and it was edited through pgAdmin.
