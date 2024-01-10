use testcoursedb;

-- 1 > Create a procedure that takes employee details (name, salary, department ID) as parameters and 
-- adds a new employee to the "employees" table.

desc employees;
call add_Employee('Suraj','Rokade',56000,20);
call add_employee(402,'Sudarshan','Narhe',70000,30);
select * from employees;

-- 2> Create a procedure that takes an employee ID and a new salary as parameters and 
-- updates the salary of the specified employee based on some criteria.
call update_salary(0,80000); 

-- 3> Create a function that takes a department ID as a parameter and 
-- returns the average salary of employees in that department.

select d.department_id,avg(salary) 
from employees e 
left join departments d on e.department_id=d.department_id
where d.department_id= 60;

call get_AverageSalary(60,@AvgSal);
select @AvgSal as AverageSalary;


-- 4> Create a function that takes a department ID as a parameter and 
-- returns the count of employees in that department.

select count(Employee_id) from employees 
where department_id = 60
group by department_id;

call count_ByDepartmentId(60);

-- 5> Create a procedure that takes employee ID and new department ID as parameters and 
-- transfers the employee to the specified department.
desc departments;

Update employees
set department_id = 30
where employee_id = 0;

select * from employees;
call updateEmployeeDep(0,60);

-- 6> Create a procedure that takes a percentage increase as a parameter and 
-- increases the salaries of all employees by that percentage.

update employees
set salary = salary+salary*10/100;

call update_salaryByPer(10);