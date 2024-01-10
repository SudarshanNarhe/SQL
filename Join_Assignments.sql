use testcoursedb;
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
-- 1. Write a query to find the addresses (location_id, street_address, city, 
-- state_province, country_name) of all the departments
select DEPARTMENT_ID,DEPARTMENT_NAME,l.location_id, l.street_address, city, state_province, l.country_id, country_name
from  departments d
left join locations l on d.location_id = l.location_id
left join countries using (country_id);

-- 2. Write a query to find the names (first_name, last name), department ID 
-- and name of all the employees.
select first_name, last_name, d.department_id , department_name
from employees e
left join departments d on e.DEPARTMENT_ID=d.DEPARTMENT_ID;

-- 3. Find the names (first_name, last_name), job, department_id, and 
-- department name of the employees who work in London.
select first_name, last_name,job_id, d.department_id, department_name
from employees e 
left join departments d on e.DEPARTMENT_ID=d.DEPARTMENT_ID
left join locations l on d.location_id= l.location_id
where city='london';

-- 4. Write a query to find the employee id, name (last_name) along with their 
-- manager_id, manager name (last_name)
select e.employee_id, e.last_name as 'Employee',m.employee_id as 'Manager ID', m.last_name as 'Manager'
from employees e
inner join employees m on m.employee_id = e.manager_id;

-- 5. Find the names (first_name, last_name) and hire date of the employees 
-- who were hired after 'Jones'.
select first_name, last_name, hire_date 
from employees e1
where last_name = 'jones';

select e1.first_name, e1.last_name, e1.hire_date 
from employees e1
inner join employees e2 on (e2.last_name='jones')
where e1.hire_date > e2.hire_date;

-- 6. Write a query to get the department name and number of employees in the department.
select department_name,count(e.employee_id) as TotalEmp
from departments d
left join employees e on d.department_id = e.department_id
group by department_name;

-- 7. Find the employee ID, job title, number of days between ending date and 
-- starting date for all jobs in department 90 from job history.
select employee_id, job_title, datediff(end_date,start_date) as 'NoOfDays' 
from  job_history j1
left join jobs j on j1.job_id= j.job_id
where department_id = 90;

-- 8. Write a query to display the department ID, department name and 
-- manager first name.
select d.department_id, department_name, e.first_name As 'Manager'
from departments d
left join employees e on d.manager_id=e.employee_id
group by department_id;

-- 9. Write a query to display the department name, manager name, and city.
select department_name, e.first_name, city
from departments d
left join employees e on d.manager_id=e.manager_id
left join locations l on l.location_id = d.location_id
group by d.department_id;

-- 10. Write a query to display the job title and average salary of employees.
select job_title, avg(salary)
from jobs
left join employees e on e.job_id=jobs.job_id
group by job_title;

-- 11. Display job title, employee name, and the difference between salary 
-- of the employee and minimum salary for the job.
select  e.first_name as 'EmployeeName',j.job_title, salary-min_salary as 'DiffSalary',min_salary
from employees e
left join jobs j using(job_id); 

-- 12. Write a query to display the job history that were done by any 
-- employee who is currently drawing more than 10000 of salary
select e.employee_id,start_date, end_date,j.Job_id,j.department_id
from job_history j
left join employees e on j.employee_id=e.employee_id
where e.salary > 10000;

/*13. Write a query to display department name, name (first_name, 
last_name), hire date, salary of the manager for all managers whose 
experience is more than 15 years. */
select department_name, concat(first_name,' ',last_name)as Name , hire_date, salary 
from employees e
left join departments d on d.manager_id= e.employee_id
where datediff(curdate(),hire_date)/365 > 36.5;

-- 1.Write a query to select employee with the highest salary
select  concat(first_name,' ',last_name)as Name, max(salary)
from employees  
group by employee_id
order by max(salary) desc;

select  concat(e1.first_name,' ',e1.last_name)as Name, max(e1.salary)
from employees e 
inner join employees e1 on e.salary=e1.salary
group by name
order by max(e1.salary) desc limit 1;

SELECT * , MAX(e1.Salary) 
FROM Employees e1 
RIGHT JOIN employees e2 ON (e1.salary=(SELECT max(salary) FROM employees));

-- 2.Select employee with the second highest salary

SELECT * , MAX(e1.Salary) 
FROM Employees e1 
RIGHT JOIN employees e2 ON (e1.salary<(SELECT max(salary) FROM employees)); 

SELECT *  
FROM Employees e1 
RIGHT JOIN employees e2 ON (e1.salary<(SELECT max(salary) FROM employees))
limit 1,1;

-- 3.Write a query to select employees and their corresponding managers and their salaries
select e1.employee_id, concat(e2.first_name, e2.last_name) as Name,concat(e1.first_name, e1.last_name) as ManagerName, e1.salary
from employees e1
inner join employees e2 on e1.employee_id=e2.manager_id;

-- 4.Write a query to show count of employees under each manager in descending order
select e2.first_name, count(e1.employee_id) as 'NoOFEmp'
from employees e1
right join employees e2 on e1.employee_id=e2.manager_id
group by e1.employee_id
order by NoOfEmp desc;

-- 5.Find the count of employees in each department
select e1.department_id, count(e1.employee_id)as 'NoOFEmp'
from employees e1
left join departments e2 on e1.department_id= e2.department_id
group by e2.department_id;

-- 6.Get the count of employees hired year wise
select  year(e1.hire_date),count(e1.employee_id)
from employees e1
inner join employees e2 using (hire_date);

-- 7.Select the employees whose first_name contains “an”
select e1.first_name from employees e1
inner join employees e2 on e1.employee_id=e2.employee_id and e2.first_name like '%an%';

-- 8.Find the employees who joined in August, 1994.
select * from employees e1
inner join employees e2 on e2.employee_id=e1.employee_id 
							and month(e2.hire_date) =8 
                            and year(e2.hire_date)= 1987;

-- 9.Write an SQL query to display employees who earn more than the average salary in that company
select avg(salary) from employees;

select * ,avg(e1.salary) as 'AverageSal'
from employees e1
left join employees e2 on e2.salary >'AverageSal';

-- 10.Find the maximum salary from each department.
select department_name, max(salary) 
from employees
inner join departments using (department_id)
group by DEPARTMENT_NAME;

-- 11 Write a query to make deptid foreign key in employee table.
desc  employees;
/*
 alter table employees 
 drop foreign key deaprtment_id,
 add constraint depart foreign key (department_id) references departments(department_id);   */
 
-- 12 Write a query to insert multiple rows in both tables using one insert command.
/*
desc departments;
insert into employees values (404,'Pavan','Dhawale','pavan@123',84737892);
insert into departments values (280,'HR',103,1800);   */

-- 13 Write a query to show employee names and department names for each employee. 
select concat(first_name,last_name) as'Employee_Name',department_name 
from employees
inner join departments using (department_id)
group by Employee_name;

-- 14 Show name of city where ‘Ramesh’ is working.
-- 15 Write a query to show name of city and number of employees working in that city.
-- 16 Show all employees who are working in HR department and having salary less than 5000
-- 17 Show employee having highest salary. 
-- 18 Show name of department along with number of employees working in that city.
-- 19 Show city wise number of employees
-- 20 Show city name and total salary of employees working in that city.





