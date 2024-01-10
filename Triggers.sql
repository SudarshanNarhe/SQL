use testcoursedb;

create table salary_changes(
employee_id int ,
changed_at datetime default current_timestamp,
old_salary decimal(8,2),
new_salary decimal(8,2),
primary key (employee_id, changed_at));

select * from employees;

update employees 
set salary = 90000
where employee_id = 402;

select * from employees;
select * from salary_changes;

update employees 
set salary = 90000
where employee_id = 0;

select * from salary_changes;

desc employees;
insert into employees (employee_id,first_name,last_name,salary) values (405,'Snehal','Daund',75000);


create table employees_birth(
employee_id int,
employee_name varchar (50),
birth_date date,
salary decimal (8,2));

insert into employees_birth values 
(1,'Aadarsh','2000-12-14',70000),
(2,'Suraj','1998-11-1',80000),
(3,'Sudarshan','1997-10-23',90000),
(4,'Yogesh','2001-3-29',350000),
(5,'Pavan','2002-4-19',67000),
(6,'utkarsha','1998-6-13',94000),
(7,'Sneha','1999-12-29',78000),
(8,'Ganesh','1998-2-24',62000),
(9,'Ishwar','1999-7-30',82000);

select * from employees_birth;

-- 1.create a trigger to check entered record of employee having age greater than 18

/*CREATE DEFINER=`root`@`localhost` TRIGGER `employees_birth_BEFORE_INSERT` BEFORE INSERT ON `employees_birth` FOR EACH ROW BEGIN
if (datediff(Current_date,new.birth_date)/365) < 18 then
signal sqlstate '40000' set message_text = 'Invalid age Criteria';
else
signal sqlstate '30000' set message_text = 'Valid age Criteria';
end if;
END */
insert into employees_birth values (11,'Akash','2007-3-13',28000);
insert into employees_birth values (10,'Pavan','2002-3-13',78000);

use testcoursedb;

-- 2.Create a trigger to check if least salary of a employee is 5000 if not set it to 5000

insert into employees_birth values(11,'Yogesh','1997-12-20',3500);
insert into employees_birth values(12,'Sanket','1997-12-20',5600);
select * from employees_birth;

/*CREATE DEFINER=`root`@`localhost` TRIGGER `employees_birth_BEFORE_INSERT_1` BEFORE INSERT ON `employees_birth` FOR EACH ROW BEGIN
if new.salary<5000 then
set new.salary=5000;
end if;
END*/

-- 3. write a trigger for auto-increment of id in employee table
insert into employees_birth values(12,'Maruti','1997-12-20',4300);


-- 4. create a trigger to restrict delete record of employee who is manager of other employee before delete 
use testcoursedb;
select * from employees;

select DISTINCT e1.employee_id 
    FROM employees e1
    INNER JOIN employees e2 on(e1.employee_id=e2.manager_id);

 SELECT COUNT(DISTINCT manager_id)
    FROM employees;
    
     DELETE FROM employees 
    WHERE employee_id=0;
    
     DELETE FROM employees 
    WHERE employee_id=404;