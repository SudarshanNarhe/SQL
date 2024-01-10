use testcoursedb;

desc Employees;
select * from employees;
/*Write a query to display the names (first_name, last_name) and salary for 
all employees whose salary is not in the range $10,000 through $15,000.*/

select first_name, last_name, salary
from employees
where salary not between 10000 and 15000;

 /*Write a query to display the names (first_name, last_name) and 
department ID of all employees in departments 30 or 100 in ascending 
alphabetical order by first_name*/

desc departments;
select first_name, last_name, department_id
from employees
where department_id=30 or department_id=100
order by first_name asc;

/*Write a query to display the names (first_name, last_name) and salary for 
all employees whose salary is not in the range $10,000 through $15,000 
and are in department 30 or 100. */

select first_name, last_name, salary, department_id
from employees
where salary not between 10000 and 15000 and
	department_id =30 or department_id=100;

/*Write a query to display the names (first_name, last_name) and hire date 
for all employees who were hired in 1987.*/

select first_name, last_name, hire_date 
from employees
where year(hire_date)=1987;

/*Write a query to display the first_name of all employees who have both "b" 
and "c" in their first name*/

select first_name 
from employees
where first_name like ("%b%") and first_name like ("%c%");

/*Write a query to display the last name, job, and salary for all employees 
whose job is that of a Programmer or a Shipping Clerk, and whose salary 
is not equal to $4,500, $10,000, or $15,000*/
select * from employees;

select last_name , salary,job_id
from employees 
where salary not in (4500, 10000,15000) and 
job_id ='IT_PROG' or job_id='ST_CLERK';

/*Write a query to display the last names of employees whose names have 
exactly 6 characters.*/

select last_name 
from employees
-- where length(last_name)=6;
where last_name like '______';

/*Write a query to display the last names of employees having 'e' as the third 
character */

select last_name
from employees
where substring(last_name, 3, 1)='e';

/*Write a query to display the jobs/designations available in the employees 
table*/

select count(distinct job_id)
from employees;

/*Write a query to display the names (first_name, last_name), salary 
and PF (15% of salary) of all employees*/

select first_name, last_name, salary*0.15 as "PF"
from employees;

/*Write a query to select all record from employees where last name in 
'BLAKE', 'SCOTT', 'KING' and 'FORD'*/
select last_name from employees;

select last_name
from employees
where last_name in('blake','scott','king','ford');
