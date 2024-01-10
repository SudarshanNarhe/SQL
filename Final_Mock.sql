use testcoursedb;

SET @@sql_mode = SYS.LIST_DROP(@@sql_mode, 'ONLY_FULL_GROUP_BY');
SELECT @@sql_mode;

-- find out second highest salary as per the departments 
select department_id,first_name, max(salary)as'highest_salary'
from employees 
where salary < (select max(salary) from employees)
group by department_id;


-- second highest salary from the employees table 
select first_name, salary as'highest_salary'
from employees 
order by highest_salary desc limit 1,1;

select first_name, max(salary) as'second_highest_salary'
from employees
where  salary <(select max(salary) from employees);

call get_Employee(101,@Employee_FullName);
select @Employee_FullName;

/*String sql = "{ call get_Employee(?,?) }" 
CallableStatement cs = con.prepareCall(sql);
cs.setInt(1,101);
cs.getString(2,Types.VARCHAR);
*/

-- Find  which mananger has the highest number of employees(testcoursedb)?
select e1.manager_id,count(e.employee_id) as 'No. Of Empyloyees'  
from employees e inner join employees e1
on e.employee_id=e1.manager_id
group by e1.manager_id 
order by count(e.employee_id) desc;


