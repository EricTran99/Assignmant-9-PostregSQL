# Assignmant-9-PostregSQL
Week 9 module challenge - the basic of SQL

This module challenges in utilising the PostregSQL through pgAdmin in order to create tables and link through the use of 'Primary and foreign keys'. The visualisation of entity relationship diagram (ERD) is
also used to provide a visual look of which tables are connect through which keys.

ERD
for the data modelling, the ERD is used as a visual display in order to determine which table would need to be linked to, as well as which column have in common and which can be used as primary keys.
In the repository is a txt file which contains the coding for ERD diagram which can be imported through any ERD modelling programs. Below is an image that shows what the ERD looks like and what the sql program
used to connect various tables.

![week 9 ERD screenshot](https://github.com/Nisloen/Assignmant-9-PostregSQL/assets/134130254/b6f3be30-0cb9-42d7-8310-48e76cba7c83)


How does it work?
In the SQL program, it is split into two sections.
1. the creation of the tables and the inter-connection through a mix of primary and foreign keys.
2. the usage of the tables to display certain tables which displays certain columns linked with the primary key (emp_no)

The first half of the module are series of create tables that have columns in specific positions as it's used to import the relating csv files, found in the repository. The name of the csv are similar to the
name of the table names to know which goes to which. However, for the "employees_key_list" table, the csv file isn't able to 'format change' into the correct format "yyyy-mm-dd" hence it needs to "ALTER DATABASE"
which is below the create table for employees_key_list.
So create the table, run the alter database, and then import the employee csv file to the table.

For the second part of the module, there are list of questions which required to use the tables created in order to select certain columns and showcase the results. Each questions has an individual coding sequences which
can be run to show the results relating to the questions (the questions are also shown as description in the SQL).
