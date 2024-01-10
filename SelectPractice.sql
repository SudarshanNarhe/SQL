use classicmodels;

desc employees; -- describe the table

select lastname -- select single column
from Employees;

select firstname, lastname ,jobtitle -- particular coloumns
from employees;

select employeenumber, firstname, lastname ,jobtitle, extension, email, officecode, reportsto
from employees; -- all columns

select * from employees; -- all coloumns 

select 1+1;  -- we can done operations also

select now();  -- gives date and time 

-- It concatation of two things by as we give aalice by it gives name to that particlular coloumn
select concat("Sudarshan" ," : ", "Narhe") as Name;  

-- It has concat the two coloums and show new coloumn as fullname but doestn't modify the original data 
select concat(firstname," " ,lastname) as "Full name" from Employees; 

select concat(firstname," " ,lastname) as Fullname from Employees;

desc customers;

-- sort by ascending order lastname
select contactlastname , contactFirstName
from customers
 order by contactLastName;
 
 -- concatactlast name desc and contact firstname asc order
 select contactLastname, contactfirstname
 from customers
 order by contactLastName desc,
 contactFirstName asc;
 
 desc orderdetails;
 
 -- for the expressions 
 select productcode, ordernumber, quantityordered*priceEach as "Total Price" 
 from orderdetails;
 
  select productcode, ordernumber, quantityordered*priceEach as "Total Price" 
 from orderdetails
 order by "Total Price" asc;
 
 desc orders;
 select * from orders;
 
 -- use of fields 
 select ordernumber , status
 from orders 
 order by field(status,
					'In Process',
                    'On Hold',
                    'Cancelled',
                    'Resolved',
                    'Disputed',
                    'Shipped');
 
 select * from employees;
 
 select firstname, lastname, reportsto 
 from employees 
 order by reportsto asc; -- it will give us null value first because it start from null bydefault
 
 select firstname, lastname, reportsto 
 from employees 
 order by reportsto desc; -- for that we have to sort by the decsending 
 
 -- where clause use
 select * 
 from employees
 where jobTitle ="Sales Rep"; -- equality operator
 
 -- find the employees whose job title is sales rep and office code is 1
 select * 
 from employees
 where jobTitle="Sales Rep" and 
       officeCode=1;
       
-- find the employees whose job title is sales or office code is 1
select lastname, firstName, officecode, jobtitle
from employees
where jobTitle="sales rep" or 
	officeCode=1;
    
-- where clause using between 
select firstname, lastname, officecode
from employees
where officecode between 1 and 3;

-- like operator 
-- find all the employees whose last name end with son
select firstname, lastname
from employees
where lastname like '%son'; -- % is use ro matches strings 

select firstName, lastname
from employees
where firstname like '_____'; -- _ gives the count of characters and gives output

-- find all the employees who are located in office with officecode 1,2,3
select firstname, lastname, officecode
from employees
where officecode in (1,2,3);  -- in operator return value if true 

-- find out all employees who are not report to any one 
-- use is null operator 
desc employees;
select firstname, lastname, reportsto
from employees
where reportsTo is null;

-- find out all employees who are not sales representative
-- use comaparisom opeartors
select firstname, lastname, jobtitle
from employees
where jobTitle<>"Sales rep"; -- we can use != or <> as a not equal to also

-- find out all employees whose officecode greater than 5
select firstname, lastname , officecode
from employees
where officeCode>5;

-- find all employees whose officecode less than equal to 4
select firstname, lastname, officecode
from employees
where officeCode<=4;
