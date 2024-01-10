use testcoursedb;

select * from employees;

/* 1.Write a query to find the names (first_name, last_name) and the salaries of 
the employees who have a higher salary than the employee whose 
last_name='Bull'. */

select last_name , salary
from employees 
where last_name = 'Bull';

select first_name, last_name, salary
from employees
where salary > (select salary
					from employees 
					where last_name = 'Bull');

--  2.Write a query to find the names (first_name, last_name) of all employees 
-- who works in the IT department

select * from departments;

select department_id 
from departments 
where department_name= 'IT'; 

select first_name, last_name 
from employees
where department_id= (select department_id 
							from departments 
							where department_name= 'IT'); 
                            

/* 3. Write a query to find the names (first_name, last_name) of the employees who 
have a manager and work for a department based in the United States.
Hint : Write single-row and multiple-row subqueries */

select * from employees;
select * from locations;

select location_id from locations where country_id='US'; -- inner qeury

select first_name, last_name , department_id, manager_id
from employees
WHERE manager_id in (select employee_id 
						FROM employees WHERE department_id 
								IN (SELECT department_id 
											FROM departments 
                                            WHERE location_id IN (select location_id
																	from locations
                                                                    where country_id='US')));


-- 4 .Write a query to find the names (first_name, last_name) of the employees 
-- who are managers

select distinct first_name, last_name 
from employees
where employee_id in (select manager_id 
						from employees);

/* 5. Write a query to find the names (first_name, last_name), the salary of the 
employees whose salary is greater than the average salary.*/

select avg(salary)
from employees;

select first_name, last_name , salary
from employees
where salary > all (select avg(salary)
						from employees);

/* 6. Write a query to find the names (first_name, last_name), the salary of the 
employees whose salary is equal to the minimum salary for their job 
grade.*/

select * from jobs;

SELECT first_name, last_name, salary 
FROM employees e1
WHERE e1.salary = (SELECT min_salary
					FROM jobs j1
					WHERE e1.job_id = j1.job_id); 

/* 7. Write a query to find the names (first_name, last_name), the salary of the 
employees who earn more than the average salary and who works in any 
of the IT departments */

select department_id 
from departments
where department_name = 'IT';

select first_name, last_name , salary
from employees
where salary > (select avg(salary) from employees)
				and department_id in(select department_id 
										from departments
										where department_name = 'IT');

/* 8. Write a query to find the names (first_name, last_name), the salary of the 
employees who earn more than Mr. Bell*/

select salary 
from employees
where Last_name like '%BELL%';

select first_name , last_name , salary
from employees
where salary > (select salary 
				from employees
				where Last_name like '%BELL%');

/* 9. Write a query to find the names (first_name, last_name), the salary of the 
employees who earn the same salary as the minimum salary for all 
departments*/

SELECT MIN(salary) FROM employees;

SELECT * FROM employees 
WHERE salary = (SELECT MIN(salary) FROM employees);

/* 10. Write a query to find the names (first_name, last_name), the salary of the 
employees whose salary greater than the average salary of all 
departments.*/

select avg(salary)
from employees;

select first_name, last_name , salary
from employees
where salary > (select avg(salary)
					from employees);


/* 11.Write a query to find the names (first_name, last_name) and salary 
of the employees who earn a salary that is higher than the salary of all the 
Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of 
the lowest to highest.
*/

select all(salary)
from employees
where job_id = 'sh_clerk';

select first_name, last_name, salary
from employees
where salary > all(select (salary)
				from employees
				where job_id = 'sh_clerk')
order by salary asc;

/* 11.Write a query to find the names (first_name, last_name) of the 
employees who are not supervisors.*/

select * from employees;

select job_id 
from jobs 
where job_title like '%manager%';

select * from employees
where job_id not in(select job_id 
from jobs 
where job_title like '%manager%');

/* 12.Write a query to display the employee ID, first name, last names, 
and department names of all employees.*/

select employee_id, first_name, last_name ,
(select department_name from departments d 
where e.department_id = d.department_id) as departmentName
from employees e
order by department_id;

/* 13.Write a query to display the employee ID, first name, last names, 
salary of all employees whose salary is above average for their 
depTablesartments.*/

select employee_id, first_name, last_name, salary  
from employees A 
where salary > (select avg(salary) 
					from employees
                    where department_id = A.department_id);

/* 14.Write a query to fetch even numbered records from employees 
table.*/


-- 15. Write a query to find the 5th maximum salary in the employees table.

select distinct salary from employees
order by salary desc limit 4,1;

-- by nested query
select distinct salary from employees e1
where 5 = (select count(distinct salary) from employees e2 where e2.salary>=e1.salary);

-- 16. Write a query to find the 4th minimum salary in the employees table.

select distinct salary 
from employees
order by salary limit 3,1;

-- by nested query
select distinct salary from employees e1
where 4 = (select count(distinct salary) from employees e2 where e2.salary <= e1.salary);

-- 17. Write a query to select last 10 records from a table.

select * from employees
order by employee_id desc limit 10;

/*18. Write a query to list department number, name for all the 
departments in which there are no employees in the department. */

select * from departments 
where department_id not in(select department_id from employees);

-- 19. Write a query to get 3 maximum salaries.

select distinct salary from employees 
order by salary desc limit 3;

-- 20. Write a query to get 3 minimum salaries

select distinct salary from employees
order by salary limit 3;

-- 21. Write a query to get nth max salaries of employees

select distinct salary from employees
order by salary desc limit 8,1;

-- 22. Write a query to get nth max salaries of employees.

select distinct salary from employees
order by salary limit 8,1;

