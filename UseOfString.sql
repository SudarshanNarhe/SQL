use testcoursedb;

select * from employees;
select * from locations;
-- use of String

/*Write a query to get the job_id and related employee's id.
Partial output of the query :
job_id Employees ID
AC_ACCOUNT206
AC_MGR 205
AD_ASST 200
AD_PRES 100
AD_VP 101 ,102
FI_ACCOUNT 110 ,113 ,111 ,109 ,112  */

select  job_id, group_concat(employee_id)
from employees
group by JOB_ID;

 /*Write a query to update the portion of the phone_number in the employees 
table, within the phone number the substring '124' will be replaced by '999'.
Sample table: employees */

UPDATE employees
SET phone_number = REPLACE(phone_number, '124', '999')
WHERE phone_number LIKE '%124%';

select * from employees;

/*Write a query to get the details of the employees where the length of the first 
name greater than or equal to 8.
Sample table: employees */

select first_name
from employees
where length(first_name)>=8;

/*Write a query to display leading zeros before maximum and minimum salary.
Sample table: jobs */

select * from jobs;

select lpad(max_salary, 8, 0) as max_salary,
lpad(min_salary, 8, 0) as min_salary
from jobs;

/* Write a query to append '@example.com' to email field.
Sample table: employees
Sample Output :
 EMAIL
 --------------------
 SKING@example.com
 NKOCHHAR@example.com
 LDEHAAN@example.com
MySQL string
 AHUNOLD@example.com
 BERNST@example.com
 DAUSTIN@example.com
 VPATABAL@example.com
 DLORENTZ@example.com
 NGREENBE@example.com
 - - - - - - - - - - -
 - - - - - - - - - - -*/
 
update employees
set email = concat(email, '@example.com');

select * from employees;

/*Write a query to get the employee id, first name and hire month.
Sample table: employees */

select employee_id, first_name, hire_date
from employees;

/* Write a query to get the employee id, email id (discard the last three 
characters).
Sample table: employees*/

SELECT employee_id, LEFT(email, LENGTH(email) - 3) AS modified_email
FROM employees;

 /*Write a query to find all employees where first names are in upper case.
Sample table: employees */

select first_name 
from employees
where  first_name = binary upper(first_Name); -- its not case sensetive for that use of binary is mandotory

/*Write a query to extract the last 4 character of phone numbers.
Sample table: employees */

SELECT employee_id, RIGHT(phone_number, 4) AS last_four_characters
FROM employees;

/* Write a query to get the last word of the street address.
Sample table: locations*/

select *from locations;
select substring_index(street_address, ' ',-1) as Last_word
from locations;

 -- Write a query to get the locations that have minimum street length.
-- Sample table: locations

select *from locations;
 
 select street_address,min(length(street_address)) as minlength
 from locations
 group by street_address
 order by minlength;

/*Write a query to display the first word from those job titles which contains 
more than one words.
Sample table: jobs*/

select * from employees;

SELECT job_title, SUBSTR(job_title,1, INSTR(job_title, ' ') -1)
FROM jobs;

/*Write a query to display the length of first name for employees where last 
name contain character 'c' after 2nd position.
Sample table: employees*/

select length(first_name), last_Name
from employees
where instr(last_Name, 'C')>2;


 






