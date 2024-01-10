use testcoursedb;

select * from employees;

-- Write a query to list the number of jobs available in the employees table.
select count(distinct job_id)
from employees;

-- Write a query to get the total salaries payable to employees.
select sum(salary)as Total_Payable_Salary
from employees;

--  Write a query to get the minimum salary from employees table.
select min(salary)
from employees;

 /*Write a query to get the maximum salary of an employee working as a 
Programmer. */

select max(salary)
from employees
where job_id = 'IT_PROG';

 /*Write a query to get the average salary and number of employees working 
the department 90 */

select department_id,avg(salary), count(employee_id)
from employees
where department_id=90;

 /*Write a query to get the highest, lowest, sum, and average salary of all 
employees.*/

select max(salary), min(salary), sum(salary), avg(salary)
from employees;

-- Write a query to get the number of employees with the same job.
select Job_id, count(*)
from employees
group by job_id;

 /*Write a query to get the difference between the highest and lowest 
salaries. */

select max(salary) - min(salary) as Differance
from employees;

/*Write a query to find the manager ID and the salary of the lowest-paid 
employee for that manager */

select manager_id, min(salary) as Lowest_paid
from employees
group by manager_id;

/*Write a query to get the department ID and the total salary payable 
in each department*/

select department_id,sum(salary)
from employees
group by department_id;

/*Write a query to get the average salary for each job ID excluding 
programmer*/

select job_id,avg(salary)
from employees 
where job_id<> 'IT_PROG'
group by job_id;

/*Write a query to get the total salary, maximum, minimum, average 
salary of employees (job ID wise), for department ID 90 only */

select department_id,sum(salary), max(salary), min(salary), avg(salary)
from employees
where department_id=90
group by job_id;

/*Write a query to get the job ID and maximum salary of the 
employees where maximum salary is greater than or equal to $4000*/

select * from employees;

select job_id, max(salary)as maximum_salary
from employees
group by job_id
having maximum_salary>=4000;

/*Write a query to get the average salary for all departments 
employing more than 10 employees.*/

select count(*) as NumOfEmp, avg(salary)
from employees
group by department_id
having  NumOfEmp>10;
