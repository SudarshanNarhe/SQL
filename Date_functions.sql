use testcoursedb;

-- 1.Find the names of employees hired in the last 3 months
select * from employees 
where hire_date >= curdate()- interval 3 month;

-- 2.Retrieve employees hired on a specific date
select * from employees
where hire_date = '1987-8-17';

-- 3.Count the number of employees hired each year
select year(hire_date), count(*) from employees
group by year(hire_date);

-- 4.List employees with birthdays in the next 30 days
select employee_name from employees_birth
-- where birth_date between curdate() and  (curdate() + interval 30 day);
where month(birth_date) = month(curdate()) and day(birth_date)= (day(current_date())+ interval 90 day);

SELECT employee_id, first_name, hire_date
FROM employees
WHERE adddate(hire_date, interval 37 YEAR) BETWEEN current_date() AND adddate(current_date(), interval 1 month);

-- 5.Find employees who have been with the company for more than 5 years
select * from employees
where hire_date<=  curdate()-interval 5 year;

-- 6.Calculate the average age of employees
select avg(year(curdate())-year(birth_date)) as Average from employees_birth;

-- 7.List employees with no hire date (potentially missing data)
select * from employees 
where hire_date is null;

-- 8.Find the earliest and latest hire dates
select min(hire_date) as Earliest, max(hire_date)as Latest from employees;
 
-- 9.Retrieve employees with the same birth date
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select birth_date, count(employee_name) from employees_birth 
group by birth_date;

-- 10.List employees and their age in descending order
select employee_name,year(curdate())-year(birth_date) as 'age' from employees_birth
order by age desc;

-- 11.Find employees hired in the current year
select * from employees
where year(hire_date)= year(curdate());

-- 12.Count the number of employees born in each month
select month(hire_date),count(employee_id) from employees
group by month(hire_date);

-- 13 List employees with a hire date and a birth date on the same day


-- 14 Find employees with a birth date in a specific range
select * from employees_birth
where birth_date between '1998-12-29' and '2000-4-17';

-- 15 Calculate the total number of years of experience for all employees
select employee_id,first_name,(year(curdate())-year(hire_date)) as Experiance from employees
group by employee_id;

-- 16 Find employees with an upcoming work anniversary within the next month
select * from employees
where month(hire_date)= month(curdate()+ interval 1 month);

-- 17 Retrieve employees who were born on a weekend (Saturday or Sunday)
select * from employees_birth
where dayofweek(birth_date) in (1,7);

-- 18 List employees who have not celebrated their birthdays yet this year
select * from employees_birth
where month(birth_date)> month(curdate()) or (month(birth_date) = month(curdate()) and day(birth_date) > day(curdate()));

-- 19 Calculate the average age of employees hired in each year

-- 20 Find employees with a hire date on a weekday (Monday to Friday)
select * from employees
where dayofweek(hire_date) in(2,3,4,5,6);