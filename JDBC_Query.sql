use testcoursedb;
desc employees;
-- show employees with highest salary
select concat(First_name,' ',Last_name) as Name , salary
from employees
order by salary desc;

-- show employees with lowest salary
select concat(First_name,' ',Last_name) as Name , salary
from employees
order by salary asc;

--  list employees who start with name 'A'
select First_name
from employees
where first_name like 'A%';

-- show employees who are hired in 2017
select * from employees 
where year(hire_date) = 2017;

--  list department which has highest no of employees
select d.department_id,department_name,count(employee_id) as 'NoOfEmp'
from employees
left join departments d using(department_id)
group by DEPARTMENT_ID
order by NoOfEmp desc;

 -- show top 3 list of managers who has maximum no of employees under them
 
 select Manager_id, count(employee_id) as 'NoOfEmp'
 from employees
 group by MANAGER_ID
 order by NoOfEmp desc limit 3;
 
--  show minimum salary for each department
select d.department_id,department_name, min(salary)
from employees
left join departments d using (department_id)
group by DEPARTMENT_ID;

--  show maximum salary for each department
select d.department_id,department_name, max(salary)
from employees
left join departments d using (department_id)
group by DEPARTMENT_ID;

--  show locations which has maximum departments
select l.location_id, city, count(department_id) as 'NoOfDept'
from departments
left join locations l using (location_id)
group by location_id
order by NoOfDept desc;

--  show alternate employee names under department with highest no of employees

--  show list of region with highest no of employees
select region_id, region_name, count(employee_id) as 'NoOfEmp'
from employees
left join departments using (department_id)
left join locations using (location_id)
left join countries using (country_id)
left join regions using (region_id)
group by REGION_ID
order by NoOfemp desc;