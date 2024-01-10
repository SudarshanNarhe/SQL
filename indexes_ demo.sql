use testcoursedb;

select * from employees
where salary = 12100;

explain select * from employees where salary = 12100; -- it will give you 107 rows 

create index salary on employees(salary);

select * from employees where salary = 12100;

explain select * from employees where salary = 12100; -- it only perform on that rows that is it trigger only that rows

show indexes from employees; -- it will show all indices on that table 

drop index salary on employees; -- to drop the index