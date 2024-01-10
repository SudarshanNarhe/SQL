use classicmodels;
call getCountOfemployees(@e);
-- select @e as Count;
-- if we didn't write a select statement in procrdure we have to write after a call a to display

call getCustomerLevel(227,@level);
select @level as Level;

use testcoursedb;

select concat(e.first_name ,' ',e.last_name)as Name,d.department_name, l.city
from employees e
left join departments d on e.department_id=d.department_id
left join locations l on d.location_id=l.location_id
where e.employee_id=100;

call getDepartmentAndLocation(100,@ename,@dept,@Location);
select @ename as 'Employee Name',@dept as 'Department', @Location as 'City';

-- Loop 
call classicmodels.factorialLoop();

-- While Loop
call classicmodels.factorialWhile();

-- functions
SET GLOBAL log_bin_trust_function_creators = 1;
select classicmodels.getOfficeCode();

-- Power 
call classicmodels.getPower();

-- Sum OF Digit 
call classicmodels.SumOfDigits(); 

-- cursor
SET @fullNameList = "";

CALL getFullName(@fullNameList);
SELECT @fullNameList;
